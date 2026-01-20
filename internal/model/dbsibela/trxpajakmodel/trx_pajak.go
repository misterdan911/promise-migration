package trxpajakmodel

import (
	"context"
	"fmt"
	"log"
	"promise-migration/db"

	"github.com/jackc/pgx/v5"
	"github.com/jackc/pgx/v5/pgtype"
)

type TrxPajak struct {
	KodePajak                    pgtype.Int4
	KodeTrxRiwayatPelaksanaan    pgtype.Int4
	KategoriNilaiTransaksi       pgtype.Text
	ManajemenFee                 pgtype.Numeric
	NilaiTransaksi               pgtype.Numeric
	JenisMataUang                pgtype.Text
	KursAsing                    pgtype.Numeric
	KursBank                     pgtype.Numeric
	KursKmk                      pgtype.Numeric
	TaxTreaty                    pgtype.Numeric
	KodeJenisTransaksi           pgtype.Int4
	JenisTransaksi               pgtype.Text
	KodeObjekPajak               pgtype.Text
	ObjekPajak                   pgtype.Text
	KodeDetailTransaksi          pgtype.Int4
	DetailTransaksi              pgtype.Text
	Ucr                          pgtype.Text
	Uch                          pgtype.Text
	Udcr                         pgtype.Timestamp
	Udch                         pgtype.Timestamp
	NamaDokEfaktur               pgtype.Text
	NomorEfaktur                 pgtype.Text
	TanggalEfaktur               pgtype.Timestamp
	NamaTabelLama               pgtype.Text
	IdSptb               pgtype.Int4
	BiayaTakKenaPajak      		 pgtype.Int4
}

func InsertNew(trxPajak TrxPajak) TrxPajak {
	ctx := context.Background()

	qInsert := `
	INSERT INTO trx_pajak (
		kode_trx_riwayat_pelaksanaan,
		kategori_nilai_transaksi,
		manajemen_fee,
		nilai_transaksi,
		jenis_mata_uang,
		kurs_asing,
		kurs_bank,
		kurs_kmk,
		tax_treaty,
		kode_jenis_transaksi,
		jenis_transaksi,
		kode_objek_pajak,
		objek_pajak,
		kode_detail_transaksi,
		detail_transaksi,
		ucr,
		uch,
		udcr,
		udch,
		nama_dok_efaktur,
		nomor_efaktur,
		tanggal_efaktur,
		nama_tabel_lama,
		id_sptb
	) VALUES (
		@kode_trx_riwayat_pelaksanaan,
		@kategori_nilai_transaksi,
		@manajemen_fee,
		@nilai_transaksi,
		@jenis_mata_uang,
		@kurs_asing,
		@kurs_bank,
		@kurs_kmk,
		@tax_treaty,
		@kode_jenis_transaksi,
		@jenis_transaksi,
		@kode_objek_pajak,
		@objek_pajak,
		@kode_detail_transaksi,
		@detail_transaksi,
		@ucr,
		@uch,
		@udcr,
		@udch,
		@nama_dok_efaktur,
		@nomor_efaktur,
		@tanggal_efaktur,
		@nama_tabel_lama,
		@id_sptb
	) RETURNING *`

	args := pgx.NamedArgs{
		"kode_trx_riwayat_pelaksanaan": trxPajak.KodeTrxRiwayatPelaksanaan,
		"kategori_nilai_transaksi":     trxPajak.KategoriNilaiTransaksi,
		"manajemen_fee":                trxPajak.ManajemenFee,
		"nilai_transaksi":              trxPajak.NilaiTransaksi,
		"jenis_mata_uang":              trxPajak.JenisMataUang,
		"kurs_asing":                   trxPajak.KursAsing,
		"kurs_bank":                    trxPajak.KursBank,
		"kurs_kmk":                     trxPajak.KursKmk,
		"tax_treaty":                   trxPajak.TaxTreaty,
		"kode_jenis_transaksi":         trxPajak.KodeJenisTransaksi,
		"jenis_transaksi":              trxPajak.JenisTransaksi,
		"kode_objek_pajak":             trxPajak.KodeObjekPajak,
		"objek_pajak":                  trxPajak.ObjekPajak,
		"kode_detail_transaksi":        trxPajak.KodeDetailTransaksi,
		"detail_transaksi":             trxPajak.DetailTransaksi,
		"ucr":                          trxPajak.Ucr,
		"uch":                          trxPajak.Uch,
		"udcr":                         trxPajak.Udcr,
		"udch":                         trxPajak.Udch,
		"nama_dok_efaktur":             trxPajak.NamaDokEfaktur,
		"nomor_efaktur":                trxPajak.NomorEfaktur,
		"tanggal_efaktur":              trxPajak.TanggalEfaktur,
		"nama_tabel_lama":              trxPajak.NamaTabelLama,
		"id_sptb":              trxPajak.IdSptb,
	}

	rwIns, errIns := db.DbSibela.Query(ctx, qInsert, args)
	if errIns != nil {
		fmt.Println("unable to insert trx_pajak, " + errIns.Error())
	}
	defer rwIns.Close()

	allTrxPajak, err := pgx.CollectRows(rwIns, pgx.RowToStructByName[TrxPajak])
	if err != nil {
		log.Fatal("failed collecting TrxPajak, " + err.Error())
	}

	return allTrxPajak[0]
}
