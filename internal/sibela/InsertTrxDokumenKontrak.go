package sibela

import (
	"promise-migration/internal/model/dbsibela/refpermintaanmodel"
	"promise-migration/internal/model/dbsibela/refproseskontrakmodel"
	"promise-migration/internal/model/dbsibela/trxdokumenkontrakmodel"
	"promise-migration/internal/model/dbsidapet/helperdokumenmodel"
	"promise-migration/internal/model/promise_sibela/tblpaketplonionmodel"
	"promise-migration/internal/model/promise_sibela/tblsuratpesanandptplmodel"
	"promise-migration/internal/model/promise_sibela/tblsuratpesananplmodel"
	"promise-migration/internal/sibela/structs"

	"github.com/jackc/pgx/v5/pgtype"
)

func InsertTrxDokumenKontrak(refPermintaan refpermintaanmodel.RefPermintaan, tblPaket tblpaketplonionmodel.TblPaketPlOnion, refProsesKontrak refproseskontrakmodel.RefProsesKontrak) error {
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

	trxDokumenKontrak := trxdokumenkontrakmodel.TrxDokumenKontrak{
		KodeProsesKontrak: refProsesKontrak.KodeProsesKontrak,
		TglSurat:          pgtype.Timestamp(tblSuratPesanan.TanggalSp),
		KodeBentukKontrak: pgtype.Int4{Valid: true, Int32: 5},
		NomorSuratPesanan: tblSuratPesanan.NomorpesananSp,
		Ucr:               refPermintaan.Ucr,
	}

	trxdokumenkontrakmodel.InsertNew(trxDokumenKontrak)

	/*
		trxTte := trxttemodel.TrxTte{
			KodePermintaan: kodePermintaan,
			KategoriTte:    pgtype.Text{Valid: true, String: "surat_pesanan"},
			PathDokumen:    pathDokumen,
		}

		trxttemodel.InsertNew(trxTte)
	*/

	return nil

}
