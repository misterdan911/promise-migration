package usman

import(
	"time"
	"github.com/jackc/pgx/v5/pgtype"
	"promise-migration/internal/model/dbusman/refusermodel"
	"promise-migration/internal/model/dbusman/trxgroupusermodel"
	"promise-migration/internal/model/promise_sippan/tblruputmodel"
	"promise-migration/internal/model/vmsdb/tblprofilepenyediamodel"
)

func PopulateTrxGroupUser() {
	
	// Setup user akses sippan
	SetupPpkAccessForSippan()

	// Setup user akses sidapet
	SetupVendorAccessForSidapet()
}

func SetupPpkAccessForSippan() {
	allIdUserCreator := tblruputmodel.GetAllIdUserCreatorFromTblRupUt()

	for _, idUserCreator := range allIdUserCreator {
		currentTime := time.Now().UTC()
		trxGroupUser := trxgroupusermodel.TrxGroupUser{
			KodeGroup: pgtype.Text{Valid: true, String: "G03.2"},
			IdUser:    idUserCreator.IdUser,
			Status:    pgtype.Text{Valid: true, String: "1"},
			Udcr:      pgtype.Text{Valid: true, String: currentTime.String()},
		}
		trxgroupusermodel.InsertNew(trxGroupUser)
			
	}
}

func SetupVendorAccessForSidapet(){
	allIdUserTblProfilePenyedia := tblprofilepenyediamodel.GetAllIdUser()
	allIdUserEksternal := refusermodel.GetAllIdUserEksternal()
	
	for _, idUser1 := range allIdUserTblProfilePenyedia {
		for _, idUser2 := range allIdUserEksternal {
			if idUser1.IdUser.Int32 == idUser2.Id.Int32 {
				
				currentTime := time.Now().UTC()
				trxGroupUser := trxgroupusermodel.TrxGroupUser{
					KodeGroup: pgtype.Text{Valid: true, String: "G01.8"},
					IdUser:    idUser2.Id,
					Status:    pgtype.Text{Valid: true, String: "1"},
					Udcr:      pgtype.Text{Valid: true, String: currentTime.String()},
				}
				trxgroupusermodel.InsertNew(trxGroupUser)
				
				break
			}
		}
	}
}
