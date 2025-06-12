package rdatadiriumummodel

import (
	"context"
	"database/sql"
	"fmt"
	"log"
	"promise-migration/db"
	"promise-migration/internal/model/dbsidapet/helperusermodel"
	"promise-migration/internal/sidapet/model/hdomisilimodel"
	"promise-migration/internal/sidapet/sidapethelper"
	"promise-migration/internal/structs"

	"github.com/jackc/pgx/v5"
)

func InsertRefDataDiriUmum(profilePenyedia structs.TblProfilePenyedia, helperuser helperusermodel.HelperUser) {
	ctx := context.Background()

	var nama sql.NullString
	var namaBadanUsaha sql.NullString
	var kodeKabKota sql.NullString
	var alamatDomisili sql.NullString
	var alamatBU sql.NullString

	if profilePenyedia.IdJenisPenyedia.Int32 == 1 { // kalau badan usaha
		if profilePenyedia.Nama.String != "" {
			namaBadanUsaha = sql.NullString{Valid: true, String: profilePenyedia.Nama.String}
		}

		if profilePenyedia.Alamat.String != "" {
			alamatBU = sql.NullString{Valid: true, String: profilePenyedia.Alamat.String}
		}

	} else if profilePenyedia.IdJenisPenyedia.Int32 == 2 { // kalau perorangan
		if profilePenyedia.Nama.String != "" {
			nama = sql.NullString{Valid: true, String: profilePenyedia.Nama.String}
		}

		strKodeKabKota := hdomisilimodel.GetKodeKabKotaByKodeDomisili(profilePenyedia.IdDomisili.Int32)
		if strKodeKabKota != "" {
			kodeKabKota = sql.NullString{Valid: true, String: strKodeKabKota}
		}

		if profilePenyedia.Alamat.String != "" {
			alamatDomisili = sql.NullString{Valid: true, String: profilePenyedia.Alamat.String}
		}
	}

	qIns := `
    INSERT INTO ref_datadiri_umum (
      kode_vendor,
      nama,
      nama_badan_usaha,
      nomor_telp,
      email,
      kode_kab_kota_domisili,
      alamat_domisili,
      alamat_badan_usaha
    ) VALUES (
      @kode_vendor,
      @nama,
      @nama_badan_usaha,
      @nomor_telp,
      @email,
      @kode_kab_kota_domisili,
      @alamat_domisili,
      @alamat_badan_usaha
    )`

	args := pgx.NamedArgs{
		"kode_vendor":            helperuser.KodeVendor,
		"nama":                   nama,
		"nama_badan_usaha":       namaBadanUsaha,
		"nomor_telp":             profilePenyedia.NoTelp,
		"email":                  profilePenyedia.Email,
		"kode_kab_kota_domisili": kodeKabKota,
		"alamat_domisili":        alamatDomisili,
		"alamat_badan_usaha":     alamatBU,
	}

	_, errIns := db.DbSidapet.Exec(ctx, qIns, args)
	if errIns != nil {
		fmt.Println("email: " + profilePenyedia.Email.String + sidapethelper.GetLen(profilePenyedia.Email.String))
		log.Fatal("unable to insert ref_datadiri_umum, " + errIns.Error())
	}
}
