package rdatadiriumummodel

import (
	"context"
	"fmt"
	"github.com/jackc/pgx/v5"
	"promise-migration/db"
	"promise-migration/internal/sidapet/model/hdomisilimodel"
	"promise-migration/internal/sidapet/structs"
)

func InsertRefDataDiriUmum(profilePenyedia structs.TblProfilePenyedia) {
	ctx := context.Background()

	var nama string
	var namaBadanUsaha string

	if profilePenyedia.IdJenisPenyedia.Int32 == 1 {
		namaBadanUsaha = profilePenyedia.Nama.String
	} else if profilePenyedia.IdJenisPenyedia.Int32 == 2 {
		nama = profilePenyedia.Nama.String
	}

	var kodeKabKota string = hdomisilimodel.GetKodeKabKotaByKodeDomisili(profilePenyedia.IdDomisili.Int32)

	qIns := `
    INSERT INTO ref_datadiri_umum (
      kode_vendor,
      nama,
      nama_badan_usaha,
      nomor_telp,
      email,
      kode_kab_kota_domisili
    ) VALUES (
      @kode_vendor,
      @nama,
      @nama_badan_usaha,
      @nomor_telp,
      @email,
      @kode_kab_kota_domisili
    )`

	args := pgx.NamedArgs{
		"kode_vendor":            profilePenyedia.IdProfilPenyedia,
		"nama":                   nama,
		"nama_badan_usaha":       namaBadanUsaha,
		"nomor_telp":             profilePenyedia.NoTelp,
		"email":                  profilePenyedia.Email,
		"kode_kab_kota_domisili": kodeKabKota,
	}

	rwIns, errIns := db.DbSidapet.Query(ctx, qIns, args)
	if errIns != nil {
		fmt.Println("unable to insert ref_datadiri_umum, " + errIns.Error())
	}
	defer rwIns.Close()
}
