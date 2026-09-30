package siqut

import (
	"promise-migration/internal/model/dbsiqut/trxchatpenjelasanmodel"
	"promise-migration/internal/model/dbsiqut/trxpemberianpenjelasanmodel"
	"promise-migration/internal/model/promise_siqut/tblsiqutberipenjelasanmodel"

	"github.com/jackc/pgx/v5/pgtype"
)

func MigrateTblSiqutBeriPenjelasan(idSiqutDpp pgtype.Int4, kodePersiapanPemilihan pgtype.Int4) {
	allTblSBP := tblsiqutberipenjelasanmodel.GetAllPenjelasanPerPaket(idSiqutDpp)

	// loopCount := 1
	// var kodePenjelasan pgtype.Int4

	var trxPemberianPenjelasan trxpemberianpenjelasanmodel.TrxPemberianPenjelasan

	for _, tblSBP := range allTblSBP {
		if tblSBP.KomenPenjelasan.Int32 == 999999 {
			trxPemberianPenjelasan := trxpemberianpenjelasanmodel.TrxPemberianPenjelasan{
				KodePersiapanPemilihan: kodePersiapanPemilihan,
				IsiPenjelasan: tblSBP.Penjelasan,
			}
			trxPemberianPenjelasan = trxpemberianpenjelasanmodel.InsertNew(trxPemberianPenjelasan)

			break
		}
	}

	for _, tblSBP := range allTblSBP { 
		if tblSBP.KomenPenjelasan.Int32 == 999999 {
				continue 
		}

		var kodePenjelasan pgtype.Int4
		var kodeVendor pgtype.Int4
		var tanya pgtype.Text
		var jawab pgtype.Text
		var udcr pgtype.Timestamp
		var udch pgtype.Timestamp
		var isReplied pgtype.Bool

		if tblSBP.KomenPenjelasan.Int32 == 0 { // cari pertanyaan
			kodePenjelasan = trxPemberianPenjelasan.KodePenjelasan
			tanya = tblSBP.Penjelasan
			udcr = tblSBP.CreatedAt

			idSiqutBeriPenjelasan := tblSBP.IdSiqutBeriPenjelasan
			
			// cari jawabanya
			for _, tblSBP2 := range allTblSBP {
				if tblSBP2.KomenPenjelasan == idSiqutBeriPenjelasan {
					jawab = tblSBP2.Penjelasan
					udch = tblSBP.CreatedAt
					isReplied.Valid = true
					isReplied.Bool = true
					break
				}
			}

			trxChatPenjelasan := trxchatpenjelasanmodel.TrxChatPenjelasan{
				KodePenjelasan: kodePenjelasan,
				KodeVendor: kodeVendor,
				Tanya: tanya,
				Jawab: jawab,
				Udcr: udcr,
				Udch: udch,
				TanggalJawab: udch,
				IsReplied: isReplied,
			}

			trxchatpenjelasanmodel.InsertNew(trxChatPenjelasan)
			
		}
	}

}

