package usman

import (
	"promise-migration/internal/usman/model/dbsidapet/helperusermodel"
	"promise-migration/internal/usman/model/vmsdb/usermodel"
)

func PopulateHelperUser() {
	allVmsUser := usermodel.GetAllUser()

	for _, vmsUser := range allVmsUser {
		helperUser := helperusermodel.HelperUser{
			VmsUserId: vmsUser.Id,
		}

		helperusermodel.InsertNew(helperUser)
	}

}
