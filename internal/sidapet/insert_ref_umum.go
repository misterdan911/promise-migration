package sidapet

import (
	"promise-migration/internal/model/dbsidapet/helperdokumenmodel"
	"promise-migration/internal/model/dbsidapet/helperusermodel"
	"promise-migration/internal/model/dbsidapet/refumummodel"
	"promise-migration/internal/sidapet/model/hdomisilimodel"
	"promise-migration/internal/structs"


  "github.com/jackc/pgx/v5/pgtype"
)

func InsertRefUmum(profilePenyedia structs.TblProfilePenyedia, helperUser helperusermodel.HelperUser) {

  var kodeKabKotaDomisili pgtype.Text

  strKodeKabKota := hdomisilimodel.GetKodeKabKotaByKodeDomisili(profilePenyedia.IdDomisili.Int32)
  if strKodeKabKota != "" {
    kodeKabKotaDomisili = pgtype.Text{Valid: true, String: strKodeKabKota}
  }

  helperDokumen := helperdokumenmodel.GetByOriginalPath(profilePenyedia.PathDomisili)
  fileDokDomisili := helperDokumen.Newfilename
  encryptKeyDokDomisili := helperDokumen.EncryptKey

  refUmum := refumummodel.RefUmum {
    KodeVendor: helperUser.KodeVendor,
    NomorTelp: profilePenyedia.NoTelp,
    AlamatBadanUsaha: profilePenyedia.Alamat,
    FileDokDomisili: fileDokDomisili,
    EncryptKeyDokDomisili: encryptKeyDokDomisili,
    KodeKabKotaDomisili: kodeKabKotaDomisili,
  }

  refumummodel.InsertNew(refUmum)
}
