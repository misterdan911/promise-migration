package sibela

import (
	"fmt"
	"promise-migration/internal/model/dbsibela/refpermintaanmodel"
	"promise-migration/internal/model/dbsibela/refproseskontrakmodel"
	"promise-migration/internal/model/dbsibela/trxjenislaporanmodel"
	"promise-migration/internal/model/dbsibela/trxjenissispembayaranmodel"
	"promise-migration/internal/model/dbsibela/trxsistempembayaranmodel"
	"promise-migration/internal/model/promise_sibela/tblpaketplonionmodel"
	"promise-migration/internal/model/promise_sibela/tbltermindptplmodel"
	"promise-migration/internal/model/promise_sibela/tblterminplmodel"
	"promise-migration/internal/sibela/structs"
	"strconv"

	"github.com/jackc/pgx/v5/pgtype"
)

func InsertRefProsesKontrak(refPermintaan refpermintaanmodel.RefPermintaan, tblPaketPl tblpaketplonionmodel.TblPaketPlOnion) {

	InsertPersiapanKontrak(refPermintaan, tblPaketPl)

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

func InsertPersiapanKontrak(refPermintaan refpermintaanmodel.RefPermintaan, tblPaketPl tblpaketplonionmodel.TblPaketPlOnion) error {
	// Persiapan Kontrak
	refProsesKontrak := refproseskontrakmodel.RefProsesKontrak{
		KodePermintaan:           refPermintaan.KodePermintaan,
		KodeStatusKontrak:        pgtype.Int4{Valid: true, Int32: 1},
		KodeStepPersiapanKontrak: pgtype.Int4{Valid: true, Int32: 6},
		StatusPengisian:          pgtype.Text{Valid: true, String: "Selesai"},
		Ucr:                      refPermintaan.Ucr,
	}
	refProsesKontrak = refproseskontrakmodel.InsertNewData(refProsesKontrak)

	// Jenis Laporan
	trxJenisLaporan := trxjenislaporanmodel.TrxJenisLaporan{
		KodeProsesKontrak: refProsesKontrak.KodeProsesKontrak,
		Ucr:               refPermintaan.Ucr,
		NamaLaporan:       pgtype.Text{Valid: true, String: "-"},
	}

	trxjenislaporanmodel.InsertNew(trxJenisLaporan)

	//Jenis Pembayaran
	var allTblTermin []structs.TblTerminPl
	switch tblPaketPl.JenisPenyedia.String {
	case "luar_dpt":
		allTblTermin = tblterminplmodel.GetByIdPaketPl(tblPaketPl.IdPaket)
	case "dpt":
		allTblTermin = tbltermindptplmodel.GetByIdPaketPl(tblPaketPl.IdPaket)
	}

	if len(allTblTermin) > 0 {

		if allTblTermin[0].IdPaketPl.Int32 != 1347 {
			return nil
		}
		
		trxSistemPembayaran := trxsistempembayaranmodel.TrxSistemPembayaran{
			KodeProsesKontrak: refProsesKontrak.KodeProsesKontrak,
			JenisPembayaran: pgtype.Text{Valid: true, String:"termin"},
			KategoriSispembayaran: pgtype.Text{Valid: true, String:"termin"},
			Ucr:                      refPermintaan.Ucr,
		}
		trxSistemPembayaran = trxsistempembayaranmodel.InsertNew(trxSistemPembayaran)

		persenTermin, _ := strconv.ParseFloat(allTblTermin[0].PersenTermin.String, 64)
		//fmt.Printf("persen_termin: %s\n", allTblTermin[0].PersenTermin.String)
		fmt.Println("persen_termin: ", persenTermin)
		aa := pgtype.Float8{
			Float64: persenTermin,
			Valid:   true,
		}

		trxJenisSispembayaran := trxjenissispembayaranmodel.TrxJenisSispembayaran{
			KodeSistemPembayaran: trxSistemPembayaran.KodeSistemPembayaran,
			NamaSispembayaran: pgtype.Text{Valid: true, String:"Coba"},
			Persentase: aa,
			NilaiRupiah: aa,
		}
		trxjenissispembayaranmodel.InsertNew(trxJenisSispembayaran)
	}

	return nil

}
