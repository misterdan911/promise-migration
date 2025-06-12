package radministrasiperomodel

import (
	"context"
	"fmt"
	"log"
	"promise-migration/db"
	"promise-migration/internal/model/dbsidapet/helperusermodel"
	"promise-migration/internal/sidapet/sidapethelper"
	"promise-migration/internal/structs"

	"github.com/jackc/pgx/v5"
)

func InsertRefAdministrasiPero(profilePenyedia structs.TblProfilePenyedia, helperUser helperusermodel.HelperUser) {
	if profilePenyedia.IdJenisPenyedia.Int32 == 1 {
		return
	}

	ctx := context.Background()

	qIns := `
    INSERT INTO ref_administrasi_pero (
      kode_vendor,
      npwp,
      file_skb_pph23,
      file_sk_pp23
    ) VALUES (
      @kode_vendor,
      @npwp,
      @file_skb_pph23,
      @file_sk_pp23
    )`

	args := pgx.NamedArgs{
		"kode_vendor":    helperUser.KodeVendor,
		"npwp":           profilePenyedia.Npwp,
		"file_skb_pph23": profilePenyedia.PathSkb,
		"file_sk_pp23":   profilePenyedia.PathSkpp23,
	}

	_, errIns := db.DbSidapet.Exec(ctx, qIns, args)
	if errIns != nil {
		fmt.Println("npwp" + profilePenyedia.Npwp.String + sidapethelper.GetLen(profilePenyedia.Npwp.String))
		log.Fatal("unable to insert ref_administrasi_pero, " + errIns.Error())
	}

}
