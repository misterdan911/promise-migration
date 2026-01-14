package trxsistempembayaranmodel

import (
	"context"
	"fmt"
	"log"
	"promise-migration/db"

	"github.com/jackc/pgx/v5"
	"github.com/jackc/pgx/v5/pgtype"
)

type TrxSistemPembayaran struct {
	KodeSistemPembayaran  pgtype.Int4
	KodeProsesKontrak     pgtype.Int4
	JenisPembayaran       pgtype.Text
	KategoriSispembayaran pgtype.Text
	Ucr                   pgtype.Text
	Uch                   pgtype.Text
	Udcr                  pgtype.Timestamp
	Udch                  pgtype.Timestamp
}

func InsertNew(trxSistemPembayaran TrxSistemPembayaran) TrxSistemPembayaran {
	ctx := context.Background()

	qInsert := `
	INSERT INTO trx_sistem_pembayaran (
		kode_proses_kontrak,
		jenis_pembayaran,
		kategori_sispembayaran,
		ucr,
		uch,
		udcr,
		udch
	) VALUES (
		@kode_proses_kontrak,
		@jenis_pembayaran,
		@kategori_sispembayaran,
		@ucr,
		@uch,
		@udcr,
		@udch
	) RETURNING *`

	args := pgx.NamedArgs{
		"kode_proses_kontrak":     trxSistemPembayaran.KodeProsesKontrak,
		"jenis_pembayaran":        trxSistemPembayaran.JenisPembayaran,
		"kategori_sispembayaran":  trxSistemPembayaran.KategoriSispembayaran,
		"ucr":                     trxSistemPembayaran.Ucr,
		"uch":                     trxSistemPembayaran.Uch,
		"udcr":                    trxSistemPembayaran.Udcr,
		"udch":                    trxSistemPembayaran.Udch,
	}

	rwIns, errIns := db.DbSiplang.Query(ctx, qInsert, args)
	if errIns != nil {
		fmt.Println("unable to insert trx_sistem_pembayaran, " + errIns.Error())
	}
	defer rwIns.Close()

	allTrxSistemPembayaran, err := pgx.CollectRows(rwIns, pgx.RowToStructByName[TrxSistemPembayaran])
	if err != nil {
		log.Fatal("failed collecting TrxSistemPembayaran, " + err.Error())
	}

	return allTrxSistemPembayaran[0]
}
