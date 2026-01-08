package sibela


/*
func InsertPenandatanganToSidapetRefVendorPenandatangan() {
	// ambil semua vendor yg bertandatangan di sibela
	allTblSignature := tblsignaturemodel.GetAllSignatureVendor()

	for _, tblSignature := range allTblSignature {

		userPenandatangan := helperusermodel.GetByVmsUserId(tblSignature.IdUser)
		if (userPenandatangan == helperusermodel.HelperUser{}) {
			// ada id user yg tandatangan, tapi data usernya sudah tidak ada (id_user: 12134, id_profile_penyedia: 981)
			continue
		}

		jabatan := pgtype.Text{Valid:true}
		if !(tblSignature.IdDireksiPerus{}) {
			jabatan.String = "direksi"
		} else {
			jabatan.String = "perorangan"
		}

		refVendorPenandatangan := refvendorpenandatanganmodel.RefVendorPenandatangan{
			KodePenandatangan: userPenandatangan.KodePenandatangan,
			Jabatan: jabatan,
			KodeVendor: userPenandatangan.KodeVendor,
			IsAktif: pgtype.Bool{Valid: true, Bool: true},
		}

		refvendorpenandatanganmodel.InsertNewIfNotExists(refVendorPenandatangan)
	}
}
*/