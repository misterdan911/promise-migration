package trxbastmodel

import (
	"context"
	"fmt"
	"log"
	"promise-migration/db"

	"github.com/jackc/pgx/v5"
	"github.com/jackc/pgx/v5/pgtype"
)

type TrxBast struct {
	KodeBast                     pgtype.Int4
	KodeTrxRiwayatPelaksanaan    pgtype.Int4
	KodeTte                      pgtype.Int4
	Ucr                          pgtype.Text
	Uch                          pgtype.Text
	Udcr                         pgtype.Timestamp
	Udch                         pgtype.Timestamp
	TglSurat                     pgtype.Timestamp
}

func InsertNew(trxBast TrxBast) TrxBast {
	ctx := context.Background()

	qInsert := `
	INSERT INTO trx_bast (
		kode_trx_riwayat_pelaksanaan,
		kode_tte,
		ucr,
		uch,
		udcr,
		udch,
		tgl_surat
	) VALUES (
		@kode_trx_riwayat_pelaksanaan,
		@kode_tte,
		@ucr,
		@uch,
		@udcr,
		@udch,
		@tgl_surat
	) RETURNING *`

	args := pgx.NamedArgs{
		"kode_trx_riwayat_pelaksanaan": trxBast.KodeTrxRiwayatPelaksanaan,
		"kode_tte":                     trxBast.KodeTte,
		"ucr":                          trxBast.Ucr,
		"uch":                          trxBast.Uch,
		"udcr":                         trxBast.Udcr,
		"udch":                         trxBast.Udch,
		"tgl_surat":                    trxBast.TglSurat,
	}

	rwIns, errIns := db.DbSibela.Query(ctx, qInsert, args)
	if errIns != nil {
		fmt.Println("unable to insert trx_bast, " + errIns.Error())
	}
	defer rwIns.Close()

	allTrxBast, err := pgx.CollectRows(rwIns, pgx.RowToStructByName[TrxBast])
	if err != nil {
		log.Fatal("failed collecting TrxBast, " + err.Error())
	}

	return allTrxBast[0]
}
