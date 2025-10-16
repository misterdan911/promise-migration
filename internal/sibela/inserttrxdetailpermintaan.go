package sibela

import (
	"promise-migration/internal/sibela/structs"
	"promise-migration/internal/model/promise_sibela/tblpaketplonionmodel"
	"promise-migration/internal/model/promise_sibela/tblpesananplmodel"
	"github.com/jackc/pgx/v5/pgtype"
)

func InsertTrxDetailPermintaan(kodePermintaan pgtype.Int4, tblPaketPl tblpaketplonionmodel.TblPaketPlOnion) {

	var tblPesanan structs.TblPesanan

	if tblPaketPl.JenisPenyedia.String == "luar_dpt" {
		tblPesanan = tblpesananplmodel.GetDataByIdPaket(tblPaketPl.IdPaket)
	} else if tblPaketPl.JenisPenyedia.String == "dpt" {
		tblPesanan = tblpesanandptplmodel.GetDataByIdPaket(tblPaketPl.IdPaket)
	}
}
