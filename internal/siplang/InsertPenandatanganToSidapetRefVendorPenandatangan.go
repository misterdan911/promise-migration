package siplang

import (
	"promise-migration/internal/model/dbsidapet/helperusermodel"
	"promise-migration/internal/model/dbsidapet/refvendorpenandatanganmodel"
	"promise-migration/internal/model/promise_siplang/tblsignaturemodel"

	"github.com/jackc/pgx/v5/pgtype"
)

func InsertPenandatanganToSidapetRefVendorPenandatangan() {
	// ambil semua vendor yg bertandatangan di siplang
	allTblSignature := tblsignaturemodel.GetAllSignatureVendor()

	for _, tblSignature := range allTblSignature {

		userPenandatangan := helperusermodel.GetByVmsUserId(tblSignature.IdUser)
		if (userPenandatangan == helperusermodel.HelperUser{}) {
			// ada id user yg tandatangan, tapi data usernya sudah tidak ada (id_user: 12134, id_profile_penyedia: 981)
			continue
		}

		jabatan := pgtype.Text{Valid: true}
		if tblSignature.IdDireksiPerus.Valid {
			jabatan.String = "direksi"
		} else {
			jabatan.String = "perorangan"
		}

		if userPenandatangan.KodePenandatangan.Valid == false && userPenandatangan.KodeVendor.Valid == false {
			continue
		}

		refVendorPenandatangan := refvendorpenandatanganmodel.RefVendorPenandatangan{
			KodePenandatangan: userPenandatangan.KodePenandatangan,
			Jabatan:           jabatan,
			KodeVendor:        userPenandatangan.KodeVendor,
			IsAktif:           pgtype.Bool{Valid: true, Bool: true},
		}

		refvendorpenandatanganmodel.InsertNewIfNotExists(refVendorPenandatangan)
	}
}
