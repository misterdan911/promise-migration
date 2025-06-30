package trxvendorpenjrmodel

import (
	"context"
	"database/sql"
	"fmt"
	"github.com/jackc/pgx/v5"
	"github.com/jackc/pgx/v5/pgtype"
	"log"
	"promise-migration/db"
	"promise-migration/internal/sidapet/model/sidapet/trxnilaiakhirmodel"
	"promise-migration/internal/sidapet/model/vmsdb/tverifmodel"
)

type TrxVPNewRow struct {
	KodeVendorPenjr pgtype.Int4
}

func InsertTrxVendorPenjr(tverif tverifmodel.TblVerif, kodeJenisVendor int) {

	ctx := context.Background()

	qIns := `
    INSERT INTO trx_vendor_penjr (
			kode_penjaringan,
			kode_vendor,
			status_verifikasi,
			alasan_ditolak,
			batas_waktu_perbaikan,
			file_daftar_kehadiran,
			file_lainnya,
			file_ba_verif,
			status_dpt,
			alasan_tidak_terpilih
    ) VALUES (
			@kode_penjaringan,
			@kode_vendor,
			@status_verifikasi,
			@alasan_ditolak,
			@batas_waktu_perbaikan,
			@file_daftar_kehadiran,
			@file_lainnya,
			@file_ba_verif,
			@status_dpt,
			@alasan_tidak_terpilih
    ) RETURNING kode_vendor_penjr`

	var statusVerifikasi string
	if (tverif.StatusVerif.Int32 == 4) && (tverif.Terpilih.Int32 == 1) {
		statusVerifikasi = "diterima"
	} else {
		statusVerifikasi = "ditolak"
	}

	var statusDpt string
	if tverif.Terpilih.Int32 == 1 {
		statusDpt = "terpilih"
	} else {
		statusDpt = "tidak_terpilih"
	}

	args := pgx.NamedArgs{
		"kode_penjaringan":      tverif.IdPaket,
		"kode_vendor":           tverif.IdProfil,
		"status_verifikasi":     sql.NullString{Valid: true, String: statusVerifikasi},
		"alasan_ditolak":        sql.NullString{},
		"batas_waktu_perbaikan": sql.NullTime{},
		"file_daftar_kehadiran": sql.NullString{},
		"file_lainnya":           sql.NullString{},
		"file_ba_verif":         sql.NullString{},
		"status_dpt":            sql.NullString{Valid: true, String: statusDpt},
		"alasan_tidak_terpilih": sql.NullString{},
	}

	rwTVP, errIns := db.DbSidapet.Query(ctx, qIns, args)
	if errIns != nil {
		fmt.Println("unable to insert trx_vendor_penjr, " + errIns.Error())
	}

	allTVP, err := pgx.CollectRows(rwTVP, pgx.RowToStructByName[TrxVPNewRow])
	if err != nil {
		log.Fatal("failed collecting rwTVP, " + err.Error())
	}
	defer rwTVP.Close()

	kodeVendorPenjr := int(allTVP[0].KodeVendorPenjr.Int32)

	trxnilaiakhirmodel.InsertTrxNilaiakhir(kodeJenisVendor, kodeVendorPenjr, tverif)
}
