package trxjenislaporanmodel

import (
	"context"
	"fmt"
	"log"
	"promise-migration/db"

	"github.com/jackc/pgx/v5"
	"github.com/jackc/pgx/v5/pgtype"
)

type TrxJenisLaporan struct {
	KodeTrxJenisLaporan pgtype.Int4
	KodeProsesKontrak   pgtype.Int4
	PathDokumen         pgtype.Text
	Ucr                 pgtype.Text
	Uch                 pgtype.Text
	Udcr                pgtype.Timestamp
	Udch                pgtype.Timestamp
	NamaLaporan         pgtype.Text
}

func InsertNew(trxJenisLaporan TrxJenisLaporan) TrxJenisLaporan {
	ctx := context.Background()

	qInsert := `
	INSERT INTO trx_jenis_laporan (
		kode_proses_kontrak,
		path_dokumen,
		ucr,
		uch,
		udcr,
		udch,
		nama_laporan
	) VALUES (
		@kode_proses_kontrak,
		@path_dokumen,
		@ucr,
		@uch,
		@udcr,
		@udch,
		@nama_laporan
	) RETURNING *`

	args := pgx.NamedArgs{
		"kode_proses_kontrak": trxJenisLaporan.KodeProsesKontrak,
		"path_dokumen":        trxJenisLaporan.PathDokumen,
		"ucr":                 trxJenisLaporan.Ucr,
		"uch":                 trxJenisLaporan.Uch,
		"udcr":                trxJenisLaporan.Udcr,
		"udch":                trxJenisLaporan.Udch,
		"nama_laporan":        trxJenisLaporan.NamaLaporan,
	}

	rwIns, errIns := db.DbSiplang.Query(ctx, qInsert, args)
	if errIns != nil {
		fmt.Println("unable to insert trx_jenis_laporan, " + errIns.Error())
	}
	defer rwIns.Close()

	allTrxJenisLaporan, err := pgx.CollectRows(rwIns, pgx.RowToStructByName[TrxJenisLaporan])
	if err != nil {
		log.Fatal("failed collecting TrxJenisLaporan, " + err.Error())
	}

	return allTrxJenisLaporan[0]
}
