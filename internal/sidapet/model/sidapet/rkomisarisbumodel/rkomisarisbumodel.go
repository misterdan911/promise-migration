package rkomisarisbumodel

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

type VTblKomisaris struct {
	IdKomisaris      pgtype.Int4
	NmKomisaris      pgtype.Text
	JbtnKomisaris    pgtype.Text
	HpKomisaris      pgtype.Text
	NoKtpKomisaris   pgtype.Text
	PathKtpKomisaris pgtype.Text
}

func InsertRefKomisarisBu(profilePenyedia structs.TblProfilePenyedia, helperUser helperusermodel.HelperUser) {
	if profilePenyedia.IdJenisPenyedia.Int32 == 2 {
		return
	}

	ctx := context.Background()

	qVmsTblKomisaris := `
	  SELECT
		id_komisaris,
		nm_komisaris,
		jbtn_komisaris,
		hp_komisaris,
		no_ktp_komisaris,
		path_ktp_komisaris
	  FROM tbl_komisaris_perusahaan
	  WHERE id_profil_penyedia = $1
	  ORDER BY id_komisaris`

	rVTK, errVTK := db.VmsDb.Query(ctx, qVmsTblKomisaris, strconv.Itoa(int(profilePenyedia.IdProfilPenyedia.Int32)))
	if errVTK != nil {
		log.Fatal("qVmsTblKomisaris Failed, " + errVTK.Error() + " " + qVmsTblKomisaris)
	}

	allVTK, errCollect := pgx.CollectRows(rVTK, pgx.RowToStructByName[VTblKomisaris])
	if errCollect != nil {
		log.Fatal("failed collecting rows, " + errCollect.Error())
	}
	defer rVTK.Close()

	for _, vTK := range allVTK {
		qIns := `
		INSERT INTO ref_komisaris_bu (
		  kode_vendor,
		  nm_komisaris,
		  jbtn_komisaris,
		  hp_komisaris,
		  no_ktp_komisaris,
		  path_ktp_komisaris
		) VALUES (
		  @kode_vendor,
		  @nm_komisaris,
		  @jbtn_komisaris,
		  @hp_komisaris,
		  @no_ktp_komisaris,
		  @path_ktp_komisaris
		)`

		args := pgx.NamedArgs{
			"kode_vendor":        helperUser.KodeVendor,
			"nm_komisaris":       vTK.NmKomisaris,
			"jbtn_komisaris":     vTK.JbtnKomisaris,
			"hp_komisaris":       vTK.HpKomisaris,
			"no_ktp_komisaris":   vTK.NoKtpKomisaris,
			"path_ktp_komisaris": vTK.PathKtpKomisaris,
		}

		_, errIns := db.DbSidapet.Exec(ctx, qIns, args)
		if errIns != nil {
			log.Fatal("unable to insert ref_komisaris_bu, " + errIns.Error())
		}
	}
}
