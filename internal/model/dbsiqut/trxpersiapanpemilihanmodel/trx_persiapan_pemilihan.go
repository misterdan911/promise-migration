package trxpersiapanpemilihanmodel

import (
	"context"
	"log"

	"github.com/jackc/pgx/v5"
	"github.com/jackc/pgx/v5/pgtype"

	"promise-migration/db"
)

type TrxPersiapanPemilihan struct {
	KodePersiapanPemilihan pgtype.Int4
	KodeKu pgtype.Int4
	KodeMetodePemasukanDok pgtype.Int4
}

func InsertNew(trxPersiapanPemilihan TrxPersiapanPemilihan) TrxPersiapanPemilihan {
	ctx := context.Background()

	qIns := `
	INSERT INTO trx_persiapan_pemilihan(
		kode_ku,
		kode_metode_pemasukan_dok
	) VALUES (
		@kode_ku,
		@kode_metode_pemasukan_dok
	) RETURNING kode_persiapan_pemilihan, kode_ku, kode_metode_pemasukan_dok`
	
	args := pgx.NamedArgs{
		"kode_ku":          						trxPersiapanPemilihan.KodeKu,
		"kode_metode_pemasukan_dok":    trxPersiapanPemilihan.KodeMetodePemasukanDok,
	}

	rwIns, errIns := db.DbSiqut.Query(ctx, qIns, args)
	if errIns != nil {
		log.Fatal("unable to insert trx_persiapan_pemilihan, " + errIns.Error())
	}

	defer rwIns.Close()

	allRows, errRwIns := pgx.CollectRows(rwIns, pgx.RowToStructByName[TrxPersiapanPemilihan])

	if errRwIns != nil {
		log.Fatal("failed collecting TrxPersiapanPemilihan (trx_persiapan_pemilihan.go), " + errRwIns.Error())
	}

	return allRows[0]
}


