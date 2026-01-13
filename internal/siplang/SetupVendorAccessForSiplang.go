package siplang

import (
	"promise-migration/internal/model/dbusman/refusermodel"
	"promise-migration/internal/model/dbusman/trxgroupusermodel"
	"time"

	"github.com/jackc/pgx/v5/pgtype"
)

func SetupVendorAccessForSiplang() {

	allIdUserEksternal := refusermodel.GetAllIdUserEksternal()

	for _, idUser := range allIdUserEksternal {
		currentTime := time.Now().UTC()
		trxGroupUser := trxgroupusermodel.TrxGroupUser{
			KodeGroup: pgtype.Text{Valid: true, String: "G05.3"},
			IdUser:    idUser.Id,
			Status:    pgtype.Text{Valid: true, String: "1"},
			Udcr:      pgtype.Text{Valid: true, String: currentTime.String()},
		}
		trxgroupusermodel.InsertNew(trxGroupUser)
	}

}
