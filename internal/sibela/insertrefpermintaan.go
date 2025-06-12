package sibela

import (
	"promise-migration/internal/model/dbsibela/refpermintaanmodel"
	"promise-migration/internal/model/dbsidapet/helperusermodel"
	"promise-migration/internal/model/promise_sibela/tblpaketplmodel"
	"promise-migration/internal/sibela/sibelahelper"

	"github.com/jackc/pgx/v5/pgtype"
)

func InsertRefPermintaan() {

	allTblPaketPl := tblpaketplmodel.GetAllData()

	for _, tblPaketPl := range allTblPaketPl {
		idUserPP := tblPaketPl.IdUserpp
		userPP := helperusermodel.GetByVmsUserId(idUserPP)

		var jenisPenyedia pgtype.Text
		if userPP.VmsUserLevel.Int32 == 5 {
			jenisPenyedia.Valid = true
			jenisPenyedia.String = "dpt"
		} else if userPP.VmsUserLevel.Int32 == 9 {
			jenisPenyedia.Valid = true
			jenisPenyedia.String = "luar_dpt"
		}

		refPermintaan := refpermintaanmodel.RefPermintaan{
			KodePermintaan: tblPaketPl.IdPaketPl,
			KodeUnit:       userPP.KodeUnit,
			JenisPenyedia:  jenisPenyedia,
		}

		refpermintaanmodel.InsertNew(refPermintaan)
	}

	sibelahelper.UpdatePkSequence("ref_permintaan", "kode_permintaan")

}
