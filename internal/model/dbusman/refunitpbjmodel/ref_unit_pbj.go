package refunitpbjmodel

import (
	"context"
	"log"
	"promise-migration/db"

	"github.com/jackc/pgx/v5"
	"github.com/jackc/pgx/v5/pgtype"
)

type RefUnitPbj struct {
	KodeUnitPbj pgtype.Int4
	KodeUnit    pgtype.Text
	NamaUnit    pgtype.Text
	KodePbj     pgtype.Text
	NamaPbj     pgtype.Text
}

func GetByKodePbj(kodePbj pgtype.Text) RefUnitPbj {
	var refUnitPbj RefUnitPbj
	ctx := context.Background()

	qRefUnitPbj := `
	SELECT
		kode_unit_pbj,
		kode_unit,
		nama_unit,
		kode_pbj,
		nama_pbj
	FROM ref_unit_pbj
	WHERE kode_pbj = $1`

	rwRefUnitPbj, err := db.DbUsman.Query(ctx, qRefUnitPbj, kodePbj)
	if err != nil {
		log.Fatal("qRefUnitPbj Failed, " + err.Error() + " " + qRefUnitPbj)
	}

	allRefUnitPbj, err := pgx.CollectRows(rwRefUnitPbj, pgx.RowToStructByName[RefUnitPbj])
	if err != nil {
		log.Fatal("failed collecting rwRefUnitPbj (refunitpbjmodel.go:GetByKodePbj), " + err.Error())
	}
	defer rwRefUnitPbj.Close()

	if len(allRefUnitPbj) > 0 {
		refUnitPbj = allRefUnitPbj[0]
	}

	return refUnitPbj
}
