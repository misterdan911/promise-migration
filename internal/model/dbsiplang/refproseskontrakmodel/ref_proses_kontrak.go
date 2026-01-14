package refproseskontrakmodel

import (
	"context"
	"fmt"
	"log"
	"promise-migration/db"

	"github.com/jackc/pgx/v5"
	"github.com/jackc/pgx/v5/pgtype"
)

type RefProsesKontrak struct {
	KodeProsesKontrak        pgtype.Int4
	KodePermintaan           pgtype.Int4
	KodeStatusKontrak        pgtype.Int4
	KodeStepPersiapanKontrak pgtype.Int4
	Ucr                      pgtype.Text
	Uch                      pgtype.Text
	Udcr                     pgtype.Timestamp
	Udch                     pgtype.Timestamp
	StatusPengisian          pgtype.Text
}

func InsertNewData(refProsesKontrak RefProsesKontrak) RefProsesKontrak {
	ctx := context.Background()

	qInsert := `
	INSERT INTO ref_proses_kontrak (
		kode_permintaan,
		kode_status_kontrak,
		kode_step_persiapan_kontrak,
		ucr,
		uch,
		udcr,
		udch,
		status_pengisian
	) VALUES (
		@kode_permintaan,
		@kode_status_kontrak,
		@kode_step_persiapan_kontrak,
		@ucr,
		@uch,
		@udcr,
		@udch,
		@status_pengisian
	) RETURNING *`

	args := pgx.NamedArgs{
		"kode_permintaan":             refProsesKontrak.KodePermintaan,
		"kode_status_kontrak":         refProsesKontrak.KodeStatusKontrak,
		"kode_step_persiapan_kontrak": refProsesKontrak.KodeStepPersiapanKontrak,
		"ucr":                         refProsesKontrak.Ucr,
		"uch":                         refProsesKontrak.Uch,
		"udcr":                        refProsesKontrak.Udcr,
		"udch":                        refProsesKontrak.Udch,
		"status_pengisian":            refProsesKontrak.StatusPengisian,
	}

	rwIns, errIns := db.DbSiplang.Query(ctx, qInsert, args)
	if errIns != nil {
		fmt.Println("unable to insert ref_proses_kontrak, " + errIns.Error())
	}
	defer rwIns.Close()

	allProsesKontrak, err := pgx.CollectRows(rwIns, pgx.RowToStructByName[RefProsesKontrak])
	if err != nil {
		log.Fatal("failed collecting RefProsesKontrak, " + err.Error())
	}

	return allProsesKontrak[0]
}
