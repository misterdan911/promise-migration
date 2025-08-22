package sidapet

import (
	"promise-migration/internal/model/dbsidapet/helperdokumenmodel"
	"promise-migration/internal/model/dbsidapet/helperusermodel"
	"promise-migration/internal/model/dbsidapet/refumummodel"
	"promise-migration/internal/structs"

)

func InsertRefUmum(profilePenyedia structs.TblProfilePenyedia, helperUser helperusermodel.HelperUser) {

  helperDokumen := helperdokumenmodel.GetByOriginalPath(profilePenyedia.PathDomisili)
  fileDokDomisili := helperDokumen.Newfilename
  encryptKeyDokDomisili := helperDokumen.EncryptKey

  refUmum := refumummodel.RefUmum {
    KodeVendor: helperUser.KodeVendor,
    NomorTelp: profilePenyedia.NoTelp,
    AlamatBadanUsaha: profilePenyedia.Alamat,
    FileDokDomisili: fileDokDomisili,
    EncryptKeyDokDomisili: encryptKeyDokDomisili,
  }

  refumummodel.InsertNew(refUmum)
}