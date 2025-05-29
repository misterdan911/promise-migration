package usman

import (
	"context"
	"log"
	"promise-migration/db"
	"promise-migration/internal/usman/model/dbsidapet/helperusernipmodel"

	"github.com/jackc/pgx/v5"
)

func PopulateHelperUserNip() {
	ctx := context.Background()

	qUserNip := `
	SELECT NULL as id, id_user, nip FROM (
		SELECT id_user, nip_bendahara AS nip FROM tbl_bendahara UNION
		SELECT id_user, nip FROM tbl_pejabat_pembelian2 UNION
		SELECT id_user, nip_pp AS nip FROM tbl_pejabat_pembelian_sub UNION
		SELECT id_user, nip_pp AS nip FROM tbl_pejabat_pembelian_sub2 UNION
		SELECT id_user, nip FROM tbl_pengendali_kualitas UNION
		SELECT id_user, nip_pk AS nip FROM tbl_pengendali_kualitas_sub UNION
		SELECT id_user, nip FROM tbl_pokja UNION
		SELECT id_user, CAST ( nip_ppk AS VARCHAR ) AS nip FROM tbl_ppk2 UNION
		SELECT id_user, nip_ppk AS nip FROM tbl_ppk_sub
	) ref_nip
	WHERE id_user != 0
	ORDER BY id_user`

	rwUserNip, err := db.VmsDb.Query(ctx, qUserNip)
	if err != nil {
		log.Fatal("qUserNip Failed, " + err.Error() + " " + qUserNip)
	}

	allUserNip, err := pgx.CollectRows(rwUserNip, pgx.RowToStructByName[helperusernipmodel.HelperUserNip])
	if err != nil {
		log.Fatal("failed collecting rwUserNip (populateusernip.go), " + err.Error())
	}
	defer rwUserNip.Close()

	for _, userNip := range allUserNip {

		helperUserNip := helperusernipmodel.HelperUserNip{
			Id:     userNip.Id,
			IdUser: userNip.IdUser,
			Nip:    userNip.Nip,
		}

		// Insert new user nip
		helperusernipmodel.InsertNew(helperUserNip)
	}

}
