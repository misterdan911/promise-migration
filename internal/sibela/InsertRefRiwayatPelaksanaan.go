package sibela

import (
	"promise-migration/internal/model/dbsibela/refpermintaanmodel"
	"promise-migration/internal/model/dbsibela/refproseskontrakmodel"
	"promise-migration/internal/model/dbsibela/refriwayatpelaksanaanmodel"
	"promise-migration/internal/model/promise_sibela/tblpaketplonionmodel"
	"promise-migration/internal/model/promise_sibela/tblsuratbapmodel"
	"promise-migration/internal/model/promise_sibela/tblsuratbapdptmodel"
	"promise-migration/internal/sibela/structs"

	"github.com/jackc/pgx/v5/pgtype"
)

func InsertRefRiwayatPelaksanaan(refPermintaan refpermintaanmodel.RefPermintaan, tblPaketPl tblpaketplonionmodel.TblPaketPlOnion, refProsesKontrak3 refproseskontrakmodel.RefProsesKontrak) error {

	// looping per-termin
	for _, helperRiwayatPelaksanaan:= range allHelperRiwayatPelaksanaan {

		// insert ref_riwayat_pelaksanaan
		trxJenisSispembayaran := helperRiwayatPelaksanaan.TrxJenisSispembayaran
		tblTerminPl := helperRiwayatPelaksanaan.TblTerminPl
		var statusRiwayatPelaksanaan pgtype.Text
		statusRiwayatPelaksanaan.Valid = true

		if tblTerminPl.StatusTerminBast.Int32 == 3 {
			statusRiwayatPelaksanaan.String = "selesai"
		}	else {
			statusRiwayatPelaksanaan.String = "proses"
		}

		refRiwayatPelaksanaan := refriwayatpelaksanaanmodel.RefRiwayatPelaksanaan{
			KodeProsesKontrak: refProsesKontrak3.KodeProsesKontrak,
			KodeTrxJenisSispembayaran: trxJenisSispembayaran.KodeTrxJenisSispembayaran,
			StatusRiwayatPelaksanaan: statusRiwayatPelaksanaan,
			Ucr: refPermintaan.Ucr,
		}
		refRiwayatPelaksanaan = refriwayatpelaksanaanmodel.InsertNew(refRiwayatPelaksanaan)

		//insert trx_riwayat_pelaksanaan
		trxRiwayatPelaksanaan := trxriwayatpelaksanaanmodel.TrxRiwayatPelaksanaan{
			KodeRiwayatPelaksanaan: refRiwayatPelaksanaan.KodeRiwayatPelaksanaan,
		}
		trxriwayatpelaksanaanmodel.InsertNew(trxRiwayatPelaksanaan)

		// insert ref_ba_pemeriksaan
		var tblSuratBap structs.TblSuratBap
		switch tblPaketPl.JenisPenyedia.String {
		case "luar_dpt":
			tblSuratBap = tblsuratbapmodel.GetByIdTerminPl(tblTerminPl.IdTerminPl)
		case "dpt":
			tblSuratBap = tblsuratbapdptmodel.GetByIdTerminPl(tblTerminPl.IdTerminPl)
		}

		refBaPemeriksaan := refbapemeriksaanmodel.RefBaPemeriksaan{
		}
		refbapemeriksaanmodel.InsertNew(refBaPemeriksaan)


	}

	return nil
}
