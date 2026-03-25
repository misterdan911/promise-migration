package usman

import (
	"strings"

	"promise-migration/internal/model/dbusman/helperuserkodeunitmodel"
	"promise-migration/internal/model/dbusman/refunitpbjmodel"
	"promise-migration/internal/model/dbusman/refuserinternalmodel"
	"promise-migration/internal/model/dbusman/refusermodel"
	"promise-migration/internal/model/dbusman/trxusertampungmodel"
	"promise-migration/internal/model/vmsdb/tblpejabatpembeliansubmodel"
	"promise-migration/internal/model/vmsdb/tblppksubmodel"
	"promise-migration/internal/model/vmsdb/usermodel"

	"github.com/jackc/pgx/v5/pgtype"
)

func MigrateUserInternal() {
	allInternalUser := usermodel.GetAllInternalUser()

	for _, internalUser := range allInternalUser {

		internalUserReal := usermodel.GetUserByEmailReal(internalUser.EmailReal)

		var kodeUnit pgtype.Text
		var namaUnit pgtype.Text
		var kodeUnitPbj pgtype.Int4 // untuk di trx_user_tampung
		var nip pgtype.Text

		// Apakah ini user PP
		tblPpSub := tblpejabatpembeliansubmodel.GetPpByIdUser(internalUser.Id)
		if (tblPpSub != tblpejabatpembeliansubmodel.TblPejabatPembelianSub{}) {
			kodeUnit = tblPpSub.KodeUnit
			nip = tblPpSub.Nip
		} else {
			// Apakah ini user PPK
			tblPpkSub := tblppksubmodel.GetPpkSubByIdUser(internalUser.Id)
			if (tblPpkSub != tblppksubmodel.TblPpkSub{}) {
				kodeUnit = tblPpkSub.KodeUnit
				nip = tblPpkSub.Nip
			} else {
				helperUserKodeUnit := helperuserkodeunitmodel.GetByEmail(internalUserReal.EmailReal)
				kodeUnit = helperUserKodeUnit.KodeUnit
				nip = helperUserKodeUnit.Nip
			}
		}

		kodeUnit = ReplaceWithNewKodeUnit(kodeUnit)

		if kodeUnit.Valid {
			refUnitPbj := refunitpbjmodel.GetByKodePbj(kodeUnit)
			kodeUnitPbj = refUnitPbj.KodeUnitPbj
			namaUnit = refUnitPbj.NamaUnit
		}

		if !kodeUnitPbj.Valid {
			continue
		}

		// kalau email dan email_real sama
		if internalUser.Email == internalUser.EmailReal {

			// Mitigasi password supaya cocok dg sistem yg baru
			hashedPassword := internalUser.Password.String
			hashedPassword = strings.Replace(hashedPassword, "$2y$", "$2b$", 1)
			newHashedPass := strings.Replace(hashedPassword, "$2a$", "$2b$", 1)		

			// masukin ke ref_user
			refUser := refusermodel.RefUser{
				Id:         internalUser.Id,
				Email:      internalUser.Email,
				Password:   pgtype.Text{Valid: true, String: newHashedPass},
				Udcr:       internalUser.CreatedAt,
				Udch:       internalUser.UpdatedAt,
				StatusUser: pgtype.Text{Valid: true, String: "internal"},
			}
			// fmt.Printf("IdUser: %d\n", internalUser.Id.Int32)
			refusermodel.InsertNew(refUser)

			// masukin ke ref_user_internal
			refUserInternal := refuserinternalmodel.RefUserInternal{
				IdUser:   internalUser.Id,
				Nip:      nip,
				Username: internalUser.Name,
				Udcr:     internalUser.CreatedAt,
				Udch:     internalUser.UpdatedAt,
			}
			// fmt.Printf("IdUser: %d\n", refUserInternal.IdUser.Int32)
			refuserinternalmodel.InsertNew(refUserInternal)

			// fmt.Printf("\n")
		}

		trxUserTampung := trxusertampungmodel.TrxUserTampung{
			Nama:        internalUserReal.Name,
			Email:       internalUserReal.EmailReal,
			KodeUnitPbj: kodeUnitPbj,
			Nip:         nip,
			KodeJabatan: internalUser.IdLevel,
			StatusAktif: pgtype.Bool{Valid: true, Bool: true},
			KodeUnit:    kodeUnit,
			NamaUnit:    namaUnit,
		}

		trxusertampungmodel.InsertNew(trxUserTampung)
	}
}

func ReplaceWithNewKodeUnit(kodeUnit pgtype.Text) pgtype.Text {
	
	kodeUnit.String = strings.TrimSpace(kodeUnit.String)

	switch kodeUnit.String {
	case "UN31.DSI":
			kodeUnit.String = "UN31.DTD"
	case "UN31.SRUH":
			kodeUnit.String = "UN31.SEKUN"
	case "UN31.PPBI":
			kodeUnit.String = "UN31.PBI"
	case "UN31.LLOP1":
			kodeUnit.String = "UN31.LPPJJ1"
	case "UN31.LLOP2":
			kodeUnit.String = "UN31.LPPJJ2"
	case "UN31.LLOP3":
			kodeUnit.String = "UN31.LPPJJ3"
	case "UN31.LLOP4":
			kodeUnit.String = "UN31.LPPJJ4"
	case "UN31.PSDM":
			kodeUnit.String = "UN31.DSDM"
	case "UN31.DPK":
			kodeUnit.String = "UN31.PKPK"
	case "UN31.LLOP":
			kodeUnit.String = "UN31.LPPJJ"
	}

	return kodeUnit
}
	
