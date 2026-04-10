package trxjangkawaktumodel

import (
	"context"
	"fmt"
	"log"
	"promise-migration/db"

	"github.com/jackc/pgx/v5"
	"github.com/jackc/pgx/v5/pgtype"
)

type TrxJangkaWaktu struct {
	KodeJangkaWaktu    pgtype.Int4
	KodeProsesKontrak  pgtype.Int4
	JangkaWaktu        pgtype.Int4
	Dari               pgtype.Timestamptz
	SampaiDengan       pgtype.Timestamp
	Ucr                pgtype.Text
	Uch                pgtype.Text
	Udcr               pgtype.Timestamp
	Udch               pgtype.Timestamp
	SatuanJangkaWaktu  pgtype.Text
}

func InsertNew(trxJangkaWaktu TrxJangkaWaktu) TrxJangkaWaktu {
	ctx := context.Background()

	qInsert := `
	INSERT INTO trx_jangka_waktu (
		kode_proses_kontrak,
		jangka_waktu,
		dari,
		sampai_dengan,
		ucr,
		uch,
		udcr,
		udch,
		satuan_jangka_waktu
	) VALUES (
		@kode_proses_kontrak,
		@jangka_waktu,
		@dari,
		@sampai_dengan,
		@ucr,
		@uch,
		@udcr,
		@udch,
		@satuan_jangka_waktu
	) RETURNING *`

	args := pgx.NamedArgs{
		"kode_proses_kontrak": trxJangkaWaktu.KodeProsesKontrak,
		"jangka_waktu":        trxJangkaWaktu.JangkaWaktu,
		"dari":                trxJangkaWaktu.Dari,
		"sampai_dengan":       trxJangkaWaktu.SampaiDengan,
		"ucr":                 trxJangkaWaktu.Ucr,
		"uch":                 trxJangkaWaktu.Uch,
		"udcr":                trxJangkaWaktu.Udcr,
		"udch":                trxJangkaWaktu.Udch,
		"satuan_jangka_waktu": trxJangkaWaktu.SatuanJangkaWaktu,
	}

	rwIns, errIns := db.DbSibela.Query(ctx, qInsert, args)
	if errIns != nil {
		fmt.Println("unable to insert trx_jangka_waktu, " + errIns.Error())
	}
	defer rwIns.Close()

	allTrxJangkaWaktu, err := pgx.CollectRows(rwIns, pgx.RowToStructByName[TrxJangkaWaktu])
	if err != nil {
		log.Fatal("failed collecting TrxJangkaWaktu(trx_jangka_waktu.go::InsertNew), " + err.Error())
	}

	return allTrxJangkaWaktu[0]
}
