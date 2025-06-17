package usmanhelper

import (
	"promise-migration/internal/g"
	"promise-migration/internal/ghelper"
	"promise-migration/internal/usman/model/dbusman/refusermodel"
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
