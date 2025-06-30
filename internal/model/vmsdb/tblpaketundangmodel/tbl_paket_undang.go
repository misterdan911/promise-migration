package tblpaketundangmodel

import (
	"context"
	"log"
	"github.com/jackc/pgx/v5"
	"github.com/jackc/pgx/v5/pgtype"
	"promise-migration/db"
)

type TblPaketUndang struct {
	IdUndang pgtype.Int4
	IdPaket  pgtype.Int4
	Email    pgtype.Text
	Status   pgtype.Int4
}
	
func GetByIdPaket(idPaket pgtype.Int4) []TblPaketUndang {
	ctx := context.Background()

	qTblPaketUndang := `
  SELECT
		id_undang,
		id_paket,
		email,
		status
  FROM tbl_paket_undang
  WHERE id_paket = $1`

	rwTblPaketUndang, err := db.VmsDb.Query(ctx, qTblPaketUndang, idPaket)
	if err != nil {
		log.Fatal("qTblPaketUndang Failed, " + err.Error() + " " + qTblPaketUndang)
	}

	allTblPaketUndang, err2 := pgx.CollectRows(rwTblPaketUndang, pgx.RowToStructByName[TblPaketUndang])
	if err2 != nil {
		log.Fatal("failed collecting rwTblPaketUndang (tbl_paket_undang.go:GetByIdPaket), " + err2.Error())
	}
	defer rwTblPaketUndang.Close()

	return allTblPaketUndang

}
