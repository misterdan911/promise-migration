package sibela

import (
	"promise-migration/internal/model/dbsibela/trxnegohargamodel"
	"promise-migration/internal/model/promise_sibela/logsibelamodel"
	"promise-migration/internal/sibela/structs"

	"github.com/jackc/pgx/v5/pgtype"
)

func InsertNegosiasiHarga(kodeDetailPermintaan pgtype.Int4, tblPesanan structs.TblPesanan) error {

	if tblPesanan.IDPesanan.Int32 != 31283 {
		return nil
	}

	allLogSibela := logsibelamodel.GetDataByIdPesanan(tblPesanan.IDPesanan)

	for _, logSibela := range allLogSibela {

		trxNegoHarga := trxnegohargamodel.TrxNegoHarga{
			KodeDetailPermintaan: kodeDetailPermintaan,
			HargaAwal:            logSibela.HargaSatuan,
			HargaNego:            logSibela.Negosiasi,
			Negotiator:           logSibela.Role,
			TglNego:              logSibela.CreatedAt,
		}

		trxnegohargamodel.InsertNewData(trxNegoHarga)
	}

	return nil

	// allLogSibela := logsibelamodel.GetDataByIdPesanan(tblPesanan.IDPesanan)

	// if strings.TrimSpace(logSibela.Tahap.String) == "Negosiasi" && logSibela.KeteranganNegosiasi.Valid == false {
	// 	InsertTrxNegoHarga(trxDetailPermintaan.KodeDetailPermintaan, tblPesanan, logSibela)
	// }

}

func InsertTrxNegoHarga(kodeDetailPermintaan pgtype.Int4, tblPesanan structs.TblPesanan, logSibela logsibelamodel.LogSibela) {
	// fmt.Printf("kodeDetailPermintaan: %d \n", kodeDetailPermintaan.Int32)

	trxNegoHarga := trxnegohargamodel.TrxNegoHarga{
		KodeDetailPermintaan: kodeDetailPermintaan,
		HargaAwal:            logSibela.HargaSatuan,
		HargaNego:            logSibela.Negosiasi,
		Negotiator:           logSibela.Role,
		TglNego:              logSibela.CreatedAt,
	}

	trxnegohargamodel.InsertNewData(trxNegoHarga)
}
