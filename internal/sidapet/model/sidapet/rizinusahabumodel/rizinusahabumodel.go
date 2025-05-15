package rizinusahabumodel

import (
	"context"
	"database/sql"
	"fmt"
	"github.com/jackc/pgx/v5"
	"github.com/jackc/pgx/v5/pgtype"
	"log"
	"promise-migration/db"
	"promise-migration/internal/sidapet/helper"
	"promise-migration/internal/sidapet/structs"
	"strconv"
)

type VTblIzin struct {
	IdIjinUsaha      pgtype.Int4
	IdProfilPenyedia pgtype.Int4
	NamaIzin         pgtype.Text
	NoIzin           pgtype.Text
	MasaIzin         pgtype.Text
	PemberiIzin      pgtype.Text
	KualifikasiUsaha pgtype.Text
	KlasifikasiUsaha pgtype.Text
	Tdp              pgtype.Text
	PathIzin         pgtype.Text
}

func InsertRefIzinUsahaBu(profilePenyedia structs.TblProfilePenyedia) {

	if profilePenyedia.IdJenisPenyedia.Int32 == 2 {
		return
	}

	ctx := context.Background()

	qVmsTblIzinUsaha := `
	  SELECT
	    id_ijin_usaha,
	    id_profil_penyedia,
	    nama_izin,
	    no_izin,
	    masa_izin,
	    pemberi_izin,
	    kualifikasi_usaha,
	    klasifikasi_usaha,
	    tdp,
	    path_izin
	  FROM tbl_ijin_usaha_perusahaan
	  WHERE id_profil_penyedia = $1
	  ORDER BY id_ijin_usaha`

	rVTI, errVTK := db.VmsDb.Query(ctx, qVmsTblIzinUsaha, strconv.Itoa(int(profilePenyedia.IdProfilPenyedia.Int32)))
	if errVTK != nil {
		log.Fatal("qVmsTblIzinUsaha Failed, " + errVTK.Error() + " " + qVmsTblIzinUsaha)
	}

	allVTI, errCollect := pgx.CollectRows(rVTI, pgx.RowToStructByName[VTblIzin])
	if errCollect != nil {
		log.Fatal("failed collecting rows, " + errCollect.Error())
	}
	defer rVTI.Close()

	for _, vTI := range allVTI {

		jenisIzinusaha := helper.GetJenisIzinUsaha(vTI.NamaIzin.String)
		isIzinSelamanya, tglBerlakuAkhir := helper.ParseMasaIzin(vTI.MasaIzin.String)

		var izinBerlakuAkhir sql.NullString
		if tglBerlakuAkhir != "" {
			izinBerlakuAkhir = sql.NullString{Valid: true, String: tglBerlakuAkhir}
		}

		qIns := `
 		INSERT INTO ref_izin_usaha_bu (
		  kode_vendor,
		  jenis_izin_usaha,
		  nama,
		  nomor_izin,
		  kode,
		  file_izin,
		  is_izin_selamanya,
			izin_berlaku_akhir
		) VALUES (
		  @kode_vendor,
		  @jenis_izin_usaha,
		  @nama,
		  @nomor_izin,
		  @kode,
		  @file_izin,
		  @is_izin_selamanya,
			@izin_berlaku_akhir
		)`

		args := pgx.NamedArgs{
			"kode_vendor":        profilePenyedia.IdProfilPenyedia,
			"jenis_izin_usaha":   jenisIzinusaha,
			"nama":               vTI.NamaIzin,
			"nomor_izin":         vTI.NoIzin,
			"kode":               sql.NullString{},
			"file_izin":          vTI.PathIzin,
			"is_izin_selamanya":  sql.NullBool{Valid: true, Bool: isIzinSelamanya},
			"izin_berlaku_akhir": izinBerlakuAkhir,
		}

		_, errIns := db.DbSidapet.Exec(ctx, qIns, args)
		if errIns != nil {
			fmt.Println("unable to insert ref_izin_usaha_bu, " + errIns.Error())
		}
	}
}
