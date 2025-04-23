package rdatapajakbumodel

import (
	"context"
	"database/sql"
	"fmt"
	"github.com/jackc/pgx/v5"
	"promise-migration/db"
	"promise-migration/internal/sidapet/structs"
)

func InsertrefDataPajakBu(profilePenyedia structs.TblProfilePenyedia) {

	if profilePenyedia.IdJenisPenyedia.Int32 == 2 {
		return
	}

	ctx := context.Background()

	qIns := `
		INSERT INTO ref_data_pajak_bu (
		  kode_vendor,
		  npwp,
		  file_npwp,
		  file_bukti_kswp,
		  file_bukti_spt,
		  file_skb_pph23,
		  file_sk_pp23
		) VALUES (
		  @kode_vendor,
		  @npwp,
		  @file_npwp,
		  @file_bukti_kswp,
		  @file_bukti_spt,
		  @file_skb_pph23,
		  @file_sk_pp23
		)`

	args := pgx.NamedArgs{
		"kode_vendor":     profilePenyedia.IdProfilPenyedia,
		"npwp":            profilePenyedia.Npwp,
		"file_npwp":       profilePenyedia.PathNpwp,
		"file_bukti_kswp": sql.NullString{},
		"file_bukti_spt":  sql.NullString{},
		"file_skb_pph23":  profilePenyedia.PathSkb,
		"file_sk_pp23":    profilePenyedia.PathSkpp23,
	}

	_, errIns := db.DbSidapet.Exec(ctx, qIns, args)
	if errIns != nil {
		fmt.Println("unable to insert ref_data_pajak_bu, " + errIns.Error())
	}
}
