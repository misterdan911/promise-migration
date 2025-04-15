package rpersonaliaperomodel

import (
	"context"
	"fmt"
	"github.com/jackc/pgx/v5"
	"promise-migration/db"
	"promise-migration/internal/sidapet/structs"
)

func InsertRefPersonaliaPero(profilePenyedia structs.TblProfilePenyedia) {
	if profilePenyedia.IdJenisPenyedia.Int32 == 1 {
		return
	}

	ctx := context.Background()

	qIns := `
    INSERT INTO ref_personalia_pero (
      kode_vendor,
      nama
    ) VALUES (
      @kode_vendor,
      @nama
    )`

	args := pgx.NamedArgs{
		"kode_vendor": profilePenyedia.IdProfilPenyedia,
		"nama":        profilePenyedia.Nama,
	}

	rwIns, errIns := db.DbSidapet.Query(ctx, qIns, args)
	if errIns != nil {
		fmt.Println("unable to insert ref_personalia_pero, " + errIns.Error())
	}
	defer rwIns.Close()

}
