package helper

func TruncateTableAndLog() {

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

	// Truncate Log File
	TruncateLog("pengalaman_bu.txt")
}
