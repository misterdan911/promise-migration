package trxdokumenkontrakmodel

import (
	"context"
	"fmt"
	"log"
	"promise-migration/db"

	"github.com/jackc/pgx/v5"
	"github.com/jackc/pgx/v5/pgtype"
)

type TrxDokumenKontrak struct {
	KodeDokumenKontrak pgtype.Int4
	KodeProsesKontrak  pgtype.Int4
	TglSurat           pgtype.Timestamp
	KodeTte            pgtype.Int4
	Ucr                pgtype.Text
	Uch                pgtype.Text
	Udcr               pgtype.Timestamp
	Udch               pgtype.Timestamp
	KodeBentukKontrak  pgtype.Int4
	NomorSuratPesanan  pgtype.Text
}

func InsertNew(trxDokumenKontrak TrxDokumenKontrak) TrxDokumenKontrak {
	ctx := context.Background()

	qInsert := `
	INSERT INTO trx_dokumen_kontrak (
		kode_proses_kontrak,
		tgl_surat,
		kode_tte,
		ucr,
		uch,
		udcr,
		udch,
		kode_bentuk_kontrak,
		nomor_surat_pesanan
	) VALUES (
		@kode_proses_kontrak,
		@tgl_surat,
		@kode_tte,
		@ucr,
		@uch,
		@udcr,
		@udch,
		@kode_bentuk_kontrak,
		@nomor_surat_pesanan
	) RETURNING *`

	args := pgx.NamedArgs{
		"kode_proses_kontrak": trxDokumenKontrak.KodeProsesKontrak,
		"tgl_surat":           trxDokumenKontrak.TglSurat,
		"kode_tte":            trxDokumenKontrak.KodeTte,
		"ucr":                 trxDokumenKontrak.Ucr,
		"uch":                 trxDokumenKontrak.Uch,
		"udcr":                trxDokumenKontrak.Udcr,
		"udch":                trxDokumenKontrak.Udch,
		"kode_bentuk_kontrak": trxDokumenKontrak.KodeBentukKontrak,
		"nomor_surat_pesanan": trxDokumenKontrak.NomorSuratPesanan,
	}

	rwIns, errIns := db.DbSiplang.Query(ctx, qInsert, args)
	if errIns != nil {
		fmt.Println("unable to insert trx_dokumen_kontrak, " + errIns.Error())
	}
	defer rwIns.Close()

	allDokumenKontrak, err := pgx.CollectRows(rwIns, pgx.RowToStructByName[TrxDokumenKontrak])
	if err != nil {
		log.Fatal("failed collecting TrxDokumenKontrak, " + err.Error())
	}

	return allDokumenKontrak[0]
}
