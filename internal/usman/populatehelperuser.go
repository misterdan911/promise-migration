package usman

import (
	"fmt"
	"promise-migration/internal/g"
	"promise-migration/internal/helper"
	"promise-migration/internal/model/dbsidapet/helperusermodel"
	"promise-migration/internal/model/dbsidapet/helperusernipmodel"
	promisesibela "promise-migration/internal/model/promise_sibela/tblprofilepenyediamodel"
	"promise-migration/internal/model/vmsdb/tblpejabatpembeliansubmodel"
	"promise-migration/internal/model/vmsdb/tblppksubmodel"
	vmspenyedia "promise-migration/internal/model/vmsdb/tblprofilepenyediamodel"
	"promise-migration/internal/structs"
  "promise-migration/internal/usman/model/vmsdb/usermodel"
	"promise-migration/internal/usman/model/dbusman/refusermodel"
  "promise-migration/internal/usman/usmanhelper"

	"github.com/jackc/pgx/v5/pgtype"
)

var allHUserNip []helperusernipmodel.HelperUserNip

func PopulateHelperUser() {
	allVmsUser := usermodel.GetAllUser()
	allHUserNip = helperusernipmodel.GetAllHelperUserNip()

	for _, vmsUser := range allVmsUser {
		refusermodel.DeleteByEmail(vmsUser.Email);
	}

  usmanhelper.UpdatePkSequence2("ref_user", "id", "ref_user_id_seq")
  usmanhelper.UpdatePkSequence2("ref_user_external", "id", "ref_user_external_id_seq")
  usmanhelper.UpdatePkSequence2("ref_user_internal", "id", "ref_user_internal_id_seq")
  usmanhelper.UpdatePkSequence2("trx_group_user", "id_group_user", "trx_group_user_id_seq")

	for _, vmsUser := range allVmsUser {

		// save to global variable
		g.User = g.GUser{
			Id:   vmsUser.Id,
			Name: vmsUser.Name,
		}

		nip := pgtype.Text{}

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

		// kalau penyedia ditemukan, set nilai dbPenyedia, namaPenyedia, dan jenisPenyedia
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
				//msg := "UserId: " + strconv.Itoa(int(vmsUser.Id.Int32)) + ", profile penyedia tidak ditemukan"
				msg := "profile penyedia tidak ditemukan"
				fmt.Println(msg)
				helper.LogUser(msg)
			}
		}

		if (vmsUser.IdLevel.Int32 != 5) || (vmsUser.IdLevel.Int32 != 9) {
			// GetNip
			nip = GetNipByUserId(vmsUser.Id)
		}

		// dapatkan kode unit
		var kodeUnit pgtype.Text
		if vmsUser.IdLevel.Int32 == 6 {
			kodeUnit = tblpejabatpembeliansubmodel.GetKodeUnitByUserId(vmsUser.Id)
		} else if vmsUser.IdLevel.Int32 == 7 {
			kodeUnit = tblppksubmodel.GetKodeUnitByUserId(vmsUser.Id)
		}

		// fmt.Println("kodeUnit: " + kodeUnit.String)

		helperUser := helperusermodel.HelperUser{
			VmsUserId:        vmsUser.Id,
			VmsUserName:      vmsUser.Name,
			VmsUserLevel:     vmsUser.IdLevel,
			VmsUserEmail:     vmsUser.Email,
			VmsUserPass:      vmsUser.Password,
			VmsUserCreatedAt: vmsUser.CreatedAt,
			VmsUserUpdatedAt: vmsUser.UpdatedAt,
			Nip:              nip,
			KodeUnit:         kodeUnit,
			DbPenyedia:       dbPenyedia,
			NamaPenyedia:     namaPenyedia,
			JenisPenyedia:    jenisPenyedia,
		}

		helperusermodel.InsertNew(helperUser)
	}

}

func GetNipByUserId(userId pgtype.Int4) pgtype.Text {
	for _, userNip := range allHUserNip {
		if userNip.IdUser.Int32 == userId.Int32 {
			return userNip.Nip
		}
	}
	return pgtype.Text{}
}
