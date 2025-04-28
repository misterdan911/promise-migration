package rkeuanganbumodel

import (
	"context"
	"database/sql"
	"fmt"
	"github.com/jackc/pgx/v5"
	"promise-migration/db"
	"promise-migration/internal/sidapet/structs"
)

func InsertRefKeuanganBu(profilePenyedia structs.TblProfilePenyedia) {

	if profilePenyedia.IdJenisPenyedia.Int32 == 2 {
		return
	}

	ctx := context.Background()

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
		"kode_vendor":          profilePenyedia.IdProfilPenyedia,
		"nm_pemilik_rek":       profilePenyedia.PemilikRek,
		"no_rek":               profilePenyedia.NoRek,
		"sandi_bank":           sql.NullString{}, // TODO
		"file_buku_rek":        profilePenyedia.PathRek,
		"file_lap_keu":         profilePenyedia.PathLapPerus,
		"file_lap_keu_audited": sql.NullString{},
	}

	_, errIns := db.DbSidapet.Exec(ctx, qIns, args)
	if errIns != nil {
		fmt.Println("unable to insert ref_keuangan_bu, " + errIns.Error())
	}
}
