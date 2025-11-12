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

	// Jenis Pembayaran
	var allTblTermin []structs.TblTerminPl
	switch tblPaketPl.JenisPenyedia.String {
	case "luar_dpt":
		allTblTermin = tblterminplmodel.GetByIdPaketPl(tblPaketPl.IdPaket)
	case "dpt":
		allTblTermin = tbltermindptplmodel.GetByIdPaketPl(tblPaketPl.IdPaket)
	}

	jenisPembayaran := pgtype.Text{Valid:true}
	totalTermin := len(allTblTermin)

	if totalTermin > 1 {
		jenisPembayaran.String = "termin"
	} else if totalTermin == 1 {
		jenisPembayaran.String = "sekaligus"
	} else {
		jenisPembayaran.Valid = false
	}

	if jenisPembayaran.Valid {

		trxSistemPembayaran := trxsistempembayaranmodel.TrxSistemPembayaran{
			KodeProsesKontrak:     refProsesKontrak.KodeProsesKontrak,
			JenisPembayaran:       jenisPembayaran,
			KategoriSispembayaran: jenisPembayaran,
			Ucr:                   refPermintaan.Ucr,
		}
		trxSistemPembayaran = trxsistempembayaranmodel.InsertNew(trxSistemPembayaran)

		for _, tblTermin := range allTblTermin {
			persenTermin, _ := strconv.ParseFloat(tblTermin.PersenTermin.String, 64)
			fmt.Println("persen_termin: ", persenTermin)
			persentase := pgtype.Float8{
				Float64: persenTermin,
				Valid:   true,
			}

			sppIni, _ := strconv.ParseFloat(tblTermin.SppIni.String, 64)
			nilaiRupiah := pgtype.Float8{
				Float64: sppIni,
				Valid:   true,
			}

			trxJenisSispembayaran := trxjenissispembayaranmodel.TrxJenisSispembayaran{
				KodeSistemPembayaran: trxSistemPembayaran.KodeSistemPembayaran,
				NamaSispembayaran: tblTermin.NamaTermin,
				Persentase: persentase,
				NilaiRupiah: nilaiRupiah,
			}
			trxjenissispembayaranmodel.InsertNew(trxJenisSispembayaran)
		}

	}



	/*
	trxJangkaWaktu := trxjangkawaktumodel.TrxJangkaWaktu{
	}
	trxjangkawaktumodel.InsertNew(trxJangkaWaktu)
	*/

	return nil
}
