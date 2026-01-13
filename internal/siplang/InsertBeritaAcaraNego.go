package siplang

import (
	"promise-migration/internal/model/dbesign/trxdetailpenandatanganmodel"
	"promise-migration/internal/model/dbesign/trxpenandatanganmodel"
	"promise-migration/internal/model/dbsidapet/helperdokumenmodel"
	"promise-migration/internal/model/dbsidapet/helperusermodel"
	"promise-migration/internal/model/dbsiplang/trxttemodel"
	"promise-migration/internal/model/promise_siplang/tblpaketplonionmodel"
	"promise-migration/internal/model/promise_siplang/tblsignaturemodel"
	"promise-migration/internal/model/promise_siplang/tblundangandptplmodel"
	"promise-migration/internal/model/promise_siplang/tblundanganplmodel"
	"promise-migration/internal/sibela/structs"

	"github.com/jackc/pgx/v5/pgtype"
)

func InsertBeritaAcaraNego(kodePermintaan pgtype.Int4, tblPaket tblpaketplonionmodel.TblPaketPlOnion) error {

	var tblUndangan structs.TblUndanganPl

	switch tblPaket.JenisPenyedia.String {
	case "luardpt":
		tblUndangan = tblundanganplmodel.GetDataByIdPaket(tblPaket.IdPaket)
	case "dpt":
		tblUndangan = tblundangandptplmodel.GetDataByIdPaket(tblPaket.IdPaket)
	default:
		return nil
	}

	var strFileNameAja string
	var strEncryptAja string

	helperDokumen := helperdokumenmodel.GetByOriginalPath(tblUndangan.BanegoFile)

	if (helperDokumen == helperdokumenmodel.HelperDokumen{}) {
		strFileNameAja = tblUndangan.BanegoFile.String
		strEncryptAja = "NO ENCRYPT"
	} else {
		strFileNameAja = helperDokumen.Newfilename.String
		strEncryptAja = helperDokumen.EncryptKey.String
	}

	fileNameAja := pgtype.Text{Valid: true, String: strFileNameAja}
	// encryptAja := pgtype.Text{Valid: true, String: strEncryptAja}

	strFileNameGabungEncrypt := strFileNameAja + "|" + strEncryptAja
	fileNameGabungEncrypt := pgtype.Text{Valid: true, String: strFileNameGabungEncrypt}

	var pathDokumen pgtype.Text
	pathDokumen.Valid = true

	// if (helperDokumen == helperdokumenmodel.HelperDokumen{}) {
	// 	pathDokumen.String = tblUndangan.BanegoFile.String
	// } else {
	// 	pathDokumen.String = helperDokumen.Newfilename.String + "|" + helperDokumen.EncryptKey.String
	// }

	// Bikin transaksi Esign
	// -------------------------------------------------------------
	trxPenandatangan := trxpenandatanganmodel.TrxPenandatangan{
		NamaAplikasi:       gAppName,
		NomorSurat:         tblUndangan.NomorPl,
		JenisSurat:         pgtype.Text{Valid: true, String: "Berita Acara Negosiasi"},
		KeteranganSurat:    pgtype.Text{Valid: true, String: "-"},
		PathDokumen:        fileNameAja,
		PathDokumenSelesai: fileNameAja,
		TglSelesai:         pgtype.Timestamp(tblUndangan.TertanggalPl),
	}
	trxPenandatangan = trxpenandatanganmodel.InsertNew(trxPenandatangan)

	jenisSignature := pgtype.Text{Valid: true, String: "Berita Acara Serah Terima"}
	allSignature := tblsignaturemodel.GetAllSignatureSekaliSatuPaket(tblPaket.IdPaket, tblPaket.JenisPenyedia, jenisSignature)

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

	// trxTte := trxttemodel.TrxTte{
	// 	KodePermintaan: kodePermintaan,
	// 	KategoriTte:    pgtype.Text{Valid: true, String: "ba_negosiasi"},
	// 	PathDokumen:    pathDokumen,
	// }

	trxTte := trxttemodel.TrxTte{
		KodeTrxPenandatangan: trxPenandatangan.KodeTrxPenandatangan,
		KodePermintaan:       kodePermintaan,
		KategoriTte:          pgtype.Text{Valid: true, String: "ba_negosiasi"},
		PathDokumen:          fileNameGabungEncrypt,
		PathDokumenSelesai:   fileNameAja,
	}

	trxttemodel.InsertNew(trxTte)

	return nil
}
