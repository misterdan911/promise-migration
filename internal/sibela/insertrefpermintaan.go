package sibela

import (
	"promise-migration/internal/model/dbsibela/refpermintaanmodel"
	"promise-migration/internal/model/dbsidapet/helperusermodel"
	"promise-migration/internal/model/dbsippan/refrupmodel"
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

		var userPPK helperusermodel.HelperUser
		var kodeUnit pgtype.Text

		// dapatkan kodeUnit
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

		var kodeJenisPengadaan pgtype.Int4
		kodeJenisPengadaan.Valid = true

		if tblPaketPl.IdKriteria.Int32 == 1 {
			kodeJenisPengadaan.Int32 = 1
		} else if tblPaketPl.IdKriteria.Int32 == 2 {
			kodeJenisPengadaan.Int32 = 3
		} else if tblPaketPl.IdKriteria.Int32 == 3 {
			kodeJenisPengadaan.Int32 = 4
		} else if tblPaketPl.IdKriteria.Int32 == 4 {
			kodeJenisPengadaan.Int32 = 2
		} else {
			kodeJenisPengadaan.Valid = false
		}

		// dapatkan kode_jenis_aset
		var kodeJenisAset pgtype.Text
		kodeJenisAset.Valid = true

		if tblPaketPl.JenisAset.String == "persediaan" || tblPaketPl.JenisAset.String == "baranghabispakai" {
			kodeJenisAset.String = "11"
		} else if tblPaketPl.JenisAset.String == "asettetap" {
			kodeJenisAset.String = "12"
		} else {
			kodeJenisAset.Valid = false
		}

		// dapatkan nilai_hps
		/*
			var nilaiHps pgtype.Int4
			nilaiHps.Valid = true
			nilaiHps.Int32 = ghelper.StringToInt32WithDefault(tblPaketPl.Total.String, 0)
		*/

		// dapatkan nama_unit
		namaUnit := GetNamaUnit(kodeUnit)

		refPermintaan := refpermintaanmodel.RefPermintaan{
			KodeRup:             kodeRup,
			KodeUnit:            kodeUnit,
			JenisPenyedia:       tblPaketPl.JenisPenyedia,
			KodeVendor:          kodeVendor,
			NamaPaket:           tblPaketPl.NamaPesanan,
			KodeSkemaPembayaran: tblPaketPl.IdPembayaran,
			KodeJenisPengadaan:  kodeJenisPengadaan,
			KodeJenisAset:       kodeJenisAset,
			// NilaiHps:            nilaiHps,
			NamaUnit: namaUnit,
			// Ucr:                 helperUser.VmsUserEmail,
		}

		refPermintaan = refpermintaanmodel.InsertNew(refPermintaan)

		InsertTrxDetailPermintaan(refPermintaan.KodePermintaan, tblPaketPl)
		// TODO Insert trx_negosiasi_teknis
	}

	sibelahelper.UpdatePkSequence("ref_permintaan", "kode_permintaan")

}

func GetNamaUnit(kodeUnit pgtype.Text) pgtype.Text {
	var namaUnit pgtype.Text

	namaUnit = tblunitsubmodel.GetNamaUnitByKodeUnit(kodeUnit)

	if namaUnit.Valid == false {
		namaUnit = tblunitsubbarumodel.GetNamaUnitByKodeUnit(kodeUnit)
	}

	return namaUnit
}
