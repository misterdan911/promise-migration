package rsertifperomodel

import (
	"context"
	"fmt"
	"github.com/jackc/pgx/v5"
	"github.com/jackc/pgx/v5/pgtype"
	"log"
	"promise-migration/db"
	"promise-migration/internal/sidapet/structs"
	"strconv"
)

type VmsSP struct {
	NmSertifOrang pgtype.Text
	PathSertif    pgtype.Text
}

func InsertRefSertifPero(profilePenyedia structs.TblProfilePenyedia) {
	if profilePenyedia.IdJenisPenyedia.Int32 == 1 {
		return
	}

	ctx := context.Background()

	qVmsSertifPero := `SELECT nm_sertif_orang, path_sertif FROM tbl_sertif_perorangan WHERE id_profil_penyedia = $1`

	rSP, errVPP := db.VmsDb.Query(ctx, qVmsSertifPero, strconv.Itoa(int(profilePenyedia.IdProfilPenyedia.Int32)))
	if errVPP != nil {
		log.Fatal("qVmsSertifPero Failed, " + errVPP.Error() + " " + qVmsSertifPero)
	}

	allSP, errCollect := pgx.CollectRows(rSP, pgx.RowToStructByName[VmsSP])
	if errCollect != nil {
		log.Fatal("failed collecting rows, " + errCollect.Error())
	}
	defer rSP.Close()

	for _, vSP := range allSP {

		qIns := `
		    INSERT INTO ref_sertif_pero (
		      kode_vendor,
		      nm_sertifikat,
		      file_bukti
		    ) VALUES (
		      @kode_vendor,
		      @nm_sertifikat,
		      @file_bukti
		    )`

		args := pgx.NamedArgs{
			"kode_vendor":   profilePenyedia.IdProfilPenyedia,
			"nm_sertifikat": vSP.NmSertifOrang,
			"file_bukti":    vSP.PathSertif,
		}

		_, errIns := db.DbSidapet.Exec(ctx, qIns, args)
		if errIns != nil {
			fmt.Println("unable to insert ref_sertif_pero, " + errIns.Error())
		}

	}

}
