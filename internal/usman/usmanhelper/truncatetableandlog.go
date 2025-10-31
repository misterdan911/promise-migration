package usmanhelper

import (
	"context"
	"log"
	"promise-migration/db"
	"promise-migration/internal/g"
	"promise-migration/internal/ghelper"
	"promise-migration/internal/model/dbusman/refusermodel"
	"promise-migration/internal/usman/model/vmsdb/usermodel"
	"slices"
)

func TruncateTableAndLog() {

	// Kosongkan tabel db_sidapet.helper_user
	TruncatedbSidapetHelperUser()

	// Hapus semua user di db_usman.ref_user kecuali yg di exclude di file excluded_email.txt
	allVmsUser := usermodel.GetAllUser()
	for _, vmsUser := range allVmsUser {
		skipUser := slices.Contains(g.ExcludedEmails, vmsUser.Email.String)
		if skipUser {
			continue
		} else {
			refusermodel.DeleteByEmail(vmsUser.Email)
		}
	}

	UpdatePkSequence2("ref_user", "id", "ref_user_id_seq")
	UpdatePkSequence2("ref_user_external", "id", "ref_user_external_id_seq")
	UpdatePkSequence2("ref_user_internal", "id", "ref_user_internal_id_seq")
	UpdatePkSequence2("trx_group_user", "id_group_user", "trx_group_user_id_seq")

	// Truncate Log File
	//TruncateLog("pengalaman_bu.txt")
	ghelper.DeleteLogUserFolder()
}

func TruncateTableAndLog2() {

	ctx := context.Background()

	qTruncate := "TRUNCATE TABLE ref_user CASCADE"
	_, err := db.DbUsman.Exec(ctx, qTruncate)
	if err != nil {
		log.Fatal("Truncate ref_user Failed, " + err.Error())
	}
	ResetSequence("ref_user_id_seq")

	qTruncate = "TRUNCATE TABLE ref_user_internal"
	_, err = db.DbUsman.Exec(ctx, qTruncate)
	if err != nil {
		log.Fatal("Truncate ref_user_internal Failed, " + err.Error())
	}
	ResetSequence("ref_user_internal_id_seq")

	qTruncate = "TRUNCATE TABLE ref_user_external"
	_, err = db.DbUsman.Exec(ctx, qTruncate)
	if err != nil {
		log.Fatal("Truncate ref_user_external Failed, " + err.Error())
	}

	qTruncate = "TRUNCATE TABLE trx_user_tampung"
	_, err = db.DbUsman.Exec(ctx, qTruncate)
	if err != nil {
		log.Fatal("Truncate trx_user_tampung Failed, " + err.Error())
	}
	ResetSequence("trx_user_tampung_kode_user_tampung_seq")

	ResetSequence("trx_group_user_id_seq")
}
