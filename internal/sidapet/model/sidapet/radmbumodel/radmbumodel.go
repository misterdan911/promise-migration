package radmbumodel

import (
	"context"
	"log"
	"promise-migration/db"
	"promise-migration/internal/model/dbsidapet/helperdokumenmodel"
	"promise-migration/internal/model/dbsidapet/helperusermodel"
	"promise-migration/internal/structs"

	"github.com/jackc/pgx/v5"
)

func InsertRefAdmBu(profilePenyedia structs.TblProfilePenyedia, helperUser helperusermodel.HelperUser) {
	if profilePenyedia.IdJenisPenyedia.Int32 == 2 {
		return
	}

	ctx := context.Background()

  helperDokumen := helperdokumenmodel.GetByOriginalPath(profilePenyedia.PathIkutSerta)
  fileFis := helperDokumen.Newfilename
  encryptKeyFis := helperDokumen.EncryptKey

  helperDokumen = helperdokumenmodel.GetByOriginalPath(profilePenyedia.PathKuasa)
  fileSKuasa := helperDokumen.Newfilename
  encryptKeySKuasa := helperDokumen.EncryptKey

	qIns := `
    INSERT INTO ref_adm_bu (
      kode_vendor,
      file_fis,
      encrypt_key_fis,
      file_s_kuasa,
      encrypt_key_s_kuasa
    ) VALUES (
      @kode_vendor,
      @file_fis,
      @encrypt_key_fis,
      @file_s_kuasa,
      @encrypt_key_s_kuasa
    )`

	args := pgx.NamedArgs{
		"kode_vendor":  helperUser.KodeVendor,
		"file_fis":     fileFis,
		"encrypt_key_fis":     encryptKeyFis,
		"file_s_kuasa": fileSKuasa,
		"encrypt_key_s_kuasa": encryptKeySKuasa,
	}

	_, errIns := db.DbSidapet.Exec(ctx, qIns, args)
	if errIns != nil {
		log.Fatal("unable to insert ref_adm_bu, " + errIns.Error())
	}
	//defer rwIns.Close()
}
