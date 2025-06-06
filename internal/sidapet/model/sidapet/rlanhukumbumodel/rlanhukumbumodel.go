package rlanhukumbumodel

import (
	"context"
	"database/sql"
	"fmt"
	"github.com/jackc/pgx/v5"
	"github.com/jackc/pgx/v5/pgtype"
	"log"
	"promise-migration/db"
	helper2 "promise-migration/internal/helper"
	"promise-migration/internal/sidapet/sidapethelper"
	"promise-migration/internal/structs"
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

		tglAktaAwal := sql.NullString{}
		tglAkta, errConvert := sidapethelper.ConvertToPostgresDate(vTA.TglAkta.String)
		if errConvert != nil {
			fmt.Println("errConvert:", errConvert)
		} else {
			tglAktaAwal.Valid = true
			tglAktaAwal.String = tglAkta
		}

		tglAktaRubah := sql.NullString{}
		tglAktaAkhir, errConvert2 := sidapethelper.ConvertToPostgresDate(vTA.TglAktaAkhir.String)
		if errConvert2 != nil {
			fmt.Println("errConvert2:", errConvert2)
			helper2.Log("ref_lan_hukum_bu.txt", "Error converting tgl_akta_akhir"+errConvert2.Error())
		} else {
			tglAktaRubah.Valid = true
			tglAktaRubah.String = tglAktaAkhir
		}

		qIns := `
		INSERT INTO ref_lan_hukum_bu (
		  kode_vendor,
		  no_akta_awal,
		  tgl_akta_awal,
		  notaris_awal,
		  no_sah_awal,
		  file_akta_awal,
		  no_akta_rubah,
		  tgl_akta_rubah,
		  notaris_rubah,
		  file_akta_rubah
		) VALUES (
		  @kode_vendor,
		  @no_akta_awal,
		  @tgl_akta_awal,
		  @notaris_awal,
		  @no_sah_awal,
		  @file_akta_awal,
		  @no_akta_rubah,
		  @tgl_akta_rubah,
		  @notaris_rubah,
		  @file_akta_rubah
		)`

		args := pgx.NamedArgs{
			"kode_vendor":     profilePenyedia.IdProfilPenyedia,
			"no_akta_awal":    vTA.NoAkta,
			"tgl_akta_awal":   tglAktaAwal,
			"notaris_awal":    vTA.NotaAkta,
			"no_sah_awal":     vTA.NoSahAkta,
			"file_akta_awal":  vTA.PathAkta,
			"no_akta_rubah":   vTA.NoAktaAkhir,
			"tgl_akta_rubah":  tglAktaRubah,
			"notaris_rubah":   vTA.NotaAktaAkhir,
			"file_akta_rubah": vTA.PathAktaAkhir,
		}

		_, errIns := db.DbSidapet.Exec(ctx, qIns, args)
		if errIns != nil {
			log.Fatal("unable to insert ref_lan_hukum_bu, " + errIns.Error())
		}
	}

}
