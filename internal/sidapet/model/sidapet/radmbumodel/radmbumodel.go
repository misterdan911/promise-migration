package radmbumodel

import (
	"context"
	"github.com/jackc/pgx/v5"
	"log"
	"promise-migration/db"
	"promise-migration/internal/model/dbsidapet/helperusermodel"
	"promise-migration/internal/structs"
)

func InsertRefAdmBu(profilePenyedia structs.TblProfilePenyedia, helperUser helperusermodel.HelperUser) {
	if profilePenyedia.IdJenisPenyedia.Int32 == 2 {
		return
	}

	ctx := context.Background()

	qIns := `
    INSERT INTO ref_adm_bu (
      kode_vendor,
      file_fis,
      file_s_kuasa
    ) VALUES (
      @kode_vendor,
      @file_fis,
      @file_s_kuasa
    )`

	args := pgx.NamedArgs{
		"kode_vendor":  helperUser.KodeVendor,
		"file_fis":     profilePenyedia.PathIkutSerta,
		"file_s_kuasa": profilePenyedia.PathKuasa,
	}

	_, errIns := db.DbSidapet.Exec(ctx, qIns, args)
	if errIns != nil {
		log.Fatal("unable to insert ref_adm_bu, " + errIns.Error())
	}
	//defer rwIns.Close()
}
