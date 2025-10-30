package sibela

import (
	"promise-migration/internal/model/dbsibela/refpermintaanmodel"
	"promise-migration/internal/model/dbsibela/refproseskontrakmodel"
	"promise-migration/internal/model/promise_sibela/tblpaketplonionmodel"
	"promise-migration/internal/model/promise_sibela/tbltermindptplmodel"
	"promise-migration/internal/model/promise_sibela/tblterminplmodel"

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
	refProsesKontrak2 = refproseskontrakmodel.InsertNewData(refProsesKontrak2)
	InsertTrxDokumenKontrak(refPermintaan, tblPaketPl, refProsesKontrak2)

	// Riwayat Pelaksanaan
	statusPengisian := GetStatusPengisian(tblPaketPl)
	refProsesKontrak3 := refproseskontrakmodel.RefProsesKontrak{
		KodePermintaan:    refPermintaan.KodePermintaan,
		KodeStatusKontrak: pgtype.Int4{Valid: true, Int32: 3},
		StatusPengisian:   statusPengisian,
		Ucr:               refPermintaan.Ucr,
	}
	refProsesKontrak3 = refproseskontrakmodel.InsertNewData(refProsesKontrak3)
	InsertRefRiwayatPelaksanaan(refPermintaan, tblPaketPl, refProsesKontrak2)
}

func GetStatusPengisian(tblPaketPl tblpaketplonionmodel.TblPaketPlOnion) pgtype.Text {
	var statusTerminBast pgtype.Int8

	switch tblPaketPl.JenisPenyedia.String {
	case "luar_dpt":
		statusTerminBast = tblterminplmodel.GetLastStatusTerminBast(tblPaketPl.IdPaket)
	case "dpt":
		statusTerminBast = tbltermindptplmodel.GetLastStatusTerminBast(tblPaketPl.IdPaket)
	}

	statusPengisian := pgtype.Text{Valid: true, String: "Proses Pengisian"}
	if statusTerminBast.Int64 == 3 {
		statusPengisian.String = "Selesai"
	}

	return statusPengisian
}
