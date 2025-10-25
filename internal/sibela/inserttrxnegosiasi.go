package sibela

import (
	"promise-migration/internal/ghelper"
	"promise-migration/internal/model/dbsibela/trxnegohargamodel"
	"promise-migration/internal/model/promise_sibela/logsibelamodel"
	"promise-migration/internal/model/promise_sibela/tblpaketplonionmodel"
	"promise-migration/internal/sibela/structs"
	"strings"

	"github.com/jackc/pgx/v5/pgtype"
)

func InsertNegosiasiHarga(kodeDetailPermintaan pgtype.Int4, tblPaketPl tblpaketplonionmodel.TblPaketPlOnion, tblPesanan structs.TblPesanan) error {

	// buat testing
	if tblPesanan.IDPesanan.Int32 != 31283 {
		return nil
	}

	allLogSibela := logsibelamodel.GetDataByIdPesanan(tblPesanan.IDPesanan, tblPaketPl)

	// dapatkan harga satuan (sebelum di nego)
	var hargaSatuan pgtype.Int8
	hargaSatuan.Valid = true
	hargaSatuan.Int64 = ghelper.StringToInt64WithDefault(tblPesanan.HargaSatuan.String, 0)

	tahapan := pgtype.Int4{
		Valid: true,
		Int32: 0,
	}

	var count int = 0

	for _, logSibela := range allLogSibela {

		if strings.ToLower(logSibela.KeteranganNegosiasi.String) == "pp menyetujui negosiasi" {
			continue
		}
		// if strings.ToLower(logSibela.KeteranganNegosiasi.String) == "terima"

		switch strings.ToLower(logSibela.KeteranganNegosiasi.String) {
		case "pp menyetujui negosiasi":
			continue
		case "terima":
			trxnegohargamodel.UpdatePersetujuan(kodeDetailPermintaan)
		default:

			var hargaNego pgtype.Int8
			if !logSibela.Negosiasi.Valid {
				hargaNego = hargaSatuan
			} else {
				hargaNego = logSibela.Negosiasi
			}

			if count > 0 && (count%2) == 0 {
				tahapan.Int32++
			}

			trxNegoHarga := trxnegohargamodel.TrxNegoHarga{
				KodeDetailPermintaan: kodeDetailPermintaan,
				HargaAwal:            hargaSatuan,
				HargaNego:            hargaNego,
				Negotiator:           logSibela.Role,
				TglNego:              logSibela.CreatedAt,
				Tahapan:              tahapan,
			}

			trxnegohargamodel.InsertNewData(trxNegoHarga)

			count++
		}

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
