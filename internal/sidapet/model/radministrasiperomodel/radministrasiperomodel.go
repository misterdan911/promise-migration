package radministrasiperomodel

import (
	"context"
	"fmt"
	"github.com/jackc/pgx/v5"
	"promise-migration/db"
	"promise-migration/internal/sidapet/structs"
)

func InsertRefAdministrasiPero(profilePenyedia structs.TblProfilePenyedia) {
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
		"kode_vendor":    profilePenyedia.IdProfilPenyedia,
		"npwp":           profilePenyedia.Npwp,
		"file_skb_pph23": profilePenyedia.PathSkb,
		"file_sk_pp23":   profilePenyedia.PathSkpp23,
	}

	rwIns, errIns := db.DbSidapet.Query(ctx, qIns, args)
	if errIns != nil {
		fmt.Println("unable to insert ref_administrasi_pero, " + errIns.Error())
	}
	defer rwIns.Close()

}
