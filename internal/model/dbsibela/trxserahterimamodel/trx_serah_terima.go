package trxserahterimamodel

import (
	"context"
	// "fmt"
	"log"
	"promise-migration/db"

	"github.com/jackc/pgx/v5"
	"github.com/jackc/pgx/v5/pgtype"
)

type TrxSerahTerima struct {
	KodeSerahTerima     pgtype.Int4
	KodeProsesKontrak   pgtype.Int4
	KategoriSerahTerima pgtype.Text
	Rincian             pgtype.Text
	Persentase          pgtype.Numeric
	NilaiRupiah         pgtype.Numeric
	StatusSerahTerima   pgtype.Int2
	Ucr                 pgtype.Text
	Uch                 pgtype.Text
	Udcr                pgtype.Timestamp
	Udch                pgtype.Timestamp
}

func InsertNew(trxSerahTerima TrxSerahTerima) TrxSerahTerima {

	ctx := context.Background()

	qInsert := `
		INSERT INTO trx_serah_terima (
			kode_proses_kontrak,
			kategori_serah_terima,
			rincian,
			persentase,
			nilai_rupiah,
			status_serah_terima,
			ucr,
			uch,
			udcr,
			udch
		) VALUES (
			@kode_proses_kontrak,
			@kategori_serah_terima,
			@rincian,
			@persentase,
			@nilai_rupiah,
			@status_serah_terima,
			@ucr,
			@uch,
			@udcr,
			@udch
		) RETURNING *`

	args := pgx.NamedArgs{
		"kode_proses_kontrak":   trxSerahTerima.KodeProsesKontrak,
		"kategori_serah_terima": trxSerahTerima.KategoriSerahTerima,
		"rincian":               trxSerahTerima.Rincian,
		"persentase":            trxSerahTerima.Persentase,
		"nilai_rupiah":          trxSerahTerima.NilaiRupiah,
		"status_serah_terima":   trxSerahTerima.StatusSerahTerima,
		"ucr":                   trxSerahTerima.Ucr,
		"uch":                   trxSerahTerima.Uch,
		"udcr":                  trxSerahTerima.Udcr,
		"udch":                  trxSerahTerima.Udch,
	}

	/*
		qInsert := `
		INSERT INTO trx_serah_terima (
			kode_proses_kontrak,
			kategori_serah_terima,
			rincian,
			persentase,
			ucr
		) VALUES (
			@kode_proses_kontrak,
			@kategori_serah_terima,
			@rincian,
			@persentase,
			@ucr
		)`

		args := pgx.NamedArgs{
			"kode_proses_kontrak":   trxSerahTerima.KodeProsesKontrak,
			"kategori_serah_terima": trxSerahTerima.KategoriSerahTerima,
			"rincian":               trxSerahTerima.Rincian,
			"persentase":            trxSerahTerima.Persentase,
			"ucr":                   trxSerahTerima.Ucr,
		}
	*/

	rwIns, errIns := db.DbSibela.Query(ctx, qInsert, args)

	if errIns != nil {
		log.Fatal("unable to insert trx_serah_terima, " + errIns.Error())
		// fmt.Println("unable to insert trx_serah_terima, " + errIns.Error())
	}
	defer rwIns.Close()

	allTrxSerahTerima, err := pgx.CollectRows(rwIns, pgx.RowToStructByName[TrxSerahTerima])
	if err != nil {
		log.Fatal("failed collecting TrxSerahTerima, " + err.Error())
	}

	return allTrxSerahTerima[0]
}
