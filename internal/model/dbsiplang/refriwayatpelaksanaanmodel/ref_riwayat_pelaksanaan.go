package refriwayatpelaksanaanmodel

import (
	"context"
	"fmt"
	"log"
	"promise-migration/db"

	"github.com/jackc/pgx/v5"
	"github.com/jackc/pgx/v5/pgtype"
)

type RefRiwayatPelaksanaan struct {
	KodeRiwayatPelaksanaan    pgtype.Int4
	KodeProsesKontrak         pgtype.Int4
	KodeTrxJenisSispembayaran pgtype.Int4
	StatusRiwayatPelaksanaan  pgtype.Text
	Ucr                       pgtype.Text
	Uch                       pgtype.Text
	Udcr                      pgtype.Timestamp
	Udch                      pgtype.Timestamp
}

func InsertNew(refRiwayatPelaksanaan RefRiwayatPelaksanaan) RefRiwayatPelaksanaan {
	ctx := context.Background()

	qInsert := `
	INSERT INTO ref_riwayat_pelaksanaan (
		kode_proses_kontrak,
		kode_trx_jenis_sispembayaran,
		status_riwayat_pelaksanaan,
		ucr,
		uch,
		udcr,
		udch
	) VALUES (
		@kode_proses_kontrak,
		@kode_trx_jenis_sispembayaran,
		@status_riwayat_pelaksanaan,
		@ucr,
		@uch,
		@udcr,
		@udch
	) RETURNING *`

	args := pgx.NamedArgs{
		"kode_proses_kontrak":          refRiwayatPelaksanaan.KodeProsesKontrak,
		"kode_trx_jenis_sispembayaran": refRiwayatPelaksanaan.KodeTrxJenisSispembayaran,
		"status_riwayat_pelaksanaan":   refRiwayatPelaksanaan.StatusRiwayatPelaksanaan,
		"ucr":                          refRiwayatPelaksanaan.Ucr,
		"uch":                          refRiwayatPelaksanaan.Uch,
		"udcr":                         refRiwayatPelaksanaan.Udcr,
		"udch":                         refRiwayatPelaksanaan.Udch,
	}

	rwIns, errIns := db.DbSiplang.Query(ctx, qInsert, args)
	if errIns != nil {
		fmt.Println("unable to insert ref_riwayat_pelaksanaan, " + errIns.Error())
	}
	defer rwIns.Close()

	allRefRiwayatPelaksanaan, err := pgx.CollectRows(rwIns, pgx.RowToStructByName[RefRiwayatPelaksanaan])
	if err != nil {
		log.Fatal("failed collecting RefRiwayatPelaksanaan, " + err.Error())
	}

	return allRefRiwayatPelaksanaan[0]
}
