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

	// // buat testing
	// if tblPesanan.IDPesanan.Int32 != 31283 {
	// 	return nil
	// }
	// if tblPesanan.IDPaket.Int32 != 2146 {
	// 	return nil
	// }

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
	var hargaNego pgtype.Int8

	for _, logSibela := range allLogSibela {

		if logSibela.Tahap.String == "Update Negosiasi" {
			continue
		}

		switch strings.ToLower(logSibela.KeteranganNegosiasi.String) {
		case "tolak":
			continue
		case "pp menyetujui negosiasi":
			continue
		case "terima":

			trxNegoHarga := trxnegohargamodel.TrxNegoHarga{
				KodeDetailPermintaan: kodeDetailPermintaan,
				HargaAwal:            hargaSatuan,
				HargaNego:            hargaNego,
				Negotiator:           logSibela.Role,
				TglNego:              logSibela.CreatedAt,
				Tahapan:              tahapan,
			}
			trxnegohargamodel.InsertNewData(trxNegoHarga)
			trxnegohargamodel.UpdatePersetujuan(kodeDetailPermintaan)
			count++

		default:

			if !logSibela.Negosiasi.Valid {
				hargaNego = hargaSatuan
			} else {
				hargaNego = logSibela.Negosiasi
			}

			if count > 0 {
				if count%2 == 0 {
					tahapan.Int32++
				}
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
