package usman

import (
	"promise-migration/internal/model/dbsidapet/helperusermodel"
	"promise-migration/internal/usman/model/dbusman/refusermodel"
)

func UpdateUsmanRefUserIdOnHelperUser() {

  allUser := refusermodel.GetAllData()

  for _, user := range allUser {

    helperUser := helperusermodel.HelperUser{
      VmsUserEmail: user.Email,
      UsmanRefUserId: user.Id,
    }

    // update field usman_ref_user_id di tabel helper_user
    helperusermodel.UpdateUsmanRefUserIdByEmail(helperUser)
  }


}