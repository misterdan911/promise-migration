package trxttemodel

import (
	"context"
	"log"
	"promise-migration/db"

	"github.com/jackc/pgx/v5"
	"github.com/jackc/pgx/v5/pgtype"
)

type TrxTte struct {
	KodeTte              pgtype.Int4
	KodeTrxPenandatangan pgtype.Int4
	KodePermintaan       pgtype.Int4
	KategoriTte          pgtype.Text
	PathDokumen          pgtype.Text
	PathDokumenSelesai   pgtype.Text
	TglSelesai           pgtype.Timestamptz
	NomorSurat           pgtype.Text
}

func InsertNew(trxTte TrxTte) {
	ctx := context.Background()

	qInsert := `
	INSERT INTO trx_tte (
		kode_trx_penandatangan,
		kode_permintaan,
		kategori_tte,
		path_dokumen,
		path_dokumen_selesai,
		tgl_selesai,
		nomor_surat
	) VALUES (
		@kode_trx_penandatangan,
		@kode_permintaan,
		@kategori_tte,
		@path_dokumen,
		@path_dokumen_selesai,
		@tgl_selesai,
		@nomor_surat
	)`

	args := pgx.NamedArgs{
		"kode_trx_penandatangan": trxTte.KodeTrxPenandatangan,
		"kode_permintaan":        trxTte.KodePermintaan,
		"kategori_tte":           trxTte.KategoriTte,
		"path_dokumen":           trxTte.PathDokumen,
		"path_dokumen_selesai":   trxTte.PathDokumenSelesai,
		"tgl_selesai":            trxTte.TglSelesai,
		"nomor_surat":            trxTte.NomorSurat,
	}

	_, errIns := db.DbSibela.Exec(ctx, qInsert, args)
	if errIns != nil {
		log.Fatal("unable to insert trx_tte (trx_tte.go:InsertTrxTte), " + errIns.Error())
	}
}
