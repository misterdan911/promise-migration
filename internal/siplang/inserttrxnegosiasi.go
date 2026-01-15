package siplang

import (
	"promise-migration/internal/ghelper"
	"promise-migration/internal/model/dbsiplang/trxnegohargamodel"
	"promise-migration/internal/model/promise_siplang/logsiplangmodel"
	"promise-migration/internal/model/promise_siplang/tblpaketplonionmodel"
	"promise-migration/internal/siplang/structs"
	"strings"

	"github.com/jackc/pgx/v5/pgtype"
)

func InsertNegosiasiHarga(kodeDetailPermintaan pgtype.Int4, tblPaketPl tblpaketplonionmodel.TblPaketPlOnion, tblPesanan structs.TblPesanan) error {

	var hargaAwal pgtype.Int8
	hargaAwal.Valid = true
	hargaAwal.Int64 = ghelper.StringToInt64WithDefault(tblPesanan.HargaSatuan.String, 0)

	var hargaNego pgtype.Int8
	hargaNego.Valid = true
	hargaNego.Int64 = ghelper.StringToInt64WithDefault(tblPesanan.Negosiasi.String, 0)

	// tahap 0
	trxNegoHarga := trxnegohargamodel.TrxNegoHarga{
		KodeDetailPermintaan: kodeDetailPermintaan,
		HargaAwal:            hargaAwal,
		HargaNego:            hargaAwal,
		Negotiator:           pgtype.Text{Valid: true, String: "penyedia"},
		TglNego:              tblPaketPl.CreateAt,
		Tahapan:              pgtype.Int4{Valid: true, Int32: 0},
	}

	trxnegohargamodel.InsertNewData(trxNegoHarga)

	trxNegoHarga = trxnegohargamodel.TrxNegoHarga{
		KodeDetailPermintaan: kodeDetailPermintaan,
		HargaAwal:            hargaAwal,
		HargaNego:            hargaNego,
		Negotiator:           pgtype.Text{Valid: true, String: "pp"},
		TglNego:              tblPaketPl.CreateAt,
		Tahapan:              pgtype.Int4{Valid: true, Int32: 0},
	}

	trxnegohargamodel.InsertNewData(trxNegoHarga)

	// tahap 1
	trxNegoHarga = trxnegohargamodel.TrxNegoHarga{
		KodeDetailPermintaan: kodeDetailPermintaan,
		HargaAwal:            hargaAwal,
		HargaNego:            hargaNego,
		Negotiator:           pgtype.Text{Valid: true, String: "penyedia"},
		TglNego:              tblPaketPl.CreateAt,
		Tahapan:              pgtype.Int4{Valid: true, Int32: 1},
	}

	trxnegohargamodel.InsertNewData(trxNegoHarga)

	trxNegoHarga = trxnegohargamodel.TrxNegoHarga{
		KodeDetailPermintaan: kodeDetailPermintaan,
		HargaAwal:            hargaAwal,
		HargaNego:            hargaNego,
		Negotiator:           pgtype.Text{Valid: true, String: "pp"},
		TglNego:              tblPaketPl.CreateAt,
		Tahapan:              pgtype.Int4{Valid: true, Int32: 1},
	}

	trxnegohargamodel.InsertNewData(trxNegoHarga)

	allLogSibela := logsiplangmodel.GetDataByIdPesanan(tblPesanan.IDPesanan, tblPaketPl)

	for _, logSibela := range allLogSibela {
		if strings.ToLower(logSibela.KeteranganNegosiasi.String) == "terima" {
			trxnegohargamodel.UpdatePersetujuan(kodeDetailPermintaan)
		}
	}

	return nil
}

/*
func InsertNegosiasiHarga_Old(kodeDetailPermintaan pgtype.Int4, tblPaketPl tblpaketplonionmodel.TblPaketPlOnion, tblPesanan structs.TblPesanan) error {

	// // buat testing
	// if tblPesanan.IDPesanan.Int32 != 31283 {
	// 	return nil
	// }
	// if tblPesanan.IDPaket.Int32 != 2146 {
	// 	return nil
	// }

	allLogSibela := logsiplangmodel.GetDataByIdPesanan(tblPesanan.IDPesanan, tblPaketPl)

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

		if logSibela.Tahap.String == "Update Negosiasi" {
			continue
		}

		var hargaNego pgtype.Int8
		hargaNego.Valid = true
		hargaNego.Int64 = ghelper.StringToInt64WithDefault(logSibela.Negosiasi.String, 0)


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
*/

func InsertTrxNegoHarga(kodeDetailPermintaan pgtype.Int4, tblPesanan structs.TblPesanan, logSibela logsiplangmodel.LogSibela) {
	// fmt.Printf("kodeDetailPermintaan: %d \n", kodeDetailPermintaan.Int32)

	var hargaSatuan pgtype.Int8
	var hargaNego pgtype.Int8
	hargaSatuan.Int64 = ghelper.StringToInt64WithDefault(logSibela.HargaSatuan.String, 0)
	hargaNego.Int64 = ghelper.StringToInt64WithDefault(logSibela.Negosiasi.String, 0)


	trxNegoHarga := trxnegohargamodel.TrxNegoHarga{
		KodeDetailPermintaan: kodeDetailPermintaan,
		HargaAwal:            hargaSatuan,
		HargaNego:            hargaNego,
		Negotiator:           logSibela.Role,
		TglNego:              logSibela.CreatedAt,
	}

	trxnegohargamodel.InsertNewData(trxNegoHarga)
}