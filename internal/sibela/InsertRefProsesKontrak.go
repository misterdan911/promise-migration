package sibela

import (
	"fmt"
	"promise-migration/internal/ghelper"
	"promise-migration/internal/model/dbsibela/refkeluaranproseskontrakmodel"
	"promise-migration/internal/model/dbsibela/refpermintaanmodel"
	"promise-migration/internal/model/dbsibela/refproseskontrakmodel"
	"promise-migration/internal/model/dbsibela/trxjangkawaktumodel"
	"promise-migration/internal/model/dbsibela/trxjenislaporanmodel"
	"promise-migration/internal/model/dbsibela/trxjenissispembayaranmodel"
	"promise-migration/internal/model/dbsibela/trxserahterimamodel"
	"promise-migration/internal/model/dbsibela/trxsistempembayaranmodel"
	"promise-migration/internal/model/promise_sibela/tblpaketplonionmodel"
	"promise-migration/internal/model/promise_sibela/tbltermindptplmodel"
	"promise-migration/internal/model/promise_sibela/tblterminplmodel"
	"promise-migration/internal/sibela/structs"
	"strconv"

	"github.com/jackc/pgx/v5/pgtype"
)

var allTrxJenisSispembayaran []trxjenissispembayaranmodel.TrxJenisSispembayaran

type HelperRiwayatPelaksanaan struct {
	TrxJenisSispembayaran trxjenissispembayaranmodel.TrxJenisSispembayaran
	TblTerminPl         structs.TblTerminPl
}

var allHelperRiwayatPelaksanaan []HelperRiwayatPelaksanaan

func InsertRefProsesKontrak(refPermintaan refpermintaanmodel.RefPermintaan, tblPaketPl tblpaketplonionmodel.TblPaketPlOnion) {

	allHelperRiwayatPelaksanaan = nil
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
	InsertRefRiwayatPelaksanaan(refPermintaan, tblPaketPl, refProsesKontrak3)
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

	jenisPembayaran := pgtype.Text{Valid: true}
	totalTermin := len(allTblTermin)

	if totalTermin > 0 {
		gKodeStatusPermintaan.Int32 = 8
		
		if allTblTermin[totalTermin - 1].StatusTerminBast.Int32 == 3 {
			gKodeStatusPermintaan.Int32 = 9
		}
	}

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
			fmt.Printf("idTerminPl: %d\n", tblTermin.IdTerminPl.Int32)
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
				NamaSispembayaran:    tblTermin.NamaTermin,
				Persentase:           persentase,
				NilaiRupiah:          nilaiRupiah,
			}
			trxJenisSispembayaran = trxjenissispembayaranmodel.InsertNew(trxJenisSispembayaran)

			allHelperRiwayatPelaksanaan = append(allHelperRiwayatPelaksanaan, HelperRiwayatPelaksanaan{
				TrxJenisSispembayaran: trxJenisSispembayaran,
				TblTerminPl: tblTermin,
			})

		}

		// Jangka Waktu
		beginDate := allTblTermin[0].TanggalBastTerealisasi.Time
		endDate := allTblTermin[len(allTblTermin)-1].TanggalBastTerealisasi.Time
		totalDays, _ := ghelper.CountDaysBetween(beginDate, endDate)
		totalMonths, _ := ghelper.CountMonthsBetween(beginDate, endDate)
		totalYears, _ := ghelper.CountYearsBetween(beginDate, endDate)

		// fmt.Printf("todalDays: %d\n", totalDays)
		// fmt.Printf("totalMonths: %d\n", totalMonths)
		// fmt.Printf("totalMonths: %d\n", totalYears)

		satuanJangkaWaktu := pgtype.Text{Valid: true}
		jangkaWaktu := pgtype.Int4{Valid: true}

		if totalYears > 0 {
			satuanJangkaWaktu.String = "tahunan"
			jangkaWaktu.Int32 = int32(totalYears)
		} else if totalMonths > 0 {
			satuanJangkaWaktu.String = "bulanan"
			jangkaWaktu.Int32 = int32(totalMonths)
		} else {
			satuanJangkaWaktu.String = "harian"
			jangkaWaktu.Int32 = int32(totalDays)
		}

		// fmt.Printf("IdTerminPl: %d\n", allTblTermin[0].IdTerminPl.Int32)
		// fmt.Printf("IdPaketPl: %d\n", allTblTermin[0].IdPaketPl.Int32)

		if !allTblTermin[0].TanggalBastTerealisasi.Valid {
			allTblTermin[0].TanggalBastTerealisasi.Valid = true
			allTblTermin[0].TanggalBastTerealisasi.Scan("1970-01-01 08:00:00")
		}

		if !allTblTermin[len(allTblTermin)-1].TanggalBastTerealisasi.Valid {
			allTblTermin[len(allTblTermin)-1].TanggalBastTerealisasi.Valid = true
			allTblTermin[len(allTblTermin)-1].TanggalBastTerealisasi.Scan("1970-01-01 08:00:00")
		}

		trxJangkaWaktu := trxjangkawaktumodel.TrxJangkaWaktu{
			KodeProsesKontrak: refProsesKontrak.KodeProsesKontrak,
			JangkaWaktu:       jangkaWaktu,
			Dari:              allTblTermin[0].TanggalBastTerealisasi,
			SampaiDengan:      allTblTermin[len(allTblTermin)-1].TanggalBastTerealisasi,
			SatuanJangkaWaktu: satuanJangkaWaktu,
			Ucr:               refPermintaan.Ucr,
		}
		trxjangkawaktumodel.InsertNew(trxJangkaWaktu)

		// Keluaran
		refKeluaranProsesKontrak := refkeluaranproseskontrakmodel.RefKeluaranProsesKontrak{
			KodeProsesKontrak: refProsesKontrak.KodeProsesKontrak,
			Keluaran:          pgtype.Text{Valid: true, String: "-"},
			Ucr:               refPermintaan.Ucr,
			StatusAktif:       pgtype.Int2{Valid: true, Int16: 1},
		}
		refkeluaranproseskontrakmodel.InsertNew(refKeluaranProsesKontrak)

		// Serah Terima
		var persentase pgtype.Numeric
		persentase.Valid = true
		err := persentase.Scan("100")
		if err != nil {
			return err
		}

		trxSerahTerima := trxserahterimamodel.TrxSerahTerima{
			KodeProsesKontrak:   refProsesKontrak.KodeProsesKontrak,
			KategoriSerahTerima: pgtype.Text{Valid: true, String: "sekaligus"},
			Rincian:             pgtype.Text{Valid: true, String: "-"},
			Persentase:          persentase,
			Ucr:                 refPermintaan.Ucr,
		}
		trxserahterimamodel.InsertNew(trxSerahTerima)

	}

	return nil
}
