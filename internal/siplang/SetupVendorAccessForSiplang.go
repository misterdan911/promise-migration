package siplang

import (
	"promise-migration/internal/model/dbusman/trxgroupusermodel"
	"promise-migration/internal/model/dbsidapet/helperusermodel"
	"time"

	"github.com/jackc/pgx/v5/pgtype"
)

func SetupVendorAccessForSiplang() {

	allUserDpt := helperusermodel.GetAllUserDpt()

	for _, userDpt := range allUserDpt {
		currentTime := time.Now().UTC()
		trxGroupUser := trxgroupusermodel.TrxGroupUser{
			KodeGroup: pgtype.Text{Valid: true, String: "G05.3"},
			IdUser:    userDpt.UsmanRefUserId,
			Status:    pgtype.Text{Valid: true, String: "1"},
			Udcr:      pgtype.Text{Valid: true, String: currentTime.String()},
		}
		trxgroupusermodel.InsertNew(trxGroupUser)
	}

}
