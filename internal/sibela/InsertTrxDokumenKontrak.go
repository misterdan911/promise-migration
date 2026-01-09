package sibela

import (
	"fmt"
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

	var strFileNameAja string
	var strEncryptAja string

	helperDokumen := helperdokumenmodel.GetByOriginalPath(tblSuratPesanan.SuratpesananFile)

	if (helperDokumen == helperdokumenmodel.HelperDokumen{}) {
		strFileNameAja = tblSuratPesanan.SuratpesananFile.String
		strEncryptAja = "NO ENCRYPT"
	} else {
		strFileNameAja = helperDokumen.Newfilename.String
		strEncryptAja = helperDokumen.EncryptKey.String
	}

	strFileNameGabungEncrypt := strFileNameAja + "|" + strEncryptAja

	// if tblSuratPesanan.SuratpesananFile.String == "" {
	// 	// helperDokumen.Newfilename.Valid = true
	// 	// helperDokumen.Newfilename.String = "KOSONG DARI AWAL"
	// 	// helperDokumen.EncryptKey.Valid = true
	// 	// helperDokumen.EncryptKey.String = "NO ENCRYPT"

	// 	strFileNameAja = "KOSONG DARI AWAL"
	// 	strEncryptAja = "NO ENCRYPT"
	// }


	// var strFileNameGabungEncrypt string 

	// if (helperDokumen == helperdokumenmodel.HelperDokumen{}) {
	// 	strFileNameAja = "" 
	// 	strFileNameGabungEncrypt = ""
	// } else {
	// 	strFileNameGabungEncrypt = strFileNameAja + "|" + strEncryptAja
	// }

	fileNameAja := pgtype.Text{Valid: true, String: strFileNameAja}
	encryptAja := pgtype.Text{Valid: true, String: strEncryptAja}
	fileNameGabungEncrypt := pgtype.Text{Valid: true, String: strFileNameGabungEncrypt}


	

	// Bikin transaksi si Esign
	// -------------------------------------------------------------
	trxPenandatangan := trxpenandatanganmodel.TrxPenandatangan{
		NamaAplikasi: gAppName,
		NomorSurat: tblSuratPesanan.NomorpesananSp,
		JenisSurat: pgtype.Text{Valid: true, String: "Surat Pesanan"},
		KeteranganSurat: pgtype.Text{Valid: true, String: "-"},
		PathDokumen: fileNameAja,
		PathDokumenSelesai: fileNameAja,
		TglSelesai: pgtype.Timestamp(tblSuratPesanan.TanggalSp),
	}
	trxPenandatangan = trxpenandatanganmodel.InsertNew(trxPenandatangan)

	allSignatureSP := tblsignaturemodel.GetAllSignatureSP(tblPaket.IdPaket, tblPaket.JenisPenyedia)

	for _, signatureSP := range allSignatureSP {

		fmt.Printf("signatureSP.IdUser: %d\n", signatureSP.IdUser.Int32)

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
		PathDokumen:    fileNameGabungEncrypt,
		PathDokumenSelesai:    fileNameAja,
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

	fmt.Printf("tblPaket.JenisPenyedia.String: %v\n" , tblPaket.JenisPenyedia.String)
	fmt.Printf("tblSuratPesanan.IDSuratpesananPl: %d\n" , tblSuratPesanan.IDSuratpesananPl.Int32)
	fmt.Println("tblSuratPesanan.SuratpesananFile: " , tblSuratPesanan.SuratpesananFile.String)
	fmt.Printf("helperDokumen.KodeHelper: %d\n", helperDokumen.KodeHelper.Int32)

	refDokDetailTransaksi := refdokdetailtransaksimodel.RefDokDetailTransaksi{
		KodeTransaksi: trxDokumenKontrak.KodeDokumenKontrak, 
		NamaDokumen: fileNameAja,
		KeyyDok: encryptAja,
		KeteranganDok: pgtype.Text{Valid: true, String: "Dokumen Kontrak"},
		KategoriTransaksi: pgtype.Text{Valid: true, String: "dokumen_kontrak"},
	}
	refdokdetailtransaksimodel.InsertNew(refDokDetailTransaksi)

	return nil
}
