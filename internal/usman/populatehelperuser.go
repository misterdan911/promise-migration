package usman

import (
	"fmt"
	"promise-migration/internal/usman/model/dbsidapet/helperusermodel"
	promisesibela "promise-migration/internal/usman/model/promise_sibela/tblprofilepenyediamodel"
	vmspenyedia "promise-migration/internal/usman/model/vmsdb/tblprofilepenyediamodel"
	"promise-migration/internal/usman/model/vmsdb/usermodel"
	"promise-migration/internal/usman/structs"
	"strconv"

	"github.com/jackc/pgx/v5/pgtype"
)

func PopulateHelperUser() {
	allVmsUser := usermodel.GetAllUser()

	for _, vmsUser := range allVmsUser {

		// coba cari data penyedia di db vms_db
		penyedia := vmspenyedia.GetPenyediaByUserId(vmsUser.Id)
		var dbPenyedia pgtype.Text
		var strDbPenyedia string
		var namaPenyedia pgtype.Text
		var jenisPenyedia pgtype.Text

		if (penyedia == structs.TblProfilePenyedia{}) {
			// kalau di vms_db gak ada, coba cari di db promise_sibela
			penyedia = promisesibela.GetPenyediaByUserId(vmsUser.Id)

			if (penyedia != structs.TblProfilePenyedia{}) {
				strDbPenyedia = "promise_sibela"
			}
		} else {
			strDbPenyedia = "vms_db"
		}

		if (penyedia != structs.TblProfilePenyedia{}) {
			dbPenyedia = pgtype.Text{Valid: true, String: strDbPenyedia}
			namaPenyedia = pgtype.Text{Valid: true, String: penyedia.Nama.String}

			if penyedia.IdJenisPenyedia.Int32 == 1 {
				jenisPenyedia = pgtype.Text{Valid: true, String: "perusahaan"}
			} else if penyedia.IdJenisPenyedia.Int32 == 2 {
				jenisPenyedia = pgtype.Text{Valid: true, String: "perorangan"}
			}
		} else {
			if vmsUser.IdLevel.Int32 == 5 || vmsUser.IdLevel.Int32 == 9 {
				fmt.Println("UserId: " + strconv.Itoa(int(vmsUser.Id.Int32)) + ", profile penyedia tidak ditemukan")
			}
		}

		helperUser := helperusermodel.HelperUser{
			VmsUserId:        vmsUser.Id,
			VmsUserName:      vmsUser.Name,
			VmsUserLevel:     vmsUser.IdLevel,
			VmsUserEmail:     vmsUser.Email,
			VmsUserPass:      vmsUser.Password,
			VmsUserCreatedAt: vmsUser.CreatedAt,
			VmsUserUpdatedAt: vmsUser.UpdatedAt,
			DbPenyedia:       dbPenyedia,
			NamaPenyedia:     namaPenyedia,
			JenisPenyedia:    jenisPenyedia,
		}

		helperusermodel.InsertNew(helperUser)
	}

}
