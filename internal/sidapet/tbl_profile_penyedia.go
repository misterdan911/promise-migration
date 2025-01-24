package sidapet

import (
	"context"
	"database/sql"
	"fmt"
	"github.com/jackc/pgx/v5"
	"github.com/jackc/pgx/v5/pgtype"
	"log"
	"promise-migration/db"
	"promise-migration/internal/sidapet/helper"
)

type TblProfilePenyedia struct {
	Email            pgtype.Text
	IdUser           pgtype.Int4
	IdProfilPenyedia pgtype.Int4
	IdJenisPenyedia  pgtype.Int4
	Nama             pgtype.Text
	PenyediaTerpilih pgtype.Int4
	CreateTime       pgtype.Timestamptz
	UpdateTime       pgtype.Timestamptz
}

func MigrateTblProfilePenyedia() {

	helper.TruncateTable("ref_vendor")
	helper.TruncateTable("ref_vendor_register")
	helper.TruncateTable("ref_vendor_reg_history")
	helper.TruncateTable("trx_jawab_profil")

	ctx := context.Background()

	qTblProfilePenyedia := `SELECT email, id_user, id_profil_penyedia, id_jenis_penyedia, nama, penyedia_terpilih, create_time, update_time FROM tbl_profile_penyedia ORDER BY id_profil_penyedia ASC`

	rwTblProfilePenyedia, err := db.VmsDb.Query(ctx, qTblProfilePenyedia)
	if err != nil {
		log.Fatal("qTblProfilePenyedia Failed, " + err.Error() + " " + qTblProfilePenyedia)
	}

	allProfilePenyedia, err := pgx.CollectRows(rwTblProfilePenyedia, pgx.RowToStructByName[TblProfilePenyedia])
	if err != nil {
		log.Fatal("failed collecting rwTblProfilePenyedia, " + err.Error())
	}
	defer rwTblProfilePenyedia.Close()

	for _, profilePenyedia := range allProfilePenyedia {

		qRefVendor := `
    INSERT INTO ref_vendor (
      kode_vendor, 
      kode_jenis_vendor, 
      nama_perusahaan, 
      is_tetap,
      udcr,
      udchTblVerifPaket
    ) VALUES (
      @kode_vendor,
      @kode_jenis_vendor,
      @nama_perusahaan,
      @is_tetap,
      @udcr,
      @udch
    )`

		isTetap := sql.NullBool{Valid: true}
		if profilePenyedia.PenyediaTerpilih.Int32 == 99 {
			isTetap.Bool = false
		} else {
			isTetap.Bool = true
		}

		args := pgx.NamedArgs{
			"kode_vendor":       profilePenyedia.IdProfilPenyedia,
			"kode_jenis_vendor": profilePenyedia.IdJenisPenyedia,
			"nama_perusahaan":   profilePenyedia.Nama,
			"is_tetap":          isTetap,
			"udcr":              profilePenyedia.CreateTime,
			"udch":              profilePenyedia.UpdateTime,
		}
		_, errInsertRefVendor := db.DbSidapet.Exec(ctx, qRefVendor, args)
		if errInsertRefVendor != nil {
			fmt.Println("unable to insert trx_verifikator_penjr, " + errInsertRefVendor.Error())
		}
	}
}
