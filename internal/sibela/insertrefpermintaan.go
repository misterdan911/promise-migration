package sibela

import (
	"promise-migration/internal/model/dbsibela/refpermintaanmodel"
	"promise-migration/internal/model/dbsidapet/helperusermodel"
	"promise-migration/internal/model/promise_sibela/tblpaketplmodel"
	"promise-migration/internal/sibela/sibelahelper"
)

func InsertRefPermintaan() {

	allTblPaketPl := tblpaketplmodel.GetAllData()

	for _, tblPaketPl := range allTblPaketPl {
		idUserPP := tblPaketPl.IdUserpp
		helperUser := helperusermodel.GetByVmsUserId(idUserPP)

		refPermintaan := refpermintaanmodel.RefPermintaan{
			KodePermintaan: tblPaketPl.IdPaketPl,
			KodeUnit:       helperUser.KodeUnit,
		}

		refpermintaanmodel.InsertNew(refPermintaan)
	}

	sibelahelper.UpdatePkSequence("ref_permintaan", "kode_permintaan")

}
