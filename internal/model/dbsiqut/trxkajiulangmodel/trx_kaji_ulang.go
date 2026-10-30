package trxkajiulangmodel

import (
	"context"
	"log"

	"github.com/jackc/pgx/v5"
	"github.com/jackc/pgx/v5/pgtype"

	"promise-migration/db"
)

type TrxKajiUlang struct {
	KodeKu pgtype.Int4
	KodePerencanaan pgtype.Int4
}

func InsertNew(trxKajiUlang TrxKajiUlang) TrxKajiUlang {
	ctx := context.Background()

	qIns := `
	INSERT INTO trx_kaji_ulang(
		kode_perencanaan
	) VALUES (
		@kode_perencanaan
	) RETURNING kode_ku, kode_perencanaan`
	
	args := pgx.NamedArgs{
		"kode_perencanaan":          trxKajiUlang.KodePerencanaan,
	}

	rwIns, errIns := db.DbSiqut.Query(ctx, qIns, args)
	if errIns != nil {
		log.Fatal("unable to insert trx_kaji_ulang, " + errIns.Error())
	}

	defer rwIns.Close()

	allRows, errRwIns := pgx.CollectRows(rwIns, pgx.RowToStructByName[TrxKajiUlang])

	if errRwIns != nil {
		log.Fatal("failed collecting TrxKajiUlang (trx_kaji_ulang.go), " + errRwIns.Error())
	}

	return allRows[0]
}

