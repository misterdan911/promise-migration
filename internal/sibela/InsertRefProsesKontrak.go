package sibela

import (
	"promise-migration/internal/model/dbsibela/refpermintaanmodel"
	"promise-migration/internal/model/dbsibela/refproseskontrakmodel"
	"promise-migration/internal/model/promise_sibela/tblpaketplonionmodel"

	"github.com/jackc/pgx/v5/pgtype"
)

func InsertRefProsesKontrak(refPermintaan refpermintaanmodel.RefPermintaan, tblPaketPl tblpaketplonionmodel.TblPaketPlOnion) {

	// Persiapan Kontrak
	refProsesKontrak1 := refproseskontrakmodel.RefProsesKontrak{
		KodePermintaan:           refPermintaan.KodePermintaan,
		KodeStatusKontrak:        pgtype.Int4{Valid: true, Int32: 1},
		KodeStepPersiapanKontrak: pgtype.Int4{Valid: true, Int32: 6},
		StatusPengisian:          pgtype.Text{Valid: true, String: "Selesai"},
		Ucr:                      refPermintaan.Ucr,
	}
	refproseskontrakmodel.InsertNewData(refProsesKontrak1)

	// Dokumen Kontrak
	refProsesKontrak2 := refproseskontrakmodel.RefProsesKontrak{
		KodePermintaan:    refPermintaan.KodePermintaan,
		KodeStatusKontrak: pgtype.Int4{Valid: true, Int32: 2},
		StatusPengisian:   pgtype.Text{Valid: true, String: "Selesai"},
		Ucr:               refPermintaan.Ucr,
	}
	refproseskontrakmodel.InsertNewData(refProsesKontrak2)
	InsertSuratPesanan(refPermintaan.KodePermintaan, tblPaketPl)

}
