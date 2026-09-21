package trxdokumenmodel

import (
	"context"
	"log"

	"github.com/jackc/pgx/v5"
	"github.com/jackc/pgx/v5/pgtype"

	"promise-migration/db"
)

type TrxDokumen struct {
	KodeDok              pgtype.Int4
	KodePerencanaan      pgtype.Int4
	KodeKelDok           pgtype.Int4
	NamaDok              pgtype.Text
	FileDok              pgtype.Text
	EncryptKey           pgtype.Text
	Udcr                 pgtype.Timestamptz
	NomorDok             pgtype.Text
	KodeTrxPenandatangan pgtype.Int4
	TanggalTte           pgtype.Date
	FlagRevisi           pgtype.Int2
}

func InsertNew(trxDokumen TrxDokumen) TrxDokumen {
	ctx := context.Background()

	qIns := `
	INSERT INTO trx_dokumen(
		kode_perencanaan,
		kode_kel_dok,
		nama_dok,
		file_dok,
		encrypt_key,
		udcr,
		nomor_dok,
		kode_trx_penandatangan,
		tanggal_tte,
		flag_revisi
	) VALUES (
		@kode_perencanaan,
		@kode_kel_dok,
		@nama_dok,
		@file_dok,
		@encrypt_key,
		@udcr,
		@nomor_dok,
		@kode_trx_penandatangan,
		@tanggal_tte,
		@flag_revisi
	) RETURNING *`

	args := pgx.NamedArgs{
		"kode_dok":               trxDokumen.KodeDok,
		"kode_perencanaan":       trxDokumen.KodePerencanaan,
		"kode_kel_dok":           trxDokumen.KodeKelDok,
		"nama_dok":               trxDokumen.NamaDok,
		"file_dok":               trxDokumen.FileDok,
		"encrypt_key":            trxDokumen.EncryptKey,
		"udcr":                   trxDokumen.Udcr,
		"nomor_dok":              trxDokumen.NomorDok,
		"kode_trx_penandatangan": trxDokumen.KodeTrxPenandatangan,
		"tanggal_tte":            trxDokumen.TanggalTte,
		"flag_revisi":            trxDokumen.FlagRevisi,
	}

	rwIns, errIns := db.DbSiqut.Query(ctx, qIns, args)
	if errIns != nil {
		log.Fatal("unable to insert trx_dokumen, " + errIns.Error())
	}

	defer rwIns.Close()

	allRows, errRwIns := pgx.CollectRows(rwIns, pgx.RowToStructByName[TrxDokumen])

	if errRwIns != nil {
		log.Fatal("failed collecting TrxDokumen (trx_dokumen.go), " + errRwIns.Error())
	}

	return allRows[0]
}

