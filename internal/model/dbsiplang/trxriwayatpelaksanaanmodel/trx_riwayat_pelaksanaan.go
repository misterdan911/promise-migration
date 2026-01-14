package trxriwayatpelaksanaanmodel

import (
	"context"
	"fmt"
	"log"
	"promise-migration/db"

	"github.com/jackc/pgx/v5"
	"github.com/jackc/pgx/v5/pgtype"
)

type TrxRiwayatPelaksanaan struct {
	KodeTrxRiwayatPelaksanaan  pgtype.Int4
	KodeRiwayatPelaksanaan     pgtype.Int4
	KodeStepRiwayatPelaksanaan pgtype.Int4
	StatusStep                 pgtype.Text
	Ucr                        pgtype.Text
	Uch                        pgtype.Text
	Udcr                       pgtype.Timestamp
	Udch                       pgtype.Timestamp
}

func InsertNew(trxRiwayatPelaksanaan TrxRiwayatPelaksanaan) TrxRiwayatPelaksanaan {
	ctx := context.Background()

	qInsert := `
	INSERT INTO trx_riwayat_pelaksanaan (
		kode_riwayat_pelaksanaan,
		kode_step_riwayat_pelaksanaan,
		status_step,
		ucr,
		uch,
		udcr,
		udch
	) VALUES (
		@kode_riwayat_pelaksanaan,
		@kode_step_riwayat_pelaksanaan,
		@status_step,
		@ucr,
		@uch,
		@udcr,
		@udch
	) RETURNING *`

	args := pgx.NamedArgs{
		"kode_riwayat_pelaksanaan":      trxRiwayatPelaksanaan.KodeRiwayatPelaksanaan,
		"kode_step_riwayat_pelaksanaan": trxRiwayatPelaksanaan.KodeStepRiwayatPelaksanaan,
		"status_step":                   trxRiwayatPelaksanaan.StatusStep,
		"ucr":                           trxRiwayatPelaksanaan.Ucr,
		"uch":                           trxRiwayatPelaksanaan.Uch,
		"udcr":                          trxRiwayatPelaksanaan.Udcr,
		"udch":                          trxRiwayatPelaksanaan.Udch,
	}

	rwIns, errIns := db.DbSiplang.Query(ctx, qInsert, args)
	if errIns != nil {
		fmt.Println("unable to insert trx_riwayat_pelaksanaan, " + errIns.Error())
	}
	defer rwIns.Close()

	allTrxRiwayatPelaksanaan, err := pgx.CollectRows(rwIns, pgx.RowToStructByName[TrxRiwayatPelaksanaan])
	if err != nil {
		log.Fatal("failed collecting TrxRiwayatPelaksanaan, " + err.Error())
	}

	return allTrxRiwayatPelaksanaan[0]
}
