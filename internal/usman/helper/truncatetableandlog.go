package helper

import "promise-migration/internal/helper"

func TruncateTableAndLog() {

  TruncatedbSidapetHelperUser()
  // TruncatedbSidapetHelperUserNip()
  TruncateTable("ref_user")

  TruncateTable("ref_user_external")
  ResetSequence("ref_user_external_id_seq")

  TruncateTable("ref_user_internal")
  ResetSequence("ref_user_internal_id_seq")

  TruncateTable("trx_group_user")
  ResetSequence("trx_group_user_id_seq")

  // Truncate Log File
  //TruncateLog("pengalaman_bu.txt")
  helper.DeleteLogUserFolder()

}
