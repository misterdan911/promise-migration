package sibela

import (
	"fmt"
	"promise-migration/internal/model/dbsibela/refpermintaanmodel"
	"promise-migration/internal/model/dbsibela/refproseskontrakmodel"
	"promise-migration/internal/model/dbsibela/refriwayatpelaksanaanmodel"
	"promise-migration/internal/model/dbsibela/refbapemeriksaanmodel"
	"promise-migration/internal/model/dbsibela/trxriwayatpelaksanaanmodel"
	"promise-migration/internal/model/dbsibela/trxbastmodel"
	"promise-migration/internal/model/dbsibela/trxkwitansimodel"
	"promise-migration/internal/model/dbsibela/trxttemodel"
	"promise-migration/internal/model/dbsibela/refsptjmmodel"
	"promise-migration/internal/model/dbsibela/trxsptjmmodel"
	"promise-migration/internal/model/promise_sibela/tblbaserahterimaplmodel"
	"promise-migration/internal/model/promise_sibela/tblbaserahterimadptplmodel"
	"promise-migration/internal/model/promise_sibela/tblpaketplonionmodel"
	"promise-migration/internal/model/promise_sibela/tblsuratbapmodel"
	"promise-migration/internal/model/promise_sibela/tblsuratbapdptmodel"
	"promise-migration/internal/model/promise_sibela/tblsptjmmodel"
	"promise-migration/internal/model/promise_sibela/tblsptjmdptmodel"
	"promise-migration/internal/model/dbsidapet/helperdokumenmodel"
	"promise-migration/internal/model/dbsidapet/helperusermodel"
	"promise-migration/internal/sibela/structs"

	"github.com/jackc/pgx/v5/pgtype"
)

type SptjmParam struct {
	TblSptjm structs.TblSptjm
	RefPermintaan refpermintaanmodel.RefPermintaan
}

var lastKodeTrxRiwayatPelaksanaan pgtype.Int4

func InsertRefRiwayatPelaksanaan(refPermintaan refpermintaanmodel.RefPermintaan, tblPaketPl tblpaketplonionmodel.TblPaketPlOnion, refProsesKontrak3 refproseskontrakmodel.RefProsesKontrak) error {

	// looping per-termin
	for _, helperRiwayatPelaksanaan:= range allHelperRiwayatPelaksanaan {

		// insert ref_riwayat_pelaksanaan
		trxJenisSispembayaran := helperRiwayatPelaksanaan.TrxJenisSispembayaran
		tblTerminPl := helperRiwayatPelaksanaan.TblTerminPl
		var statusRiwayatPelaksanaan pgtype.Text
		statusRiwayatPelaksanaan.Valid = true

		if tblTerminPl.StatusTerminBast.Int32 == 3 {
			statusRiwayatPelaksanaan.String = "selesai"
		}	else {
			statusRiwayatPelaksanaan.String = "proses"
		}

		refRiwayatPelaksanaan := refriwayatpelaksanaanmodel.RefRiwayatPelaksanaan{
			KodeProsesKontrak: refProsesKontrak3.KodeProsesKontrak,
			KodeTrxJenisSispembayaran: trxJenisSispembayaran.KodeTrxJenisSispembayaran,
			StatusRiwayatPelaksanaan: statusRiwayatPelaksanaan,
			Ucr: refPermintaan.Ucr,
		}
		refRiwayatPelaksanaan = refriwayatpelaksanaanmodel.InsertNew(refRiwayatPelaksanaan)

		//insert trx_riwayat_pelaksanaan (list step tiap termin: step BAP, step BAST, step Kuitansi, dll..)
		var tblSuratBap structs.TblSuratBap
		switch tblPaketPl.JenisPenyedia.String {
		case "luar_dpt":
			tblSuratBap = tblsuratbapmodel.GetByIdTerminPl(tblTerminPl.IdTerminPl)
		case "dpt":
			tblSuratBap = tblsuratbapdptmodel.GetByIdTerminPl(tblTerminPl.IdTerminPl)
		}
		kodeStepRiwayatPelaksanaan := pgtype.Int4{Valid: true}

		// insert ref_ba_pemeriksaan
		// ---------------------------------------------------------------------------------------------
		statusStep := pgtype.Text{Valid: true, String: "selesai"}
		kodeStepRiwayatPelaksanaan.Int32 = 1 // BAP

		trxRiwayatPelaksanaan := trxriwayatpelaksanaanmodel.TrxRiwayatPelaksanaan{
			KodeRiwayatPelaksanaan: refRiwayatPelaksanaan.KodeRiwayatPelaksanaan,
			KodeStepRiwayatPelaksanaan: kodeStepRiwayatPelaksanaan,
			StatusStep: statusStep,
			Ucr: refPermintaan.Ucr,
			Udcr: tblSuratBap.TanggalBap,
		}
		trxRiwayatPelaksanaan = trxriwayatpelaksanaanmodel.InsertNew(trxRiwayatPelaksanaan)

		helperDokumen := helperdokumenmodel.GetByOriginalPath(tblSuratBap.BapFile)
		var pathDokumen pgtype.Text
		pathDokumen.Valid = true
		if (helperDokumen == helperdokumenmodel.HelperDokumen{}) {
			pathDokumen.String = tblSuratBap.BapFile.String
		} else {
			pathDokumen.String = helperDokumen.Newfilename.String + "|" + helperDokumen.EncryptKey.String
		}

		trxTte := trxttemodel.TrxTte{
			KodePermintaan: refPermintaan.KodePermintaan,
			KategoriTte:pgtype.Text{Valid: true, String: "ba_pemeriksaan"},
			PathDokumen: pathDokumen,
			TglSelesai: tblSuratBap.TanggalBap,
			NomorSurat: tblSuratBap.NomorBap,
		}
		trxTte = trxttemodel.InsertNew(trxTte)

		helperUser := helperusermodel.GetByVmsUserId(tblSuratBap.IdPkualitas)

		refBaPemeriksaan := refbapemeriksaanmodel.RefBaPemeriksaan{
			KodeTrxRiwayatPelaksanaan: trxRiwayatPelaksanaan.KodeTrxRiwayatPelaksanaan,
			KodeTte: trxTte.KodeTte,
			TanggalBap: tblSuratBap.TanggalBap,
			DokHasilPekerjaan: pathDokumen, 
			NamaPemeriksa: helperUser.VmsUserName,
			Ucr: refPermintaan.Ucr,
		}
		refbapemeriksaanmodel.InsertNew(refBaPemeriksaan)
		// ---------------------------------------------------------------------------------------------


		// insert trx_bast
		// ---------------------------------------------------------------------------------------------
		var tblBaserahterimaPl structs.TblBaserahterimaPl
		switch tblPaketPl.JenisPenyedia.String {
		case "luar_dpt":
			tblBaserahterimaPl = tblbaserahterimaplmodel.GetByIdTerminPl(tblTerminPl.IdTerminPl)
		case "dpt":
			tblBaserahterimaPl = tblbaserahterimadptplmodel.GetByIdTerminPl(tblTerminPl.IdTerminPl)
		}

		kodeStepRiwayatPelaksanaan.Int32 = 2 // BAST

		trxRiwayatPelaksanaan = trxriwayatpelaksanaanmodel.TrxRiwayatPelaksanaan{
			KodeRiwayatPelaksanaan: refRiwayatPelaksanaan.KodeRiwayatPelaksanaan,
			KodeStepRiwayatPelaksanaan: kodeStepRiwayatPelaksanaan,
			StatusStep: statusStep,
			Ucr: refPermintaan.Ucr,
			Udcr: tblBaserahterimaPl.TanggalSt,
		}
		trxRiwayatPelaksanaan = trxriwayatpelaksanaanmodel.InsertNew(trxRiwayatPelaksanaan)

		helperDokumen = helperdokumenmodel.GetByOriginalPath(tblTerminPl.TerminFile)
		pathDokumen.Valid = true
		if (helperDokumen == helperdokumenmodel.HelperDokumen{}) {
			pathDokumen.String = tblTerminPl.TerminFile.String
		} else {
			pathDokumen.String = helperDokumen.Newfilename.String + "|" + helperDokumen.EncryptKey.String
		}

		trxTte = trxttemodel.TrxTte{
			KodePermintaan: refPermintaan.KodePermintaan,
			KategoriTte:pgtype.Text{Valid: true, String: "ba_serah_terima"},
			PathDokumen: pathDokumen,
			TglSelesai: tblTerminPl.TanggalBastTerealisasi,
			NomorSurat: tblBaserahterimaPl.NomorSt,
		}
		trxTte = trxttemodel.InsertNew(trxTte)

		trxBast := trxbastmodel.TrxBast{
			KodeTrxRiwayatPelaksanaan: trxRiwayatPelaksanaan.KodeTrxRiwayatPelaksanaan,
			KodeTte: trxTte.KodeTte,
			Ucr: pgtype.Text{Valid: true, String: "-"},
			TglSurat: tblBaserahterimaPl.TanggalSt,
		}
		trxbastmodel.InsertNew(trxBast)
		// ---------------------------------------------------------------------------------------------

		// insert trx_kwitansi
		// ---------------------------------------------------------------------------------------------
		helperDokumen = helperdokumenmodel.GetByOriginalPath(tblTerminPl.PathKwitansiPpk)
		pathDokumen.Valid = true
		if (helperDokumen == helperdokumenmodel.HelperDokumen{}) {
			pathDokumen.String = tblTerminPl.PathKwitansiPpk.String
		} else {
			pathDokumen.String = helperDokumen.Newfilename.String + "|" + helperDokumen.EncryptKey.String
		}

		fmt.Println(pathDokumen.String);

		kategoriInput := pgtype.Text{Valid: true, String: "ppk"}

		trxKwitansi := trxkwitansimodel.TrxKwitansi{
			KodeTrxRiwayatPelaksanaan: trxRiwayatPelaksanaan.KodeTrxRiwayatPelaksanaan,
			NomorKwitansi: tblTerminPl.NomorKwitansi,
			NamaDokKwitansi: pathDokumen,
			NamaDokKwitansiSelesai: pathDokumen,
			KategoriInput: kategoriInput,
			Ucr: refPermintaan.Ucr,
			NamaUploader: userPPK.VmsUserName,
			TanggalKwitansi: tblTerminPl.TanggalKwitansi,
		}
		trxkwitansimodel.InsertNew(trxKwitansi)

		kategoriInput = pgtype.Text{Valid: true, String: "penyedia"}

		helperDokumen = helperdokumenmodel.GetByOriginalPath(tblTerminPl.PathKwitansiPenyedia)
		pathDokumen.Valid = true
		if (helperDokumen == helperdokumenmodel.HelperDokumen{}) {
			pathDokumen.String = tblTerminPl.PathKwitansiPenyedia.String
		} else {
			pathDokumen.String = helperDokumen.Newfilename.String + "|" + helperDokumen.EncryptKey.String
		}

		trxKwitansi = trxkwitansimodel.TrxKwitansi{
			KodeTrxRiwayatPelaksanaan: trxRiwayatPelaksanaan.KodeTrxRiwayatPelaksanaan,
			NomorKwitansi: tblTerminPl.NomorKwitansi,
			NamaDokKwitansi: pathDokumen,
			NamaDokKwitansiSelesai: pathDokumen,
			KategoriInput: kategoriInput,
			Ucr: refPermintaan.Ucr,
			NamaUploader: gUserVendor.VmsUserName,
			TanggalKwitansi: tblTerminPl.TanggalKwitansi,
		}
		trxkwitansimodel.InsertNew(trxKwitansi)

		// pajak di skip dulu

		lastKodeTrxRiwayatPelaksanaan = trxRiwayatPelaksanaan.KodeTrxRiwayatPelaksanaan
	}

	// insert sptjm
	var tblSptjm structs.TblSptjm

	switch tblPaketPl.JenisPenyedia.String {
	case "luar_dpt":
		tblSptjm = tblsptjmmodel.GetByIdPaket(tblPaketPl.IdPaket)
	case "dpt":
		tblSptjm = tblsptjmdptmodel.GetByIdPaket(tblPaketPl.IdPaket)
	}
	
	sptjmParam := SptjmParam{
		TblSptjm: tblSptjm,
		RefPermintaan: refPermintaan,
	}

	InsertSptjm(sptjmParam)

	return nil
}


func InsertSptjm(sptjmParam SptjmParam) error {

	tblSptjm := sptjmParam.TblSptjm
	refPermintaan := sptjmParam.RefPermintaan

	if (tblSptjm != structs.TblSptjm{})  {
		refSptjm := refsptjmmodel.RefSptjm {
			KodeTrxRiwayatPelaksanaan: lastKodeTrxRiwayatPelaksanaan,
			NamaBank: tblSptjm.JaminanBank,
			NominalJaminan: tblSptjm.SebesarBank,
			Ucr: refPermintaan.Ucr,
		}
		refsptjmmodel.InsertNew(refSptjm)	
	} else {
		return nil
	}

	// trx_sptjm
	// -----------------------------------------------------------------------
	// sptjm
	var pathDokumen pgtype.Text
	pathDokumen.Valid = true
	helperDokumen := helperdokumenmodel.GetByOriginalPath(tblSptjm.SptjmFile)
	if (helperDokumen == helperdokumenmodel.HelperDokumen{}) {
		pathDokumen.String = tblSptjm.SptjmFile.String
	} else {
		pathDokumen.String = helperDokumen.Newfilename.String + "|" + helperDokumen.EncryptKey.String
	}

	trxTte := trxttemodel.TrxTte{
		KodePermintaan: refPermintaan.KodePermintaan,
		KategoriTte:pgtype.Text{Valid: true, String: "sptjm"},
		PathDokumen: pathDokumen,
		TglSelesai: tblSptjm.TanggalSptjm,
		NomorSurat: pgtype.Text{Valid: true, String: ""},
	}
	trxTte = trxttemodel.InsertNew(trxTte)

	trxSptjm := trxsptjmmodel.TrxSptjm{
		KodeTrxRiwayatPelaksanaan: lastKodeTrxRiwayatPelaksanaan,
		KodeTte: trxTte.KodeTte,
		TglSurat: tblSptjm.TanggalSptjm,
		KategoriSurat:pgtype.Text{Valid: true, String: "sptjm"},
		Ucr: refPermintaan.Ucr,
	}
	trxsptjmmodel.InsertNew(trxSptjm)

	// bast_sementara
	helperDokumen = helperdokumenmodel.GetByOriginalPath(tblSptjm.BastsFile)
	if (helperDokumen == helperdokumenmodel.HelperDokumen{}) {
		pathDokumen.String = tblSptjm.BastsFile.String
	} else {
		pathDokumen.String = helperDokumen.Newfilename.String + "|" + helperDokumen.EncryptKey.String
	}

	trxTte = trxttemodel.TrxTte{
		KodePermintaan: refPermintaan.KodePermintaan,
		KategoriTte:pgtype.Text{Valid: true, String: "bast_sementara"},
		PathDokumen: pathDokumen,
		TglSelesai: tblSptjm.TanggalBastSementara,
		NomorSurat: tblSptjm.NomorBastSementara,
	}
	trxTte = trxttemodel.InsertNew(trxTte)

	trxSptjm = trxsptjmmodel.TrxSptjm{
		KodeTrxRiwayatPelaksanaan: lastKodeTrxRiwayatPelaksanaan,
		KodeTte: trxTte.KodeTte,
		TglSurat: tblSptjm.TanggalBastSementara,
		KategoriSurat:pgtype.Text{Valid: true, String: "bast_sementara"},
		Ucr: refPermintaan.Ucr,
	}
	trxsptjmmodel.InsertNew(trxSptjm)

	// s_perjanjian_pembayaran
	helperDokumen = helperdokumenmodel.GetByOriginalPath(tblSptjm.SperpemFile)
	if (helperDokumen == helperdokumenmodel.HelperDokumen{}) {
		pathDokumen.String = tblSptjm.SperpemFile.String
	} else {
		pathDokumen.String = helperDokumen.Newfilename.String + "|" + helperDokumen.EncryptKey.String
	}

	trxTte = trxttemodel.TrxTte{
		KodePermintaan: refPermintaan.KodePermintaan,
		KategoriTte:pgtype.Text{Valid: true, String: "s_perjanjian_pembayaran"},
		PathDokumen: pathDokumen,
		TglSelesai: tblSptjm.TanggalBastSementara,
		NomorSurat: pgtype.Text{Valid: true, String: ""},
	}
	trxTte = trxttemodel.InsertNew(trxTte)

	trxSptjm = trxsptjmmodel.TrxSptjm{
		KodeTrxRiwayatPelaksanaan: lastKodeTrxRiwayatPelaksanaan,
		KodeTte: trxTte.KodeTte,
		TglSurat: tblSptjm.TanggalBastSementara,
		KategoriSurat:pgtype.Text{Valid: true, String: "s_perjanjian_pembayaran"},
		Ucr: refPermintaan.Ucr,
	}
	trxsptjmmodel.InsertNew(trxSptjm)

	// s_pernyataan_kesanggupan
	helperDokumen = helperdokumenmodel.GetByOriginalPath(tblSptjm.SperkesFilePenyedia)
	if (helperDokumen == helperdokumenmodel.HelperDokumen{}) {
		pathDokumen.String = tblSptjm.SperkesFilePenyedia.String
	} else {
		pathDokumen.String = helperDokumen.Newfilename.String + "|" + helperDokumen.EncryptKey.String
	}

	trxTte = trxttemodel.TrxTte{
		KodePermintaan: refPermintaan.KodePermintaan,
		KategoriTte:pgtype.Text{Valid: true, String: "s_pernyataan_kesanggupan"},
		PathDokumen: pathDokumen,
		TglSelesai: tblSptjm.TanggalBastSementara,
		NomorSurat: pgtype.Text{Valid: true, String: ""},
	}
	trxTte = trxttemodel.InsertNew(trxTte)

	trxSptjm = trxsptjmmodel.TrxSptjm{
		KodeTrxRiwayatPelaksanaan: lastKodeTrxRiwayatPelaksanaan,
		KodeTte: trxTte.KodeTte,
		TglSurat: tblSptjm.TanggalBastSementara,
		KategoriSurat:pgtype.Text{Valid: true, String: "s_pernyataan_kesanggupan"},
		Ucr: refPermintaan.Ucr,
	}
	trxsptjmmodel.InsertNew(trxSptjm)

	return nil
}
