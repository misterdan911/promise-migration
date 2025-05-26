package usman

import (
	"github.com/jackc/pgx/v5/pgtype"
	"promise-migration/internal/usman/model/dbusman/refuserexternalmodel"
	"promise-migration/internal/usman/model/dbusman/refusermodel"
	"promise-migration/internal/usman/model/dbusman/trxgroupusermodel"
	"promise-migration/internal/usman/model/vmsdb/usermodel"
)

func MigrateVmsDbUser() {

	allVmsUser := usermodel.GetAllUser()

	for _, vmsUser := range allVmsUser {

		var statusUser string
		idLevel := vmsUser.IdLevel.Int32

		if idLevel == 5 || idLevel == 9 {
			statusUser = "eksternal"
		} else {
			continue
		}

		refUser := refusermodel.RefUser{
			Email:      vmsUser.Email,
			Password:   vmsUser.Password,
			StatusUser: pgtype.Text{Valid: true, String: statusUser},
			Udcr:       vmsUser.CreatedAt,
			Udch:       vmsUser.UpdatedAt,
		}

		// masukan data ke tabel ref_user
		refUser = refusermodel.InsertNew(refUser)

		if statusUser == "eksternal" {
			// masukan data ke tabel ref_user_external kalau vmsUser external
			refUserExternal := refuserexternalmodel.RefUserExternal{
				Nama:   vmsUser.Name,
				IdUser: refUser.Id,
				//StatusPengguna: <perseorangan / perushaan>,
			}
			refuserexternalmodel.InsertNew(refUserExternal)

			// kasih akses masuk ke Si-Dapet
			// karena semua vmsUser external pasti bisa masuk Si-Dapet
			trxgroupusermodel.InsertNew(refUser, "G01.8")
		}

	}
}
