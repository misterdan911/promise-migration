package rkomisarisbumodel

import (
	"context"
	"fmt"
	"log"
	"promise-migration/db"
	"promise-migration/internal/model/dbsidapet/helperdokumenmodel"
	"promise-migration/internal/model/dbsidapet/helperusermodel"
	"promise-migration/internal/sidapet/sidapethelper"
	"promise-migration/internal/structs"
	"strconv"

	"github.com/jackc/pgx/v5"
	"github.com/jackc/pgx/v5/pgtype"
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

  var rVTK pgx.Rows
  var errVTK error

  if helperUser.DbPenyedia.String == "vms_db" {
    rVTK, errVTK = db.VmsDb.Query(ctx, qVmsTblKomisaris, strconv.Itoa(int(profilePenyedia.IdProfilPenyedia.Int32)))
  }
  if helperUser.DbPenyedia.String == "promise_sibela" {
    rVTK, errVTK = db.PromiseSibela.Query(ctx, qVmsTblKomisaris, strconv.Itoa(int(profilePenyedia.IdProfilPenyedia.Int32)))
  }

	// rVTK, errVTK := db.VmsDb.Query(ctx, qVmsTblKomisaris, strconv.Itoa(int(profilePenyedia.IdProfilPenyedia.Int32)))

	if errVTK != nil {
		log.Fatal("qVmsTblKomisaris Failed, " + errVTK.Error() + " " + qVmsTblKomisaris)
	}

	allVTK, errCollect := pgx.CollectRows(rVTK, pgx.RowToStructByName[VTblKomisaris])
	if errCollect != nil {
		log.Fatal("failed collecting rows, " + errCollect.Error())
	}
	defer rVTK.Close()

	for _, vTK := range allVTK {

    helperDokumen := helperdokumenmodel.GetByOriginalPath(vTK.PathKtpKomisaris)
    pathKtpKomisaris := helperDokumen.Newfilename
    encryptKey := helperDokumen.EncryptKey

		qIns := `
		INSERT INTO ref_komisaris_bu (
		  kode_vendor,
		  nm_komisaris,
		  jbtn_komisaris,
		  hp_komisaris,
		  no_ktp_komisaris,
		  path_ktp_komisaris,
      encrypt_key
		) VALUES (
		  @kode_vendor,
		  @nm_komisaris,
		  @jbtn_komisaris,
		  @hp_komisaris,
		  @no_ktp_komisaris,
		  @path_ktp_komisaris,
      @encrypt_key
		)`

		args := pgx.NamedArgs{
			"kode_vendor":        helperUser.KodeVendor,
			"nm_komisaris":       vTK.NmKomisaris,
			"jbtn_komisaris":     vTK.JbtnKomisaris,
			"hp_komisaris":       vTK.HpKomisaris,
			"no_ktp_komisaris":   vTK.NoKtpKomisaris,
			"path_ktp_komisaris": pathKtpKomisaris,
      "encrypt_key": encryptKey,
		}

		_, errIns := db.DbSidapet.Exec(ctx, qIns, args)
		if errIns != nil {
      fmt.Println("no_ktp_komisaris: " + vTK.NoKtpKomisaris.String + sidapethelper.GetLen(vTK.NoKtpKomisaris.String))
			log.Fatal("unable to insert ref_komisaris_bu, " + errIns.Error())
		}
	}
}
