package usman

import (
	"github.com/jackc/pgx/v5/pgtype"
	"promise-migration/internal/sidapet/model/vmsdb/usermodel"
	"promise-migration/internal/usman/model/usman/refusermodel"
)

func MigrateUser() {

	allUser := usermodel.GetAllUser()

	for _, user := range allUser {

		var statusUser string
		idLevel := user.IdLevel.Int32

		if idLevel == 5 || idLevel == 9 {
			statusUser = "eksternal"
		} else {
			continue
		}

		refUser := refusermodel.RefUser{
			Email:      user.Email,
			Password:   user.Password,
			StatusUser: pgtype.Text{Valid: true, String: statusUser},
			Udcr:       user.CreatedAt,
			Udch:       user.UpdatedAt,
		}

		refusermodel.InsertNew(refUser)

		//refUserExternal := refuserexternalmodel.RefUserExternal{
		//	Nama: user.Name,
		//}
		//refuserexternalmodel.InsertNew(refUserExternal)
	}
}
