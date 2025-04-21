package rlanhukumbumodel

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

type VTAkta struct {
	NoAkta         pgtype.Text
	TglAkta        pgtype.Text
	NotaAkta       pgtype.Text
	NoSahAkta      pgtype.Text
	PathAkta       pgtype.Text
	NoAktaAkhir    pgtype.Text
	TglAktaAkhir   pgtype.Text
	NotaAktaAkhir  pgtype.Text
	BuktiRubahAkta pgtype.Text
	PathAktaAkhir  pgtype.Text
}

func InsertRefLanHukumBu(profilePenyedia structs.TblProfilePenyedia) {

	if profilePenyedia.IdJenisPenyedia.Int32 == 2 {
		return
	}

	ctx := context.Background()

	qVmsTblAkta := `
	  SELECT
		no_akta,
		tgl_akta,
		nota_akta,
		no_sah_akta,
		path_akta,
		no_akta_akhir,
		tgl_akta_akhir,
		nota_akta_akhir,
		bukti_rubah_akta,
		path_akta_akhir
	FROM tbl_akta_perusahaan
	WHERE id_profil_penyedia = $1`

	rVTA, errVPP := db.VmsDb.Query(ctx, qVmsTblAkta, strconv.Itoa(int(profilePenyedia.IdProfilPenyedia.Int32)))
	if errVPP != nil {
		log.Fatal("qVmsTblAkta Failed, " + errVPP.Error() + " " + qVmsTblAkta)
	}

	allVTA, errCollect := pgx.CollectRows(rVTA, pgx.RowToStructByName[VTAkta])
	if errCollect != nil {
		log.Fatal("failed collecting rows, " + errCollect.Error())
	}
	defer rVTA.Close()

	for _, vTA := range allVTA {

		qIns := `
		INSERT INTO ref_lan_hukum_bu (
		  kode_vendor,
		  no_akta_awal,
		  notaris_awal,
		  no_sah_awal,
		  file_akta_awal,
		  no_akta_rubah,
		  notaris_rubah,
		  file_akta_rubah
		) VALUES (
		  @kode_vendor,
		  @no_akta_awal,
		  @notaris_awal,
		  @no_sah_awal,
		  @file_akta_awal,
		  @no_akta_rubah,
		  @notaris_rubah,
		  @file_akta_rubah
		)`

		args := pgx.NamedArgs{
			"kode_vendor":     profilePenyedia.IdProfilPenyedia,
			"no_akta_awal":    vTA.NoAkta,
			"notaris_awal":    vTA.NotaAkta,
			"no_sah_awal":     vTA.NoSahAkta,
			"file_akta_awal":  vTA.PathAkta,
			"no_akta_rubah":   vTA.NoAktaAkhir,
			"notaris_rubah":   vTA.NotaAktaAkhir,
			"file_akta_rubah": vTA.PathAktaAkhir,
		}

		rwIns, errIns := db.DbSidapet.Query(ctx, qIns, args)
		if errIns != nil {
			fmt.Println("unable to insert ref_lan_hukum_bu, " + errIns.Error())
		}
		defer rwIns.Close()
	}

}
