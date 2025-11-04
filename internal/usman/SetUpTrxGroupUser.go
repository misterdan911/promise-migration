package usman

import(
	"time"
	"github.com/jackc/pgx/v5/pgtype"
	"promise-migration/internal/model/dbusman/trxgroupusermodel"
	"promise-migration/internal/model/promise_sippan/tblruputmodel"
)

func PopulateTrxGroupUser() {
	
	// Setup user akses sippan
	SetupPpkAccessForSippan()

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
