package trxpenjaringanmodel

import (
	"context"
	"fmt"
	"github.com/jackc/pgx/v5"
	"github.com/jackc/pgx/v5/pgtype"
	"log"
	"promise-migration/db"
	// "promise-migration/internal/sidapet/model/sidapet/tverifikatorpenjrmodel"
	// "promise-migration/internal/sidapet/structs"
	"strconv"
	// "strings"
)

type TrxPenjaringan struct {
  KodePenjaringan           pgtype.Int4
  KodeTrxKategori           pgtype.Int4
  NamaPenjaringan           pgtype.Text
  Keperluan                 pgtype.Text
  KodeJenisPengadaan        pgtype.Int2
  KodeJenisVendor           pgtype.Int2
  Metode                    pgtype.Text
  FilePersyaratan           pgtype.Text
  KodeStatusPengajuan       pgtype.Int4
  StatusPersetujuan         pgtype.Text
  UserPersetujuan           pgtype.Text
  AlasanDitolak             pgtype.Text
  StatusPengajuanPjr        pgtype.Text
  StatusProsesPjr           pgtype.Text
  StatusPengumumanDpt       pgtype.Text
  TglDaftarAwal             pgtype.Timestamptz
  TglDaftarAkhir            pgtype.Timestamptz
  TglVerifikasiAwal         pgtype.Timestamptz
  TglVerifikasiAkhir        pgtype.Timestamptz
  TglEvaluasiAwal           pgtype.Timestamptz
  TglEvaluasiAkhir          pgtype.Timestamptz
  TglPengumuman             pgtype.Timestamptz
  StatusSTugas              pgtype.Text
  FileSTugas                pgtype.Text
  KeypassSTugas             pgtype.Text
  FileSTugasAfterTte        pgtype.Text
  KodeTrxPenandatangan      pgtype.Int4
  NomorSurat               pgtype.Text
  FilePengumuman           pgtype.Text
  NamaPembuatPenjaringan   pgtype.Text
  KodeUnitPbj              pgtype.Text
  Ucr                      pgtype.Text
  Udcr                     pgtype.Timestamptz
  Udch                     pgtype.Timestamptz
	KodeStatusPenjaringan     pgtype.Int4
  KeypassFilePersyaratan    pgtype.Text
  FilePersyaratanDraft     pgtype.Text
  TanggalTteSuratTugas     pgtype.Date
}

type StructKodePenjaringan struct {
	KodePenjaringan pgtype.Int4
}

func GetAllData() []TrxPenjaringan {
  var allTrxPenjaringan []TrxPenjaringan
  ctx := context.Background()

  qTrxPenjaringan := `
  SELECT
    kode_penjaringan,
    kode_trx_kategori,
    nama_penjaringan,
    keperluan,
    kode_jenis_pengadaan,
    kode_jenis_vendor,
    metode,
    file_persyaratan,
    kode_status_pengajuan,
    status_persetujuan,
    user_persetujuan,
    alasan_ditolak,
    status_pengajuan_pjr,
    status_proses_pjr,
    status_pengumuman_dpt,
    tgl_daftar_awal,
    tgl_daftar_akhir,
    tgl_verifikasi_awal,
    tgl_verifikasi_akhir,
    tgl_evaluasi_awal,
    tgl_evaluasi_akhir,
    tgl_pengumuman,
    status_s_tugas,
    file_s_tugas,
    keypass_s_tugas,
    file_s_tugas_after_tte,
    kode_trx_penandatangan,
    nomor_surat,
    file_pengumuman,
    nama_pembuat_penjaringan,
    kode_unit_pbj,
    ucr,
    udcr,
    udch,
    keypass_file_persyaratan,
    file_persyaratan_draft,
    tanggal_tte_surat_tugas
  FROM public.trx_penjaringan`

  rows, err := db.DbSidapet.Query(ctx, qTrxPenjaringan)
  if err != nil {
    log.Fatal("qTrxPenjaringan Failed, " + err.Error() + " " + qTrxPenjaringan)
  }

  allTrxPenjaringan, err = pgx.CollectRows(rows, pgx.RowToStructByName[TrxPenjaringan])
  if err != nil {
    log.Fatal("failed collecting rows (trxpenjaringanmodel.go:GetAllData), " + err.Error())
  }
  defer rows.Close()

  return allTrxPenjaringan
}

func InsertTrxPenjaringan(trx TrxPenjaringan) pgtype.Int4 {
  ctx := context.Background()

  // Set default values if needed
  // if !trx.Udcr.Valid {
  //   trx.Udcr = pgtype.Timestamptz{Time: time.Now(), Valid: true}
  // }
  // if !trx.Udch.Valid {
  //   trx.Udch = pgtype.Timestamptz{Time: time.Now(), Valid: true}
  // }

  qInsertPenjaringan := `
  INSERT INTO trx_penjaringan (
    kode_trx_kategori,
    nama_penjaringan,
    keperluan,
    kode_jenis_pengadaan,
    kode_jenis_vendor,
    metode,
    file_persyaratan,
    kode_status_pengajuan,
    status_persetujuan,
    user_persetujuan,
    alasan_ditolak,
    status_pengajuan_pjr,
    status_proses_pjr,
    status_pengumuman_dpt,
    tgl_daftar_awal,
    tgl_daftar_akhir,
    tgl_verifikasi_awal,
    tgl_verifikasi_akhir,
    tgl_evaluasi_awal,
    tgl_evaluasi_akhir,
    tgl_pengumuman,
    status_s_tugas,
    file_s_tugas,
    keypass_s_tugas,
    file_s_tugas_after_tte,
    kode_trx_penandatangan,
    nomor_surat,
    file_pengumuman,
    nama_pembuat_penjaringan,
    kode_unit_pbj,
    ucr,
    udcr,
    udch,
		kode_status_penjaringan,
    keypass_file_persyaratan,
    file_persyaratan_draft,
    tanggal_tte_surat_tugas
  ) VALUES (
    @kode_trx_kategori,
    @nama_penjaringan,
    @keperluan,
    @kode_jenis_pengadaan,
    @kode_jenis_vendor,
    @metode,
    @file_persyaratan,
    @kode_status_pengajuan,
    @status_persetujuan,
    @user_persetujuan,
    @alasan_ditolak,
    @status_pengajuan_pjr,
    @status_proses_pjr,
    @status_pengumuman_dpt,
    @tgl_daftar_awal,
    @tgl_daftar_akhir,
    @tgl_verifikasi_awal,
    @tgl_verifikasi_akhir,
    @tgl_evaluasi_awal,
    @tgl_evaluasi_akhir,
    @tgl_pengumuman,
    @status_s_tugas,
    @file_s_tugas,
    @keypass_s_tugas,
    @file_s_tugas_after_tte,
    @kode_trx_penandatangan,
    @nomor_surat,
    @file_pengumuman,
    @nama_pembuat_penjaringan,
    @kode_unit_pbj,
    @ucr,
    @udcr,
    @udch,
    @kode_status_penjaringan,
		@keypass_file_persyaratan,
    @file_persyaratan_draft,
    @tanggal_tte_surat_tugas
  ) RETURNING kode_penjaringan`

  args := pgx.NamedArgs{
    "kode_trx_kategori":        trx.KodeTrxKategori,
    "nama_penjaringan":         trx.NamaPenjaringan,
    "keperluan":                trx.Keperluan,
    "kode_jenis_pengadaan":     trx.KodeJenisPengadaan,
    "kode_jenis_vendor":        trx.KodeJenisVendor,
    "metode":                   trx.Metode,
    "file_persyaratan":          trx.FilePersyaratan,
    "kode_status_pengajuan":    trx.KodeStatusPengajuan,
    "status_persetujuan":       trx.StatusPersetujuan,
    "user_persetujuan":         trx.UserPersetujuan,
    "alasan_ditolak":           trx.AlasanDitolak,
    "status_pengajuan_pjr":     trx.StatusPengajuanPjr,
    "status_proses_pjr":        trx.StatusProsesPjr,
    "status_pengumuman_dpt":    trx.StatusPengumumanDpt,
    "tgl_daftar_awal":          trx.TglDaftarAwal,
    "tgl_daftar_akhir":         trx.TglDaftarAkhir,
    "tgl_verifikasi_awal":      trx.TglVerifikasiAwal,
    "tgl_verifikasi_akhir":     trx.TglVerifikasiAkhir,
    "tgl_evaluasi_awal":        trx.TglEvaluasiAwal,
    "tgl_evaluasi_akhir":       trx.TglEvaluasiAkhir,
    "tgl_pengumuman":           trx.TglPengumuman,
    "status_s_tugas":           trx.StatusSTugas,
    "file_s_tugas":             trx.FileSTugas,
    "keypass_s_tugas":          trx.KeypassSTugas,
    "file_s_tugas_after_tte":   trx.FileSTugasAfterTte,
    "kode_trx_penandatangan":   trx.KodeTrxPenandatangan,
    "nomor_surat":              trx.NomorSurat,
    "file_pengumuman":          trx.FilePengumuman,
    "nama_pembuat_penjaringan": trx.NamaPembuatPenjaringan,
    "kode_unit_pbj":            trx.KodeUnitPbj,
    "ucr":                      trx.Ucr,
    "udcr":                     trx.Udcr,
    "udch":                     trx.Udch,
    "kode_status_penjaringan":  trx.KodeStatusPenjaringan,
    "keypass_file_persyaratan": trx.KeypassFilePersyaratan,
    "file_persyaratan_draft":   trx.FilePersyaratanDraft,
    "tanggal_tte_surat_tugas":  trx.TanggalTteSuratTugas,
  }

  var kodePenjaringan pgtype.Int4
  rwTrxPenjaringan, err := db.DbSidapet.Query(ctx, qInsertPenjaringan, args)
  if err != nil {
    fmt.Println("unable to insert trx_penjaringan, " + err.Error())
  }
  defer rwTrxPenjaringan.Close()

	sliceKodePenjaringan, err2 := pgx.CollectRows(rwTrxPenjaringan, pgx.RowToStructByName[StructKodePenjaringan])
	if err2 != nil {
		log.Fatal("failed collecting sliceKodePenjaringan, " + err2.Error())
	}

	if len(sliceKodePenjaringan) > 0 {
		kodePenjaringan = sliceKodePenjaringan[0].KodePenjaringan
	}

	return kodePenjaringan
}

func GetPenjaringanByKodePenjaringan(kodePenjaringan int) TrxPenjaringan {
	ctx := context.Background()

	var penjaringan TrxPenjaringan

	qPenjaringan := `
    SELECT
    kode_penjaringan,
    kode_trx_kategori,
    nama_penjaringan,
    keperluan,
    kode_jenis_pengadaan,
    kode_jenis_vendor,
    metode,
    file_persyaratan,
    kode_status_pengajuan,
    status_persetujuan,
    user_persetujuan,
    alasan_ditolak,
    status_pengajuan_pjr,
    status_proses_pjr,
    status_pengumuman_dpt,
    tgl_daftar_awal,
    tgl_daftar_akhir,
    tgl_verifikasi_awal,
    tgl_verifikasi_akhir,
    tgl_evaluasi_awal,
    tgl_evaluasi_akhir,
    tgl_pengumuman,
    status_s_tugas,
    file_s_tugas,
    keypass_s_tugas,
    file_s_tugas_after_tte,
    kode_trx_penandatangan,
    nomor_surat,
    file_pengumuman,
    nama_pembuat_penjaringan,
    kode_unit_pbj,
    ucr,
    udcr,
    udch,
    keypass_file_persyaratan,
    file_persyaratan_draft,
    tanggal_tte_surat_tugas
  FROM trx_penjaringan
  WHERE kode_penjaringan = $1`

	rPenjaringan, errPjr := db.DbSidapet.Query(ctx, qPenjaringan, strconv.Itoa(kodePenjaringan))
	if errPjr != nil {
		log.Fatal("qPenjaringan Failed, " + errPjr.Error() + " " + qPenjaringan)
	}

	allPjr, errCollect := pgx.CollectRows(rPenjaringan, pgx.RowToStructByName[TrxPenjaringan])
	if errCollect != nil {
		log.Fatal("failed collecting allPjr, " + errCollect.Error())
	}
	defer rPenjaringan.Close()

	if len(allPjr) > 0 {
		penjaringan = allPjr[0]
	}

	return penjaringan
}

func DeleteByKodePenjaringan(kodePenjaringan pgtype.Int4) {
  ctx := context.Background()

  qDelete := `DELETE FROM trx_penjaringan WHERE kode_penjaringan = $1`
  _, err := db.DbSidapet.Exec(ctx, qDelete, kodePenjaringan)
  if err != nil {
    log.Fatal("failed deleting trx_penjaringan (trxpenjaringanmodel.go:DeleteByKodePenjaringan), " + err.Error())
  }

}

func DeleteWhereUcrNull() {
  ctx := context.Background()

  qDelete := `DELETE FROM trx_penjaringan WHERE ucr IS NULL`
  _, err := db.DbSidapet.Exec(ctx, qDelete)
  if err != nil {
    log.Fatal("failed deleting trx_penjaringan (trxpenjaringanmodel.go:DeleteWhereUcrNull), " + err.Error())
  }
}
