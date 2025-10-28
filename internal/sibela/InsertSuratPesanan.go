package sibela

import (
	"promise-migration/internal/model/dbsibela/trxttemodel"
	"promise-migration/internal/model/dbsidapet/helperdokumenmodel"
	"promise-migration/internal/model/promise_sibela/tblpaketplonionmodel"
	"promise-migration/internal/model/promise_sibela/tblsuratpesanandptplmodel"
	"promise-migration/internal/model/promise_sibela/tblsuratpesananplmodel"
	"promise-migration/internal/sibela/structs"

	"github.com/jackc/pgx/v5/pgtype"
)

func InsertSuratPesanan(kodePermintaan pgtype.Int4, tblPaket tblpaketplonionmodel.TblPaketPlOnion) error {
	var tblSuratPesanan structs.TblSuratpesananPl

	switch tblPaket.JenisPenyedia.String {
	case "luar_dpt":
		tblSuratPesanan = tblsuratpesananplmodel.GetDataByIdPaket(tblPaket.IdPaket)
	case "dpt":
		tblSuratPesanan = tblsuratpesanandptplmodel.GetDataByIdPaket(tblPaket.IdPaket)
	default:
		return nil
	}

	helperDokumen := helperdokumenmodel.GetByOriginalPath(tblSuratPesanan.SuratpesananFile)

	var pathDokumen pgtype.Text
	pathDokumen.Valid = true

	if (helperDokumen == helperdokumenmodel.HelperDokumen{}) {
		pathDokumen.String = tblSuratPesanan.SuratpesananFile.String
	} else {
		pathDokumen.String = helperDokumen.Newfilename.String + "|" + helperDokumen.EncryptKey.String
	}

	trxTte := trxttemodel.TrxTte{
		KodePermintaan: kodePermintaan,
		KategoriTte:    pgtype.Text{Valid: true, String: "surat_pesanan"},
		PathDokumen:    pathDokumen,
	}

	trxttemodel.InsertTrxTte(trxTte)

	return nil

}
