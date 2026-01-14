package siplang

import (
	"fmt"
	// "promise-migration/internal/model/dbesign/refpenandatanganmodel"
	"promise-migration/internal/model/dbsidapet/helperusermodel"
	"promise-migration/internal/model/dbsiplang/refpermintaanmodel"
	"promise-migration/internal/model/dbsippan/refrupmodel"
	"promise-migration/internal/model/promise_siplang/logpaketmodel"
	"promise-migration/internal/model/promise_siplang/tblpaketplonionmodel"
	"promise-migration/internal/model/vmsdb/tblppksubmodel"

	// "promise-migration/internal/model/vmsdb/tblpejabatpembeliansubmodel"

	sibelaprofile "promise-migration/internal/model/promise_sibela/tblprofilepenyediamodel"
	vmsdbprofile "promise-migration/internal/model/vmsdb/tblprofilepenyediamodel"

	"promise-migration/internal/model/promise_sippan/tblruputmodel"
	"promise-migration/internal/model/vmsdb/tblunitsubbarumodel"
	"promise-migration/internal/model/vmsdb/tblunitsubmodel"
	"promise-migration/internal/siplang/siplanghelper"
	"promise-migration/internal/structs"

	"github.com/jackc/pgx/v5/pgtype"
)

type UserPP struct {
	KodePenandatangan pgtype.Int4
	Jabatan           pgtype.Text
}

var gTblPaketPl tblpaketplonionmodel.TblPaketPlOnion
var userPPK helperusermodel.HelperUser

// var gUserPP UserPP
var gUserVendor helperusermodel.HelperUser
var gKodeStatusPermintaan pgtype.Int4
var gAppName = pgtype.Text{Valid: true, String: "Si-PLang"}

func InsertRefPermintaan() {

	// reset gUserPP
	// gUserPP = UserPP{}

	// allTblPaketPl := tblpaketplmodel.GetAllData()
	allTblPaketPl := tblpaketplonionmodel.GetAllData()

	for _, tblPaketPl := range allTblPaketPl {

		// quick testing for debug siplang
		// -----------------------------------------------------------------
		// 1041 -> dholy
		// 2320 -> danu

		// if tblPaketPl.IdProfilPenyedia.Int32 != 2320 {
		// 	continue
		// }

		// if tblPaketPl.IdPaket.Int32 == 390 && tblPaketPl.JenisPenyedia.String == "dpt" {

		// } else {
		// 	continue
		// }
		// -----------------------------------------------------------------

		gTblPaketPl = tblPaketPl

		gKodeStatusPermintaan.Valid = true
		gKodeStatusPermintaan.Int32 = 0

		// dapatkan kode_rup
		var kodeRup pgtype.Int4
		kodeRup.Valid = false
		noRup := tblruputmodel.GetNoRupByIdRupUt(tblPaketPl.IdRupUt)
		if noRup.String != "" {
			kodeRup.Valid = true
			kodeRup = refrupmodel.GetKodeRupByNoRup(noRup)
			// fmt.Printf("no_rup: %s -> kode_rup: %d\n", noRup.String, kodeRup.Int32)
		}

		// dapatkan kodeUnit
		var kodeUnit pgtype.Text
		userIdPpk := tblppksubmodel.GetUserIdUserPpkActive(tblPaketPl.IdPpk)
		userPPK = helperusermodel.GetByVmsUserId(userIdPpk)
		kodeUnit = userPPK.KodeUnit

		allLogPaket := logpaketmodel.GetByIdPaket(tblPaketPl.IdPaket)
		if len(allLogPaket) > 0 {
			idUserPp := allLogPaket[0].IdUser
			userPp := helperusermodel.GetByVmsUserId(idUserPp)
			kodeUnit = userPp.KodeUnit
		}

		// dapatkan kodeVendor
		var profilePenyedia structs.TblProfilePenyedia
		var helperUser helperusermodel.HelperUser
		var kodeVendor pgtype.Int4

		if tblPaketPl.IdProfilPenyedia.Valid {

			switch tblPaketPl.JenisPenyedia.String {
			case "luardpt":
				profilePenyedia = sibelaprofile.GetPenyediaById(tblPaketPl.IdProfilPenyedia)
			case "dpt":
				profilePenyedia = vmsdbprofile.GetDataByIdProfile(tblPaketPl.IdProfilPenyedia)
			}

			vmsUserId := profilePenyedia.IdUser
			helperUser = helperusermodel.GetByVmsUserId(vmsUserId)
			gUserVendor = helperUser
			kodeVendor = helperUser.KodeVendor
		}

		// fmt.Printf("tblPaketPl.IdProfilPenyedia: %d\n",  tblPaketPl.IdProfilPenyedia.Int32)
		// fmt.Printf("helperUser.KodeVendor: %d\n",  helperUser.KodeVendor.Int32)

		// dapatkan KodeSkemaPembayaran
		var kodeSkemaPembayaran pgtype.Int4
		kodeSkemaPembayaran.Valid = true

		switch tblPaketPl.IdPembayaran.Int32 {
		case 1:
			kodeSkemaPembayaran.Int32 = 4
		case 2:
			kodeSkemaPembayaran.Int32 = 3
		case 3:
			kodeSkemaPembayaran.Int32 = 2
		case 4:
			kodeSkemaPembayaran.Int32 = 1
		default:
			kodeSkemaPembayaran.Valid = false
		}

		// dapatkan kode_jenis_pengadaan
		var kodeJenisPengadaan pgtype.Int4
		kodeJenisPengadaan.Valid = true

		switch tblPaketPl.IdKriteria.Int32 {
		case 1:
			kodeJenisPengadaan.Int32 = 1
		case 2:
			kodeJenisPengadaan.Int32 = 3
		case 3:
			kodeJenisPengadaan.Int32 = 4
		case 4:
			kodeJenisPengadaan.Int32 = 2
		default:
			kodeJenisPengadaan.Valid = false
		}

		// dapatkan kode_jenis_aset
		var kodeJenisAset pgtype.Text
		kodeJenisAset.Valid = true

		switch tblPaketPl.JenisAset.String {
		case "persediaan", "baranghabispakai":
			kodeJenisAset.String = "11"
		case "asettetap":
			kodeJenisAset.String = "12"
		default:
			kodeJenisAset.Valid = false
		}

		// dapatkan kode_status_permintaan

		// dapatkan nama_unit
		namaUnit := GetNamaUnit(kodeUnit)

		// dapatkan Ucr
		var ucr pgtype.Text
		ucr.Valid = true

		if len(allLogPaket) > 0 {

			if allLogPaket[0].IdUser.Valid {
				userPp := helperusermodel.GetByVmsUserId(allLogPaket[0].IdUser)
				ucr.String = userPp.VmsUserEmailReal.String + "|" + userPp.VmsUserName.String
			} else {
				ucr.String = userPPK.VmsUserEmailReal.String + "|" + userPPK.VmsUserName.String
			}

		} else {
			ucr.String = "-"
		}

		fmt.Printf("Id Paket: %d -------------------- \n", tblPaketPl.IdPaket.Int32)
		// fmt.Println("Nama Paket: ", tblPaketPl.NamaPesanan.String)

		refPermintaan := refpermintaanmodel.RefPermintaan{
			KodeRup:             kodeRup,
			KodeUnit:            kodeUnit,
			JenisPenyedia:       tblPaketPl.JenisPenyedia,
			KodeVendor:          kodeVendor,
			NamaPaket:           tblPaketPl.NamaPesanan,
			KodeSkemaPembayaran: kodeSkemaPembayaran,
			KodeJenisPengadaan:  kodeJenisPengadaan,
			KodeJenisAset:       kodeJenisAset,
			NamaUnit:            namaUnit,
			Ucr:                 ucr,
			Udcr:                tblPaketPl.CreateAt,
		}

		fmt.Printf("tblPaketPl.IdPaket: %d\n", tblPaketPl.IdPaket.Int32)
		fmt.Printf("tblPaketPl.NamaPaket: %v\n", tblPaketPl.NamaPesanan.String)

		refPermintaan = refpermintaanmodel.InsertNew(refPermintaan)

		// fmt.Println("InsertTrxDetailPermintaan")
		InsertTrxDetailPermintaan(refPermintaan.KodePermintaan, tblPaketPl)

		// fmt.Println("InsertTrxNegosiasiTeknis")
		InsertTrxNegosiasiTeknis(refPermintaan.KodePermintaan, tblPaketPl)

		// fmt.Println("InsertBeritaAcaraNego")
		InsertBeritaAcaraNego(refPermintaan.KodePermintaan, tblPaketPl)

		// // Berita Acara Hasil Pemilihan belum ada

		// fmt.Println("InsertRefProsesKontrak")
		InsertRefProsesKontrak(refPermintaan, tblPaketPl)

		refpermintaanmodel.UpdateKodeStatusPermintaan(refPermintaan.KodePermintaan, gKodeStatusPermintaan)
	}

	siplanghelper.UpdatePkSequence("ref_permintaan", "kode_permintaan")

}

func GetNamaUnit(kodeUnit pgtype.Text) pgtype.Text {
	var namaUnit pgtype.Text

	namaUnit = tblunitsubmodel.GetNamaUnitByKodeUnit(kodeUnit)

	if !namaUnit.Valid {
		namaUnit = tblunitsubbarumodel.GetNamaUnitByKodeUnit(kodeUnit)
	}

	return namaUnit
}
