package rpersonaliaperomodel

import (
	"context"
	"github.com/jackc/pgx/v5"
	"log"
	"promise-migration/db"
	"promise-migration/internal/model/dbsidapet/helperusermodel"
	"promise-migration/internal/structs"
)

func InsertRefPersonaliaPero(profilePenyedia structs.TblProfilePenyedia, helperUser helperusermodel.HelperUser) {
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
		"kode_vendor": helperUser.KodeVendor,
		"nama":        profilePenyedia.Nama,
	}

	_, errIns := db.DbSidapet.Exec(ctx, qIns, args)
	if errIns != nil {
		log.Fatal("unable to insert ref_personalia_pero, " + errIns.Error())
	}

}
