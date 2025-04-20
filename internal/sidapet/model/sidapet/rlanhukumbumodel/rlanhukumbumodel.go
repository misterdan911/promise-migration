package rlanhukumbumodel

import (
	"context"
	"fmt"
	"github.com/jackc/pgx/v5"
	"promise-migration/db"
	"promise-migration/internal/sidapet/structs"
)

func InsertRefLanHukumBu(profilePenyedia structs.TblProfilePenyedia) {

	if profilePenyedia.IdJenisPenyedia.Int32 == 2 {
		return
	}

	ctx := context.Background()

	//qVmsTblAkta := `SELECT `

	qIns := `
    INSERT INTO ref_adm_bu (
      kode_vendor,
      no_akta_awal
    ) VALUES (
      @kode_vendor,
      @no_akta_awal
    )`

	args := pgx.NamedArgs{
		"kode_vendor":  profilePenyedia.IdProfilPenyedia,
		"no_akta_awal": profilePenyedia.PathIkutSerta,
	}

	rwIns, errIns := db.DbSidapet.Query(ctx, qIns, args)
	if errIns != nil {
		fmt.Println("unable to insert ref_adm_bu, " + errIns.Error())
	}
	defer rwIns.Close()
}
