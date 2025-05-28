package usman

import (
	"promise-migration/internal/usman/model/dbsidapet/helperusermodel"
	"promise-migration/internal/usman/model/dbusman/refuserexternalmodel"
	"promise-migration/internal/usman/model/dbusman/refusermodel"
	"promise-migration/internal/usman/model/dbusman/trxgroupusermodel"

	"github.com/jackc/pgx/v5/pgtype"
)

func MigrateVmsDbUser() {

	allUser := helperusermodel.GetAllUser()

	for _, helperUser := range allUser {

		var statusUser string
		idLevel := helperUser.VmsUserLevel.Int32

		if idLevel == 5 || idLevel == 9 {
			statusUser = "eksternal"
		} else {
			continue
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
			// masukan data ke tabel ref_user_external kalau helperUser external
			refUserExternal := refuserexternalmodel.RefUserExternal{
				Nama:           helperUser.VmsUserName,
				StatusPengguna: helperUser.JenisPenyedia,
				IdUser:         refUser.Id,
			}
			refuserexternalmodel.InsertNew(refUserExternal)

			// kasih akses masuk ke Si-Dapet
			// karena semua helperUser external pasti bisa masuk Si-Dapet
			trxgroupusermodel.InsertNew(refUser, "G01.8")
		}

	}
}
