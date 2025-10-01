package sibela

import (
	"promise-migration/internal/model/dbsibela/refpermintaanmodel"
	"promise-migration/internal/model/dbsidapet/helperusermodel"
	"promise-migration/internal/model/promise_sibela/tblpaketplonionmodel"
	sibelaprofile "promise-migration/internal/model/promise_sibela/tblprofilepenyediamodel"
	"promise-migration/internal/sibela/sibelahelper"
	"promise-migration/internal/structs"

	"github.com/jackc/pgx/v5/pgtype"
)

func InsertRefPermintaan() {

	// allTblPaketPl := tblpaketplmodel.GetAllData()
	allTblPaketPl := tblpaketplonionmodel.GetAllData()

	for _, tblPaketPl := range allTblPaketPl {
		var userPPK helperusermodel.HelperUser
		var kodeUnit pgtype.Text

		// dapatkan kodeUnit
		userPPK = helperusermodel.GetByVmsUserId(tblPaketPl.IdPpk)
		kodeUnit = userPPK.KodeUnit

		// dapatkan jenis_penyedia
		// var jenisPenyedia pgtype.Text
		var profilePenyedia structs.TblProfilePenyedia
		var helperUser helperusermodel.HelperUser

		if (tblPaketPl.IdProfilPenyedia != pgtype.Int4{}) {
			profilePenyedia = sibelaprofile.GetPenyediaById(tblPaketPl.IdProfilPenyedia)
			vmsUserId := profilePenyedia.IdUser
			helperUser = helperusermodel.GetByVmsUserId(vmsUserId)
		}

		var kodeJenisPengadaan pgtype.Int4
		kodeJenisPengadaan.Valid = true

		if tblPaketPl.IdKriteria.Int32 == 1 {
			kodeJenisPengadaan.Int32 = 1
		} else if tblPaketPl.IdKriteria.Int32 == 2 {
			kodeJenisPengadaan.Int32 = 3
		} else if tblPaketPl.IdKriteria.Int32 == 3 {
			kodeJenisPengadaan.Int32 = 4
		} else if tblPaketPl.IdKriteria.Int32 == 4 {
			kodeJenisPengadaan.Int32 = 2
		} else {
			kodeJenisPengadaan.Valid = false
		}

		refPermintaan := refpermintaanmodel.RefPermintaan{
			KodeUnit:            kodeUnit,
			JenisPenyedia:       tblPaketPl.JenisPenyedia,
			KodeVendor:          helperUser.KodeVendor,
			NamaPaket:           tblPaketPl.NamaPesanan,
			KodeSkemaPembayaran: tblPaketPl.IdPembayaran,
			KodeJenisPengadaan:  kodeJenisPengadaan,
		}

		refpermintaanmodel.InsertNew(refPermintaan)
	}

	sibelahelper.UpdatePkSequence("ref_permintaan", "kode_permintaan")

}
