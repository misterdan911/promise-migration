
-- penting
CREATE INDEX idx_helper_dokumen_original_path ON helper_dokumen (original_path);

-- Create indexes for kode_vendor field
CREATE INDEX idx_ref_adm_bu_kode_vendor ON ref_adm_bu (kode_vendor);
CREATE INDEX idx_ref_administrasi_pero_kode_vendor ON ref_administrasi_pero (kode_vendor);
CREATE INDEX idx_ref_data_pajak_bu_kode_vendor ON ref_data_pajak_bu (kode_vendor);
CREATE INDEX idx_ref_datadiri_kode_vendor ON ref_datadiri (kode_vendor);
CREATE INDEX idx_ref_direksi_bu_kode_vendor ON ref_direksi_bu (kode_vendor);
CREATE INDEX idx_ref_direksi_bu_custom_kode_vendor ON ref_direksi_bu_custom (kode_vendor);
CREATE INDEX idx_ref_fasilitas_bu_kode_vendor ON ref_fasilitas_bu (kode_vendor);
CREATE INDEX idx_ref_fasilitas_bu_custom_kode_vendor ON ref_fasilitas_bu_custom (kode_vendor);
CREATE INDEX idx_ref_history_adm_bu_kode_vendor ON ref_history_adm_bu (kode_vendor);
CREATE INDEX idx_ref_history_administrasi_pero_kode_vendor ON ref_history_administrasi_pero (kode_vendor);
CREATE INDEX idx_ref_history_data_pajak_bu_kode_vendor ON ref_history_data_pajak_bu (kode_vendor);
CREATE INDEX idx_ref_history_datadiri_umum_kode_vendor ON ref_history_datadiri_umum (kode_vendor);
CREATE INDEX idx_ref_history_direksi_bu_kode_vendor ON ref_history_direksi_bu (kode_vendor);
CREATE INDEX idx_ref_history_fasilitas_bu_kode_vendor ON ref_history_fasilitas_bu (kode_vendor);
CREATE INDEX idx_ref_history_izin_usaha_bu_kode_vendor ON ref_history_izin_usaha_bu (kode_vendor);
CREATE INDEX idx_ref_history_kantor_bu_kode_vendor ON ref_history_kantor_bu (kode_vendor);
CREATE INDEX idx_ref_history_keuangan_bu_kode_vendor ON ref_history_keuangan_bu (kode_vendor);
CREATE INDEX idx_ref_history_keuangan_pero_kode_vendor ON ref_history_keuangan_pero (kode_vendor);
CREATE INDEX idx_ref_history_komisaris_bu_kode_vendor ON ref_history_komisaris_bu (kode_vendor);
CREATE INDEX idx_ref_history_lan_hukum_bu_kode_vendor ON ref_history_lan_hukum_bu (kode_vendor);
CREATE INDEX idx_ref_history_pengalaman_bu_kode_vendor ON ref_history_pengalaman_bu (kode_vendor);
CREATE INDEX idx_ref_history_pengalaman_pero_kode_vendor ON ref_history_pengalaman_pero (kode_vendor);
CREATE INDEX idx_ref_history_pengurus_bu_kode_vendor ON ref_history_pengurus_bu (kode_vendor);
CREATE INDEX idx_ref_history_personalia_pero_kode_vendor ON ref_history_personalia_pero (kode_vendor);
CREATE INDEX idx_ref_history_saham_bu_kode_vendor ON ref_history_saham_bu (kode_vendor);
CREATE INDEX idx_ref_history_sertif_pero_kode_vendor ON ref_history_sertif_pero (kode_vendor);
CREATE INDEX idx_ref_history_sertifikat_usaha_bu_kode_vendor ON ref_history_sertifikat_usaha_bu (kode_vendor);
CREATE INDEX idx_ref_history_tenaga_ahli_bu_kode_vendor ON ref_history_tenaga_ahli_bu (kode_vendor);
CREATE INDEX idx_ref_history_tenaga_pendukung_bu_kode_vendor ON ref_history_tenaga_pendukung_bu (kode_vendor);
CREATE INDEX idx_ref_izin_usaha_bu_kode_vendor ON ref_izin_usaha_bu (kode_vendor);
CREATE INDEX idx_ref_izin_usaha_bu_custom_kode_vendor ON ref_izin_usaha_bu_custom (kode_vendor);
CREATE INDEX idx_ref_kantor_bu_kode_vendor ON ref_kantor_bu (kode_vendor);
CREATE INDEX idx_ref_kantor_bu_custom_kode_vendor ON ref_kantor_bu_custom (kode_vendor);
CREATE INDEX idx_ref_keuangan_bu_kode_vendor ON ref_keuangan_bu (kode_vendor);
CREATE INDEX idx_ref_keuangan_pero_kode_vendor ON ref_keuangan_pero (kode_vendor);
CREATE INDEX idx_ref_komisaris_bu_kode_vendor ON ref_komisaris_bu (kode_vendor);
CREATE INDEX idx_ref_lan_hukum_bu_kode_vendor ON ref_lan_hukum_bu (kode_vendor);
CREATE INDEX idx_ref_pakta_integritas_kode_vendor ON ref_pakta_integritas (kode_vendor);
CREATE INDEX idx_ref_penanggung_jwb_kode_vendor ON ref_penanggung_jwb (kode_vendor);
CREATE INDEX idx_ref_pengalaman_bu_kode_vendor ON ref_pengalaman_bu (kode_vendor);
CREATE INDEX idx_ref_pengalaman_bu_custom_kode_vendor ON ref_pengalaman_bu_custom (kode_vendor);
CREATE INDEX idx_ref_pengalaman_pero_kode_vendor ON ref_pengalaman_pero (kode_vendor);
CREATE INDEX idx_ref_pengurus_bu_kode_vendor ON ref_pengurus_bu (kode_vendor);
CREATE INDEX idx_ref_personalia_pero_kode_vendor ON ref_personalia_pero (kode_vendor);
CREATE INDEX idx_ref_saham_bu_kode_vendor ON ref_saham_bu (kode_vendor);
CREATE INDEX idx_ref_saham_bu_custom_kode_vendor ON ref_saham_bu_custom (kode_vendor);
CREATE INDEX idx_ref_sertif_pero_kode_vendor ON ref_sertif_pero (kode_vendor);
CREATE INDEX idx_ref_sertifikat_usaha_bu_kode_vendor ON ref_sertifikat_usaha_bu (kode_vendor);
CREATE INDEX idx_ref_sertifikat_usaha_bu_custom_kode_vendor ON ref_sertifikat_usaha_bu_custom (kode_vendor);
CREATE INDEX idx_ref_tenaga_ahli_bu_kode_vendor ON ref_tenaga_ahli_bu (kode_vendor);
CREATE INDEX idx_ref_tenaga_ahli_bu_custom_kode_vendor ON ref_tenaga_ahli_bu_custom (kode_vendor);
CREATE INDEX idx_ref_tenaga_pendukung_bu_kode_vendor ON ref_tenaga_pendukung_bu (kode_vendor);
CREATE INDEX idx_ref_tenaga_pendukung_bu_custom_kode_vendor ON ref_tenaga_pendukung_bu_custom (kode_vendor);
CREATE INDEX idx_ref_umum_kode_vendor ON ref_umum (kode_vendor);
CREATE INDEX idx_ref_v_keluar_dpt_kode_vendor ON ref_v_keluar_dpt (kode_vendor);
CREATE INDEX idx_ref_vendor_penandatangan_kode_vendor ON ref_vendor_penandatangan (kode_vendor);
CREATE INDEX idx_ref_vendor_reg_history_kode_vendor ON ref_vendor_reg_history (kode_vendor);
CREATE INDEX idx_ref_vendor_register_kode_vendor ON ref_vendor_register (kode_vendor);
CREATE INDEX idx_trx_custom_item_kode_vendor ON trx_custom_item (kode_vendor);
CREATE INDEX idx_trx_konfirmasi_data_sesuai_kode_vendor ON trx_konfirmasi_data_sesuai (kode_vendor);
CREATE INDEX idx_trx_undangan_penjr_kode_vendor ON trx_undangan_penjr (kode_vendor);
CREATE INDEX idx_trx_verif_luar_dpt_kode_vendor ON trx_verif_luar_dpt (kode_vendor);



CREATE INDEX CONCURRENTLY IF NOT EXISTS idx_ref_vendor_register_kode_vendor ON ref_vendor_register (kode_vendor);
CREATE INDEX CONCURRENTLY IF NOT EXISTS idx_ref_umum_kode_vendor ON ref_umum (kode_vendor);
CREATE INDEX CONCURRENTLY IF NOT EXISTS idx_ref_adm_bu_kode_vendor ON ref_adm_bu (kode_vendor);
CREATE INDEX CONCURRENTLY IF NOT EXISTS idx_ref_lan_hukum_bu_kode_vendor ON ref_lan_hukum_bu (kode_vendor);
CREATE INDEX CONCURRENTLY IF NOT EXISTS idx_ref_komisaris_bu_kode_vendor ON ref_komisaris_bu (kode_vendor);
CREATE INDEX CONCURRENTLY IF NOT EXISTS idx_ref_direksi_bu_kode_vendor ON ref_direksi_bu (kode_vendor);

-- ----------------------------------





-- ref_adm_bu
CREATE INDEX idx_ref_adm_bu_kode_vendor ON ref_adm_bu(kode_vendor);

-- ref_administrasi_pero
CREATE INDEX idx_ref_administrasi_pero_kode_vendor ON ref_administrasi_pero(kode_vendor);

-- ref_ambang_batas_penilaian
CREATE INDEX idx_ref_ambang_batas_penilaian_kode_penjaringan ON ref_ambang_batas_penilaian(kode_penjaringan);

-- ref_data_pajak_bu
CREATE INDEX idx_ref_data_pajak_bu_kode_vendor ON ref_data_pajak_bu(kode_vendor);

-- ref_datadiri
CREATE INDEX idx_ref_datadiri_kode_vendor ON ref_datadiri(kode_vendor);

-- ref_datadiri_umum
CREATE INDEX idx_ref_datadiri_umum_kode_kab_kota_domisili ON ref_datadiri_umum(kode_kab_kota_domisili);
CREATE INDEX idx_ref_datadiri_umum_kode_kab_kota_ktp ON ref_datadiri_umum(kode_kab_kota_ktp);
CREATE INDEX idx_ref_datadiri_umum_kode_kualifikasi_usaha ON ref_datadiri_umum(kode_kualifikasi_usaha);
CREATE INDEX idx_ref_datadiri_umum_kode_vendor ON ref_datadiri_umum(kode_vendor);

-- ref_direksi_bu
CREATE INDEX idx_ref_direksi_bu_kode_vendor ON ref_direksi_bu(kode_vendor);

-- ref_direksi_bu_custom
CREATE INDEX idx_ref_direksi_bu_custom_kode_vendor ON ref_direksi_bu_custom(kode_vendor);

-- ref_fasilitas_bu
CREATE INDEX idx_ref_fasilitas_bu_kode_kepemilikan ON ref_fasilitas_bu(kode_kepemilikan);
CREATE INDEX idx_ref_fasilitas_bu_kode_vendor ON ref_fasilitas_bu(kode_vendor);

-- ref_fasilitas_bu_custom
CREATE INDEX idx_ref_fasilitas_bu_custom_kode_vendor ON ref_fasilitas_bu_custom(kode_vendor);

-- ref_history_adm_bu
CREATE INDEX idx_ref_history_adm_bu_kode_vendor ON ref_history_adm_bu(kode_vendor);

-- ref_history_administrasi_pero
CREATE INDEX idx_ref_history_administrasi_pero_kode_vendor ON ref_history_administrasi_pero(kode_vendor);

-- ref_history_data_pajak_bu
CREATE INDEX idx_ref_history_data_pajak_bu_kode_vendor ON ref_history_data_pajak_bu(kode_vendor);

-- ref_history_datadiri_umum
CREATE INDEX idx_ref_history_datadiri_umum_kode_vendor ON ref_history_datadiri_umum(kode_vendor);

-- ref_history_direksi_bu
CREATE INDEX idx_ref_history_direksi_bu_kode_vendor ON ref_history_direksi_bu(kode_vendor);

-- ref_history_fasilitas_bu
CREATE INDEX idx_ref_history_fasilitas_bu_kode_vendor ON ref_history_fasilitas_bu(kode_vendor);

-- ref_history_izin_usaha_bu
CREATE INDEX idx_ref_history_izin_usaha_bu_kode_vendor ON ref_history_izin_usaha_bu(kode_vendor);

-- ref_history_kantor_bu
CREATE INDEX idx_ref_history_kantor_bu_kode_vendor ON ref_history_kantor_bu(kode_vendor);

-- ref_history_keuangan_bu
CREATE INDEX idx_ref_history_keuangan_bu_kode_vendor ON ref_history_keuangan_bu(kode_vendor);

-- ref_history_keuangan_pero
CREATE INDEX idx_ref_history_keuangan_pero_kode_vendor ON ref_history_keuangan_pero(kode_vendor);

-- ref_history_komisaris_bu
CREATE INDEX idx_ref_history_komisaris_bu_kode_vendor ON ref_history_komisaris_bu(kode_vendor);

-- ref_history_lan_hukum_bu
CREATE INDEX idx_ref_history_lan_hukum_bu_kode_vendor ON ref_history_lan_hukum_bu(kode_vendor);

-- ref_history_pengalaman_pero
CREATE INDEX idx_ref_history_pengalaman_pero_kode_vendor ON ref_history_pengalaman_pero(kode_vendor);

-- ref_history_pengalaman_ta
CREATE INDEX idx_ref_history_pengalaman_ta_kode_tenaga_ahli_history ON ref_history_pengalaman_ta(kode_tenaga_ahli_history);

-- ref_history_pengurus_bu
CREATE INDEX idx_ref_history_pengurus_bu_kode_vendor ON ref_history_pengurus_bu(kode_vendor);

-- ref_history_personalia_pero
CREATE INDEX idx_ref_history_personalia_pero_kode_vendor ON ref_history_personalia_pero(kode_vendor);

-- ref_history_saham_bu
CREATE INDEX idx_ref_history_saham_bu_kode_vendor ON ref_history_saham_bu(kode_vendor);

-- ref_history_sertif_pero
CREATE INDEX idx_ref_history_sertif_pero_kode_vendor ON ref_history_sertif_pero(kode_vendor);

-- ref_history_sertif_ta
CREATE INDEX idx_ref_history_sertif_ta_kode_tenaga_ahli_history ON ref_history_sertif_ta(kode_tenaga_ahli_history);

-- ref_history_sertif_tp
CREATE INDEX idx_ref_history_sertif_tp_kode_tenaga_pendukung ON ref_history_sertif_tp(kode_tenaga_pendukung);

-- ref_history_sertifikat_usaha_bu
CREATE INDEX idx_ref_history_sertifikat_usaha_bu_kode_vendor ON ref_history_sertifikat_usaha_bu(kode_vendor);

-- ref_history_tenaga_ahli_bu
CREATE INDEX idx_ref_history_tenaga_ahli_bu_kode_vendor ON ref_history_tenaga_ahli_bu(kode_vendor);

-- ref_history_umum
CREATE INDEX idx_ref_history_umum_kode_vendor ON ref_history_umum(kode_vendor);

-- ref_history_vendor
CREATE INDEX idx_ref_history_vendor_kode_vendor ON ref_history_vendor(kode_vendor);

-- ref_item_tanya
CREATE INDEX idx_ref_item_tanya_kode_kat_item_tanya ON ref_item_tanya(kode_kat_item_tanya);
CREATE INDEX idx_ref_item_tanya_kode_penjaringan ON ref_item_tanya(kode_penjaringan);
CREATE INDEX idx_ref_item_tanya_tipe_input ON ref_item_tanya(tipe_input);

-- ref_item_tanya_tpl
CREATE INDEX idx_ref_item_tanya_tpl_kode_kat_item_tanya ON ref_item_tanya_tpl(kode_kat_item_tanya);
CREATE INDEX idx_ref_item_tanya_tpl_tipe_input ON ref_item_tanya_tpl(tipe_input);

-- ref_izin_usaha_bu
CREATE INDEX idx_ref_izin_usaha_bu_kode_vendor ON ref_izin_usaha_bu(kode_vendor);

-- ref_izin_usaha_bu_custom
CREATE INDEX idx_ref_izin_usaha_bu_custom_kode_vendor ON ref_izin_usaha_bu_custom(kode_vendor);

-- ref_kantor_bu
CREATE INDEX idx_ref_kantor_bu_kode_kepemilikan ON ref_kantor_bu(kode_kepemilikan);
CREATE INDEX idx_ref_kantor_bu_kode_kondisi ON ref_kantor_bu(kode_kondisi);
CREATE INDEX idx_ref_kantor_bu_kode_vendor ON ref_kantor_bu(kode_vendor);

-- ref_kantor_bu_custom
CREATE INDEX idx_ref_kantor_bu_custom_kode_vendor ON ref_kantor_bu_custom(kode_vendor);

-- ref_kat_item_tanya
CREATE INDEX idx_ref_kat_item_tanya_kode_subkat ON ref_kat_item_tanya(kode_subkat);

-- ref_keuangan_bu
CREATE INDEX idx_ref_keuangan_bu_kode_vendor ON ref_keuangan_bu(kode_vendor);

-- ref_keuangan_pero
CREATE INDEX idx_ref_keuangan_pero_kode_vendor ON ref_keuangan_pero(kode_vendor);

-- ref_komisaris_bu
CREATE INDEX idx_ref_komisaris_bu_kode_vendor ON ref_komisaris_bu(kode_vendor);

-- ref_komisaris_bu_custom
CREATE INDEX idx_ref_komisaris_bu_custom_kode_vendor ON ref_komisaris_bu_custom(kode_vendor);

-- ref_lan_hukum_bu
CREATE INDEX idx_ref_lan_hukum_bu_kode_vendor ON ref_lan_hukum_bu(kode_vendor);

-- ref_pakta_integritas
CREATE INDEX idx_ref_pakta_integritas_kode_vendor ON ref_pakta_integritas(kode_vendor);

-- ref_penanggung_jwb
CREATE INDEX idx_ref_penanggung_jwb_kode_vendor ON ref_penanggung_jwb(kode_vendor);

-- ref_pengalaman_bu
CREATE INDEX idx_ref_pengalaman_bu_kode_vendor ON ref_pengalaman_bu(kode_vendor);

-- ref_pengalaman_bu_custom
CREATE INDEX idx_ref_pengalaman_bu_custom_kode_vendor ON ref_pengalaman_bu_custom(kode_vendor);

-- ref_pengalaman_pero
CREATE INDEX idx_ref_pengalaman_pero_kode_vendor ON ref_pengalaman_pero(kode_vendor);

-- ref_pengalaman_pero_custom
CREATE INDEX idx_ref_pengalaman_pero_custom_kode_penjaringan ON ref_pengalaman_pero_custom(kode_penjaringan);
CREATE INDEX idx_ref_pengalaman_pero_custom_kode_vendor ON ref_pengalaman_pero_custom(kode_vendor);

-- ref_pengalaman_ta
CREATE INDEX idx_ref_pengalaman_ta_kode_tenaga_ahli ON ref_pengalaman_ta(kode_tenaga_ahli);

-- ref_pengalaman_ta_custom
CREATE INDEX idx_ref_pengalaman_ta_custom_kode_tenaga_ahli_custom ON ref_pengalaman_ta_custom(kode_tenaga_ahli_custom);

-- ref_pengalaman_tp
CREATE INDEX idx_ref_pengalaman_tp_kode_tenaga_pendukung ON ref_pengalaman_tp(kode_tenaga_pendukung);

-- ref_pengalaman_tp_custom
CREATE INDEX idx_ref_pengalaman_tp_custom_kode_tenaga_pendukung_custom ON ref_pengalaman_tp_custom(kode_tenaga_pendukung_custom);

-- ref_pengurus_bu
CREATE INDEX idx_ref_pengurus_bu_kode_vendor ON ref_pengurus_bu(kode_vendor);

-- ref_pengurus_bu_verif
CREATE INDEX idx_ref_pengurus_bu_verif_kode_pengurus_bu ON ref_pengurus_bu_verif(kode_pengurus_bu);
CREATE INDEX idx_ref_pengurus_bu_verif_kode_vendor_penjr ON ref_pengurus_bu_verif(kode_vendor_penjr);

-- ref_persentase_penilaian
CREATE INDEX idx_ref_persentase_penilaian_kode_penjaringan ON ref_persentase_penilaian(kode_penjaringan);

-- ref_persentase_penilaian_tpl
CREATE INDEX idx_ref_persentase_penilaian_tpl_kode_jenis_vendor ON ref_persentase_penilaian_tpl(kode_jenis_vendor);

-- ref_personalia_pero
CREATE INDEX idx_ref_personalia_pero_kode_jenjang_pendidikan ON ref_personalia_pero(kode_jenjang_pendidikan);
CREATE INDEX idx_ref_personalia_pero_kode_vendor ON ref_personalia_pero(kode_vendor);

-- ref_saham_bu
CREATE INDEX idx_ref_saham_bu_kode_vendor ON ref_saham_bu(kode_vendor);

-- ref_saham_bu_custom
CREATE INDEX idx_ref_saham_bu_custom_kode_vendor ON ref_saham_bu_custom(kode_vendor);

-- ref_sertif_pero
CREATE INDEX idx_ref_sertif_pero_kode_vendor ON ref_sertif_pero(kode_vendor);

-- ref_sertif_pero_custom
CREATE INDEX idx_ref_sertif_pero_custom_kode_penjaringan ON ref_sertif_pero_custom(kode_penjaringan);
CREATE INDEX idx_ref_sertif_pero_custom_kode_vendor ON ref_sertif_pero_custom(kode_vendor);

-- ref_sertif_ta
CREATE INDEX idx_ref_sertif_ta_kode_tenaga_ahli ON ref_sertif_ta(kode_tenaga_ahli);

-- ref_sertif_ta_custom
CREATE INDEX idx_ref_sertif_ta_custom_kode_tenaga_ahli_custom ON ref_sertif_ta_custom(kode_tenaga_ahli_custom);

-- ref_sertif_tp
CREATE INDEX idx_ref_sertif_tp_kode_tenaga_pendukung ON ref_sertif_tp(kode_tenaga_pendukung);

-- ref_sertif_tp_custom
CREATE INDEX idx_ref_sertif_tp_custom_kode_tenaga_pendukung_custom ON ref_sertif_tp_custom(kode_tenaga_pendukung_custom);

-- ref_sertifikat_usaha_bu_custom
CREATE INDEX idx_ref_sertifikat_usaha_bu_custom_kode_vendor ON ref_sertifikat_usaha_bu_custom(kode_vendor);

-- ref_subkat_persyaratan
CREATE INDEX idx_ref_subkat_persyaratan_kode_kat_persyaratan ON ref_subkat_persyaratan(kode_kat_persyaratan);

-- ref_tenaga_ahli_bu
CREATE INDEX idx_ref_tenaga_ahli_bu_kode_jenjang_pendidikan ON ref_tenaga_ahli_bu(kode_jenjang_pendidikan);
CREATE INDEX idx_ref_tenaga_ahli_bu_kode_vendor ON ref_tenaga_ahli_bu(kode_vendor);

-- ref_tenaga_ahli_bu_custom
CREATE INDEX idx_ref_tenaga_ahli_bu_custom_kode_vendor ON ref_tenaga_ahli_bu_custom(kode_vendor);

-- ref_tenaga_pendukung_bu
CREATE INDEX idx_ref_tenaga_pendukung_bu_kode_vendor ON ref_tenaga_pendukung_bu(kode_vendor);

-- ref_tenaga_pendukung_bu_custom
CREATE INDEX idx_ref_tenaga_pendukung_bu_custom_kode_vendor ON ref_tenaga_pendukung_bu_custom(kode_vendor);

-- ref_umum
CREATE INDEX idx_ref_umum_kode_vendor ON ref_umum(kode_vendor);

-- ref_v_keluar_dpt
CREATE INDEX idx_ref_v_keluar_dpt_kode_sanksi_vendor ON ref_v_keluar_dpt(kode_sanksi_vendor);
CREATE INDEX idx_ref_v_keluar_dpt_kode_status_keluar_dpt ON ref_v_keluar_dpt(kode_status_keluar_dpt);
CREATE INDEX idx_ref_v_keluar_dpt_kode_vendor ON ref_v_keluar_dpt(kode_vendor);

-- ref_vendor
CREATE INDEX idx_ref_vendor_kode_jenis_vendor ON ref_vendor(kode_jenis_vendor);

-- ref_vendor_reg_history
CREATE INDEX idx_ref_vendor_reg_history_kode_vendor ON ref_vendor_reg_history(kode_vendor);

-- ref_vendor_register
CREATE INDEX idx_ref_vendor_register_kode_vendor ON ref_vendor_register(kode_vendor);

-- ref_verif_adm_bu
CREATE INDEX idx_ref_verif_adm_bu_kode_adm_bu ON ref_verif_adm_bu(kode_adm_bu);
CREATE INDEX idx_ref_verif_adm_bu_kode_vendor_penjr ON ref_verif_adm_bu(kode_vendor_penjr);

-- ref_verif_administrasi_pero
CREATE INDEX idx_ref_verif_administrasi_pero_kode_vendor_penjr ON ref_verif_administrasi_pero(kode_vendor_penjr);

-- ref_verif_data_pajak_bu
CREATE INDEX idx_ref_verif_data_pajak_bu_kode_data_pajak ON ref_verif_data_pajak_bu(kode_data_pajak);
CREATE INDEX idx_ref_verif_data_pajak_bu_kode_vendor_penjr ON ref_verif_data_pajak_bu(kode_vendor_penjr);

-- ref_verif_datadiri_umum
CREATE INDEX idx_ref_verif_datadiri_umum_kode_datadiri_umum ON ref_verif_datadiri_umum(kode_datadiri_umum);

-- ref_verif_direksi
CREATE INDEX idx_ref_verif_direksi_kode_direksi_custom ON ref_verif_direksi(kode_direksi_custom);
CREATE INDEX idx_ref_verif_direksi_kode_vendor_penjr ON ref_verif_direksi(kode_vendor_penjr);

-- ref_verif_fasilitas_bu
CREATE INDEX idx_ref_verif_fasilitas_bu_kode_fasilitas_custom ON ref_verif_fasilitas_bu(kode_fasilitas_custom);
CREATE INDEX idx_ref_verif_fasilitas_bu_kode_vendor_penjr ON ref_verif_fasilitas_bu(kode_vendor_penjr);

-- ref_verif_izin_usaha_bu
CREATE INDEX idx_ref_verif_izin_usaha_bu_kode_izin_usaha_custom ON ref_verif_izin_usaha_bu(kode_izin_usaha_custom);
CREATE INDEX idx_ref_verif_izin_usaha_bu_kode_vendor_penjr ON ref_verif_izin_usaha_bu(kode_vendor_penjr);

-- ref_verif_kantor_bu
CREATE INDEX idx_ref_verif_kantor_bu_kode_kantor_custom ON ref_verif_kantor_bu(kode_kantor_custom);
CREATE INDEX idx_ref_verif_kantor_bu_kode_vendor_penjr ON ref_verif_kantor_bu(kode_vendor_penjr);

-- ref_verif_keuangan_bu
CREATE INDEX idx_ref_verif_keuangan_bu_kode_keuangan ON ref_verif_keuangan_bu(kode_keuangan);
CREATE INDEX idx_ref_verif_keuangan_bu_kode_vendor_penjr ON ref_verif_keuangan_bu(kode_vendor_penjr);

-- ref_verif_keuangan_pero
CREATE INDEX idx_ref_verif_keuangan_pero_kode_keuangan ON ref_verif_keuangan_pero(kode_keuangan);
CREATE INDEX idx_ref_verif_keuangan_pero_kode_vendor_penjr ON ref_verif_keuangan_pero(kode_vendor_penjr);

-- ref_verif_komisaris
CREATE INDEX idx_ref_verif_komisaris_kode_komisaris_custom ON ref_verif_komisaris(kode_komisaris_custom);
CREATE INDEX idx_ref_verif_komisaris_kode_vendor_penjr ON ref_verif_komisaris(kode_vendor_penjr);

-- ref_verif_lan_hukum_bu
CREATE INDEX idx_ref_verif_lan_hukum_bu_kode_lan_hukum ON ref_verif_lan_hukum_bu(kode_lan_hukum);
CREATE INDEX idx_ref_verif_lan_hukum_bu_kode_vendor_penjr ON ref_verif_lan_hukum_bu(kode_vendor_penjr);

-- ref_verif_pengalaman_bu
CREATE INDEX idx_ref_verif_pengalaman_bu_kode_pengalaman_bu_custom ON ref_verif_pengalaman_bu(kode_pengalaman_bu_custom);
CREATE INDEX idx_ref_verif_pengalaman_bu_kode_vendor_penjr ON ref_verif_pengalaman_bu(kode_vendor_penjr);

-- ref_verif_pengalaman_pero
CREATE INDEX idx_ref_verif_pengalaman_pero_kode_pengalaman_custom ON ref_verif_pengalaman_pero(kode_pengalaman_custom);
CREATE INDEX idx_ref_verif_pengalaman_pero_kode_vendor_penjr ON ref_verif_pengalaman_pero(kode_vendor_penjr);

-- ref_verif_saham_bu
CREATE INDEX idx_ref_verif_saham_bu_kode_saham_custom ON ref_verif_saham_bu(kode_saham_custom);
CREATE INDEX idx_ref_verif_saham_bu_kode_vendor_penjr ON ref_verif_saham_bu(kode_vendor_penjr);

-- ref_verif_sertif_pero
CREATE INDEX idx_ref_verif_sertif_pero_kode_vendor_penjr ON ref_verif_sertif_pero(kode_vendor_penjr);

-- ref_verif_sertifikat_usaha_bu
CREATE INDEX idx_ref_verif_sertifikat_usaha_bu_kode_sertifikat_usaha_custom ON ref_verif_sertifikat_usaha_bu(kode_sertifikat_usaha_custom);
CREATE INDEX idx_ref_verif_sertifikat_usaha_bu_kode_vendor_penjr ON ref_verif_sertifikat_usaha_bu(kode_vendor_penjr);

-- ref_verif_tenaga_ahli_bu
CREATE INDEX idx_ref_verif_tenaga_ahli_bu_kode_tenaga_ahli_custom ON ref_verif_tenaga_ahli_bu(kode_tenaga_ahli_custom);
CREATE INDEX idx_ref_verif_tenaga_ahli_bu_kode_vendor_penjr ON ref_verif_tenaga_ahli_bu(kode_vendor_penjr);

-- ref_verif_tenaga_pendukung_bu
CREATE INDEX idx_ref_verif_tenaga_pendukung_bu_kode_tenaga_pendukung_custom ON ref_verif_tenaga_pendukung_bu(kode_tenaga_pendukung_custom);
CREATE INDEX idx_ref_verif_tenaga_pendukung_bu_kode_vendor_penjr ON ref_verif_tenaga_pendukung_bu(kode_vendor_penjr);

-- trx_custom_item
CREATE INDEX idx_trx_custom_item_kode_vendor ON trx_custom_item(kode_vendor);

-- trx_kategori
CREATE INDEX idx_trx_kategori_kode_kategori ON trx_kategori(kode_kategori);

-- trx_kehadiran_verif
CREATE INDEX idx_trx_kehadiran_verif_kode_undangan_verif ON trx_kehadiran_verif(kode_undangan_verif);

-- trx_ketentuan_umum_khusus
CREATE INDEX idx_trx_ketentuan_umum_khusus_kode_penjaringan ON trx_ketentuan_umum_khusus(kode_penjaringan);
CREATE INDEX idx_trx_ketentuan_umum_khusus_kode_subkat ON trx_ketentuan_umum_khusus(kode_subkat);

-- trx_kualifikasi_usaha_penjr
CREATE INDEX idx_trx_kualifikasi_usaha_penjr_kode_kualifikasi_usaha ON trx_kualifikasi_usaha_penjr(kode_kualifikasi_usaha);
CREATE INDEX idx_trx_kualifikasi_usaha_penjr_kode_penjaringan ON trx_kualifikasi_usaha_penjr(kode_penjaringan);

-- trx_nilai_akhir
CREATE INDEX idx_trx_nilai_akhir_kode_vendor_penjr ON trx_nilai_akhir(kode_vendor_penjr);

-- trx_penjaringan
CREATE INDEX idx_trx_penjaringan_kode_jenis_pengadaan ON trx_penjaringan(kode_jenis_pengadaan);
CREATE INDEX idx_trx_penjaringan_kode_jenis_vendor ON trx_penjaringan(kode_jenis_vendor);
CREATE INDEX idx_trx_penjaringan_kode_status_pengajuan ON trx_penjaringan(kode_status_pengajuan);
CREATE INDEX idx_trx_penjaringan_kode_status_penjaringan ON trx_penjaringan(kode_status_penjaringan);
CREATE INDEX idx_trx_penjaringan_kode_trx_kategori ON trx_penjaringan(kode_trx_kategori);

-- trx_tim_teknis_pendukung
CREATE INDEX idx_trx_tim_teknis_pendukung_kode_undangan_verif ON trx_tim_teknis_pendukung(kode_undangan_verif);

-- trx_undangan_penjr
CREATE INDEX idx_trx_undangan_penjr_kode_penjaringan ON trx_undangan_penjr(kode_penjaringan);
CREATE INDEX idx_trx_undangan_penjr_kode_vendor ON trx_undangan_penjr(kode_vendor);

-- trx_undangan_verif
CREATE INDEX idx_trx_undangan_verif_kode_vendor_penjr ON trx_undangan_verif(kode_vendor_penjr);

-- trx_vendor_penjr
CREATE INDEX idx_trx_vendor_penjr_kode_penjaringan ON trx_vendor_penjr(kode_penjaringan);
CREATE INDEX idx_trx_vendor_penjr_kode_vendor ON trx_vendor_penjr(kode_vendor);

-- trx_verifikator_penjr
CREATE INDEX idx_trx_verifikator_penjr_kode_penjaringan ON trx_verifikator_penjr(kode_penjaringan);