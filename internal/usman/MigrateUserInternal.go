package usman

import (
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

		// dapetin kode_unit_pbj dan nip
		var kodeUnit pgtype.Text
		var kodeUnitPbj pgtype.Int4 // untuk di trx_user_tampung
		var nip pgtype.Text

		tblPpSub := tblpejabatpembeliansubmodel.GetPpByIdUser(internalUser.Id)
		if (tblPpSub != tblpejabatpembeliansubmodel.TblPejabatPembelianSub{}) {
			kodeUnit = tblPpSub.KodeUnit
			nip = tblPpSub.Nip
		} else {
			tblPpkSub := tblppksubmodel.GetPpkSubByIdUser(internalUser.Id)
			if (tblPpkSub != tblppksubmodel.TblPpkSub{}) {
				kodeUnit = tblPpkSub.KodeUnit
				nip = tblPpkSub.Nip
			}
		}

		if kodeUnit.Valid {
			refUnitPbj := refunitpbjmodel.GetByKodePbj(kodeUnit)
			kodeUnitPbj = refUnitPbj.KodeUnitPbj
		}

		// kalau email dan email_real sama
		if internalUser.Email == internalUser.EmailReal {
			// masukin ke ref_user
			refUser := refusermodel.RefUser{
				Id:         internalUser.Id,
				Email:      internalUser.Email,
				Password:   internalUser.Password,
				Udcr:       internalUser.CreatedAt,
				Udch:       internalUser.UpdatedAt,
				StatusUser: pgtype.Text{Valid: true, String: "internal"},
			}
			refusermodel.InsertNew(refUser)

			// masukin ke ref_user_internal
			refUserInternal := refuserinternalmodel.RefUserInternal{
				Nip:      nip,
				Username: internalUser.Name,
				Udcr:     internalUser.CreatedAt,
				Udch:     internalUser.UpdatedAt,
			}
			refuserinternalmodel.InsertNew(refUserInternal)
		}

		trxUserTampung := trxusertampungmodel.TrxUserTampung{
			Nama:        internalUser.Name,
			Email:       internalUser.Email,
			KodeUnitPbj: kodeUnitPbj,
			Nip:         nip,
			KodeJabatan: internalUser.IdLevel,
		}

		trxusertampungmodel.InsertNew(trxUserTampung)
	}
}
