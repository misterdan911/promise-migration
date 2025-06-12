package rkeuanganbumodel

import (
	"context"
	"database/sql"
	"github.com/jackc/pgx/v5"
	"log"
	"promise-migration/db"
	"promise-migration/internal/model/dbsidapet/helperusermodel"
	"promise-migration/internal/sidapet/model/sidapet/hbankkwmodel"
	"promise-migration/internal/structs"
)

func InsertRefKeuanganBu(profilePenyedia structs.TblProfilePenyedia, helperUser helperusermodel.HelperUser) {

	if profilePenyedia.IdJenisPenyedia.Int32 == 2 {
		return
	}

	ctx := context.Background()

	var sandiBank sql.NullString

	if profilePenyedia.KodeBank.String == "" {
		strTmp := hbankkwmodel.GetSandiBankFromArbitaryText(profilePenyedia.NmBank.String)
		if strTmp != "" {
			sandiBank = sql.NullString{Valid: true, String: strTmp}
		}
	} else {
		sandiBank = sql.NullString{Valid: true, String: profilePenyedia.KodeBank.String}
	}

	qIns := `
		INSERT INTO ref_keuangan_bu (
		  kode_vendor,
		  nm_pemilik_rek,
		  no_rek,
		  sandi_bank,
		  file_buku_rek,
		  file_lap_keu,
		  file_lap_keu_audited
		) VALUES (
		  @kode_vendor,
		  @nm_pemilik_rek,
		  @no_rek,
		  @sandi_bank,
		  @file_buku_rek,
		  @file_lap_keu,
		  @file_lap_keu_audited
		)`

	args := pgx.NamedArgs{
		"kode_vendor":          helperUser.KodeVendor,
		"nm_pemilik_rek":       profilePenyedia.PemilikRek,
		"no_rek":               profilePenyedia.NoRek,
		"sandi_bank":           sandiBank,
		"file_buku_rek":        profilePenyedia.PathRek,
		"file_lap_keu":         profilePenyedia.PathLapPerus,
		"file_lap_keu_audited": sql.NullString{},
	}

	_, errIns := db.DbSidapet.Exec(ctx, qIns, args)
	if errIns != nil {
		log.Fatal("unable to insert ref_keuangan_bu, " + errIns.Error())
	}
}
