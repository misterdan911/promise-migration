package rdatapajakbumodel

import (
	"context"
	"database/sql"
	"github.com/jackc/pgx/v5"
	"log"
	"promise-migration/db"
	"promise-migration/internal/model/dbsidapet/helperusermodel"
	"promise-migration/internal/structs"
)

func InsertrefDataPajakBu(profilePenyedia structs.TblProfilePenyedia, helperUser helperusermodel.HelperUser) {

	if profilePenyedia.IdJenisPenyedia.Int32 == 2 {
		return
	}

	ctx := context.Background()

	qIns := `
		INSERT INTO ref_data_pajak_bu (
		  kode_vendor,
		  file_bukti_kswp,
		  file_bukti_spt,
		  file_skb_pph23,
		  file_sk_pp23
		) VALUES (
		  @kode_vendor,
		  @file_bukti_kswp,
		  @file_bukti_spt,
		  @file_skb_pph23,
		  @file_sk_pp23
		)`

	args := pgx.NamedArgs{
		"kode_vendor":     helperUser.KodeVendor,
		"file_bukti_kswp": sql.NullString{},
		"file_bukti_spt":  sql.NullString{},
		"file_skb_pph23":  profilePenyedia.PathSkb,
		"file_sk_pp23":    profilePenyedia.PathSkpp23,
	}

	_, errIns := db.DbSidapet.Exec(ctx, qIns, args)
	if errIns != nil {
		log.Fatal("unable to insert ref_data_pajak_bu, " + errIns.Error())
	}
}
