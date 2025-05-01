package rfasilitasbumodel

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

type VmsTblFasilitas struct {
	IdPeralatan      pgtype.Int4
	IdProfilPenyedia pgtype.Int4
	NmFasilitas      pgtype.Text
	JumlahFasilitas  pgtype.Text
	FasilitasNow     pgtype.Text
	MerkFasilitas    pgtype.Text
	TahunFasilitas   pgtype.Text
	KondisiFasilitas pgtype.Text
	LokasiFasilitas  pgtype.Text
	PathFasilitas    pgtype.Text
}

func InsertRefFasilitasBu(profilePenyedia structs.TblProfilePenyedia) {

	if profilePenyedia.IdJenisPenyedia.Int32 == 2 {
		return
	}

	ctx := context.Background()

	qVmsTblFasilitas := `
	  SELECT
        id_peralatan,
        id_profil_penyedia,
        nm_fasilitas,
        jumlah_fasilitas,
        fasilitas_now,
        merk_fasilitas,
        tahun_fasilitas,
        kondisi_fasilitas,
        lokasi_fasilitas,
        path_fasilitas
	  FROM tbl_fasilitas_perusahaan
	  WHERE id_profil_penyedia = $1
	  ORDER BY id_peralatan`

	rVTFP, errVTK := db.VmsDb.Query(ctx, qVmsTblFasilitas, strconv.Itoa(int(profilePenyedia.IdProfilPenyedia.Int32)))
	if errVTK != nil {
		log.Fatal("qVmsTblFasilitas Failed, " + errVTK.Error() + " " + qVmsTblFasilitas)
	}

	allVTFP, errCollect := pgx.CollectRows(rVTFP, pgx.RowToStructByName[VmsTblFasilitas])
	if errCollect != nil {
		log.Fatal("failed collecting rows, " + errCollect.Error())
	}
	defer rVTFP.Close()

	for _, vTFP := range allVTFP {
		qIns := `
		INSERT INTO ref_fasilitas_bu (
		  kode_vendor,
		  nama,
		  jumlah,
		  kode_kondisi,
		  kode_kepemilikan,
		  file_kepemilikan,
		  file_foto
		) VALUES (
		  @kode_vendor,
		  @nama,
		  @jumlah,
		  @kode_kondisi,
		  @kode_kepemilikan,
		  @file_kepemilikan,
		  @file_foto
		)`

		args := pgx.NamedArgs{
			"kode_vendor":      profilePenyedia.IdProfilPenyedia,
			"nama":             vTFP.NmFasilitas,
			"jumlah":           sql.NullString{},                     // Masih harus diproses lebih lanjut
			"kode_kondisi":     sql.NullInt32{Valid: true, Int32: 1}, // Masih harus diproses lebuh lanjut
			"kode_kepemilikan": sql.NullInt32{},
			"file_kepemilikan": sql.NullString{},
			"file_foto":        vTFP.PathFasilitas,
		}

		_, errIns := db.DbSidapet.Exec(ctx, qIns, args)
		if errIns != nil {
			fmt.Println("nama: " + vTFP.NmFasilitas.String + helper.GetLen(vTFP.NmFasilitas.String))
			fmt.Println("file_foto: " + vTFP.PathFasilitas.String + helper.GetLen(vTFP.PathFasilitas.String))
			log.Fatal("unable to insert ref_fasilitas_bu, " + errIns.Error())
		}

	}
}
