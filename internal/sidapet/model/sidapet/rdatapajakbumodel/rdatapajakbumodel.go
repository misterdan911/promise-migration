package rdatapajakbumodel

import (
	"context"
	"database/sql"
	"log"
	"promise-migration/db"
	"promise-migration/internal/model/dbsidapet/helperdokumenmodel"
	"promise-migration/internal/model/dbsidapet/helperusermodel"
	"promise-migration/internal/structs"

	"github.com/jackc/pgx/v5"
)

func InsertrefDataPajakBu(profilePenyedia structs.TblProfilePenyedia, helperUser helperusermodel.HelperUser) {

 if profilePenyedia.IdJenisPenyedia.Int32 == 2 {
  return
 }

 ctx := context.Background()

  helperDokumen := helperdokumenmodel.GetByOriginalPath(profilePenyedia.PathSkb)
  fileSkb := helperDokumen.Newfilename
  encryptKeySkb := helperDokumen.EncryptKey

  helperDokumen = helperdokumenmodel.GetByOriginalPath(profilePenyedia.PathSkpp23)
  fileSkpp23 := helperDokumen.Newfilename
  encryptKeySkpp23 := helperDokumen.EncryptKey

 qIns := `
  INSERT INTO ref_data_pajak_bu (
    kode_vendor,
    file_bukti_kswp,
    file_bukti_spt,
    file_skb_pph23,
    encrypt_key_skb_pph23,
    file_sk_pp23,
    encrypt_key_sk_pp23
  ) VALUES (
    @kode_vendor,
    @file_bukti_kswp,
    @file_bukti_spt,
    @file_skb_pph23,
    @encrypt_key_skb_pph23,
    @file_sk_pp23,
    @encrypt_key_sk_pp23
  )`

 args := pgx.NamedArgs{
  "kode_vendor":     helperUser.KodeVendor,
  "file_bukti_kswp": sql.NullString{},
  "file_bukti_spt":  sql.NullString{},
  "file_skb_pph23": fileSkb,
  "encrypt_key_skb_pph23": encryptKeySkb,
  "file_sk_pp23":   fileSkpp23,
  "encrypt_key_sk_pp23": encryptKeySkpp23,
 }

 _, errIns := db.DbSidapet.Exec(ctx, qIns, args)
 if errIns != nil {
  log.Fatal("unable to insert ref_data_pajak_bu, " + errIns.Error())
 }
}
