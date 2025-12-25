package sibela

import(
	"time"
	"github.com/jackc/pgx/v5/pgtype"
	"promise-migration/internal/model/dbusman/refusermodel"
	"promise-migration/internal/model/dbusman/trxgroupusermodel"
)

func SetupVendorAccessForSibela() {

	allIdUserEksternal := refusermodel.GetAllIdUserEksternal()

	for _, idUser := range allIdUserEksternal {
		currentTime := time.Now().UTC()
		trxGroupUser := trxgroupusermodel.TrxGroupUser{
			KodeGroup: pgtype.Text{Valid: true, String: "G04.3"},
			IdUser:    idUser.Id,
			Status:    pgtype.Text{Valid: true, String: "1"},
			Udcr:      pgtype.Text{Valid: true, String: currentTime.String()},
		}
		trxgroupusermodel.InsertNew(trxGroupUser)
	}

}
