package sibela

import (
	// "fmt"
	"promise-migration/internal/model/dbesign/trxdetailpenandatanganmodel"
	"promise-migration/internal/model/dbesign/trxpenandatanganmodel"
	"promise-migration/internal/model/dbsibela/refdokdetailtransaksimodel"
	"promise-migration/internal/model/dbsibela/refpermintaanmodel"
	"promise-migration/internal/model/dbsibela/refproseskontrakmodel"
	"promise-migration/internal/model/dbsibela/trxdokumenkontrakmodel"
	"promise-migration/internal/model/dbsibela/trxttemodel"
	"promise-migration/internal/model/dbsidapet/helperdokumenmodel"
	"promise-migration/internal/model/dbsidapet/helperusermodel"
	"promise-migration/internal/model/promise_sibela/tblpaketplonionmodel"
	"promise-migration/internal/model/promise_sibela/tblsignaturemodel"
	"promise-migration/internal/model/promise_sibela/tblsuratpesanandptplmodel"
	"promise-migration/internal/model/promise_sibela/tblsuratpesananplmodel"
	"promise-migration/internal/sibela/structs"

	"github.com/jackc/pgx/v5/pgtype"
)

func InsertTrxDokumenKontrak(refPermintaan refpermintaanmodel.RefPermintaan, tblPaket tblpaketplonionmodel.TblPaketPlOnion, refProsesKontrak refproseskontrakmodel.RefProsesKontrak) error {
	var tblSuratPesanan structs.TblSuratpesananPl

	switch tblPaket.JenisPenyedia.String {
	case "luardpt":
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
		helperDokumen.EncryptKey.Valid = true
		helperDokumen.EncryptKey.String = "NO ENCRYPT"
	}

	// Bikin transaksi si Esign
	// -------------------------------------------------------------
	trxPenandatangan := trxpenandatanganmodel.TrxPenandatangan{
		NamaAplikasi: gAppName,
		NomorSurat: tblSuratPesanan.NomorpesananSp,
		JenisSurat: pgtype.Text{Valid: true, String: "Surat Pesanan"},
		KeteranganSurat: pgtype.Text{Valid: true, String: "-"},
		PathDokumen: pathDokumen,
		PathDokumenSelesai: pathDokumen,
		TglSelesai: pgtype.Timestamp(tblSuratPesanan.TanggalSp),
	}
	trxPenandatangan = trxpenandatanganmodel.InsertNew(trxPenandatangan)

	allSignatureSP := tblsignaturemodel.GetAllSignatureSP(tblPaket.IdPaket, tblPaket.JenisPenyedia)

	for _, signatureSP := range allSignatureSP {

		userPenandatangan := helperusermodel.GetByVmsUserId(signatureSP.IdUser)

		trxDetailPenandatangan := trxdetailpenandatanganmodel.TrxDetailPenandatangan{
			KodeTrxPenandatangan: trxPenandatangan.KodeTrxPenandatangan,
			StatusJabatanPenandatangan: userPenandatangan.StatusUser,
			Jabatan: userPenandatangan.Jabatan,
			StatusPenandatangan: pgtype.Text{Valid: true, String: "sudah"},
			TglTte: signatureSP.CreatedAt,
			KodePenandatangan: userPenandatangan.KodePenandatangan,
		}
		trxdetailpenandatanganmodel.InsertNew(trxDetailPenandatangan)

	}
	// -------------------------------------------------------------


	trxTte := trxttemodel.TrxTte{
		KodeTrxPenandatangan: trxPenandatangan.KodeTrxPenandatangan,
		KodePermintaan: refPermintaan.KodePermintaan,
		KategoriTte:    pgtype.Text{Valid: true, String: "surat_pesanan"},
		PathDokumen:    pathDokumen,
	}
	trxttemodel.InsertNew(trxTte)

	trxDokumenKontrak := trxdokumenkontrakmodel.TrxDokumenKontrak{
		KodeProsesKontrak: refProsesKontrak.KodeProsesKontrak,
		TglSurat:          pgtype.Timestamp(tblSuratPesanan.TanggalSp),
		KodeBentukKontrak: pgtype.Int4{Valid: true, Int32: 5},
		NomorSuratPesanan: tblSuratPesanan.NomorpesananSp,
		Ucr:               refPermintaan.Ucr,
	}
	trxDokumenKontrak = trxdokumenkontrakmodel.InsertNew(trxDokumenKontrak)

	refDokDetailTransaksi := refdokdetailtransaksimodel.RefDokDetailTransaksi{
		KodeTransaksi: trxDokumenKontrak.KodeDokumenKontrak, 
		NamaDokumen: pathDokumen,
		KeyyDok: helperDokumen.EncryptKey,
		KeteranganDok: pgtype.Text{Valid: true, String: "Dokumen Kontrak"},
		KategoriTransaksi: pgtype.Text{Valid: true, String: "dokumen_kontrak"},
	}
	refdokdetailtransaksimodel.InsertNew(refDokDetailTransaksi)

	return nil
}
