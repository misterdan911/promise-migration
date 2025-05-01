package rdireksibumodel

import (
	"context"
	"fmt"
	"github.com/jackc/pgx/v5"
	"github.com/jackc/pgx/v5/pgtype"
	"log"
	"promise-migration/db"
	"promise-migration/internal/sidapet/helper"
	"promise-migration/internal/sidapet/structs"
	"strconv"
)

type VTblDireksi struct {
	IdDireksiPerus          pgtype.Int4
	NmDireksi               pgtype.Text
	JbtnDireksi             pgtype.Text
	HpDireksi               pgtype.Text
	NoKtpDireksi            pgtype.Text
	PathKtpDireksi          pgtype.Text
	StatusDireksiPerusahaan pgtype.Int4
}

func InsertRefDireksiBu(profilePenyedia structs.TblProfilePenyedia) {

	if profilePenyedia.IdJenisPenyedia.Int32 == 2 {
		return
	}

	ctx := context.Background()

	qVmsTblDireksi := `
	  SELECT
		id_direksi_perus,
		nm_direksi,
		jbtn_direksi,
		hp_direksi,
		no_ktp_direksi,
		path_ktp_direksi,
		status_direksi_perusahaan
	  FROM tbl_direksi_perusahaan
	  WHERE id_profil_penyedia = $1
	  ORDER BY id_direksi_perus`

	rVTD, errVTK := db.VmsDb.Query(ctx, qVmsTblDireksi, strconv.Itoa(int(profilePenyedia.IdProfilPenyedia.Int32)))
	if errVTK != nil {
		log.Fatal("qVmsTblDireksi Failed, " + errVTK.Error() + " " + qVmsTblDireksi)
	}

	allVTD, errCollect := pgx.CollectRows(rVTD, pgx.RowToStructByName[VTblDireksi])
	if errCollect != nil {
		log.Fatal("failed collecting rows, " + errCollect.Error())
	}
	defer rVTD.Close()

	for _, vTD := range allVTD {
		qIns := `
		INSERT INTO ref_direksi_bu (
		  kode_vendor,
		  nm_direksi,
		  jbtn_direksi,
		  hp_direksi,
		  no_ktp_direksi,
		  path_ktp_direksi
		) VALUES (
		  @kode_vendor,
		  @nm_direksi,
		  @jbtn_direksi,
		  @hp_direksi,
		  @no_ktp_direksi,
		  @path_ktp_direksi
		)`

		args := pgx.NamedArgs{
			"kode_vendor":      profilePenyedia.IdProfilPenyedia,
			"nm_direksi":       vTD.NmDireksi,
			"jbtn_direksi":     vTD.JbtnDireksi,
			"hp_direksi":       vTD.HpDireksi,
			"no_ktp_direksi":   vTD.NoKtpDireksi,
			"path_ktp_direksi": vTD.PathKtpDireksi,
		}

		_, errIns := db.DbSidapet.Exec(ctx, qIns, args)
		if errIns != nil {
			fmt.Println("no_ktp_direksi: " + vTD.NoKtpDireksi.String + helper.GetLen(vTD.NoKtpDireksi.String))
			fmt.Println("unable to insert ref_direksi_bu, " + errIns.Error())
		}

	}
}
