package rsertifperomodel

import (
	"context"
	"log"
	"promise-migration/db"
	"promise-migration/internal/model/dbsidapet/helperdokumenmodel"
	"promise-migration/internal/model/dbsidapet/helperusermodel"
	"promise-migration/internal/structs"
	"strconv"

	"github.com/jackc/pgx/v5"
	"github.com/jackc/pgx/v5/pgtype"
)

type VmsSP struct {
  NmSertifOrang pgtype.Text
  PathSertif    pgtype.Text
}

func InsertRefSertifPero(profilePenyedia structs.TblProfilePenyedia, helperUser helperusermodel.HelperUser) {
  if profilePenyedia.IdJenisPenyedia.Int32 == 1 {
    return
  }

  ctx := context.Background()

  qVmsSertifPero := `
  SELECT nm_sertif_orang, path_sertif
  FROM tbl_sertif_perorangan
  WHERE id_profil_penyedia = $1`

  var rSP pgx.Rows
  var errVPP error

  if helperUser.DbPenyedia.String == "vms_db" {
    rSP, errVPP = db.VmsDb.Query(ctx, qVmsSertifPero, strconv.Itoa(int(profilePenyedia.IdProfilPenyedia.Int32)))
  }
  if helperUser.DbPenyedia.String == "promise_sibela" {
    rSP, errVPP = db.PromiseSibela.Query(ctx, qVmsSertifPero, strconv.Itoa(int(profilePenyedia.IdProfilPenyedia.Int32)))
  }

  if errVPP != nil {
    log.Fatal("qVmsSertifPero Failed, " + errVPP.Error() + " " + qVmsSertifPero)
  }

  allSP, errCollect := pgx.CollectRows(rSP, pgx.RowToStructByName[VmsSP])
  if errCollect != nil {
    log.Fatal("failed collecting rows, " + errCollect.Error())
  }
  defer rSP.Close()

  for _, vSP := range allSP {

    helperDokumen := helperdokumenmodel.GetByOriginalPath(vSP.PathSertif)
    fileBukti := helperDokumen.Newfilename
    encryptKey := helperDokumen.EncryptKey

    qIns := `
    INSERT INTO ref_sertif_pero (
      kode_vendor,
      nm_sertifikat,
      file_bukti,
      encrypt_key
    ) VALUES (
      @kode_vendor,
      @nm_sertifikat,
      @file_bukti,
      @encrypt_key
    )`

    args := pgx.NamedArgs{
      "kode_vendor":   helperUser.KodeVendor,
      "nm_sertifikat": vSP.NmSertifOrang,
      "file_bukti":    fileBukti,
      "encrypt_key":    encryptKey,
    }

    _, errIns := db.DbSidapet.Exec(ctx, qIns, args)
    if errIns != nil {
      log.Fatal("unable to insert ref_sertif_pero, " + errIns.Error())
    }

  }

}
