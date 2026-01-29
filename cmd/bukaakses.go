package cmd

import (
	"context"
	"fmt"
	"log"

	"github.com/jackc/pgx/v5"
	"github.com/jackc/pgx/v5/pgtype"
	"github.com/spf13/cobra"

	"promise-migration/db"
)

type UserData struct {
  IdUser pgtype.Int4
  KodeGroup pgtype.Text
  Email pgtype.Text
  Nama pgtype.Text
  KodeJabatan pgtype.Int4
  NamaJabatan pgtype.Text
  NamaAplikasi pgtype.Text
}

type DuplicateData struct {
  IdUser pgtype.Int4
  KodeGroup pgtype.Text
}

var BukaAkses = &cobra.Command{
  Use:   "bukaakses [database]",
  Short: "Membuka askses user2 promise",
  Long: `Membuka askses user2 promise.`,
  Run: func(cmd *cobra.Command, args []string) {

    db.ConnectDbUsman()
    defer db.DbUsman.Close()

    ctx := context.Background()

    qUserData := `
    SELECT
      ru.id AS id_user,
      tut.email,
      tut.nama,
      tut.kode_jabatan,
      rj.nama_jabatan,
      ra.nama_aplikasi,
      rg.kode_group
    FROM trx_user_tampung tut
    LEFT JOIN ref_user ru on ru.email = tut.email
    LEFT JOIN ref_jabatan rj on rj.kode_jabatan = tut.kode_jabatan
    LEFT JOIN ref_group rg on rg.kode_jabatan = tut.kode_jabatan
    LEFT JOIN ref_aplikasi ra on ra.kode_aplikasi = rg.kode_aplikasi
    WHERE
      tut.email is NOT NULL AND
      rg.kode_group is NOT NULL AND
      ru.id IS NOT NULL AND
      ra.kode_aplikasi in ('01','02','03','04','05')
    ORDER BY ra.kode_aplikasi, rj.nama_jabatan asc;
    `

    rows, err := db.DbUsman.Query(ctx, qUserData)
    if err != nil {
      log.Fatal("qUserData Failed, " + err.Error() + " " + qUserData)
    }

    allUserData, err := pgx.CollectRows(rows, pgx.RowToStructByName[UserData])
    if err != nil {
      log.Fatal("failed collecting rows (qUserData), " + err.Error())
    }
    defer rows.Close()

    for _, userData := range allUserData {

      qCheckDuplicate := `SELECT kode_group, id_user FROM trx_group_user WHERE kode_group = $1 AND id_user = $2`
      rows2, err2 := db.DbUsman.Query(ctx, qCheckDuplicate, userData.KodeGroup, userData.IdUser)
      if err2 != nil {
        log.Fatal("qCheckDuplicate Failed, " + err2.Error() + " " + qCheckDuplicate)
      }
      allDuplicateData, err2 := pgx.CollectRows(rows2, pgx.RowToStructByName[DuplicateData])
      if err2 != nil {
        log.Fatal("failed collecting rows2 (qCheckDuplicate), " + err2.Error())
      }
      defer rows2.Close()

      // kalau data sudah ada, skip
      if len(allDuplicateData) > 0 { continue }

      qGrantAccess := `INSERT INTO trx_group_user (kode_group, id_user, status) VALUES ($1, $2, '1')`
      _, err3 := db.DbUsman.Exec(ctx, qGrantAccess, userData.KodeGroup, userData.IdUser)

      if err3 != nil {
        log.Fatal("failed INSERT trx_group_user, " + err3.Error())
      }

      fmt.Printf("Granting %v AS %v [OK]\n", userData.Nama.String, userData.NamaJabatan.String)

    }

  },
}

func init() {

  // MigrateCmd.AddCommand(subcmd.DokumenCmd)

}


// 283903
// 281828

// delete from trx_group_user where id_group_user > 281828;
// select setval('trx_group_user_id_seq', 281828);

// delete from trx_group_user where id_group_user > 30221;
// select setval('trx_group_user_id_seq', 30221);
