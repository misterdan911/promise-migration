package sibela

import (
	"promise-migration/internal/ghelper"
	"promise-migration/internal/model/dbsibela/refpermintaanmodel"
	"promise-migration/internal/model/dbsibela/trxdetailpermintaanmodel"
	"promise-migration/internal/model/promise_sibela/tblpaketplonionmodel"
	"promise-migration/internal/model/promise_sibela/tblpesanandptplmodel"
	"promise-migration/internal/model/promise_sibela/tblpesananplmodel"
	"promise-migration/internal/sibela/structs"

	"github.com/jackc/pgx/v5/pgtype"
)

func InsertTrxDetailPermintaan(kodePermintaan pgtype.Int4, tblPaketPl tblpaketplonionmodel.TblPaketPlOnion) {

	var allTblPesanan []structs.TblPesanan

	switch tblPaketPl.JenisPenyedia.String {
	case "luar_dpt":
		allTblPesanan = tblpesananplmodel.GetDataByIdPaket(tblPaketPl.IdPaket)
	case "dpt":
		allTblPesanan = tblpesanandptplmodel.GetDataByIdPaket(tblPaketPl.IdPaket)
	}

	var nilaiHps pgtype.Int4
	nilaiHps.Valid = true

	for _, tblPesanan := range allTblPesanan {

		// dapatkan kuantitas
		var kuantitas pgtype.Int4
		kuantitas.Valid = true
		kuantitas.Int32 = ghelper.StringToInt32WithDefault(tblPesanan.Kuantitas.String, 0)

		// dapatkan harga satuan (sebelum di nego)
		var hargaSatuan pgtype.Int4
		hargaSatuan.Valid = true
		hargaSatuan.Int32 = ghelper.StringToInt32WithDefault(tblPesanan.HargaSatuan.String, 0)

		// nilai HPS -> akumulsai (harga satuan x kuantitas) sebelum dinego
		nilaiHps.Int32 += hargaSatuan.Int32 * kuantitas.Int32

		trxDetailPermintaan := trxdetailpermintaanmodel.TrxDetailPermintaan{
			KodePermintaan: kodePermintaan,
			Deskripsi:      tblPesanan.NamaBarang,
			KodeBmut:       tblPesanan.KodeBMN,
			KodeRuang:      tblPesanan.KodeRuang,
			Kuantitas:      kuantitas,
			Satuan:         tblPesanan.SatuanUkuran,
			Harga:          hargaSatuan, // Harga satuan awal (harga sebelum di nego)
		}

		trxDetailPermintaan = trxdetailpermintaanmodel.InsertNewData(trxDetailPermintaan)

		InsertNegosiasiHarga(trxDetailPermintaan.KodeDetailPermintaan, tblPaketPl, tblPesanan)

		/*
			for _, logSibela := range allLogSibela {
				if strings.TrimSpace(logSibela.Tahap.String) == "Negosiasi" && logSibela.KeteranganNegosiasi.Valid == false {
					InsertTrxNegoHarga(trxDetailPermintaan.KodeDetailPermintaan, tblPesanan, logSibela)
				}
			}
		*/

	}

	refpermintaanmodel.UpdateHps(kodePermintaan, nilaiHps)
}
