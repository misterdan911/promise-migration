package sibela

import (
	"promise-migration/internal/model/dbsibela/refpermintaanmodel"
	"promise-migration/internal/model/dbsibela/refproseskontrakmodel"
	"promise-migration/internal/model/promise_sibela/tblpaketplonionmodel"
	"promise-migration/internal/sibela/structs"
	"promise-migration/internal/model/promise_sibela/tblterminplmodel"
	"promise-migration/internal/model/promise_sibela/tbltermindptplmodel"
)

func InsertRefRiwayatPelaksanaan(refPermintaan refpermintaanmodel.RefPermintaan, tblPaketPl tblpaketplonionmodel.TblPaketPlOnion, refProsesKontrak refproseskontrakmodel.RefProsesKontrak) error {

	var allTblTermin []structs.TblTerminPl
	switch tblPaketPl.JenisPenyedia.String {
	case "luar_dpt":
		allTblTermin = tblterminplmodel.GetByIdPaketPl(tblPaketPl.IdPaket)
	case "dpt":
		allTblTermin = tbltermindptplmodel.GetByIdPaketPl(tblPaketPl.IdPaket)
	}

	for _, tblTermin := range allTblTermin {
		// insert refRiwayatPelaksanaan
	}	

	// Looping per termin
	// refRiwayatPelaksanaan := refriwayatpelaksanaanmodel.RefRiwayatPelaksanaan{
	// 	KodeProsesKontrak: refProsesKontrak.KodeProsesKontrak,
	// }

	// refriwayatpelaksanaanmodel.InsertNew(refRiwayatPelaksanaan)

	return nil
}
