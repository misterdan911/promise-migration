package sibela

import (
	"promise-migration/internal/model/dbsibela/refpermintaanmodel"
	"promise-migration/internal/model/dbsidapet/helperusermodel"
	"promise-migration/internal/model/dbsippan/refrupmodel"
	"promise-migration/internal/model/promise_sibela/logpaketmodel"
	"promise-migration/internal/model/promise_sibela/tblpaketplonionmodel"
	sibelaprofile "promise-migration/internal/model/promise_sibela/tblprofilepenyediamodel"
	"promise-migration/internal/model/promise_sippan/tblruputmodel"
	"promise-migration/internal/model/vmsdb/tblunitsubbarumodel"
	"promise-migration/internal/model/vmsdb/tblunitsubmodel"
	"promise-migration/internal/sibela/sibelahelper"
	"promise-migration/internal/structs"

	"github.com/jackc/pgx/v5/pgtype"
)

func InsertRefPermintaan() {

	// allTblPaketPl := tblpaketplmodel.GetAllData()
	allTblPaketPl := tblpaketplonionmodel.GetAllData()

	for _, tblPaketPl := range allTblPaketPl {

		// dapakan kode_rup
		var kodeRup pgtype.Int4
		kodeRup.Valid = false
		noRup := tblruputmodel.GetNoRupByIdRupUt(tblPaketPl.IdRupUt)
		if noRup.String != "" {
			kodeRup.Valid = true
			kodeRup = refrupmodel.GetKodeRupByNoRup(noRup)
			// fmt.Printf("no_rup: %s -> kode_rup: %d\n", noRup.String, kodeRup.Int32)
		}

		// dapatkan kodeUnit
		var userPPK helperusermodel.HelperUser
		var kodeUnit pgtype.Text

		userPPK = helperusermodel.GetByVmsUserId(tblPaketPl.IdPpk)
		kodeUnit = userPPK.KodeUnit

		// dapatkan kodeVendor
		var profilePenyedia structs.TblProfilePenyedia
		var helperUser helperusermodel.HelperUser
		var kodeVendor pgtype.Int4

		if (tblPaketPl.IdProfilPenyedia != pgtype.Int4{}) {
			profilePenyedia = sibelaprofile.GetPenyediaById(tblPaketPl.IdProfilPenyedia)
			vmsUserId := profilePenyedia.IdUser
			helperUser = helperusermodel.GetByVmsUserId(vmsUserId)
			kodeVendor = helperUser.KodeVendor
		}

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

		// dapatkan nama_unit
		namaUnit := GetNamaUnit(kodeUnit)

		// dapatkan Ucr
		var ucr pgtype.Text
		ucr.Valid = true
		allLogPaket := logpaketmodel.GetByIdPaket(tblPaketPl.IdPaket)
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
		}

		refPermintaan = refpermintaanmodel.InsertNew(refPermintaan)

		// InsertTrxDetailPermintaan(refPermintaan.KodePermintaan, tblPaketPl)
		// InsertTrxNegosiasiTeknis(refPermintaan.KodePermintaan, tblPaketPl)
		// InsertBeritaAcaraNego(refPermintaan.KodePermintaan, tblPaketPl)
		// Berita Acara Hasil Pemilihan belum ada
		InsertRefProsesKontrak(refPermintaan, tblPaketPl)
	}

	sibelahelper.UpdatePkSequence("ref_permintaan", "kode_permintaan")

}

func GetNamaUnit(kodeUnit pgtype.Text) pgtype.Text {
	var namaUnit pgtype.Text

	namaUnit = tblunitsubmodel.GetNamaUnitByKodeUnit(kodeUnit)

	if !namaUnit.Valid {
		namaUnit = tblunitsubbarumodel.GetNamaUnitByKodeUnit(kodeUnit)
	}

	return namaUnit
}
