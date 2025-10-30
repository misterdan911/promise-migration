package sibela

import (
	"promise-migration/internal/model/dbsibela/refpermintaanmodel"
	"promise-migration/internal/model/dbsibela/refproseskontrakmodel"
	"promise-migration/internal/model/promise_sibela/tblpaketplonionmodel"
)

func InsertRefRiwayatPelaksanaan(refPermintaan refpermintaanmodel.RefPermintaan, tblPaket tblpaketplonionmodel.TblPaketPlOnion, refProsesKontrak refproseskontrakmodel.RefProsesKontrak) error {

	refRiwayatPelaksanaan := refriwayatpelaksanaanmodel.RefRiwayatPelaksanaan{
		KodeProsesKontrak: refProsesKontrak.KodeProsesKontrak,
	}

	refriwayatpelaksanaanmodel.InsertNew(refRiwayatPelaksanaan)
}
