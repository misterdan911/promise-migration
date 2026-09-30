package trxpemberianpenjelasanmodel

import (
	"context"
	"log"

	"github.com/jackc/pgx/v5"
	"github.com/jackc/pgx/v5/pgtype"

	"promise-migration/db"
)

type TrxPemberianPenjelasan struct {
	KodePenjelasan pgtype.Int4
	KodePersiapanPemilihan pgtype.Int4
	IsiPenjelasan pgtype.Text
}

func InsertNew(trxPermberianPenjelasan TrxPemberianPenjelasan) TrxPemberianPenjelasan {
	ctx := context.Background()

	qIns := `
	INSERT INTO trx_pemberian_penjelasan(
		kode_persiapan_pemilihan,
		isi_penjelasan
	) VALUES (
		@kode_persiapan_pemilihan,
		@isi_penjelasan
	) RETURNING kode_penjelasan, kode_persiapan_pemilihan, isi_penjelasan`
	
	args := pgx.NamedArgs{
		"kode_persiapan_pemilihan": trxPermberianPenjelasan.KodePersiapanPemilihan,
		"isi_penjelasan": trxPermberianPenjelasan.IsiPenjelasan,
	}

	rwIns, errIns := db.DbSiqut.Query(ctx, qIns, args)
	if errIns != nil {
		log.Fatal("unable to insert trx_pemberian_penjelasan, " + errIns.Error())
	}

	defer rwIns.Close()

	allRows, errRwIns := pgx.CollectRows(rwIns, pgx.RowToStructByName[TrxPemberianPenjelasan])

	if errRwIns != nil {
		log.Fatal("failed collecting TrxPemberianPenjelasan (trx_pemberian_penjelasan.go), " + errRwIns.Error())
	}

	return allRows[0]
}

