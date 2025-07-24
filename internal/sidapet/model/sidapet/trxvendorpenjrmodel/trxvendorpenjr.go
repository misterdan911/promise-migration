package trxvendorpenjrmodel

import (
	"context"
	"log"
	"promise-migration/db"
	"promise-migration/internal/model/vmsdb/tblverifmodel"

	"github.com/jackc/pgx/v5"
	"github.com/jackc/pgx/v5/pgtype"
)

type TrxVPNewRow struct {
	KodeVendorPenjr pgtype.Int4
}

type TrxVendorPenjr struct {
    KodeVendorPenjr        pgtype.Int4
    KodePenjaringan        pgtype.Int4
    KodeVendor            pgtype.Int4
    StatusVerifikasi      pgtype.Text // Assuming status_verifikasi is text-based
    AlasanDitolak         pgtype.Text
    BatasWaktuPerbaikan   pgtype.Timestamptz
    FileDaftarKehadiran   pgtype.Text
    FileLainya            pgtype.Text
    FileBaVerif           pgtype.Text
    StatusDpt             pgtype.Text // Assuming status_dpt is text-based
    AlasanTidakTerpilih   pgtype.Text
}

func InsertTrxVendorPenjr(tverif tblverifmodel.TblVerif, kodeJenisVendor pgtype.Int4) {

  /*
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
		"file_lainnya":          sql.NullString{},
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
  */
}


func InsertNew(trxVendorPenjr TrxVendorPenjr) pgtype.Int4 {

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

  args := pgx.NamedArgs{
    "kode_penjaringan":      trxVendorPenjr.KodePenjaringan,
    "kode_vendor":           trxVendorPenjr.KodeVendor,
    "status_verifikasi":     trxVendorPenjr.StatusVerifikasi,
    "alasan_ditolak":        trxVendorPenjr.AlasanDitolak,
    "batas_waktu_perbaikan": trxVendorPenjr.BatasWaktuPerbaikan,
    "file_daftar_kehadiran": trxVendorPenjr.FileDaftarKehadiran,
    "file_lainnya":          trxVendorPenjr.FileLainya,
    "file_ba_verif":         trxVendorPenjr.FileBaVerif,
    "status_dpt":            trxVendorPenjr.StatusDpt,
    "alasan_tidak_terpilih": trxVendorPenjr.AlasanTidakTerpilih,
  }

  rwTVP, errIns := db.DbSidapet.Query(ctx, qIns, args)
  if errIns != nil {
    log.Fatal("unable to insert trx_vendor_penjr, " + errIns.Error())
  }

  allTVP, err := pgx.CollectRows(rwTVP, pgx.RowToStructByName[TrxVPNewRow])
  if err != nil {
    log.Fatal("failed collecting rwTVP, " + err.Error())
  }
  defer rwTVP.Close()

  return allTVP[0].KodeVendorPenjr
}