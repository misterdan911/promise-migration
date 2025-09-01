package rfasilitasbumodel

import (
	"context"
	"database/sql"
	"fmt"
	"github.com/jackc/pgx/v5"
	"github.com/jackc/pgx/v5/pgtype"
	"log"
	"promise-migration/db"
	"promise-migration/internal/model/dbsidapet/helperdokumenmodel"
	"promise-migration/internal/model/dbsidapet/helperusermodel"
	"promise-migration/internal/sidapet/sidapethelper"
	"promise-migration/internal/structs"
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

func InsertRefFasilitasBu(profilePenyedia structs.TblProfilePenyedia, helperUser helperusermodel.HelperUser) {

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

  var rVTFP pgx.Rows
  var errVTK error

  if helperUser.DbPenyedia.String == "vms_db" {
    rVTFP, errVTK = db.VmsDb.Query(ctx, qVmsTblFasilitas, strconv.Itoa(int(profilePenyedia.IdProfilPenyedia.Int32)))
  }
  if helperUser.DbPenyedia.String == "promise_sibela" {
    rVTFP, errVTK = db.PromiseSibela.Query(ctx, qVmsTblFasilitas, strconv.Itoa(int(profilePenyedia.IdProfilPenyedia.Int32)))
  }

	// rVTFP, errVTK := db.VmsDb.Query(ctx, qVmsTblFasilitas, strconv.Itoa(int(profilePenyedia.IdProfilPenyedia.Int32)))

	if errVTK != nil {
		log.Fatal("qVmsTblFasilitas Failed, " + errVTK.Error() + " " + qVmsTblFasilitas)
	}

	allVTFP, errCollect := pgx.CollectRows(rVTFP, pgx.RowToStructByName[VmsTblFasilitas])
	if errCollect != nil {
		log.Fatal("failed collecting rows, " + errCollect.Error())
	}
	defer rVTFP.Close()

	for _, vTFP := range allVTFP {

		var kodeKondisi sql.NullInt32
		ptrKodeKondisi := sidapethelper.ParseKondisiFasilitas(vTFP.KondisiFasilitas.String)

		if ptrKodeKondisi != nil {
			kodeKondisi.Valid = true
			kodeKondisi.Int32 = int32(*ptrKodeKondisi)
		}

		helperDokumen := helperdokumenmodel.GetByOriginalPath(vTFP.PathFasilitas)
		fileFoto := helperDokumen.Newfilename
		encryptKeyFoto := helperDokumen.EncryptKey

		qIns := `
		INSERT INTO ref_fasilitas_bu (
		  kode_vendor,
		  nama,
		  jumlah,
		  kode_kondisi,
		  kode_kepemilikan,
		  file_kepemilikan,
		  file_foto,
			encrypt_key_foto
		) VALUES (
		  @kode_vendor,
		  @nama,
		  @jumlah,
		  @kode_kondisi,
		  @kode_kepemilikan,
		  @file_kepemilikan,
		  @file_foto,
			@encrypt_key_foto
		)`

		args := pgx.NamedArgs{
			"kode_vendor":      helperUser.KodeVendor,
			"nama":             vTFP.NmFasilitas,
			"jumlah":           vTFP.JumlahFasilitas,
			"kode_kondisi":     kodeKondisi,
			"kode_kepemilikan": sql.NullInt32{},
			"file_kepemilikan": sql.NullString{},
			"file_foto":        fileFoto,
			"encrypt_key_foto": encryptKeyFoto,
		}

		_, errIns := db.DbSidapet.Exec(ctx, qIns, args)
		if errIns != nil {
			fmt.Println("nama: " + vTFP.NmFasilitas.String + sidapethelper.GetLen(vTFP.NmFasilitas.String))
			fmt.Println("jumlah: " + vTFP.JumlahFasilitas.String + sidapethelper.GetLen(vTFP.JumlahFasilitas.String))
			fmt.Println("kode_kondisi: " + strconv.Itoa(int(kodeKondisi.Int32)) + sidapethelper.GetLen(strconv.Itoa(int(kodeKondisi.Int32))))
			fmt.Println("file_foto: " + vTFP.PathFasilitas.String + sidapethelper.GetLen(vTFP.PathFasilitas.String))
			log.Fatal("unable to insert ref_fasilitas_bu, " + errIns.Error())
		}

	}
}
