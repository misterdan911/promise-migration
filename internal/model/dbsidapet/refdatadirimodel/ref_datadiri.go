package refdatadirimodel

import (
	"context"
	"log"
	"promise-migration/db"

	"github.com/jackc/pgx/v5"
	"github.com/jackc/pgx/v5/pgtype"
)

type RefDatadiri struct {
  KodeDatadiri         pgtype.Int4
  KodeVendor           pgtype.Int4
  TempatLahir          pgtype.Text
  TglLahir             pgtype.Date
  FileKtp              pgtype.Text
  EncryptKeyKtp        pgtype.Text
  KodeKabKotaKtp       pgtype.Text
  AlamatKtp            pgtype.Text
  IsAlamatSama         pgtype.Bool
  KodeKabKotaDomisili  pgtype.Text
  AlamatDomisili       pgtype.Text
  FileSkd              pgtype.Text
  IsSkdSelamanya       pgtype.Bool
  SkdBerlakuAwal       pgtype.Date
  SkdBerlakuAkhir      pgtype.Date
  EncryptKeySkd        pgtype.Text
  RevisiKe             pgtype.Int2
}

func InsertNew(refDatadiri RefDatadiri) {
  ctx := context.Background()

  qInsert := `
  INSERT INTO ref_datadiri (
    kode_vendor,
    tempat_lahir,
    tgl_lahir,
    file_ktp,
    encrypt_key_ktp,
    kode_kab_kota_ktp,
    alamat_ktp,
    is_alamat_sama,
    kode_kab_kota_domisili,
    alamat_domisili,
    file_skd,
    is_skd_selamanya,
    skd_berlaku_awal,
    skd_berlaku_akhir,
    encrypt_key_skd
  ) VALUES (
    @kode_vendor,
    @tempat_lahir,
    @tgl_lahir,
    @file_ktp,
    @encrypt_key_ktp,
    @kode_kab_kota_ktp,
    @alamat_ktp,
    @is_alamat_sama,
    @kode_kab_kota_domisili,
    @alamat_domisili,
    @file_skd,
    @is_skd_selamanya,
    @skd_berlaku_awal,
    @skd_berlaku_akhir,
    @encrypt_key_skd
  )`

  args := pgx.NamedArgs{
    "kode_vendor":            refDatadiri.KodeVendor,
    "tempat_lahir":           refDatadiri.TempatLahir,
    "tgl_lahir":              refDatadiri.TglLahir,
    "file_ktp":               refDatadiri.FileKtp,
    "encrypt_key_ktp":        refDatadiri.EncryptKeyKtp,
    "kode_kab_kota_ktp":      refDatadiri.KodeKabKotaKtp,
    "alamat_ktp":             refDatadiri.AlamatKtp,
    "is_alamat_sama":         refDatadiri.IsAlamatSama,
    "kode_kab_kota_domisili": refDatadiri.KodeKabKotaDomisili,
    "alamat_domisili":        refDatadiri.AlamatDomisili,
    "file_skd":               refDatadiri.FileSkd,
    "is_skd_selamanya":       refDatadiri.IsSkdSelamanya,
    "skd_berlaku_awal":       refDatadiri.SkdBerlakuAwal,
    "skd_berlaku_akhir":      refDatadiri.SkdBerlakuAkhir,
    "encrypt_key_skd":        refDatadiri.EncryptKeySkd,
  }

  _, errIns := db.DbSidapet.Exec(ctx, qInsert, args)
  if errIns != nil {
    log.Fatal("unable to insert ref_datadiri, " + errIns.Error())
  }
}