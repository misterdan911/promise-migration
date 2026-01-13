package refdokdetailtransaksimodel

import (
	"context"
	"fmt"
	"log"

	"github.com/jackc/pgx/v5"
	"github.com/jackc/pgx/v5/pgtype"

	"promise-migration/db"
)

type RefDokDetailTransaksi struct {
	KodeDokDetailTransaksi pgtype.Int4
	KodeTransaksi          pgtype.Int4
	NamaDokumen            pgtype.Text
	KeyyDok                pgtype.Text
	KeteranganDok          pgtype.Text
	KategoriTransaksi      pgtype.Text
}

func InsertNew(refDokDetailTransaksi RefDokDetailTransaksi) RefDokDetailTransaksi {
	ctx := context.Background()

	qInsert := `
	INSERT INTO ref_dok_detail_transaksi (
		kode_transaksi,
		nama_dokumen,
		keyy_dok,
		keterangan_dok,
		kategori_transaksi
	) VALUES (
		@kode_transaksi,
		@nama_dokumen,
		@keyy_dok,
		@keterangan_dok,
		@kategori_transaksi
	) RETURNING *`

	args := pgx.NamedArgs{
		"kode_transaksi":     refDokDetailTransaksi.KodeTransaksi,
		"nama_dokumen":       refDokDetailTransaksi.NamaDokumen,
		"keyy_dok":           refDokDetailTransaksi.KeyyDok,
		"keterangan_dok":     refDokDetailTransaksi.KeteranganDok,
		"kategori_transaksi": refDokDetailTransaksi.KategoriTransaksi,
	}

	rwIns, errIns := db.DbSibela.Query(ctx, qInsert, args)
	if errIns != nil {
		fmt.Println("unable to insert ref_dok_detail_transaksi, " + errIns.Error())
	}
	defer rwIns.Close()

	allRefDokDetailTransaksi, err := pgx.CollectRows(rwIns, pgx.RowToStructByName[RefDokDetailTransaksi])
	if err != nil {
		log.Fatal("failed collecting RefDokDetailTransaksi, " + err.Error())
	}

	return allRefDokDetailTransaksi[0]
}