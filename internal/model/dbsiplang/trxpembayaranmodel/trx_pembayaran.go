package trxpembayaranmodel

import (
	"context"
	"fmt"
	"log"
	"promise-migration/db"

	"github.com/jackc/pgx/v5"
	"github.com/jackc/pgx/v5/pgtype"
)

type TrxPembayaran struct {
	KodeTrxPencarian             pgtype.Int4
	KodeTrxRiwayatPelaksanaan    pgtype.Int4
	KodeTte                      pgtype.Int4
	TglSuratSpp                  pgtype.Timestamp
	TglSuratSptjb                pgtype.Timestamp
	TglSuratSrk                  pgtype.Timestamp
	NoSuratSpp                   pgtype.Text
	NoSuratSptjb                 pgtype.Text
	NoSuratSrk                   pgtype.Text
	Ucr                          pgtype.Text
	Uch                          pgtype.Text
	Udcr                         pgtype.Timestamp
	Udch                         pgtype.Timestamp
	KodePermintaanPencairan      pgtype.Int4
	KodePermintaanPencairanOld      pgtype.Text
	StatusPengusulan             pgtype.Text
	KodeKontrak      pgtype.Text

}

func InsertNew(trxPembayaran TrxPembayaran) TrxPembayaran {
	ctx := context.Background()

	qInsert := `
	INSERT INTO trx_pembayaran (
		kode_trx_riwayat_pelaksanaan,
		kode_tte,
		tgl_surat_spp,
		tgl_surat_sptjb,
		tgl_surat_srk,
		no_surat_spp,
		no_surat_sptjb,
		no_surat_srk,
		ucr,
		uch,
		udcr,
		udch,
		kode_permintaan_pencairan,
		kode_permintaan_pencairan_old,
		kode_kontrak,
		status_pengusulan
	) VALUES (
		@kode_trx_riwayat_pelaksanaan,
		@kode_tte,
		@tgl_surat_spp,
		@tgl_surat_sptjb,
		@tgl_surat_srk,
		@no_surat_spp,
		@no_surat_sptjb,
		@no_surat_srk,
		@ucr,
		@uch,
		@udcr,
		@udch,
		@kode_permintaan_pencairan,
		@kode_permintaan_pencairan_old,
		@kode_kontrak,
		@status_pengusulan
	) RETURNING *`

	args := pgx.NamedArgs{
		"kode_trx_riwayat_pelaksanaan": trxPembayaran.KodeTrxRiwayatPelaksanaan,
		"kode_tte":                     trxPembayaran.KodeTte,
		"tgl_surat_spp":                trxPembayaran.TglSuratSpp,
		"tgl_surat_sptjb":              trxPembayaran.TglSuratSptjb,
		"tgl_surat_srk":                trxPembayaran.TglSuratSrk,
		"no_surat_spp":                 trxPembayaran.NoSuratSpp,
		"no_surat_sptjb":               trxPembayaran.NoSuratSptjb,
		"no_surat_srk":                 trxPembayaran.NoSuratSrk,
		"ucr":                          trxPembayaran.Ucr,
		"uch":                          trxPembayaran.Uch,
		"udcr":                         trxPembayaran.Udcr,
		"udch":                         trxPembayaran.Udch,
		"kode_permintaan_pencairan":    trxPembayaran.KodePermintaanPencairan,
		"kode_permintaan_pencairan_old":    trxPembayaran.KodePermintaanPencairanOld,
		"kode_kontrak":    trxPembayaran.KodeKontrak,
		"status_pengusulan":            trxPembayaran.StatusPengusulan,
	}

	rwIns, errIns := db.DbSiplang.Query(ctx, qInsert, args)
	if errIns != nil {
		fmt.Println("unable to insert trx_pembayaran, " + errIns.Error())
	}
	defer rwIns.Close()

	allTrxPembayaran, err := pgx.CollectRows(rwIns, pgx.RowToStructByName[TrxPembayaran])
	if err != nil {
		log.Fatal("failed collecting TrxPembayaran, " + err.Error())
	}

	return allTrxPembayaran[0]
}
