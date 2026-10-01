package siqut

import (
	"fmt"
	"promise-migration/internal/model/dbsiqut/trxchatpenjelasanmodel"
	"promise-migration/internal/model/dbsiqut/trxpemberianpenjelasanmodel"
	"promise-migration/internal/model/promise_siqut/bridgingvendormodel"
	"promise-migration/internal/model/promise_siqut/tblsiqutberipenjelasanmodel"

	"github.com/jackc/pgx/v5/pgtype"
)

func MigrateTblSiqutBeriPenjelasan(idSiqutDpp pgtype.Int4, kodePersiapanPemilihan pgtype.Int4) {

	allTblSBP := tblsiqutberipenjelasanmodel.GetAllPenjelasanPerPaket(idSiqutDpp)

	var trxPemberianPenjelasan trxpemberianpenjelasanmodel.TrxPemberianPenjelasan
	var kodePenjelasan pgtype.Int4

	isiPenjelsan := pgtype.Text{ Valid: true, String: ""}

	for _, tblSBP := range allTblSBP {
		if tblSBP.KomenPenjelasan.Int32 == 999999 {
			isiPenjelsan.String += tblSBP.Penjelasan.String	+ "\n"
		}
	}

	trxPemberianPenjelasan = trxpemberianpenjelasanmodel.TrxPemberianPenjelasan{
		KodePersiapanPemilihan: kodePersiapanPemilihan,
		IsiPenjelasan: isiPenjelsan,
	}
	trxPemberianPenjelasan = trxpemberianpenjelasanmodel.InsertNew(trxPemberianPenjelasan)

	kodePenjelasan = trxPemberianPenjelasan.KodePenjelasan
	fmt.Printf("kodePenjelasan: %d\n", kodePenjelasan.Int32)
	
	for _, tblSBP2 := range allTblSBP { 
		if tblSBP2.KomenPenjelasan.Int32 == 999999 {
				continue 
		}

		var kodeVendor pgtype.Int4
		var tanya pgtype.Text
		var jawab pgtype.Text
		var udcr pgtype.Timestamp
		var udch pgtype.Timestamp
		isReplied := pgtype.Bool{ Valid: true, Bool: false}

		// Kalau 0 berarti ini adalah pertanyaan
		if tblSBP2.KomenPenjelasan.Int32 == 0 {
			tanya = tblSBP2.Penjelasan
			udcr = tblSBP2.CreatedAt
			idSiqutBeriPenjelasan := tblSBP2.IdSiqutBeriPenjelasan
			kodeVendor = bridgingvendormodel.GetKodeVendorByV1UserId(tblSBP2.IdUser);

			// cari jawabanya
			for _, tblSBP3 := range allTblSBP {
				if tblSBP3.KomenPenjelasan == idSiqutBeriPenjelasan {
					jawab = tblSBP3.Penjelasan
					udch = tblSBP3.CreatedAt
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

	/*
	for _, tblSBP := range allTblSBP {
		if tblSBP.KomenPenjelasan.Int32 == 999999 {
			trxPemberianPenjelasan = trxpemberianpenjelasanmodel.TrxPemberianPenjelasan{
				KodePersiapanPemilihan: kodePersiapanPemilihan,
				IsiPenjelasan: tblSBP.Penjelasan,
			}
			trxPemberianPenjelasan = trxpemberianpenjelasanmodel.InsertNew(trxPemberianPenjelasan)

			kodePenjelasan = trxPemberianPenjelasan.KodePenjelasan
			fmt.Printf("kodePenjelasan: %d\n", kodePenjelasan.Int32)
			
			for _, tblSBP2 := range allTblSBP { 
				if tblSBP2.KomenPenjelasan.Int32 == 999999 {
						continue 
				}

				var kodeVendor pgtype.Int4
				var tanya pgtype.Text
				var jawab pgtype.Text
				var udcr pgtype.Timestamp
				var udch pgtype.Timestamp
				isReplied := pgtype.Bool{ Valid: true, Bool: false}

				// Kalau 0 berarti ini adalah pertanyaan
				if tblSBP2.KomenPenjelasan.Int32 == 0 {
					tanya = tblSBP2.Penjelasan
					udcr = tblSBP2.CreatedAt
					idSiqutBeriPenjelasan := tblSBP2.IdSiqutBeriPenjelasan
					kodeVendor = bridgingvendormodel.GetKodeVendorByV1UserId(tblSBP2.IdUser);

					// cari jawabanya
					for _, tblSBP3 := range allTblSBP {
						if tblSBP3.KomenPenjelasan == idSiqutBeriPenjelasan {
							jawab = tblSBP3.Penjelasan
							udch = tblSBP3.CreatedAt
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

			break
		}
	*/

}

