package sibela

import (
	"promise-migration/internal/ghelper"
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
	
	for _, tblPesanan := range allTblPesanan {

		// dapatkan kuantitas
		var kuantitas pgtype.Int4
		kuantitas.Valid = true
		kuantitas.Int32 = ghelper.StringToInt32WithDefault(tblPesanan.Kuantitas.String, 0)

		// dapatkan harga satuan
		var hargaSatuan pgtype.Int4
		hargaSatuan.Valid = true
		hargaSatuan.Int32 = ghelper.StringToInt32WithDefault(tblPesanan.HargaSatuan.String, 0)

		trxDetailPermintaan := trxdetailpermintaanmodel.TrxDetailPermintaan{
			KodePermintaan: kodePermintaan,
			KodeBmut:       tblPesanan.KodeBMN,
			KodeRuang:      tblPesanan.KodeRuang,
			Kuantitas:      kuantitas,
			Satuan:         tblPesanan.SatuanUkuran,
			Harga:          hargaSatuan,
		}

		trxdetailpermintaanmodel.InsertNewData(trxDetailPermintaan)
	}
}
