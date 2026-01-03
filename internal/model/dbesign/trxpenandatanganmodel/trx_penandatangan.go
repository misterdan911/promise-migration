package trxpenandatanganmodel

import (
	"context"
	"fmt"
	"log"
	"promise-migration/db"

	"github.com/jackc/pgx/v5"
	"github.com/jackc/pgx/v5/pgtype"
)

type TrxPenandatangan struct {
	KodeTrxPenandatangan pgtype.Int4
	NamaAplikasi         pgtype.Text
	NomorSurat           pgtype.Text
	JenisSurat           pgtype.Text
	KeteranganSurat      pgtype.Text
	PathDokumen          pgtype.Text
	PathDokumenSelesai   pgtype.Text
	TglSelesai           pgtype.Timestamp
}

func InsertNew(trxPenandatangan TrxPenandatangan) TrxPenandatangan {
	ctx := context.Background()

	qInsert := `
	INSERT INTO trx_penandatangan (
		nama_aplikasi,
		nomor_surat,
		jenis_surat,
		keterangan_surat,
		path_dokumen,
		path_dokumen_selesai,
		tgl_selesai
	) VALUES (
		@nama_aplikasi,
		@nomor_surat,
		@jenis_surat,
		@keterangan_surat,
		@path_dokumen,
		@path_dokumen_selesai,
		@tgl_selesai
	) RETURNING *`

	args := pgx.NamedArgs{
		"nama_aplikasi":         trxPenandatangan.NamaAplikasi,
		"nomor_surat":           trxPenandatangan.NomorSurat,
		"jenis_surat":           trxPenandatangan.JenisSurat,
		"keterangan_surat":      trxPenandatangan.KeteranganSurat,
		"path_dokumen":          trxPenandatangan.PathDokumen,
		"path_dokumen_selesai":  trxPenandatangan.PathDokumenSelesai,
		"tgl_selesai":           trxPenandatangan.TglSelesai,
	}

	rwIns, errIns := db.DbEsign.Query(ctx, qInsert, args)
	if errIns != nil {
		fmt.Println("unable to insert trx_penandatangan, " + errIns.Error())
	}
	defer rwIns.Close()

	allTrxPenandatangan, err := pgx.CollectRows(rwIns, pgx.RowToStructByName[TrxPenandatangan])
	if err != nil {
		log.Fatal("failed collecting TrxPenandatangan, " + err.Error())
	}

	return allTrxPenandatangan[0]
}
