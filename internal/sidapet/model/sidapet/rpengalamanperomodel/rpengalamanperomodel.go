package rpengalamanperomodel

import (
	"context"
	"github.com/jackc/pgx/v5"
	"github.com/jackc/pgx/v5/pgtype"
	"log"
	"promise-migration/db"
	"promise-migration/internal/model/dbsidapet/helperusermodel"
	"promise-migration/internal/structs"
	"strconv"
)

type VmsPP struct {
	NmPnglmnOrg pgtype.Text
	PathPnglmn  pgtype.Text
}

func InsertRefPengalamanPero(profilePenyedia structs.TblProfilePenyedia, helperUser helperusermodel.HelperUser) {
	if profilePenyedia.IdJenisPenyedia.Int32 == 1 {
		return
	}

	ctx := context.Background()

	qVmsPengalamanPero := `SELECT nm_pnglmn_org, path_pnglmn FROM tbl_pengalaman_perorangan WHERE id_profil_penyedia = $1`

	rVPP, errVPP := db.VmsDb.Query(ctx, qVmsPengalamanPero, strconv.Itoa(int(profilePenyedia.IdProfilPenyedia.Int32)))
	if errVPP != nil {
		log.Fatal("qVmsPengalamanPero Failed, " + errVPP.Error() + " " + qVmsPengalamanPero)
	}

	allVPP, errCollect := pgx.CollectRows(rVPP, pgx.RowToStructByName[VmsPP])
	if errCollect != nil {
		log.Fatal("failed collecting rows, " + errCollect.Error())
	}
	defer rVPP.Close()

	for _, vPP := range allVPP {

		qIns := `
		    INSERT INTO ref_pengalaman_pero (
		      kode_vendor,
		      nama_pekerjaan,
		      file_bukti
		    ) VALUES (
		      @kode_vendor,
		      @nama_pekerjaan,
		      @file_bukti
		    )`

		args := pgx.NamedArgs{
			"kode_vendor":    helperUser.KodeVendor,
			"nama_pekerjaan": vPP.NmPnglmnOrg,
			"file_bukti":     vPP.PathPnglmn,
		}

		_, errIns := db.DbSidapet.Exec(ctx, qIns, args)
		if errIns != nil {
			log.Fatal("unable to insert ref_pengalaman_pero, " + errIns.Error())
		}

	}

}
