package usman

import (
	"strings"

	"github.com/jackc/pgx/v5/pgtype"
	"promise-migration/internal/model/vmsdb/usermodel"
	"promise-migration/internal/model/dbusman/refuserexternalmodel"
	"promise-migration/internal/model/dbusman/refusermodel"
	vmsdb_tblprofilepenyediamodel "promise-migration/internal/model/vmsdb/tblprofilepenyediamodel"
	promisesibela_tblprofilepenyediamodel "promise-migration/internal/model/promise_sibela/tblprofilepenyediamodel"
	"promise-migration/internal/structs"
)

func MigrateUserExternal() {
	allExternalUser := usermodel.GetAllExternalUser()

	for _, externalUser := range allExternalUser {

		// Mitigasi password supaya cocok dg sistem yg baru
		hashedPassword := externalUser.Password.String
		hashedPassword = strings.Replace(hashedPassword, "$2y$", "$2b$", 1)
		newHashedPass := strings.Replace(hashedPassword, "$2a$", "$2b$", 1)		

		refUser := refusermodel.RefUser{
			Id:         externalUser.Id,
			Email:      externalUser.Email,
			Password:   pgtype.Text{Valid: true, String: newHashedPass},
			Udcr:       externalUser.CreatedAt,
			Udch:       externalUser.UpdatedAt,
			StatusUser: pgtype.Text{Valid: true, String: "external"},
		}
		// fmt.Printf("IdUser: %d\n", externalUser.Id.Int32)
		refusermodel.InsertNew(refUser)

		tblProfilePenyedia := vmsdb_tblprofilepenyediamodel.GetPenyediaByUserId(externalUser.Id)
		if (tblProfilePenyedia == structs.TblProfilePenyedia{}) {
			tblProfilePenyedia = promisesibela_tblprofilepenyediamodel.GetPenyediaByUserId(externalUser.Id)
		}

		// JenisPenyedia
		jenisPenyedia := pgtype.Text{Valid: true}
		if tblProfilePenyedia.IdJenisPenyedia.Int32 == 1 {
			jenisPenyedia.String = "perusahaan"
		} else {
			jenisPenyedia.String = "perorangan"
		}

		refUserExternal := refuserexternalmodel.RefUserExternal{
			Id:             externalUser.Id,		// kode_vendor samain aja dengan id_user
			IdUser:         externalUser.Id,
			Username:       tblProfilePenyedia.Nama,
			Nama:           externalUser.Name,
			StatusPengguna: jenisPenyedia,
			Udcr:           externalUser.CreatedAt,
			Udch:           externalUser.UpdatedAt,
		}
		refuserexternalmodel.InsertNew(refUserExternal)
	}
}
