package sibela

import (
	"promise-migration/internal/model/dbsibela/trxttemodel"
	"promise-migration/internal/model/dbsidapet/helperdokumenmodel"
	"promise-migration/internal/model/promise_sibela/tblpaketplonionmodel"
	"promise-migration/internal/model/promise_sibela/tblundangandptplmodel"
	"promise-migration/internal/model/promise_sibela/tblundanganplmodel"
	"promise-migration/internal/sibela/structs"

	"github.com/jackc/pgx/v5/pgtype"
)

func InsertBeritaAcaraNego(kodePermintaan pgtype.Int4, tblPaket tblpaketplonionmodel.TblPaketPlOnion) error {

	var tblUndangan structs.TblUndanganPl

	switch tblPaket.JenisPenyedia.String {
	case "luar_dpt":
		tblUndangan = tblundanganplmodel.GetDataByIdPaket(tblPaket.IdPaket)
	case "dpt":
		tblUndangan = tblundangandptplmodel.GetDataByIdPaket(tblPaket.IdPaket)
	default:
		return nil
	}

	helperDokumen := helperdokumenmodel.GetByOriginalPath(tblUndangan.BanegoFile)

	var pathDokumen pgtype.Text
	pathDokumen.Valid = true

	if (helperDokumen == helperdokumenmodel.HelperDokumen{}) {
		pathDokumen.String = tblUndangan.BanegoFile.String
	} else {
		pathDokumen.String = helperDokumen.Newfilename.String + "|" + helperDokumen.EncryptKey.String
	}

	trxTte := trxttemodel.TrxTte{
		KodePermintaan: kodePermintaan,
		KategoriTte:    pgtype.Text{Valid: true, String: "ba_negosiasi"},
		PathDokumen:    pathDokumen,
	}

	trxttemodel.InsertTrxTte(trxTte)

	return nil
}
