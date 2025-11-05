package sippanhelper

import (
	"promise-migration/db"
  "promise-migration/internal/g"
  "promise-migration/internal/model/dbsippan/refrupmodel"
  "promise-migration/internal/model/vmsdb/usermodel"
  "slices"
  "context"
  "log"
)

func TruncateTableAndLog() {

  // Hapus semua data di db_sippan.ref_rup kecuali ucr yg di exclude di file excluded_email.txt
  allVmsUser := usermodel.GetAllUser()
  for _, vmsUser := range allVmsUser {
    skipUser := slices.Contains(g.ExcludedEmails, vmsUser.Email.String)
    if skipUser {
     continue
    } else {
      refrupmodel.DeleteByUcr(vmsUser.Email);
    }
  }

  UpdatePkSequence("ref_rup", "kode_rup")
}

func TruncateTableAndLog2() {

	ctx := context.Background()

	qTruncate := "TRUNCATE TABLE ref_rup CASCADE"
	_, err := db.DbSippan.Exec(ctx, qTruncate)
	if err != nil {
		log.Fatal("Truncate ref_rup Failed, " + err.Error())
	}
	ResetSequence("ref_rup_kode_rup_seq")
}
