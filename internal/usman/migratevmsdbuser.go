package usman

import (
	"promise-migration/internal/model/dbsidapet/helperusermodel"
	"promise-migration/internal/usman/model/dbusman/refuserinternalmodel"
	"promise-migration/internal/usman/model/dbusman/refusermodel"

	"github.com/jackc/pgx/v5/pgtype"
)

func MigrateUserToUsman() {

	allUser := helperusermodel.GetAllUser()

	for _, helperUser := range allUser {

		var statusUser string
		idLevel := helperUser.VmsUserLevel.Int32

		if idLevel == 5 || idLevel == 9 {
			statusUser = "eksternal"
		} else {
			// continue
			statusUser = "internal"
		}

		refUser := refusermodel.RefUser{
			Email:      helperUser.VmsUserEmail,
			Password:   helperUser.VmsUserPass,
			StatusUser: pgtype.Text{Valid: true, String: statusUser},
			Udcr:       helperUser.VmsUserCreatedAt,
			Udch:       helperUser.VmsUserUpdatedAt,
		}

		// masukan data ke tabel ref_user
		refUser = refusermodel.InsertNew(refUser)

		if statusUser == "eksternal" {
			// data user external belum bisa masuk ke ref_user_external, karena harus generate kode_vendor dulu di db_sidapet
		} else if statusUser == "internal" {
			refUserInternal := refuserinternalmodel.RefUserInternal{
				Nip:      helperUser.Nip,
				Username: helperUser.VmsUserName,
				Udcr:     helperUser.VmsUserCreatedAt,
				Udch:     helperUser.VmsUserUpdatedAt,
				IdUser:   refUser.Id,
			}
      
			refuserinternalmodel.InsertNew(refUserInternal)
		}

		helperUser.UsmanRefUserId = refUser.Id
		helperusermodel.UpdateUsmanRefUserId(helperUser)
	}
}
