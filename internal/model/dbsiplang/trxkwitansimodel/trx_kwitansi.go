package trxkwitansimodel

import (
	"context"
	"fmt"
	"log"
	"promise-migration/db"

	"github.com/jackc/pgx/v5"
	"github.com/jackc/pgx/v5/pgtype"
)

type TrxKwitansi struct {
	KodeKwitansi              pgtype.Int4
	KodeTrxRiwayatPelaksanaan pgtype.Int4
	NomorKwitansi             pgtype.Text
	NamaDokKwitansi           pgtype.Text
	NamaDokKwitansiSelesai    pgtype.Text
	KategoriInput             pgtype.Text
	Ucr                       pgtype.Text
	Uch                       pgtype.Text
	Udcr                      pgtype.Timestamp
	Udch                      pgtype.Timestamp
	NamaUploader              pgtype.Text
	TanggalKwitansi           pgtype.Timestamp
}

func InsertNew(trxKwitansi TrxKwitansi) TrxKwitansi {
	ctx := context.Background()

	qInsert := `
	INSERT INTO trx_kwitansi (
		kode_trx_riwayat_pelaksanaan,
		nomor_kwitansi,
		nama_dok_kwitansi,
		nama_dok_kwitansi_selesai,
		kategori_input,
		ucr,
		uch,
		nama_uploader,
		tanggal_kwitansi
	) VALUES (
		@kode_trx_riwayat_pelaksanaan,
		@nomor_kwitansi,
		@nama_dok_kwitansi,
		@nama_dok_kwitansi_selesai,
		@kategori_input,
		@ucr,
		@uch,
		@nama_uploader,
		@tanggal_kwitansi
	) RETURNING *`

	args := pgx.NamedArgs{
		"kode_trx_riwayat_pelaksanaan": trxKwitansi.KodeTrxRiwayatPelaksanaan,
		"nomor_kwitansi":               trxKwitansi.NomorKwitansi,
		"nama_dok_kwitansi":            trxKwitansi.NamaDokKwitansi,
		"nama_dok_kwitansi_selesai":    trxKwitansi.NamaDokKwitansiSelesai,
		"kategori_input":               trxKwitansi.KategoriInput,
		"ucr":                          trxKwitansi.Ucr,
		"uch":                          trxKwitansi.Uch,
		"nama_uploader":                trxKwitansi.NamaUploader,
		"tanggal_kwitansi":             trxKwitansi.TanggalKwitansi,
	}

	rwIns, errIns := db.DbSibela.Query(ctx, qInsert, args)
	if errIns != nil {
		fmt.Println("unable to insert trx_kwitansi, " + errIns.Error())
	}
	defer rwIns.Close()

	allTrxKwitansi, err := pgx.CollectRows(rwIns, pgx.RowToStructByName[TrxKwitansi])
	if err != nil {
		log.Fatal("failed collecting TrxKwitansi, " + err.Error())
	}

	return allTrxKwitansi[0]
}
