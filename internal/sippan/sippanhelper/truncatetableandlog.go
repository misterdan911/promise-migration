package sippanhelper

import (
  "promise-migration/internal/g"
  "promise-migration/internal/model/dbsippan/refrupmodel"
  "promise-migration/internal/model/vmsdb/usermodel"
  "slices"
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
