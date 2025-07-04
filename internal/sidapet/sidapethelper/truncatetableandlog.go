package sidapethelper

import (
	"promise-migration/internal/g"
	"promise-migration/internal/ghelper"
	"promise-migration/internal/model/dbsidapet/refvendormodel"
	"promise-migration/internal/model/dbsidapet/refvendorregistermodel"
	"promise-migration/internal/sidapet/model/sidapet/trxpenjaringanmodel"
	"slices"
)

func TruncateTableAndLog() {

	// cek email user di tabel ref_user_register dengan daftar email yg di exclude
	// kalau email terdaftar di exclude, jangan lakukan apa2
	// kalau tidak terdaftar, hapus data di ref_vendor sehingga akan mentrigger FK ON DELETE CASCADE yang akan menghapus data di tabel lain yang berhungan dg ref_vendor
	allRefVendorRegister := refvendorregistermodel.GetAllData()

	for _, refVendorRegister := range allRefVendorRegister {
		skipUser := slices.Contains(g.ExcludedEmails, refVendorRegister.Email.String)
		if skipUser {
			continue
		} else {
			refvendormodel.DeleteByKodeVendor(refVendorRegister.KodeVendor)
		}
	}

	// Hapus semua data di tabel db_sidapet.trx_penjaringan kecuali yg ucr nya terdaftar di daftar email excluded
	allTrxPenjaringan := trxpenjaringanmodel.GetAllData()

	for _, trxPenjaringan := range allTrxPenjaringan {
		skipUser := slices.Contains(g.ExcludedEmails, trxPenjaringan.Ucr.String)
		if skipUser {
			continue
		} else {
			trxpenjaringanmodel.DeleteByKodePenjaringan(trxPenjaringan.KodePenjaringan)
		}
	}

	trxpenjaringanmodel.DeleteWhereUcrNull()

	UpdatePkSequenceFromFile()

	/*
	  TruncateTable("ref_vendor")
	  TruncateTable("ref_vendor_register")
	  TruncateTable("ref_vendor_reg_history")
	  TruncateTable("ref_datadiri_umum")
	  TruncateTable("ref_administrasi_pero")
	  TruncateTable("ref_personalia_pero")
	  TruncateTable("ref_pengalaman_pero")
	  TruncateTable("ref_sertif_pero")
	  TruncateTable("ref_keuangan_pero")
	  TruncateTable("ref_adm_bu")
	  TruncateTable("ref_lan_hukum_bu")
	  TruncateTable("ref_pengurus_bu")
	  TruncateTable("ref_komisaris_bu")
	  TruncateTable("ref_direksi_bu")
	  TruncateTable("ref_izin_usaha_bu")
	  TruncateTable("ref_sertifikat_usaha_bu")
	  TruncateTable("ref_saham_bu")
	  TruncateTable("ref_data_pajak_bu")
	  TruncateTable("ref_tenaga_ahli_bu")
	  TruncateTable("ref_pengalaman_ta")
	  TruncateTable("ref_sertif_ta")
	  TruncateTable("ref_tenaga_pendukung_bu")
	  TruncateTable("ref_pengalaman_tp")
	  TruncateTable("ref_sertif_tp")
	  TruncateTable("ref_kantor_bu")
	  TruncateTable("ref_fasilitas_bu")
	  TruncateTable("ref_pengalaman_bu")
	  TruncateTable("ref_keuangan_bu")

	  TruncateTable("trx_kategori")
	  TruncateTable("trx_penjaringan")
	  TruncateTable("trx_verifikator_penjr")
	  TruncateTable("trx_undangan_penjr")

	  TruncateTable("trx_vendor_penjr")
	  TruncateTable("trx_nilai_akhir")
	*/

	// Truncate Log File
	ghelper.TruncateLog("pengalaman_bu.txt")
}
