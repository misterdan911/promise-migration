package refsptjmmodel

import (
	"context"
	"fmt"
	"log"
	"promise-migration/db"

	"github.com/jackc/pgx/v5"
	"github.com/jackc/pgx/v5/pgtype"
)

type RefSptjm struct {
	KodeSptjm                    pgtype.Int4
	KodeTrxRiwayatPelaksanaan    pgtype.Int4
	NamaBank                     pgtype.Text
	NominalJaminan               pgtype.Numeric
	Ucr                          pgtype.Text
	Uch                          pgtype.Text
	Udcr                         pgtype.Timestamp
	Udch                         pgtype.Timestamp
	DokumenJaminan               pgtype.Text
	StatusButtonTte              pgtype.Bool
}

func InsertNew(refSptjm RefSptjm) RefSptjm {
	ctx := context.Background()

	qInsert := `
	INSERT INTO ref_sptjm (
		kode_trx_riwayat_pelaksanaan,
		nama_bank,
		nominal_jaminan,
		ucr,
		uch,
		udcr,
		udch,
		dokumen_jaminan,
		status_button_tte
	) VALUES (
		@kode_trx_riwayat_pelaksanaan,
		@nama_bank,
		@nominal_jaminan,
		@ucr,
		@uch,
		@udcr,
		@udch,
		@dokumen_jaminan,
		@status_button_tte
	) RETURNING *`

	args := pgx.NamedArgs{
		"kode_trx_riwayat_pelaksanaan": refSptjm.KodeTrxRiwayatPelaksanaan,
		"nama_bank":                    refSptjm.NamaBank,
		"nominal_jaminan":              refSptjm.NominalJaminan,
		"ucr":                          refSptjm.Ucr,
		"uch":                          refSptjm.Uch,
		"udcr":                         refSptjm.Udcr,
		"udch":                         refSptjm.Udch,
		"dokumen_jaminan":              refSptjm.DokumenJaminan,
		"status_button_tte":            refSptjm.StatusButtonTte,
	}

	rwIns, errIns := db.DbSibela.Query(ctx, qInsert, args)
	if errIns != nil {
		fmt.Println("unable to insert ref_sptjm, " + errIns.Error())
	}
	defer rwIns.Close()

	allRefSptjm, err := pgx.CollectRows(rwIns, pgx.RowToStructByName[RefSptjm])
	if err != nil {
		log.Fatal("failed collecting RefSptjm, " + err.Error())
	}

	return allRefSptjm[0]
}
