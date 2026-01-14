package trxsptjmmodel

import (
	"context"
	"fmt"
	"log"
	"promise-migration/db"

	"github.com/jackc/pgx/v5"
	"github.com/jackc/pgx/v5/pgtype"
)

type TrxSptjm struct {
	KodeTrxSptjm                 pgtype.Int4
	KodeTrxRiwayatPelaksanaan    pgtype.Int4
	KodeTte                      pgtype.Int4
	TglSurat                     pgtype.Timestamp
	KategoriSurat                pgtype.Text
	Ucr                          pgtype.Text
	Uch                          pgtype.Text
	Udcr                         pgtype.Timestamp
	Udch                         pgtype.Timestamp
}

func InsertNew(trxSptjm TrxSptjm) TrxSptjm {
	ctx := context.Background()

	qInsert := `
	INSERT INTO trx_sptjm (
		kode_trx_riwayat_pelaksanaan,
		kode_tte,
		tgl_surat,
		kategori_surat,
		ucr,
		uch,
		udcr,
		udch
	) VALUES (
		@kode_trx_riwayat_pelaksanaan,
		@kode_tte,
		@tgl_surat,
		@kategori_surat,
		@ucr,
		@uch,
		@udcr,
		@udch
	) RETURNING *`

	args := pgx.NamedArgs{
		"kode_trx_riwayat_pelaksanaan": trxSptjm.KodeTrxRiwayatPelaksanaan,
		"kode_tte":                     trxSptjm.KodeTte,
		"tgl_surat":                    trxSptjm.TglSurat,
		"kategori_surat":               trxSptjm.KategoriSurat,
		"ucr":                          trxSptjm.Ucr,
		"uch":                          trxSptjm.Uch,
		"udcr":                         trxSptjm.Udcr,
		"udch":                         trxSptjm.Udch,
	}

	rwIns, errIns := db.DbSiplang.Query(ctx, qInsert, args)
	if errIns != nil {
		fmt.Println("unable to insert trx_sptjm, " + errIns.Error())
	}
	defer rwIns.Close()

	allTrxSptjm, err := pgx.CollectRows(rwIns, pgx.RowToStructByName[TrxSptjm])
	if err != nil {
		log.Fatal("failed collecting TrxSptjm, " + err.Error())
	}

	return allTrxSptjm[0]
}
