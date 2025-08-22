package sidapet

import (
	"promise-migration/internal/model/dbsidapet/helperdokumenmodel"
	"promise-migration/internal/model/dbsidapet/helperusermodel"
	"promise-migration/internal/model/dbsidapet/refdatadirimodel"
	"promise-migration/internal/sidapet/model/hdomisilimodel"
	"promise-migration/internal/structs"

	"github.com/jackc/pgx/v5/pgtype"
)

func InsertRefDatadiri(profilePenyedia structs.TblProfilePenyedia, helperUser helperusermodel.HelperUser) {

  var kodeKabKota pgtype.Text

  strKodeKabKota := hdomisilimodel.GetKodeKabKotaByKodeDomisili(profilePenyedia.IdDomisili.Int32)
  if strKodeKabKota != "" {
    kodeKabKota = pgtype.Text{Valid: true, String: strKodeKabKota}
  }

  helperDokumen := helperdokumenmodel.GetByOriginalPath(profilePenyedia.PathKtp)
  fileKtp := helperDokumen.Newfilename
  encryptKeyKtp := helperDokumen.EncryptKey

  helperDokumen = helperdokumenmodel.GetByOriginalPath(profilePenyedia.PathDomisili)
  fileSkd := helperDokumen.Newfilename
  encryptKeySkd := helperDokumen.EncryptKey

  refDataDiri := refdatadirimodel.RefDatadiri {
    KodeVendor: helperUser.KodeVendor,
    FileKtp: fileKtp,
    EncryptKeyKtp: encryptKeyKtp,
    FileSkd: fileSkd,
    EncryptKeySkd: encryptKeySkd,
    AlamatKtp: profilePenyedia.Alamat,
    KodeKabKotaKtp: kodeKabKota,
  }

  refdatadirimodel.InsertNew(refDataDiri)
}