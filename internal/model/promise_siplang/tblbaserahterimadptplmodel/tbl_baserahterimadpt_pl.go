package tblbaserahterimadptplmodel

import (
	"context"
	"log"
	"promise-migration/db"

	"promise-migration/internal/siplang/structs"

	"github.com/jackc/pgx/v5"
	"github.com/jackc/pgx/v5/pgtype"
)

func GetByIdTerminPl(idTerminPl pgtype.Int4) structs.TblBaserahterimaPl {
	var tblBaserahterimaPl structs.TblBaserahterimaPl
	ctx := context.Background()

	qBaserahterimaPl := `
	SELECT
		id_baserahterima_dptpl AS id_baserahterima_pl,
		id_termin_dptpl AS id_termin_pl,
		id_ppkualitas AS id_ppkualitas,
		nomor_dptst AS nomor_st,
		nomor_dptskrek AS nomor_skrek,
		tanggal_dptst AS tanggal_st,
		kedudukan_dptskrek AS kedudukan_skrek,
		tertanggal_dptst AS tertanggal_st
	FROM tbl_baserahterimadpt_pl
	WHERE id_termin_dptpl = $1`

	rwBaserahterimaPl, err := db.PromiseSiplang.Query(ctx, qBaserahterimaPl, idTerminPl)
	if err != nil {
		log.Fatal("qBaserahterimaPl Failed, " + err.Error() + " " + qBaserahterimaPl)
	}

	allBaserahterimaPl, err := pgx.CollectRows(rwBaserahterimaPl, pgx.RowToStructByName[structs.TblBaserahterimaPl])
	if err != nil {
		log.Fatal("failed collecting rwBaserahterimaPl (tblbaserahterimaplmodel.go:GetByIdTerminPl), " + err.Error())
	}
	defer rwBaserahterimaPl.Close()

	if len(allBaserahterimaPl) > 0 {
		tblBaserahterimaPl = allBaserahterimaPl[0]
	}

	return tblBaserahterimaPl
}
