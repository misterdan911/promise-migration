package usman

import (
	"promise-migration/internal/model/dbsidapet/helperusermodel"
	"promise-migration/internal/usman/model/dbusman/refuserexternalmodel"
	"promise-migration/internal/usman/model/dbusman/refuserinternalmodel"
	"promise-migration/internal/usman/model/dbusman/refusermodel"
	"promise-migration/internal/usman/model/dbusman/trxgroupusermodel"

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
			// masukan data ke tabel ref_user_external kalau helperUser external
			refUserExternal := refuserexternalmodel.RefUserExternal{
				Username:       helperUser.NamaPenyedia,
				Nama:           helperUser.VmsUserName,
				StatusPengguna: helperUser.JenisPenyedia,
				Udcr:           helperUser.VmsUserCreatedAt,
				Udch:           helperUser.VmsUserUpdatedAt,
				IdUser:         refUser.Id,
			}
			refuserexternalmodel.InsertNew(refUserExternal)

			// kasih akses masuk ke Si-Dapet
			// karena semua helperUser external pasti bisa masuk Si-Dapet
			trxgroupusermodel.InsertNew(refUser, "G01.8")

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
	}

	//fmt.Println("TODO: NIP belum dimasukkan ke ref_user_internal")
}
