package siplang

import (
	"fmt"
	"log"
	"strconv"
	"promise-migration/internal/model/dbesign/trxdetailpenandatanganmodel"
	"promise-migration/internal/model/dbesign/trxpenandatanganmodel"
	"promise-migration/internal/model/dbsiplang/refbapemeriksaanmodel"
	"promise-migration/internal/model/dbsiplang/refpermintaanmodel"
	"promise-migration/internal/model/dbsiplang/refproseskontrakmodel"
	"promise-migration/internal/model/dbsiplang/refriwayatpelaksanaanmodel"
	"promise-migration/internal/model/dbsiplang/refsptjmmodel"
	"promise-migration/internal/model/dbsiplang/trxbastmodel"
	"promise-migration/internal/model/dbsiplang/trxkwitansimodel"
	"promise-migration/internal/model/dbsiplang/trxpembayaranmodel"
	"promise-migration/internal/model/dbsiplang/trxriwayatpelaksanaanmodel"
	"promise-migration/internal/model/dbsiplang/trxttemodel"
	"promise-migration/internal/model/promise_siplang/tblbaserahterimadptplmodel"
	"promise-migration/internal/model/promise_siplang/tblbaserahterimaplmodel"
	"promise-migration/internal/model/promise_siplang/tblpaketplonionmodel"
	"promise-migration/internal/model/promise_siplang/tblsignaturemodel"
	"promise-migration/internal/model/promise_siplang/tblsptjmdptmodel"
	"promise-migration/internal/model/promise_siplang/tblsptjmmodel"
	"promise-migration/internal/model/promise_siplang/tblsuratbapdptmodel"
	"promise-migration/internal/model/promise_siplang/tblsuratbapmodel"

	"promise-migration/internal/model/dbsiplang/trxpajakmodel"
	"promise-migration/internal/model/dbsiplang/trxsptjmmodel"
	"promise-migration/internal/model/promise_siplang/tblsptbdptplmodel"
	"promise-migration/internal/model/promise_siplang/tblsptbplmodel"

	"promise-migration/internal/model/dbsidapet/helperdokumenmodel"
	"promise-migration/internal/model/dbsidapet/helperusermodel"
	"promise-migration/internal/siplang/structs"

	"github.com/jackc/pgx/v5/pgtype"
)

type SptjmParam struct {
	TblSptjm      structs.TblSptjm
	RefPermintaan refpermintaanmodel.RefPermintaan
}

type DataTrxEsign struct {
	NomorSurat     pgtype.Text
	JenisSurat     pgtype.Text
	PathDokumen    pgtype.Text
	TglSelesai     pgtype.Timestamp
	JenisSignature pgtype.Text
	TblPaketPl     tblpaketplonionmodel.TblPaketPlOnion
	TblTerminPl    structs.TblTerminPl
}

var lastKodeTrxRiwayatPelaksanaan pgtype.Int4

// var lastTerminPl structs.TblTerminPl

func InsertRefRiwayatPelaksanaan(refPermintaan refpermintaanmodel.RefPermintaan, tblPaketPl tblpaketplonionmodel.TblPaketPlOnion, refProsesKontrak3 refproseskontrakmodel.RefProsesKontrak) error {

	refRiwayatPelaksanaan := refriwayatpelaksanaanmodel.RefRiwayatPelaksanaan{}
	trxRiwayatPelaksanaan := trxriwayatpelaksanaanmodel.TrxRiwayatPelaksanaan{}

	// looping per-termin
	for _, helperRiwayatPelaksanaan := range allHelperRiwayatPelaksanaan {

		// insert ref_riwayat_pelaksanaan
		trxJenisSispembayaran := helperRiwayatPelaksanaan.TrxJenisSispembayaran
		tblTerminPl := helperRiwayatPelaksanaan.TblTerminPl
		var statusRiwayatPelaksanaan pgtype.Text
		statusRiwayatPelaksanaan.Valid = true

		if (tblTerminPl.StatusTerminBast == pgtype.Int4{}) {
			continue
		} else if tblTerminPl.StatusTerminBast.Int32 == 3 {
			statusRiwayatPelaksanaan.String = "selesai"
		}	else {
			statusRiwayatPelaksanaan.String = "proses"
		}



		refRiwayatPelaksanaan = refriwayatpelaksanaanmodel.RefRiwayatPelaksanaan{
			KodeProsesKontrak:         refProsesKontrak3.KodeProsesKontrak,
			KodeTrxJenisSispembayaran: trxJenisSispembayaran.KodeTrxJenisSispembayaran,
			StatusRiwayatPelaksanaan:  statusRiwayatPelaksanaan,
			Ucr:                       refPermintaan.Ucr,
		}
		refRiwayatPelaksanaan = refriwayatpelaksanaanmodel.InsertNew(refRiwayatPelaksanaan)

		//insert trx_riwayat_pelaksanaan (list step tiap termin: step BAP, step BAST, step Kuitansi, dll..)
		var tblSuratBap structs.TblSuratBap
		switch tblPaketPl.JenisPenyedia.String {
		case "luardpt":
			tblSuratBap = tblsuratbapmodel.GetByIdTerminPl(tblTerminPl.IdTerminPl)
		case "dpt":
			tblSuratBap = tblsuratbapdptmodel.GetByIdTerminPl(tblTerminPl.IdTerminPl)
		}
		kodeStepRiwayatPelaksanaan := pgtype.Int4{Valid: true}

		// insert ref_ba_pemeriksaan
		// ---------------------------------------------------------------------------------------------
		statusStep := pgtype.Text{Valid: true, String: "selesai"}
		kodeStepRiwayatPelaksanaan.Int32 = 1 // BAP

		trxRiwayatPelaksanaan = trxriwayatpelaksanaanmodel.TrxRiwayatPelaksanaan{
			KodeRiwayatPelaksanaan:     refRiwayatPelaksanaan.KodeRiwayatPelaksanaan,
			KodeStepRiwayatPelaksanaan: kodeStepRiwayatPelaksanaan,
			StatusStep:                 statusStep,
			Ucr:                        refPermintaan.Ucr,
			Udcr:                       tblSuratBap.TanggalBap,
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

		// Bikin transaksi Esign
		// -------------------------------------------------------------
		trxPenandatangan := trxpenandatanganmodel.TrxPenandatangan{
			NamaAplikasi:       gAppName,
			NomorSurat:         tblSuratBap.NomorBap,
			JenisSurat:         pgtype.Text{Valid: true, String: "Berita Acara Pemeriksaan"},
			KeteranganSurat:    pgtype.Text{Valid: true, String: "-"},
			PathDokumen:        pathDokumen,
			PathDokumenSelesai: pathDokumen,
			TglSelesai:         pgtype.Timestamp(tblSuratBap.TanggalBap),
		}
		trxPenandatangan = trxpenandatanganmodel.InsertNew(trxPenandatangan)

		jenisSignature := pgtype.Text{Valid: true, String: "Berita Acara Pemeriksaan"}
		allSignature := tblsignaturemodel.GetAllSignature(tblPaketPl.IdPaket, tblPaketPl.JenisPenyedia, tblTerminPl.IdTerminPl, jenisSignature)

		// fmt.Printf("Jml Signature BAP: %d", len(allSignature))

		for _, signature := range allSignature {

			// fmt.Printf("signature.IdUser: %d\n", signature.IdUser.Int32)

			userPenandatangan := helperusermodel.GetByVmsUserId(signature.IdUser)
			if (userPenandatangan == helperusermodel.HelperUser{}) {
				// ada id user yg tandatangan, tapi data usernya sudah tidak ada (id_user: 12134, id_profile_penyedia: 981)
				continue
			}

			trxDetailPenandatangan := trxdetailpenandatanganmodel.TrxDetailPenandatangan{
				KodeTrxPenandatangan:       trxPenandatangan.KodeTrxPenandatangan,
				StatusJabatanPenandatangan: userPenandatangan.StatusUser,
				Jabatan:                    userPenandatangan.Jabatan,
				StatusPenandatangan:        pgtype.Text{Valid: true, String: "sudah"},
				TglTte:                     signature.CreatedAt,
				KodePenandatangan:          userPenandatangan.KodePenandatangan,
			}
			trxdetailpenandatanganmodel.InsertNew(trxDetailPenandatangan)

		}
		// -------------------------------------------------------------

		trxTte := trxttemodel.TrxTte{
			KodeTrxPenandatangan: trxPenandatangan.KodeTrxPenandatangan,
			KodePermintaan:       refPermintaan.KodePermintaan,
			KategoriTte:          pgtype.Text{Valid: true, String: "ba_pemeriksaan"},
			PathDokumen:          pathDokumen,
			TglSelesai:           tblSuratBap.TanggalBap,
			NomorSurat:           tblSuratBap.NomorBap,
		}
		trxTte = trxttemodel.InsertNew(trxTte)

		helperUser := helperusermodel.GetByVmsUserId(tblSuratBap.IdPkualitas)

		refBaPemeriksaan := refbapemeriksaanmodel.RefBaPemeriksaan{
			KodeTrxRiwayatPelaksanaan: trxRiwayatPelaksanaan.KodeTrxRiwayatPelaksanaan,
			KodeTte:                   trxTte.KodeTte,
			TanggalBap:                tblSuratBap.TanggalBap,
			DokHasilPekerjaan:         pathDokumen,
			NamaPemeriksa:             helperUser.VmsUserName,
			Ucr:                       refPermintaan.Ucr,
		}
		refbapemeriksaanmodel.InsertNew(refBaPemeriksaan)
		// ---------------------------------------------------------------------------------------------

		// insert trx_bast
		// ---------------------------------------------------------------------------------------------
		var tblBaserahterimaPl structs.TblBaserahterimaPl
		switch tblPaketPl.JenisPenyedia.String {
		case "luardpt":
			tblBaserahterimaPl = tblbaserahterimaplmodel.GetByIdTerminPl(tblTerminPl.IdTerminPl)
		case "dpt":
			tblBaserahterimaPl = tblbaserahterimadptplmodel.GetByIdTerminPl(tblTerminPl.IdTerminPl)
		}

		kodeStepRiwayatPelaksanaan.Int32 = 2 // BAST

		trxRiwayatPelaksanaan = trxriwayatpelaksanaanmodel.TrxRiwayatPelaksanaan{
			KodeRiwayatPelaksanaan:     refRiwayatPelaksanaan.KodeRiwayatPelaksanaan,
			KodeStepRiwayatPelaksanaan: kodeStepRiwayatPelaksanaan,
			StatusStep:                 statusStep,
			Ucr:                        refPermintaan.Ucr,
			Udcr:                       tblBaserahterimaPl.TanggalSt,
		}
		trxRiwayatPelaksanaan = trxriwayatpelaksanaanmodel.InsertNew(trxRiwayatPelaksanaan)

		helperDokumen = helperdokumenmodel.GetByOriginalPath(tblTerminPl.TerminFile)
		pathDokumen.Valid = true
		if (helperDokumen == helperdokumenmodel.HelperDokumen{}) {
			pathDokumen.String = tblTerminPl.TerminFile.String
		} else {
			pathDokumen.String = helperDokumen.Newfilename.String + "|" + helperDokumen.EncryptKey.String
		}

		// Bikin transaksi Esign
		// -------------------------------------------------------------
		trxPenandatangan = trxpenandatanganmodel.TrxPenandatangan{
			NamaAplikasi:       gAppName,
			NomorSurat:         tblBaserahterimaPl.NomorSt,
			JenisSurat:         pgtype.Text{Valid: true, String: "Surat Berita Serah Terima (BAST)"},
			KeteranganSurat:    pgtype.Text{Valid: true, String: "-"},
			PathDokumen:        pathDokumen,
			PathDokumenSelesai: pathDokumen,
			TglSelesai:         pgtype.Timestamp(tblBaserahterimaPl.TanggalSt),
		}
		trxPenandatangan = trxpenandatanganmodel.InsertNew(trxPenandatangan)

		jenisSignature = pgtype.Text{Valid: true, String: "Berita Acara Serah Terima"}
		allSignature = tblsignaturemodel.GetAllSignature(tblPaketPl.IdPaket, tblPaketPl.JenisPenyedia, tblTerminPl.IdTerminPl, jenisSignature)

		for _, signature := range allSignature {

			// fmt.Printf("signature.IdUser: %d\n", signature.IdUser.Int32)

			userPenandatangan := helperusermodel.GetByVmsUserId(signature.IdUser)
			if (userPenandatangan == helperusermodel.HelperUser{}) {
				// ada id user yg tandatangan, tapi data usernya sudah tidak ada (id_user: 12134, id_profile_penyedia: 981)
				continue
			}

			trxDetailPenandatangan := trxdetailpenandatanganmodel.TrxDetailPenandatangan{
				KodeTrxPenandatangan:       trxPenandatangan.KodeTrxPenandatangan,
				StatusJabatanPenandatangan: userPenandatangan.StatusUser,
				Jabatan:                    userPenandatangan.Jabatan,
				StatusPenandatangan:        pgtype.Text{Valid: true, String: "sudah"},
				TglTte:                     signature.CreatedAt,
				KodePenandatangan:          userPenandatangan.KodePenandatangan,
			}
			trxdetailpenandatanganmodel.InsertNew(trxDetailPenandatangan)

		}
		// -------------------------------------------------------------

		trxTte = trxttemodel.TrxTte{
			KodeTrxPenandatangan: trxPenandatangan.KodeTrxPenandatangan,
			KodePermintaan:       refPermintaan.KodePermintaan,
			KategoriTte:          pgtype.Text{Valid: true, String: "ba_serah_terima"},
			PathDokumen:          pathDokumen,
			TglSelesai:           tblTerminPl.TanggalBastTerealisasi,
			NomorSurat:           tblBaserahterimaPl.NomorSt,
		}
		trxTte = trxttemodel.InsertNew(trxTte)

		trxBast := trxbastmodel.TrxBast{
			KodeTrxRiwayatPelaksanaan: trxRiwayatPelaksanaan.KodeTrxRiwayatPelaksanaan,
			KodeTte:                   trxTte.KodeTte,
			Ucr:                       pgtype.Text{Valid: true, String: "-"},
			TglSurat:                  tblBaserahterimaPl.TanggalSt,
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

		// fmt.Println(pathDokumen.String);

		trxRiwayatPelaksanaan.KodeStepRiwayatPelaksanaan.Int32 = 3 // Kuitansi
		trxRiwayatPelaksanaan.Udcr = tblTerminPl.TanggalKwitansi
		trxRiwayatPelaksanaan = trxriwayatpelaksanaanmodel.InsertNew(trxRiwayatPelaksanaan)

		kategoriInput := pgtype.Text{Valid: true, String: "ppk"}

		tglKwitansi := tblTerminPl.TanggalKwitansi
		if !tglKwitansi.Valid {
			tglKwitansi = tblTerminPl.TanggalBastTerealisasi
		}

		trxKwitansi := trxkwitansimodel.TrxKwitansi{
			KodeTrxRiwayatPelaksanaan: trxRiwayatPelaksanaan.KodeTrxRiwayatPelaksanaan,
			NomorKwitansi:             tblTerminPl.NomorKwitansi,
			NamaDokKwitansi:           pathDokumen,
			NamaDokKwitansiSelesai:    pathDokumen,
			KategoriInput:             kategoriInput,
			Ucr:                       refPermintaan.Ucr,
			NamaUploader:              userPPK.VmsUserName,
			TanggalKwitansi:           tglKwitansi,
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
			NomorKwitansi:             tblTerminPl.NomorKwitansi,
			NamaDokKwitansi:           pathDokumen,
			NamaDokKwitansiSelesai:    pathDokumen,
			KategoriInput:             kategoriInput,
			Ucr:                       refPermintaan.Ucr,
			NamaUploader:              gUserVendor.VmsUserName,
			TanggalKwitansi:           tblTerminPl.TanggalKwitansi,
		}
		trxkwitansimodel.InsertNew(trxKwitansi)

		// trx_pajak
		// ------------------------------------------------------------------
		var tblSptbPl structs.TblSptbPl
		namaTabelLama := pgtype.Text{Valid: true, String: ""}
		idSptb := pgtype.Int4{Valid: true, Int32: 0}

		switch tblPaketPl.JenisPenyedia.String {
		case "luardpt":
			tblSptbPl = tblsptbplmodel.GetByIdTerminPl(tblTerminPl.IdTerminPl)
			namaTabelLama.String = "tbl_sptb_pl"
			idSptb = tblSptbPl.IDSptbPl
		case "dpt":
			tblSptbPl = tblsptbdptplmodel.GetByIdTerminPl(tblTerminPl.IdTerminPl)
			namaTabelLama.String = "tbl_sptbdpt_pl"
			idSptb = tblSptbPl.IDSptbPl
		}

		trxRiwayatPelaksanaan.KodeStepRiwayatPelaksanaan.Int32 = 4 // Pajak
		trxRiwayatPelaksanaan.Udcr = tblSptbPl.TertanggalSptb
		trxRiwayatPelaksanaan = trxriwayatpelaksanaanmodel.InsertNew(trxRiwayatPelaksanaan)

		helperDokumen = helperdokumenmodel.GetByOriginalPath(tblSptbPl.FakturPajakFile)
		pathDokumen.Valid = true
		if (helperDokumen == helperdokumenmodel.HelperDokumen{}) {
			pathDokumen.String = tblSptbPl.FakturPajakFile.String
		} else {
			pathDokumen.String = helperDokumen.Newfilename.String + "|" + helperDokumen.EncryptKey.String
		}

		nilaiTransaksi := pgtype.Numeric{}
		if tblSptbPl.NilaiPerhitungan.Valid {
			err := nilaiTransaksi.Scan(tblSptbPl.NilaiPerhitungan.String)
			if err != nil {
				fmt.Println("tblSptbPl.NilaiPerhitungan.String: ", tblSptbPl.NilaiPerhitungan.String)
				log.Fatalf("Error converting to pgtype.Numeric: %v", err)
			}
		}

		// TanggalEfaktur
		// tblSptbPl.TanggalFakturPajak.String
		var tglEfaktur pgtype.Timestamp
		errTglEfaktur := tglEfaktur.Scan("2024-01-15 14:30:00")
		if errTglEfaktur != nil {
			fmt.Printf("ErrTglEfaktur: %v\n", errTglEfaktur)
		} else {
			// fmt.Printf("From string: %v (Valid: %v)\n", tglEfaktur, tglEfaktur.Valid)
		}

		trxPajak := trxpajakmodel.TrxPajak{
			KodeTrxRiwayatPelaksanaan: trxRiwayatPelaksanaan.KodeTrxRiwayatPelaksanaan,
			// KategoriNilaiTransaksi: pgtype.Text{Valid: true, String: "nilai_kontrak"},
			NilaiTransaksi: nilaiTransaksi,
			NamaDokEfaktur: pathDokumen,
			NomorEfaktur:   tblSptbPl.NomorFakturPajak,
			TanggalEfaktur: tglEfaktur,
			NamaTabelLama:  namaTabelLama,
			IdSptb:         idSptb,
		}
		trxpajakmodel.InsertNew(trxPajak)
		// ------------------------------------------------------------------

		// Pencairan - Pembayaran - trx_pembayaran
		// -------------------------------------------------------------------------
		trxRiwayatPelaksanaan.KodeStepRiwayatPelaksanaan.Int32 = 6 // Pencairan
		trxRiwayatPelaksanaan.Udcr = tblTerminPl.TanggalSpp
		trxRiwayatPelaksanaan = trxriwayatpelaksanaanmodel.InsertNew(trxRiwayatPelaksanaan)

		helperDokumen = helperdokumenmodel.GetByOriginalPath(tblTerminPl.SppFile)
		pathDokumen.Valid = true
		if (helperDokumen == helperdokumenmodel.HelperDokumen{}) {
			pathDokumen.String = tblTerminPl.SppFile.String
		} else {
			pathDokumen.String = helperDokumen.Newfilename.String + "|" + helperDokumen.EncryptKey.String
		}


		// Bikin transaksi Esign
		// -------------------------------------------------------------
		trxPenandatangan = trxpenandatanganmodel.TrxPenandatangan{
			NamaAplikasi: gAppName,
			NomorSurat: tblTerminPl.NomorSpp,
			JenisSurat: pgtype.Text{Valid: true, String: "Surat Permintaan Pembayaran"},
			KeteranganSurat: pgtype.Text{Valid: true, String: "-"},
			PathDokumen: pathDokumen,
			PathDokumenSelesai: pathDokumen,
			TglSelesai: pgtype.Timestamp(tblSuratBap.TanggalBap),
		}
		trxPenandatangan = trxpenandatanganmodel.InsertNew(trxPenandatangan)

		jenisSignature = pgtype.Text{Valid: true, String: "Surat Permintaan Pembayaran"}
		allSignature = tblsignaturemodel.GetAllSignature(tblPaketPl.IdPaket, tblPaketPl.JenisPenyedia, tblTerminPl.IdTerminPl, jenisSignature)

		for _, signature := range allSignature {

			userPenandatangan := helperusermodel.GetByVmsUserId(signature.IdUser)
			if (userPenandatangan == helperusermodel.HelperUser{}) {
				// ada id user yg tandatangan, tapi data usernya sudah tidak ada (id_user: 12134, id_profile_penyedia: 981)
				continue
			}

			trxDetailPenandatangan := trxdetailpenandatanganmodel.TrxDetailPenandatangan{
				KodeTrxPenandatangan: trxPenandatangan.KodeTrxPenandatangan,
				StatusJabatanPenandatangan: userPenandatangan.StatusUser,
				Jabatan: userPenandatangan.Jabatan,
				StatusPenandatangan: pgtype.Text{Valid: true, String: "sudah"},
				TglTte: signature.CreatedAt,
				KodePenandatangan: userPenandatangan.KodePenandatangan,
			}
			trxdetailpenandatanganmodel.InsertNew(trxDetailPenandatangan)

		}
		// -------------------------------------------------------------


		trxTte = trxttemodel.TrxTte{
			KodeTrxPenandatangan: trxPenandatangan.KodeTrxPenandatangan,
			KodePermintaan: refPermintaan.KodePermintaan,
			KategoriTte:pgtype.Text{Valid: true, String: "s_pembayaran"},
			PathDokumen: pathDokumen,
			TglSelesai: tblTerminPl.TanggalSpp,
			NomorSurat: tblTerminPl.NomorSpp,
		}
		trxTte = trxttemodel.InsertNew(trxTte)

		/*
		trxPembayaran := trxpembayaranmodel.TrxPembayaran{
			KodeTrxRiwayatPelaksanaan: trxRiwayatPelaksanaan.KodeTrxRiwayatPelaksanaan,
			KodeTte: trxTte.KodeTte,
			TglSuratSpp: tblTerminPl.TanggalSpp,
			NoSuratSpp: tblTerminPl.NomorSpp,			// Surat Permintaan Pembayaran / Surat Pembayaran
			NoSuratSptjb: pgtype.Text{Valid: true, String: "-"},		// Surat Pernyataan Tanggung Jawab Belanja
			NoSuratSrk: pgtype.Text{Valid: true, String: "-"},
			Ucr: refPermintaan.Ucr,
		}
		*/

		// Dapatkan kode_permintaan_pencairan_old -- start
		var kdPermPencOld string
		id_paket := strconv.Itoa(int(tblPaketPl.IdPaket.Int32))
		jenis := tblPaketPl.JenisPenyedia.String
		id_termin := strconv.Itoa(int(tblTerminPl.IdTerminPl.Int32))

		if refPermintaan.Udcr.Time.Year() < 2026 {
			kdPermPencOld = id_paket + "-siplang-" + jenis
		} else {
			kdPermPencOld = id_paket + "-" + id_termin + "-siplang-" + jenis
		}
		// Dapatkan kode_permintaan_pencairan_old -- end


		// Dapatkan kode_kontrak -- start
		kdKontrak := id_termin + "-siplang-" + jenis


		trxPembayaran := trxpembayaranmodel.TrxPembayaran{
			KodeTrxRiwayatPelaksanaan: trxRiwayatPelaksanaan.KodeTrxRiwayatPelaksanaan,
			KodeTte: trxTte.KodeTte,
			TglSuratSpp: tblTerminPl.TanggalSpp,
			NoSuratSpp: tblTerminPl.NomorSpp,			// Surat Permintaan Pembayaran / Surat Pembayaran
			NoSuratSptjb: pgtype.Text{Valid: true, String: "-"},		// Surat Pernyataan Tanggung Jawab Belanja
			NoSuratSrk: pgtype.Text{Valid: true, String: "-"},
			Ucr: refPermintaan.Ucr,
			KodePermintaanPencairanOld: pgtype.Text{Valid: true, String: kdPermPencOld},
			KodeKontrak: pgtype.Text{Valid: true, String: kdKontrak},
		}

		
		trxpembayaranmodel.InsertNew(trxPembayaran)
		// -------------------------------------------------------------------------



	}

	lastIndex := len(allHelperRiwayatPelaksanaan) - 1
	if lastIndex < 0 {
		fmt.Printf("last Index %d -- kode_permintaan: %d Tidak punya data termin\n", lastIndex, refPermintaan.KodePermintaan.Int32)
		return nil
	}

	lastTblTerminPl := allHelperRiwayatPelaksanaan[lastIndex].TblTerminPl

	// insert sptjm
	var tblSptjm structs.TblSptjm

	switch tblPaketPl.JenisPenyedia.String {
	case "luardpt":
		tblSptjm = tblsptjmmodel.GetByIdPaket(tblPaketPl.IdPaket)
	case "dpt":
		tblSptjm = tblsptjmdptmodel.GetByIdPaket(tblPaketPl.IdPaket)
	}

	// Kalau tidak ada sptjm, skip
	if (tblSptjm == structs.TblSptjm{}) {
		return nil
	}

	// kalau belum ada riwayat pelaksanaan, skip
	if (trxRiwayatPelaksanaan == trxriwayatpelaksanaanmodel.TrxRiwayatPelaksanaan{}) {
		return nil
	}

	trxRiwayatPelaksanaan.KodeStepRiwayatPelaksanaan.Int32 = 5 // SPTJM
	trxRiwayatPelaksanaan.Udcr = tblSptjm.TanggalSptjm
	trxRiwayatPelaksanaan = trxriwayatpelaksanaanmodel.InsertNew(trxRiwayatPelaksanaan)

	lastKodeTrxRiwayatPelaksanaan = trxRiwayatPelaksanaan.KodeTrxRiwayatPelaksanaan

	sptjmParam := SptjmParam{
		TblSptjm:      tblSptjm,
		RefPermintaan: refPermintaan,
	}

	InsertSptjm(sptjmParam, tblPaketPl, lastTblTerminPl)

	return nil
}

func InsertSptjm(sptjmParam SptjmParam, tblPaketPl tblpaketplonionmodel.TblPaketPlOnion, lastTblTerminPl structs.TblTerminPl) error {

	tblSptjm := sptjmParam.TblSptjm
	refPermintaan := sptjmParam.RefPermintaan

	if (tblSptjm != structs.TblSptjm{}) {
		refSptjm := refsptjmmodel.RefSptjm{
			KodeTrxRiwayatPelaksanaan: lastKodeTrxRiwayatPelaksanaan,
			NamaBank:                  tblSptjm.JaminanBank,
			NominalJaminan:            tblSptjm.SebesarBank,
			Ucr:                       refPermintaan.Ucr,
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

	dataTrxEsign := DataTrxEsign{
		NomorSurat:     pgtype.Text{},
		JenisSurat:     pgtype.Text{Valid: true, String: "Surat SPTJM"},
		PathDokumen:    pathDokumen,
		TglSelesai:     pgtype.Timestamp(tblSptjm.TanggalSptjm),
		JenisSignature: pgtype.Text{Valid: true, String: "Surat Pernyataan Tanggung Jawab Mutlak"},
		TblPaketPl:     tblPaketPl,
		TblTerminPl:    lastTblTerminPl,
	}
	kodeTrxPenandatangan := BikinTransaksiEsign(dataTrxEsign)

	trxTte := trxttemodel.TrxTte{
		KodeTrxPenandatangan: kodeTrxPenandatangan,
		KodePermintaan:       refPermintaan.KodePermintaan,
		KategoriTte:          pgtype.Text{Valid: true, String: "sptjm"},
		PathDokumen:          pathDokumen,
		TglSelesai:           tblSptjm.TanggalSptjm,
		NomorSurat:           pgtype.Text{Valid: true, String: ""},
	}
	trxTte = trxttemodel.InsertNew(trxTte)

	trxSptjm := trxsptjmmodel.TrxSptjm{
		KodeTrxRiwayatPelaksanaan: lastKodeTrxRiwayatPelaksanaan,
		KodeTte:                   trxTte.KodeTte,
		TglSurat:                  tblSptjm.TanggalSptjm,
		KategoriSurat:             pgtype.Text{Valid: true, String: "sptjm"},
		Ucr:                       refPermintaan.Ucr,
	}
	trxsptjmmodel.InsertNew(trxSptjm)

	// bast_sementara
	helperDokumen = helperdokumenmodel.GetByOriginalPath(tblSptjm.BastsFile)
	if (helperDokumen == helperdokumenmodel.HelperDokumen{}) {
		pathDokumen.String = tblSptjm.BastsFile.String
	} else {
		pathDokumen.String = helperDokumen.Newfilename.String + "|" + helperDokumen.EncryptKey.String
	}

	dataTrxEsign.NomorSurat = tblSptjm.NomorBastSementara
	dataTrxEsign.JenisSurat.String = "Surat Berita Serah Terima Sementara"
	dataTrxEsign.PathDokumen = pathDokumen
	dataTrxEsign.JenisSignature.String = "Berita Acara Serah Terima Sementara"
	kodeTrxPenandatangan = BikinTransaksiEsign(dataTrxEsign)

	trxTte = trxttemodel.TrxTte{
		KodeTrxPenandatangan: kodeTrxPenandatangan,
		KodePermintaan:       refPermintaan.KodePermintaan,
		KategoriTte:          pgtype.Text{Valid: true, String: "bast_sementara"},
		PathDokumen:          pathDokumen,
		TglSelesai:           tblSptjm.TanggalBastSementara,
		NomorSurat:           tblSptjm.NomorBastSementara,
	}
	trxTte = trxttemodel.InsertNew(trxTte)

	trxSptjm = trxsptjmmodel.TrxSptjm{
		KodeTrxRiwayatPelaksanaan: lastKodeTrxRiwayatPelaksanaan,
		KodeTte:                   trxTte.KodeTte,
		TglSurat:                  tblSptjm.TanggalBastSementara,
		KategoriSurat:             pgtype.Text{Valid: true, String: "bast_sementara"},
		Ucr:                       refPermintaan.Ucr,
	}
	trxsptjmmodel.InsertNew(trxSptjm)

	// s_perjanjian_pembayaran
	helperDokumen = helperdokumenmodel.GetByOriginalPath(tblSptjm.SperpemFile)
	if (helperDokumen == helperdokumenmodel.HelperDokumen{}) {
		pathDokumen.String = tblSptjm.SperpemFile.String
	} else {
		pathDokumen.String = helperDokumen.Newfilename.String + "|" + helperDokumen.EncryptKey.String
	}

	dataTrxEsign.NomorSurat = tblSptjm.NomorBastSementara
	dataTrxEsign.JenisSurat.String = "Surat Perjanjian Pembayaran"
	dataTrxEsign.PathDokumen = pathDokumen
	dataTrxEsign.JenisSignature.String = "Surat Permintaan Pembayaran"
	kodeTrxPenandatangan = BikinTransaksiEsign(dataTrxEsign)

	trxTte = trxttemodel.TrxTte{
		KodeTrxPenandatangan: kodeTrxPenandatangan,
		KodePermintaan:       refPermintaan.KodePermintaan,
		KategoriTte:          pgtype.Text{Valid: true, String: "s_perjanjian_pembayaran"},
		PathDokumen:          pathDokumen,
		TglSelesai:           tblSptjm.TanggalBastSementara,
		NomorSurat:           pgtype.Text{Valid: true, String: ""},
	}
	trxTte = trxttemodel.InsertNew(trxTte)

	trxSptjm = trxsptjmmodel.TrxSptjm{
		KodeTrxRiwayatPelaksanaan: lastKodeTrxRiwayatPelaksanaan,
		KodeTte:                   trxTte.KodeTte,
		TglSurat:                  tblSptjm.TanggalBastSementara,
		KategoriSurat:             pgtype.Text{Valid: true, String: "s_perjanjian_pembayaran"},
		Ucr:                       refPermintaan.Ucr,
	}
	trxsptjmmodel.InsertNew(trxSptjm)

	// s_pernyataan_kesanggupan
	helperDokumen = helperdokumenmodel.GetByOriginalPath(tblSptjm.SperkesFilePenyedia)
	if (helperDokumen == helperdokumenmodel.HelperDokumen{}) {
		pathDokumen.String = tblSptjm.SperkesFilePenyedia.String
	} else {
		pathDokumen.String = helperDokumen.Newfilename.String + "|" + helperDokumen.EncryptKey.String
	}

	dataTrxEsign.NomorSurat = tblSptjm.NomorBastSementara
	dataTrxEsign.JenisSurat.String = "Surat Pernyataan Kesanggupan"
	dataTrxEsign.PathDokumen = pathDokumen
	dataTrxEsign.JenisSignature.String = "Surat Pernyataan Kesanggupan"
	kodeTrxPenandatangan = BikinTransaksiEsign(dataTrxEsign)

	trxTte = trxttemodel.TrxTte{
		KodeTrxPenandatangan: kodeTrxPenandatangan,
		KodePermintaan:       refPermintaan.KodePermintaan,
		KategoriTte:          pgtype.Text{Valid: true, String: "s_pernyataan_kesanggupan"},
		PathDokumen:          pathDokumen,
		TglSelesai:           tblSptjm.TanggalBastSementara,
		NomorSurat:           pgtype.Text{Valid: true, String: ""},
	}
	trxTte = trxttemodel.InsertNew(trxTte)

	trxSptjm = trxsptjmmodel.TrxSptjm{
		KodeTrxRiwayatPelaksanaan: lastKodeTrxRiwayatPelaksanaan,
		KodeTte:                   trxTte.KodeTte,
		TglSurat:                  tblSptjm.TanggalBastSementara,
		KategoriSurat:             pgtype.Text{Valid: true, String: "s_pernyataan_kesanggupan"},
		Ucr:                       refPermintaan.Ucr,
	}
	trxsptjmmodel.InsertNew(trxSptjm)

	return nil
}

func BikinTransaksiEsign(dataTrx DataTrxEsign) pgtype.Int4 {

	tblPaketPl := dataTrx.TblPaketPl
	tblTerminPl := dataTrx.TblTerminPl

	// Bikin transaksi si Esign
	// -------------------------------------------------------------
	trxPenandatangan := trxpenandatanganmodel.TrxPenandatangan{
		NamaAplikasi:       gAppName,
		NomorSurat:         dataTrx.NomorSurat,
		JenisSurat:         dataTrx.JenisSurat,
		KeteranganSurat:    pgtype.Text{Valid: true, String: "-"},
		PathDokumen:        dataTrx.PathDokumen,
		PathDokumenSelesai: dataTrx.PathDokumen,
		// TglSelesai: pgtype.Timestamp(tblBaserahterimaPl.TanggalSt),
		TglSelesai: dataTrx.TglSelesai,
	}
	trxPenandatangan = trxpenandatanganmodel.InsertNew(trxPenandatangan)

	// jenisSignature := pgtype.Text{Valid: true, String: "Berita Acara Serah Terima"}
	allSignature := tblsignaturemodel.GetAllSignatureSptjm(tblPaketPl.IdPaket, tblPaketPl.JenisPenyedia, tblTerminPl.IdTerminPl, dataTrx.JenisSignature)

	for _, signature := range allSignature {

		// fmt.Printf("signatureSptjm.IdUser: %d\n", signature.IdUser.Int32)

		userPenandatangan := helperusermodel.GetByVmsUserId(signature.IdUser)

		if (userPenandatangan == helperusermodel.HelperUser{}) {
			// ada id user yg tandatangan, tapi data usernya sudah tidak ada (id_user: 12134, id_profile_penyedia: 981)
			continue
		}

		trxDetailPenandatangan := trxdetailpenandatanganmodel.TrxDetailPenandatangan{
			KodeTrxPenandatangan:       trxPenandatangan.KodeTrxPenandatangan,
			StatusJabatanPenandatangan: userPenandatangan.StatusUser,
			Jabatan:                    userPenandatangan.Jabatan,
			StatusPenandatangan:        pgtype.Text{Valid: true, String: "sudah"},
			TglTte:                     signature.CreatedAt,
			KodePenandatangan:          userPenandatangan.KodePenandatangan,
		}
		trxdetailpenandatanganmodel.InsertNew(trxDetailPenandatangan)

	}
	// -------------------------------------------------------------

	return trxPenandatangan.KodeTrxPenandatangan
}
