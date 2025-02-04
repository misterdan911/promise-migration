package sidapet

import (
	"context"
	"fmt"
	"github.com/jackc/pgx/v5"
	"github.com/jackc/pgx/v5/pgtype"
	"log"
	"promise-migration/db"
	"promise-migration/internal/sidapet/helper"
	"strings"
)

type TblDomisili struct {
  IdDomisili pgtype.Int4
  NamaDomisili pgtype.Text
}

func MigrateTblDomisili() {
	helper.TruncateTable("ref_domisili")

  ctx := context.Background()

  qTblDomisili := `SELECT id_domisili, nama_domisili FROM tbl_domisili ORDER BY id_domisili`
  rwTblDomisili, err := db.VmsDb.Query(ctx, qTblDomisili)
  if err != nil {
    log.Fatal("qTblDomisili Failed, " + err.Error() + " " + qTblDomisili)
  }

  allTblDomisili, err := pgx.CollectRows(rwTblDomisili, pgx.RowToStructByName[TblDomisili])
  if err != nil {
    log.Fatal("failed collecting rwTblDomisili, " + err.Error())
  }
  defer rwTblDomisili.Close()

  fmt.Println("Migrating tbl_domisili...")
  for _, tblDomisili := range allTblDomisili {
    qInsert := `INSERT INTO ref_domisili (kode_domisili, nama_domisili) VALUES ($1, $2)`
    _, err := db.DbSidapet.Exec(ctx, qInsert, tblDomisili.IdDomisili.Int32, strings.TrimSpace(tblDomisili.NamaDomisili.String))
    if err != nil {
      log.Fatal("Insert ref_domisli failed, " + err.Error())
    }
  }

  fmt.Println("Migrating tbl_domisili done")

}
