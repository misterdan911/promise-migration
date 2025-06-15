package sibela

import (
	"promise-migration/internal/model/dbsibela/refpermintaanmodel"
	"promise-migration/internal/model/dbsidapet/helperusermodel"
	"promise-migration/internal/model/promise_sibela/tblpaketplmodel"
	sibelaprofile "promise-migration/internal/model/promise_sibela/tblprofilepenyediamodel"
	"promise-migration/internal/sibela/sibelahelper"
	"promise-migration/internal/structs"

	"github.com/jackc/pgx/v5/pgtype"
)

func InsertRefPermintaan() {

	allTblPaketPl := tblpaketplmodel.GetAllData()

	for _, tblPaketPl := range allTblPaketPl {
		var userPP helperusermodel.HelperUser
		var userPPK helperusermodel.HelperUser
		var kodeUnit pgtype.Text

		// userVendor := helperusermodel.GetByVmsUserId(tblPaketPl.)

		if (tblPaketPl.IdUserpp != pgtype.Int4{}) {
			userPP = helperusermodel.GetByVmsUserId(tblPaketPl.IdUserpp)
			kodeUnit = userPP.KodeUnit
		} else if (tblPaketPl.IdPpk != pgtype.Int4{}) {
			userPPK = helperusermodel.GetByVmsUserId(tblPaketPl.IdPpk)
			kodeUnit = userPPK.KodeUnit
		}

		// dapatkan jenis_penyedia
		var jenisPenyedia pgtype.Text
		var profilePenyedia structs.TblProfilePenyedia
		var helperUser helperusermodel.HelperUser

		if (tblPaketPl.IdProfilPenyedia != pgtype.Int4{}) {
			profilePenyedia = sibelaprofile.GetPenyediaById(tblPaketPl.IdProfilPenyedia)
			vmsUserId := profilePenyedia.IdUser
			helperUser = helperusermodel.GetByVmsUserId(vmsUserId)
		}

		if helperUser.VmsUserLevel.Int32 == 5 {
			jenisPenyedia.Valid = true
			jenisPenyedia.String = "dpt"
		} else if helperUser.VmsUserLevel.Int32 == 9 {
			jenisPenyedia.Valid = true
			jenisPenyedia.String = "luar_dpt"
		}

		refPermintaan := refpermintaanmodel.RefPermintaan{
			KodePermintaan:      tblPaketPl.IdPaketPl,
			KodeUnit:            kodeUnit,
			JenisPenyedia:       jenisPenyedia,
			KodeVendor:          helperUser.KodeVendor,
			NamaPaket:           tblPaketPl.NamaPesananPl,
			KodeSkemaPembayaran: tblPaketPl.IdPembayaran,
		}

		refpermintaanmodel.InsertNew(refPermintaan)
	}

	sibelahelper.UpdatePkSequence("ref_permintaan", "kode_permintaan")

}
