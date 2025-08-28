package rdireksibumodel

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

type VTblDireksi struct {
 IdDireksiPerus          pgtype.Int4
 NmDireksi               pgtype.Text
 JbtnDireksi             pgtype.Text
 HpDireksi               pgtype.Text
 NoKtpDireksi            pgtype.Text
 PathKtpDireksi          pgtype.Text
 StatusDireksiPerusahaan pgtype.Int4
}

func InsertRefDireksiBu(profilePenyedia structs.TblProfilePenyedia, helperUser helperusermodel.HelperUser) {

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

  var rVTD pgx.Rows
  var errVTK error

  if helperUser.DbPenyedia.String == "vms_db" {
    rVTD, errVTK = db.VmsDb.Query(ctx, qVmsTblDireksi, strconv.Itoa(int(profilePenyedia.IdProfilPenyedia.Int32)))
  }
  if helperUser.DbPenyedia.String == "promise_sibela" {
    rVTD, errVTK = db.PromiseSibela.Query(ctx, qVmsTblDireksi, strconv.Itoa(int(profilePenyedia.IdProfilPenyedia.Int32)))
  }


 if errVTK != nil {
  log.Fatal("qVmsTblDireksi Failed, " + errVTK.Error() + " " + qVmsTblDireksi)
 }

 allVTD, errCollect := pgx.CollectRows(rVTD, pgx.RowToStructByName[VTblDireksi])
 if errCollect != nil {
  log.Fatal("failed collecting rows, " + errCollect.Error())
 }
 defer rVTD.Close()

 for _, vTD := range allVTD {

  helperDokumen := helperdokumenmodel.GetByOriginalPath(vTD.PathKtpDireksi)
  pathKtpDireksi := helperDokumen.Newfilename
  encryptKey := helperDokumen.EncryptKey

  qIns := `
  INSERT INTO ref_direksi_bu (
    kode_vendor,
    nm_direksi,
    jbtn_direksi,
    hp_direksi,
    no_ktp_direksi,
    path_ktp_direksi,
    encrypt_key
  ) VALUES (
    @kode_vendor,
    @nm_direksi,
    @jbtn_direksi,
    @hp_direksi,
    @no_ktp_direksi,
    @path_ktp_direksi,
    @encrypt_key
  )`

  args := pgx.NamedArgs{
   "kode_vendor":      helperUser.KodeVendor,
   "nm_direksi":       vTD.NmDireksi,
   "jbtn_direksi":     vTD.JbtnDireksi,
   "hp_direksi":       vTD.HpDireksi,
   "no_ktp_direksi":   vTD.NoKtpDireksi,
   "path_ktp_direksi": pathKtpDireksi,
   "encrypt_key":      encryptKey,
  }

  _, errIns := db.DbSidapet.Exec(ctx, qIns, args)
  if errIns != nil {
   fmt.Println("no_ktp_direksi: " + vTD.NoKtpDireksi.String + sidapethelper.GetLen(vTD.NoKtpDireksi.String))
   log.Fatal("unable to insert ref_direksi_bu, " + errIns.Error())
  }

 }
}
