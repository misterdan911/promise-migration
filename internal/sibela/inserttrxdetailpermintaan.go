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

	var tblPesanan structs.TblPesanan

	if tblPaketPl.JenisPenyedia.String == "luar_dpt" {
		tblPesanan = tblpesananplmodel.GetDataByIdPaket(tblPaketPl.IdPaket)
	} else if tblPaketPl.JenisPenyedia.String == "dpt" {
		tblPesanan = tblpesanandptplmodel.GetDataByIdPaket(tblPaketPl.IdPaket)
	}

	var kuantitas pgtype.Int4
	kuantitas.Valid = true
	kuantitas.Int32 = ghelper.StringToInt32WithDefault(tblPesanan.Kuantitas.String, 0)

	var hargaSatuan pgtype.Int4
	hargaSatuan.Valid = true
	hargaSatuan.Int32 = ghelper.StringToInt32WithDefault(tblPesanan.HargaSatuan.String, 0)

	trxDetailPermintaan := trxdetailpermintaanmodel.TrxDetailPermintaan{
		KodePermintaan: kodePermintaan,
		KodeRuang:      tblPesanan.KodeRuang,
		Kuantitas:      kuantitas,
		Satuan:         tblPesanan.SatuanUkuran,
		Harga:          hargaSatuan,
	}

	trxdetailpermintaanmodel.InsertNewData(trxDetailPermintaan)
}
