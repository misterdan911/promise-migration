package refumummodel

import (
  "context"
  "log"
  "promise-migration/db"

  "github.com/jackc/pgx/v5"
  "github.com/jackc/pgx/v5/pgtype"
)

type RefUmum struct {
  KodeUmum                 pgtype.Int4
  KodeVendor               pgtype.Int4
  NomorTelp                pgtype.Text
  KodeKualifikasiUsaha     pgtype.Int2
  AlamatBadanUsaha         pgtype.Text
  FileDokDomisili          pgtype.Text
  IsDokDomisiliSelamanya   pgtype.Bool
  DokDomisiliBerlakuAwal   pgtype.Date
  DokDomisiliBerlakuAkhir  pgtype.Date
  EncryptKeyDokDomisili    pgtype.Text
  RevisiKe                 pgtype.Int2
  KodeKabKotaDomisili      pgtype.Text
}

func InsertNew(refUmum RefUmum) {
  ctx := context.Background()

  qInsert := `
  INSERT INTO ref_umum (
    kode_vendor,
    nomor_telp,
    kode_kualifikasi_usaha,
    alamat_badan_usaha,
    file_dok_domisili,
    is_dok_domisili_selamanya,
    dok_domisili_berlaku_awal,
    dok_domisili_berlaku_akhir,
    encrypt_key_dok_domisili,
		kode_kab_kota_domisili
  ) VALUES (
    @kode_vendor,
    @nomor_telp,
    @kode_kualifikasi_usaha,
    @alamat_badan_usaha,
    @file_dok_domisili,
    @is_dok_domisili_selamanya,
    @dok_domisili_berlaku_awal,
    @dok_domisili_berlaku_akhir,
    @encrypt_key_dok_domisili,
		@kode_kab_kota_domisili
  )`

  args := pgx.NamedArgs{
    "kode_vendor":                  refUmum.KodeVendor,
    "nomor_telp":                   refUmum.NomorTelp,
    "kode_kualifikasi_usaha":       refUmum.KodeKualifikasiUsaha,
    "alamat_badan_usaha":           refUmum.AlamatBadanUsaha,
    "file_dok_domisili":            refUmum.FileDokDomisili,
    "is_dok_domisili_selamanya":    refUmum.IsDokDomisiliSelamanya,
    "dok_domisili_berlaku_awal":    refUmum.DokDomisiliBerlakuAwal,
    "dok_domisili_berlaku_akhir":   refUmum.DokDomisiliBerlakuAkhir,
    "encrypt_key_dok_domisili":     refUmum.EncryptKeyDokDomisili,
    "kode_kab_kota_domisili":       refUmum.KodeKabKotaDomisili,
  }

  _, errIns := db.DbSidapet.Exec(ctx, qInsert, args)
  if errIns != nil {
    log.Fatal("unable to insert ref_umum, " + errIns.Error())
  }
}
