package sidapet

import (
	"promise-migration/internal/model/dbsidapet/trxundanganpenjrmodel"
	"promise-migration/internal/model/vmsdb/tblpaketmodel"
	"promise-migration/internal/model/vmsdb/tblpaketundangmodel"

	"github.com/jackc/pgx/v5/pgtype"
)

func MigrateTblPaketUndang(vmsPaket tblpaketmodel.TblPaket, kodePenjaringan pgtype.Int4) {

	allTblPaketUndang := tblpaketundangmodel.GetByIdPaket(vmsPaket.IdPaket)

	for _, tblPaketUndang := range allTblPaketUndang {
		trxUndanganPenjr := trxundanganpenjrmodel.TrxUndanganPenjr{
			KodePenjaringan: kodePenjaringan,
			Email:           tblPaketUndang.Email,
		}
		trxundanganpenjrmodel.InsertNew(trxUndanganPenjr)
	}
}
