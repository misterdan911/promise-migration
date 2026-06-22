package tblsiqutdppmodel

import (
  "context"
  "log"

  "promise-migration/db"

  "github.com/jackc/pgx/v5"
  "github.com/jackc/pgx/v5/pgtype"
)

type TblSiqutDpp struct {
  IdSiqutDpp       pgtype.Int4
  KodeUnit         pgtype.Text
  KodeUnitLama     pgtype.Text
  IdPpk            pgtype.Int4
  JenisKriteria    pgtype.Text
  JenisPaket       pgtype.Text
  JenisPenawaran   pgtype.Text
  NoSurat          pgtype.Text
  Paket            pgtype.Text
  JenisKegiatan    pgtype.Text
  Pengadaan        pgtype.Text
  Pengadaan2       pgtype.Text
  Pagu             pgtype.Int4
  NilaiHps         pgtype.Int8
  TahunAnggaran    pgtype.Int4
  Rka              pgtype.Int4
  Program          pgtype.Text
  JenisKontrak     pgtype.Text
  PathRancanganKontrak pgtype.Text
  PathKak          pgtype.Text
  IdRup            pgtype.Int4
  PathSpek         pgtype.Text
  PathQuotation    pgtype.Text
  PathDokBa        pgtype.Text
  PathDokAddendum  pgtype.Text
  MetodePemasukan  pgtype.Text
  MetodeEvaluasi   pgtype.Text
  CreatedAt        pgtype.Timestamptz
  UpdatedAt        pgtype.Timestamptz
  Disposisi        pgtype.Text
  TtdKaupbj        pgtype.Int4
  KeteranganDpp    pgtype.Text
  StatusDpp        pgtype.Int4
  Siap             pgtype.Text
}

func GetAllData() []TblSiqutDpp {
  ctx := context.Background()

  qAllData := `
  SELECT
    id_siqut_dpp,
    kode_unit,
    kode_unit_lama,
    id_ppk,
    jenis_kriteria,
    jenis_paket,
    jenis_penawaran,
    no_surat,
    paket,
    jenis_kegiatan,
    pengadaan,
    pengadaan_2,
    pagu,
    nilai_hps,
    tahun_anggaran,
    rka,
    program,
    jenis_kontrak,
    path_rancangan_kontrak,
    path_kak,
    id_rup,
    path_spek,
    path_quotation,
    path_dok_ba,
    path_dok_addendum,
    metode_pemasukan,
    metode_evaluasi,
    created_at,
    updated_at,
    disposisi,
    ttd_kaupbj,
    keterangan_dpp,
    status_dpp,
    siap
  FROM tbl_siqut_dpp
  ORDER BY id_siqut_dpp ASC`

  rwData, err := db.PromiseSiqut.Query(ctx, qAllData)
  if err != nil {
    log.Fatal("Query failed (tbl_siqut_dpp.go), " + err.Error() + " " + qAllData)
  }
  defer rwData.Close()

  allData, err2 := pgx.CollectRows(rwData, pgx.RowToStructByName[TblSiqutDpp])
  if err2 != nil {
    log.Fatal("CollectRows failed (tbl_siqut_dpp.go), " + err2.Error())
  }

  return allData
}
