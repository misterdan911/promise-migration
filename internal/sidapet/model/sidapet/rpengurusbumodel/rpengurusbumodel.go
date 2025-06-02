package rpengurusbumodel

import (
	"context"
	"github.com/jackc/pgx/v5"
	"log"
	"promise-migration/db"
	"promise-migration/internal/structs"
	"strings"
)

func InsertRefPengurusBu(profilePenyedia structs.TblProfilePenyedia) {
	if profilePenyedia.IdJenisPenyedia.Int32 == 2 {
		return
	}

	ctx := context.Background()
	var bentukBu string

	if len(profilePenyedia.Nama.String) < 2 {
		return
	}

	bentukBu = strings.ToLower(profilePenyedia.Nama.String[0:2]) // Extracts the first two characters using slice notation
	if bentukBu != "pt" || bentukBu != "cv" {
		if strings.Contains(strings.ToLower(profilePenyedia.Nama.String), "pt") {
			bentukBu = "pt"
		} else if strings.Contains(strings.ToLower(profilePenyedia.Nama.String), "cv") {
			bentukBu = "cv"
		} else {
			// kalo gak ke detek pt atau cv maka program jangan dilanjutkan
			return
		}
	}

	qIns := `
    INSERT INTO ref_pengurus_bu (
      kode_vendor,
      bentuk_bu
    ) VALUES (
      @kode_vendor,
      @bentuk_bu
    )`

	args := pgx.NamedArgs{
		"kode_vendor": profilePenyedia.IdProfilPenyedia,
		"bentuk_bu":   bentukBu,
	}

	_, errIns := db.DbSidapet.Exec(ctx, qIns, args)
	if errIns != nil {
		log.Fatal("unable to insert ref_pengurus_bu, " + errIns.Error())
	}
}
