package siplang

import (
	"promise-migration/internal/model/dbsiplang/trxnegoteknismodel"
	"promise-migration/internal/model/promise_siplang/logsiplangmodel"
	"promise-migration/internal/model/promise_siplang/tblpaketplonionmodel"

	"github.com/jackc/pgx/v5/pgtype"
)

func InsertTrxNegosiasiTeknis(kodePermintaan pgtype.Int4, tblPaket tblpaketplonionmodel.TblPaketPlOnion) error {

	// Buat testing
	// if tblPaket.IdPaket.Int32 != 2123 {
	// 	return nil
	// }

	allLogSibela := logsiplangmodel.GetDataNegoTeknis(tblPaket)

	count := 0
	tahapan := pgtype.Int4{
		Valid: true,
		Int32: 0,
	}

	for _, logSibela := range allLogSibela {

		spekAwal := logSibela.NegosiasiTeknis
		if count > 0 {
			spekAwal.String = "-"
		}

		persetujuan := pgtype.Bool{
			Valid: true,
			Bool:  false,
		}

		if logSibela.KeteranganNegosiasiTeknis.String == "Terima" {
			persetujuan.Bool = true
		}

		if count > 0 {
			if count%2 == 0 {
				tahapan.Int32++
			}
		}

		trxNegoTeknis := trxnegoteknismodel.TrxNegoTeknis{
			KodePermintaan: kodePermintaan,
			SpekAwal:       spekAwal,
			SpekNego:       logSibela.NegosiasiTeknis,
			Negotiator:     logSibela.Role,
			TglNego:        logSibela.CreatedAt,
			Tahapan:        tahapan,
			Persetujuan:    persetujuan,
		}

		trxnegoteknismodel.InsertNewData(trxNegoTeknis)
		count++
	}

	return nil
}
