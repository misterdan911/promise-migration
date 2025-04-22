package rpengurusbumodel

import (
	"context"
	"fmt"
	"github.com/jackc/pgx/v5"
	"promise-migration/db"
	"promise-migration/internal/sidapet/structs"
	"strings"
)

func InsertRefPengurusBu(profilePenyedia structs.TblProfilePenyedia) {
	if profilePenyedia.IdJenisPenyedia.Int32 == 2 {
		return
	}

	ctx := context.Background()

	var bentukBu string
	bentukBu = strings.ToLower(profilePenyedia.Nama.String[0:2])
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
		fmt.Println("unable to insert ref_pengurus_bu, " + errIns.Error())
	}
}
