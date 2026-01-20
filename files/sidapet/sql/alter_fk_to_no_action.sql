ALTER TABLE bridging_id_direksi 
DROP CONSTRAINT bridging_id_direksi_kode_direksi_fkey,
ADD CONSTRAINT bridging_id_direksi_kode_direksi_fkey 
FOREIGN KEY (kode_direksi) REFERENCES ref_direksi_bu_custom(kode_direksi);

ALTER TABLE ref_adm_bu 
DROP CONSTRAINT ref_adm_bu_kode_vendor_fkey,
ADD CONSTRAINT ref_adm_bu_kode_vendor_fkey 
FOREIGN KEY (kode_vendor) REFERENCES ref_vendor(kode_vendor);

ALTER TABLE ref_administrasi_pero 
DROP CONSTRAINT ref_administrasi_pero_kode_vendor_fkey,
ADD CONSTRAINT ref_administrasi_pero_kode_vendor_fkey 
FOREIGN KEY (kode_vendor) REFERENCES ref_vendor(kode_vendor);

ALTER TABLE ref_ambang_batas_penilaian 
DROP CONSTRAINT ref_ambang_batas_penilaian_kode_penjaringan_fkey,
ADD CONSTRAINT ref_ambang_batas_penilaian_kode_penjaringan_fkey 
FOREIGN KEY (kode_penjaringan) REFERENCES trx_penjaringan(kode_penjaringan);

ALTER TABLE ref_data_pajak_bu 
DROP CONSTRAINT ref_data_pajak_bu_kode_vendor_fkey,
ADD CONSTRAINT ref_data_pajak_bu_kode_vendor_fkey 
FOREIGN KEY (kode_vendor) REFERENCES ref_vendor(kode_vendor);

ALTER TABLE ref_datadiri 
DROP CONSTRAINT ref_datadiri_kode_vendor_fkey,
ADD CONSTRAINT ref_datadiri_kode_vendor_fkey 
FOREIGN KEY (kode_vendor) REFERENCES ref_vendor(kode_vendor);

ALTER TABLE ref_datadiri_umum 
DROP CONSTRAINT ref_datadiri_umum_kode_kab_kota_domisili_fkey,
ADD CONSTRAINT ref_datadiri_umum_kode_kab_kota_domisili_fkey 
FOREIGN KEY (kode_kab_kota_domisili) REFERENCES ref_kab_kota(kode_kab_kota);

ALTER TABLE ref_datadiri_umum 
DROP CONSTRAINT ref_datadiri_umum_kode_kab_kota_ktp_fkey,
ADD CONSTRAINT ref_datadiri_umum_kode_kab_kota_ktp_fkey 
FOREIGN KEY (kode_kab_kota_ktp) REFERENCES ref_kab_kota(kode_kab_kota);

ALTER TABLE ref_datadiri_umum 
DROP CONSTRAINT ref_datadiri_umum_kode_kualifikasi_usaha_fkey,
ADD CONSTRAINT ref_datadiri_umum_kode_kualifikasi_usaha_fkey 
FOREIGN KEY (kode_kualifikasi_usaha) REFERENCES ref_kualifikasi_usaha(kode_kualifikasi_usaha);

ALTER TABLE ref_datadiri_umum 
DROP CONSTRAINT ref_datadiri_umum_kode_vendor_fkey,
ADD CONSTRAINT ref_datadiri_umum_kode_vendor_fkey 
FOREIGN KEY (kode_vendor) REFERENCES ref_vendor(kode_vendor);

ALTER TABLE ref_direksi_bu 
DROP CONSTRAINT ref_direksi_bu_kode_vendor_fkey,
ADD CONSTRAINT ref_direksi_bu_kode_vendor_fkey 
FOREIGN KEY (kode_vendor) REFERENCES ref_vendor(kode_vendor);

ALTER TABLE ref_direksi_bu_custom 
DROP CONSTRAINT ref_direksi_bu_custom_kode_direksi_fkey,
ADD CONSTRAINT ref_direksi_bu_custom_kode_direksi_fkey 
FOREIGN KEY (kode_direksi) REFERENCES ref_direksi_bu(kode_direksi);

ALTER TABLE ref_fasilitas_bu 
DROP CONSTRAINT ref_fasilitas_bu_kode_kepemilikan_fkey,
ADD CONSTRAINT ref_fasilitas_bu_kode_kepemilikan_fkey 
FOREIGN KEY (kode_kepemilikan) REFERENCES ref_kepemilikan(kode_kepemilikan);

ALTER TABLE ref_fasilitas_bu 
DROP CONSTRAINT ref_fasilitas_bu_kode_vendor_fkey,
ADD CONSTRAINT ref_fasilitas_bu_kode_vendor_fkey 
FOREIGN KEY (kode_vendor) REFERENCES ref_vendor(kode_vendor);

ALTER TABLE ref_fasilitas_bu_custom 
DROP CONSTRAINT ref_fasilitas_bu_custom_kode_fasilitas_fkey,
ADD CONSTRAINT ref_fasilitas_bu_custom_kode_fasilitas_fkey 
FOREIGN KEY (kode_fasilitas) REFERENCES ref_fasilitas_bu(kode_fasilitas);

ALTER TABLE ref_history_adm_bu 
DROP CONSTRAINT ref_history_adm_bu_kode_vendor_fkey,
ADD CONSTRAINT ref_history_adm_bu_kode_vendor_fkey 
FOREIGN KEY (kode_vendor) REFERENCES ref_vendor(kode_vendor);

ALTER TABLE ref_history_administrasi_pero 
DROP CONSTRAINT ref_history_administrasi_pero_kode_vendor_fkey,
ADD CONSTRAINT ref_history_administrasi_pero_kode_vendor_fkey 
FOREIGN KEY (kode_vendor) REFERENCES ref_vendor(kode_vendor);

ALTER TABLE ref_history_data_pajak_bu 
DROP CONSTRAINT ref_history_data_pajak_bu_kode_vendor_fkey,
ADD CONSTRAINT ref_history_data_pajak_bu_kode_vendor_fkey 
FOREIGN KEY (kode_vendor) REFERENCES ref_vendor(kode_vendor);

ALTER TABLE ref_history_datadiri_umum 
DROP CONSTRAINT ref_history_datadiri_umum_kode_vendor_fkey,
ADD CONSTRAINT ref_history_datadiri_umum_kode_vendor_fkey 
FOREIGN KEY (kode_vendor) REFERENCES ref_vendor(kode_vendor);

ALTER TABLE ref_history_direksi_bu 
DROP CONSTRAINT ref_history_direksi_bu_kode_vendor_fkey,
ADD CONSTRAINT ref_history_direksi_bu_kode_vendor_fkey 
FOREIGN KEY (kode_vendor) REFERENCES ref_vendor(kode_vendor);

ALTER TABLE ref_history_fasilitas_bu 
DROP CONSTRAINT ref_history_fasilitas_bu_kode_vendor_fkey,
ADD CONSTRAINT ref_history_fasilitas_bu_kode_vendor_fkey 
FOREIGN KEY (kode_vendor) REFERENCES ref_vendor(kode_vendor);

ALTER TABLE ref_history_izin_usaha_bu 
DROP CONSTRAINT ref_history_izin_usaha_bu_kode_vendor_fkey,
ADD CONSTRAINT ref_history_izin_usaha_bu_kode_vendor_fkey 
FOREIGN KEY (kode_vendor) REFERENCES ref_vendor(kode_vendor);

ALTER TABLE ref_history_kantor_bu 
DROP CONSTRAINT ref_history_kantor_bu_kode_vendor_fkey,
ADD CONSTRAINT ref_history_kantor_bu_kode_vendor_fkey 
FOREIGN KEY (kode_vendor) REFERENCES ref_vendor(kode_vendor);

ALTER TABLE ref_history_keuangan_bu 
DROP CONSTRAINT ref_history_keuangan_bu_kode_vendor_fkey,
ADD CONSTRAINT ref_history_keuangan_bu_kode_vendor_fkey 
FOREIGN KEY (kode_vendor) REFERENCES ref_vendor(kode_vendor);

ALTER TABLE ref_history_keuangan_pero 
DROP CONSTRAINT ref_history_keuangan_pero_kode_vendor_fkey,
ADD CONSTRAINT ref_history_keuangan_pero_kode_vendor_fkey 
FOREIGN KEY (kode_vendor) REFERENCES ref_vendor(kode_vendor);

ALTER TABLE ref_history_komisaris_bu 
DROP CONSTRAINT ref_history_komisaris_bu_kode_vendor_fkey,
ADD CONSTRAINT ref_history_komisaris_bu_kode_vendor_fkey 
FOREIGN KEY (kode_vendor) REFERENCES ref_vendor(kode_vendor);

ALTER TABLE ref_history_lan_hukum_bu 
DROP CONSTRAINT ref_history_lan_hukum_bu_kode_vendor_fkey,
ADD CONSTRAINT ref_history_lan_hukum_bu_kode_vendor_fkey 
FOREIGN KEY (kode_vendor) REFERENCES ref_vendor(kode_vendor);

ALTER TABLE ref_history_pengalaman_bu 
DROP CONSTRAINT ref_history_pengalaman_bu_kode_vendor_fkey,
ADD CONSTRAINT ref_history_pengalaman_bu_kode_vendor_fkey 
FOREIGN KEY (kode_vendor) REFERENCES ref_vendor(kode_vendor);

ALTER TABLE ref_history_pengalaman_pero 
DROP CONSTRAINT ref_history_pengalaman_pero_kode_vendor_fkey,
ADD CONSTRAINT ref_history_pengalaman_pero_kode_vendor_fkey 
FOREIGN KEY (kode_vendor) REFERENCES ref_vendor(kode_vendor);

ALTER TABLE ref_history_pengalaman_ta 
DROP CONSTRAINT ref_history_pengalaman_ta_kode_tenaga_ahli_fkey,
ADD CONSTRAINT ref_history_pengalaman_ta_kode_tenaga_ahli_fkey 
FOREIGN KEY (kode_tenaga_ahli) REFERENCES ref_tenaga_ahli_bu(kode_tenaga_ahli);

ALTER TABLE ref_history_pengalaman_tp 
DROP CONSTRAINT ref_history_pengalaman_tp_kode_tenaga_pendukung_fkey,
ADD CONSTRAINT ref_history_pengalaman_tp_kode_tenaga_pendukung_fkey 
FOREIGN KEY (kode_tenaga_pendukung) REFERENCES ref_tenaga_pendukung_bu(kode_tenaga_pendukung);

ALTER TABLE ref_history_pengurus_bu 
DROP CONSTRAINT ref_history_pengurus_bu_kode_vendor_fkey,
ADD CONSTRAINT ref_history_pengurus_bu_kode_vendor_fkey 
FOREIGN KEY (kode_vendor) REFERENCES ref_vendor(kode_vendor);

ALTER TABLE ref_history_personalia_pero 
DROP CONSTRAINT ref_history_personalia_pero_kode_vendor_fkey,
ADD CONSTRAINT ref_history_personalia_pero_kode_vendor_fkey 
FOREIGN KEY (kode_vendor) REFERENCES ref_vendor(kode_vendor);

ALTER TABLE ref_history_saham_bu 
DROP CONSTRAINT ref_history_saham_bu_kode_vendor_fkey,
ADD CONSTRAINT ref_history_saham_bu_kode_vendor_fkey 
FOREIGN KEY (kode_vendor) REFERENCES ref_vendor(kode_vendor);

ALTER TABLE ref_history_sertif_pero 
DROP CONSTRAINT ref_history_sertif_pero_kode_vendor_fkey,
ADD CONSTRAINT ref_history_sertif_pero_kode_vendor_fkey 
FOREIGN KEY (kode_vendor) REFERENCES ref_vendor(kode_vendor);

ALTER TABLE ref_history_sertif_ta 
DROP CONSTRAINT ref_history_sertif_ta_kode_tenaga_ahli_fkey,
ADD CONSTRAINT ref_history_sertif_ta_kode_tenaga_ahli_fkey 
FOREIGN KEY (kode_tenaga_ahli) REFERENCES ref_tenaga_ahli_bu(kode_tenaga_ahli);

ALTER TABLE ref_history_sertif_tp 
DROP CONSTRAINT ref_history_sertif_tp_kode_tenaga_pendukung_fkey,
ADD CONSTRAINT ref_history_sertif_tp_kode_tenaga_pendukung_fkey 
FOREIGN KEY (kode_tenaga_pendukung) REFERENCES ref_tenaga_pendukung_bu(kode_tenaga_pendukung);

ALTER TABLE ref_history_sertifikat_usaha_bu 
DROP CONSTRAINT ref_history_sertifikat_usaha_bu_kode_vendor_fkey,
ADD CONSTRAINT ref_history_sertifikat_usaha_bu_kode_vendor_fkey 
FOREIGN KEY (kode_vendor) REFERENCES ref_vendor(kode_vendor);

ALTER TABLE ref_history_tenaga_ahli_bu 
DROP CONSTRAINT ref_history_tenaga_ahli_bu_kode_vendor_fkey,
ADD CONSTRAINT ref_history_tenaga_ahli_bu_kode_vendor_fkey 
FOREIGN KEY (kode_vendor) REFERENCES ref_vendor(kode_vendor);

ALTER TABLE ref_history_tenaga_pendukung_bu 
DROP CONSTRAINT ref_history_tenaga_pendukung_bu_kode_vendor_fkey,
ADD CONSTRAINT ref_history_tenaga_pendukung_bu_kode_vendor_fkey 
FOREIGN KEY (kode_vendor) REFERENCES ref_vendor(kode_vendor);

ALTER TABLE ref_item_tanya 
DROP CONSTRAINT ref_item_tanya_kode_kat_item_tanya_fkey,
ADD CONSTRAINT ref_item_tanya_kode_kat_item_tanya_fkey 
FOREIGN KEY (kode_kat_item_tanya) REFERENCES ref_kat_item_tanya(kode_kat_item_tanya);

ALTER TABLE ref_item_tanya 
DROP CONSTRAINT ref_item_tanya_tipe_input_fkey,
ADD CONSTRAINT ref_item_tanya_tipe_input_fkey 
FOREIGN KEY (tipe_input) REFERENCES ref_tipe_input(tipe_input);

ALTER TABLE ref_item_tanya_tpl 
DROP CONSTRAINT ref_item_tanya_tpl_kode_kat_item_tanya_fkey,
ADD CONSTRAINT ref_item_tanya_tpl_kode_kat_item_tanya_fkey 
FOREIGN KEY (kode_kat_item_tanya) REFERENCES ref_kat_item_tanya(kode_kat_item_tanya);

ALTER TABLE ref_item_tanya_tpl 
DROP CONSTRAINT ref_item_tanya_tpl_tipe_input_fkey,
ADD CONSTRAINT ref_item_tanya_tpl_tipe_input_fkey 
FOREIGN KEY (tipe_input) REFERENCES ref_tipe_input(tipe_input);

ALTER TABLE ref_izin_usaha_bu 
DROP CONSTRAINT ref_izin_usaha_bu_kode_vendor_fkey,
ADD CONSTRAINT ref_izin_usaha_bu_kode_vendor_fkey 
FOREIGN KEY (kode_vendor) REFERENCES ref_vendor(kode_vendor);

ALTER TABLE ref_izin_usaha_bu_custom 
DROP CONSTRAINT ref_izin_usaha_bu_custom_kode_izin_usaha_fkey,
ADD CONSTRAINT ref_izin_usaha_bu_custom_kode_izin_usaha_fkey 
FOREIGN KEY (kode_izin_usaha) REFERENCES ref_izin_usaha_bu(kode_izin_usaha);

ALTER TABLE ref_kantor_bu 
DROP CONSTRAINT ref_kantor_bu_kode_kepemilikan_fkey,
ADD CONSTRAINT ref_kantor_bu_kode_kepemilikan_fkey 
FOREIGN KEY (kode_kepemilikan) REFERENCES ref_kepemilikan(kode_kepemilikan);

ALTER TABLE ref_kantor_bu 
DROP CONSTRAINT ref_kantor_bu_kode_kondisi_fkey,
ADD CONSTRAINT ref_kantor_bu_kode_kondisi_fkey 
FOREIGN KEY (kode_kondisi) REFERENCES ref_kondisi(kode_kondisi);

ALTER TABLE ref_kantor_bu 
DROP CONSTRAINT ref_kantor_bu_kode_vendor_fkey,
ADD CONSTRAINT ref_kantor_bu_kode_vendor_fkey 
FOREIGN KEY (kode_vendor) REFERENCES ref_vendor(kode_vendor);

ALTER TABLE ref_kantor_bu_custom 
DROP CONSTRAINT ref_kantor_bu_custom_kode_kantor_fkey,
ADD CONSTRAINT ref_kantor_bu_custom_kode_kantor_fkey 
FOREIGN KEY (kode_kantor) REFERENCES ref_kantor_bu(kode_kantor);

ALTER TABLE ref_kat_item_tanya 
DROP CONSTRAINT ref_kat_item_tanya_kode_subkat_fkey,
ADD CONSTRAINT ref_kat_item_tanya_kode_subkat_fkey 
FOREIGN KEY (kode_subkat) REFERENCES ref_subkat_persyaratan(kode_subkat);

ALTER TABLE ref_keuangan_bu 
DROP CONSTRAINT ref_keuangan_bu_kode_vendor_fkey,
ADD CONSTRAINT ref_keuangan_bu_kode_vendor_fkey 
FOREIGN KEY (kode_vendor) REFERENCES ref_vendor(kode_vendor);

ALTER TABLE ref_keuangan_pero 
DROP CONSTRAINT ref_keuangan_pero_kode_vendor_fkey,
ADD CONSTRAINT ref_keuangan_pero_kode_vendor_fkey 
FOREIGN KEY (kode_vendor) REFERENCES ref_vendor(kode_vendor);

ALTER TABLE ref_komisaris_bu 
DROP CONSTRAINT ref_komisaris_bu_kode_vendor_fkey,
ADD CONSTRAINT ref_komisaris_bu_kode_vendor_fkey 
FOREIGN KEY (kode_vendor) REFERENCES ref_vendor(kode_vendor);

ALTER TABLE ref_komisaris_bu_custom 
DROP CONSTRAINT ref_komisaris_bu_custom_kode_komisaris_fkey,
ADD CONSTRAINT ref_komisaris_bu_custom_kode_komisaris_fkey 
FOREIGN KEY (kode_komisaris) REFERENCES ref_komisaris_bu(kode_komisaris);

ALTER TABLE ref_lan_hukum_bu 
DROP CONSTRAINT ref_lan_hukum_bu_kode_vendor_fkey,
ADD CONSTRAINT ref_lan_hukum_bu_kode_vendor_fkey 
FOREIGN KEY (kode_vendor) REFERENCES ref_vendor(kode_vendor);

ALTER TABLE ref_pakta_integritas 
DROP CONSTRAINT ref_pakta_integritas_kode_vendor_fkey,
ADD CONSTRAINT ref_pakta_integritas_kode_vendor_fkey 
FOREIGN KEY (kode_vendor) REFERENCES ref_vendor(kode_vendor);

ALTER TABLE ref_penanggung_jwb 
DROP CONSTRAINT ref_penanggung_jwb_kode_vendor_fkey,
ADD CONSTRAINT ref_penanggung_jwb_kode_vendor_fkey 
FOREIGN KEY (kode_vendor) REFERENCES ref_vendor(kode_vendor);

ALTER TABLE ref_pengalaman_bu 
DROP CONSTRAINT ref_pengalaman_bu_kode_vendor_fkey,
ADD CONSTRAINT ref_pengalaman_bu_kode_vendor_fkey 
FOREIGN KEY (kode_vendor) REFERENCES ref_vendor(kode_vendor);

ALTER TABLE ref_pengalaman_bu_custom 
DROP CONSTRAINT ref_pengalaman_bu_custom_kode_pengalaman_bu_fkey,
ADD CONSTRAINT ref_pengalaman_bu_custom_kode_pengalaman_bu_fkey 
FOREIGN KEY (kode_pengalaman_bu) REFERENCES ref_pengalaman_bu(kode_pengalaman_bu);

ALTER TABLE ref_pengalaman_pero 
DROP CONSTRAINT ref_pengalaman_pero_kode_vendor_fkey,
ADD CONSTRAINT ref_pengalaman_pero_kode_vendor_fkey 
FOREIGN KEY (kode_vendor) REFERENCES ref_vendor(kode_vendor);

ALTER TABLE ref_pengalaman_pero_custom 
DROP CONSTRAINT ref_pengalaman_pero_custom_kode_pengalaman_fkey,
ADD CONSTRAINT ref_pengalaman_pero_custom_kode_pengalaman_fkey 
FOREIGN KEY (kode_pengalaman) REFERENCES ref_pengalaman_pero(kode_pengalaman);

ALTER TABLE ref_pengalaman_pero_custom 
DROP CONSTRAINT ref_pengalaman_pero_custom_kode_penjaringan_fkey,
ADD CONSTRAINT ref_pengalaman_pero_custom_kode_penjaringan_fkey 
FOREIGN KEY (kode_penjaringan) REFERENCES trx_penjaringan(kode_penjaringan);

ALTER TABLE ref_pengalaman_pero_custom 
DROP CONSTRAINT ref_pengalaman_pero_custom_kode_vendor_fkey,
ADD CONSTRAINT ref_pengalaman_pero_custom_kode_vendor_fkey 
FOREIGN KEY (kode_vendor) REFERENCES ref_vendor(kode_vendor);

ALTER TABLE ref_pengalaman_ta 
DROP CONSTRAINT ref_pengalaman_ta_kode_tenaga_ahli_fkey,
ADD CONSTRAINT ref_pengalaman_ta_kode_tenaga_ahli_fkey 
FOREIGN KEY (kode_tenaga_ahli) REFERENCES ref_tenaga_ahli_bu(kode_tenaga_ahli);

ALTER TABLE ref_pengalaman_ta_custom 
DROP CONSTRAINT ref_pengalaman_ta_custom_kode_pengalaman_ta_fkey,
ADD CONSTRAINT ref_pengalaman_ta_custom_kode_pengalaman_ta_fkey 
FOREIGN KEY (kode_pengalaman_ta) REFERENCES ref_pengalaman_ta(kode_pengalaman_ta);

ALTER TABLE ref_pengalaman_tp 
DROP CONSTRAINT ref_pengalaman_tp_kode_tenaga_pendukung_fkey,
ADD CONSTRAINT ref_pengalaman_tp_kode_tenaga_pendukung_fkey 
FOREIGN KEY (kode_tenaga_pendukung) REFERENCES ref_tenaga_pendukung_bu(kode_tenaga_pendukung);

ALTER TABLE ref_pengalaman_tp_custom 
DROP CONSTRAINT ref_pengalaman_tp_custom_kode_pengalaman_tp_fkey,
ADD CONSTRAINT ref_pengalaman_tp_custom_kode_pengalaman_tp_fkey 
FOREIGN KEY (kode_pengalaman_tp) REFERENCES ref_pengalaman_tp(kode_pengalaman_tp);

ALTER TABLE ref_pengurus_bu 
DROP CONSTRAINT ref_pengurus_bu_kode_vendor_fkey,
ADD CONSTRAINT ref_pengurus_bu_kode_vendor_fkey 
FOREIGN KEY (kode_vendor) REFERENCES ref_vendor(kode_vendor);

ALTER TABLE ref_pengurus_bu_verif 
DROP CONSTRAINT ref_pengurus_bu_verif_kode_pengurus_bu_fkey,
ADD CONSTRAINT ref_pengurus_bu_verif_kode_pengurus_bu_fkey 
FOREIGN KEY (kode_pengurus_bu) REFERENCES ref_pengurus_bu(kode_pengurus_bu);

ALTER TABLE ref_pengurus_bu_verif 
DROP CONSTRAINT ref_pengurus_bu_verif_kode_vendor_penjr_fkey,
ADD CONSTRAINT ref_pengurus_bu_verif_kode_vendor_penjr_fkey 
FOREIGN KEY (kode_vendor_penjr) REFERENCES trx_vendor_penjr(kode_vendor_penjr);

ALTER TABLE ref_persentase_penilaian 
DROP CONSTRAINT ref_persentase_penilaian_kode_penjaringan_fkey,
ADD CONSTRAINT ref_persentase_penilaian_kode_penjaringan_fkey 
FOREIGN KEY (kode_penjaringan) REFERENCES trx_penjaringan(kode_penjaringan);

ALTER TABLE ref_persentase_penilaian_tpl 
DROP CONSTRAINT ref_persentase_penilaian_tpl_kode_jenis_vendor_fkey,
ADD CONSTRAINT ref_persentase_penilaian_tpl_kode_jenis_vendor_fkey 
FOREIGN KEY (kode_jenis_vendor) REFERENCES ref_jenis_vendor(kode_jenis_vendor);

ALTER TABLE ref_personalia_pero 
DROP CONSTRAINT ref_personalia_pero_kode_jenjang_pendidikan_fkey,
ADD CONSTRAINT ref_personalia_pero_kode_jenjang_pendidikan_fkey 
FOREIGN KEY (kode_jenjang_pendidikan) REFERENCES ref_jenjang_pendidikan(kode_jenjang_pendidikan);

ALTER TABLE ref_personalia_pero 
DROP CONSTRAINT ref_personalia_pero_kode_vendor_fkey,
ADD CONSTRAINT ref_personalia_pero_kode_vendor_fkey 
FOREIGN KEY (kode_vendor) REFERENCES ref_vendor(kode_vendor);

ALTER TABLE ref_saham_bu 
DROP CONSTRAINT ref_saham_bu_kode_vendor_fkey,
ADD CONSTRAINT ref_saham_bu_kode_vendor_fkey 
FOREIGN KEY (kode_vendor) REFERENCES ref_vendor(kode_vendor);

ALTER TABLE ref_saham_bu_custom 
DROP CONSTRAINT ref_saham_bu_custom_kode_saham_fkey,
ADD CONSTRAINT ref_saham_bu_custom_kode_saham_fkey 
FOREIGN KEY (kode_saham) REFERENCES ref_saham_bu(kode_saham);

ALTER TABLE ref_sertif_pero 
DROP CONSTRAINT ref_sertif_pero_kode_vendor_fkey,
ADD CONSTRAINT ref_sertif_pero_kode_vendor_fkey 
FOREIGN KEY (kode_vendor) REFERENCES ref_vendor(kode_vendor);

ALTER TABLE ref_sertif_pero_custom 
DROP CONSTRAINT ref_sertif_pero_custom_kode_penjaringan_fkey,
ADD CONSTRAINT ref_sertif_pero_custom_kode_penjaringan_fkey 
FOREIGN KEY (kode_penjaringan) REFERENCES trx_penjaringan(kode_penjaringan);

ALTER TABLE ref_sertif_pero_custom 
DROP CONSTRAINT ref_sertif_pero_custom_kode_sertif_fkey,
ADD CONSTRAINT ref_sertif_pero_custom_kode_sertif_fkey 
FOREIGN KEY (kode_sertif) REFERENCES ref_sertif_pero(kode_sertif);

ALTER TABLE ref_sertif_pero_custom 
DROP CONSTRAINT ref_sertif_pero_custom_kode_vendor_fkey,
ADD CONSTRAINT ref_sertif_pero_custom_kode_vendor_fkey 
FOREIGN KEY (kode_vendor) REFERENCES ref_vendor(kode_vendor);

ALTER TABLE ref_sertif_ta 
DROP CONSTRAINT ref_sertif_ta_kode_tenaga_ahli_fkey,
ADD CONSTRAINT ref_sertif_ta_kode_tenaga_ahli_fkey 
FOREIGN KEY (kode_tenaga_ahli) REFERENCES ref_tenaga_ahli_bu(kode_tenaga_ahli);

ALTER TABLE ref_sertif_ta_custom 
DROP CONSTRAINT ref_sertif_ta_custom_kode_sertif_ta_fkey,
ADD CONSTRAINT ref_sertif_ta_custom_kode_sertif_ta_fkey 
FOREIGN KEY (kode_sertif_ta) REFERENCES ref_sertif_ta(kode_sertif_ta);

ALTER TABLE ref_sertif_tp 
DROP CONSTRAINT ref_sertif_tp_kode_tenaga_pendukung_fkey,
ADD CONSTRAINT ref_sertif_tp_kode_tenaga_pendukung_fkey 
FOREIGN KEY (kode_tenaga_pendukung) REFERENCES ref_tenaga_pendukung_bu(kode_tenaga_pendukung);

ALTER TABLE ref_sertif_tp_custom 
DROP CONSTRAINT ref_sertif_tp_custom_kode_sertif_tp_fkey,
ADD CONSTRAINT ref_sertif_tp_custom_kode_sertif_tp_fkey 
FOREIGN KEY (kode_sertif_tp) REFERENCES ref_sertif_tp(kode_sertif_tp);

ALTER TABLE ref_sertifikat_usaha_bu_custom 
DROP CONSTRAINT ref_sertifikat_usaha_bu_custom_kode_sertifikat_usaha_fkey,
ADD CONSTRAINT ref_sertifikat_usaha_bu_custom_kode_sertifikat_usaha_fkey 
FOREIGN KEY (kode_sertifikat_usaha) REFERENCES ref_sertifikat_usaha_bu(kode_sertifikat_usaha);

ALTER TABLE ref_subkat_persyaratan 
DROP CONSTRAINT ref_subkat_persyaratan_kode_kat_persyaratan_fkey,
ADD CONSTRAINT ref_subkat_persyaratan_kode_kat_persyaratan_fkey 
FOREIGN KEY (kode_kat_persyaratan) REFERENCES ref_kat_persyaratan(kode_kat_persyaratan);

ALTER TABLE ref_tenaga_ahli_bu 
DROP CONSTRAINT ref_tenaga_ahli_bu_kode_jenjang_pendidikan_fkey,
ADD CONSTRAINT ref_tenaga_ahli_bu_kode_jenjang_pendidikan_fkey 
FOREIGN KEY (kode_jenjang_pendidikan) REFERENCES ref_jenjang_pendidikan(kode_jenjang_pendidikan);

ALTER TABLE ref_tenaga_ahli_bu 
DROP CONSTRAINT ref_tenaga_ahli_bu_kode_vendor_fkey,
ADD CONSTRAINT ref_tenaga_ahli_bu_kode_vendor_fkey 
FOREIGN KEY (kode_vendor) REFERENCES ref_vendor(kode_vendor);

ALTER TABLE ref_tenaga_ahli_bu_custom 
DROP CONSTRAINT ref_tenaga_ahli_bu_custom_kode_tenaga_ahli_fkey,
ADD CONSTRAINT ref_tenaga_ahli_bu_custom_kode_tenaga_ahli_fkey 
FOREIGN KEY (kode_tenaga_ahli) REFERENCES ref_tenaga_ahli_bu(kode_tenaga_ahli);

ALTER TABLE ref_tenaga_pendukung_bu 
DROP CONSTRAINT ref_tenaga_pendukung_bu_kode_vendor_fkey,
ADD CONSTRAINT ref_tenaga_pendukung_bu_kode_vendor_fkey 
FOREIGN KEY (kode_vendor) REFERENCES ref_vendor(kode_vendor);

ALTER TABLE ref_tenaga_pendukung_bu_custom 
DROP CONSTRAINT ref_tenaga_pendukung_bu_custom_kode_tenaga_pendukung_fkey,
ADD CONSTRAINT ref_tenaga_pendukung_bu_custom_kode_tenaga_pendukung_fkey 
FOREIGN KEY (kode_tenaga_pendukung) REFERENCES ref_tenaga_pendukung_bu(kode_tenaga_pendukung);

ALTER TABLE ref_umum 
DROP CONSTRAINT ref_umum_kode_vendor_fkey,
ADD CONSTRAINT ref_umum_kode_vendor_fkey 
FOREIGN KEY (kode_vendor) REFERENCES ref_vendor(kode_vendor);

ALTER TABLE ref_v_keluar_dpt 
DROP CONSTRAINT ref_v_keluar_dpt_kode_sanksi_vendor_fkey,
ADD CONSTRAINT ref_v_keluar_dpt_kode_sanksi_vendor_fkey 
FOREIGN KEY (kode_sanksi_vendor) REFERENCES ref_sanksi_vendor(kode_sanksi_vendor);

ALTER TABLE ref_v_keluar_dpt 
DROP CONSTRAINT ref_v_keluar_dpt_kode_status_keluar_dpt_fkey,
ADD CONSTRAINT ref_v_keluar_dpt_kode_status_keluar_dpt_fkey 
FOREIGN KEY (kode_status_keluar_dpt) REFERENCES ref_status_keluar_dpt(kode_status_keluar_dpt);

ALTER TABLE ref_v_keluar_dpt 
DROP CONSTRAINT ref_v_keluar_dpt_kode_vendor_fkey,
ADD CONSTRAINT ref_v_keluar_dpt_kode_vendor_fkey 
FOREIGN KEY (kode_vendor) REFERENCES ref_vendor(kode_vendor);

ALTER TABLE ref_vendor 
DROP CONSTRAINT ref_vendor_kode_jenis_vendor_fkey,
ADD CONSTRAINT ref_vendor_kode_jenis_vendor_fkey 
FOREIGN KEY (kode_jenis_vendor) REFERENCES ref_jenis_vendor(kode_jenis_vendor);

ALTER TABLE ref_vendor_reg_history 
DROP CONSTRAINT ref_vendor_reg_history_kode_vendor_fkey,
ADD CONSTRAINT ref_vendor_reg_history_kode_vendor_fkey 
FOREIGN KEY (kode_vendor) REFERENCES ref_vendor(kode_vendor);

ALTER TABLE ref_vendor_register 
DROP CONSTRAINT ref_vendor_register_kode_vendor_fkey,
ADD CONSTRAINT ref_vendor_register_kode_vendor_fkey 
FOREIGN KEY (kode_vendor) REFERENCES ref_vendor(kode_vendor);

ALTER TABLE ref_verif_adm_bu 
DROP CONSTRAINT ref_verif_adm_bu_kode_adm_bu_fkey,
ADD CONSTRAINT ref_verif_adm_bu_kode_adm_bu_fkey 
FOREIGN KEY (kode_adm_bu) REFERENCES ref_adm_bu(kode_adm_bu);

ALTER TABLE ref_verif_adm_bu 
DROP CONSTRAINT ref_verif_adm_bu_kode_vendor_penjr_fkey,
ADD CONSTRAINT ref_verif_adm_bu_kode_vendor_penjr_fkey 
FOREIGN KEY (kode_vendor_penjr) REFERENCES trx_vendor_penjr(kode_vendor_penjr);

ALTER TABLE ref_verif_administrasi_pero 
DROP CONSTRAINT ref_verif_administrasi_pero_kode_vendor_penjr_fkey,
ADD CONSTRAINT ref_verif_administrasi_pero_kode_vendor_penjr_fkey 
FOREIGN KEY (kode_vendor_penjr) REFERENCES trx_vendor_penjr(kode_vendor_penjr);

ALTER TABLE ref_verif_data_pajak_bu 
DROP CONSTRAINT ref_verif_data_pajak_bu_kode_data_pajak_fkey,
ADD CONSTRAINT ref_verif_data_pajak_bu_kode_data_pajak_fkey 
FOREIGN KEY (kode_data_pajak) REFERENCES ref_data_pajak_bu(kode_data_pajak);

ALTER TABLE ref_verif_data_pajak_bu 
DROP CONSTRAINT ref_verif_data_pajak_bu_kode_vendor_penjr_fkey,
ADD CONSTRAINT ref_verif_data_pajak_bu_kode_vendor_penjr_fkey 
FOREIGN KEY (kode_vendor_penjr) REFERENCES trx_vendor_penjr(kode_vendor_penjr);

ALTER TABLE ref_verif_datadiri_umum 
DROP CONSTRAINT ref_verif_datadiri_umum_kode_datadiri_umum_fkey,
ADD CONSTRAINT ref_verif_datadiri_umum_kode_datadiri_umum_fkey 
FOREIGN KEY (kode_datadiri_umum) REFERENCES ref_datadiri_umum(kode_datadiri_umum);

ALTER TABLE ref_verif_direksi 
DROP CONSTRAINT ref_verif_direksi_kode_direksi_custom_fkey,
ADD CONSTRAINT ref_verif_direksi_kode_direksi_custom_fkey 
FOREIGN KEY (kode_direksi_custom) REFERENCES ref_direksi_bu_custom(kode_direksi);

ALTER TABLE ref_verif_direksi 
DROP CONSTRAINT ref_verif_direksi_kode_vendor_penjr_fkey,
ADD CONSTRAINT ref_verif_direksi_kode_vendor_penjr_fkey 
FOREIGN KEY (kode_vendor_penjr) REFERENCES trx_vendor_penjr(kode_vendor_penjr);

ALTER TABLE ref_verif_fasilitas_bu 
DROP CONSTRAINT ref_verif_fasilitas_bu_kode_fasilitas_custom_fkey,
ADD CONSTRAINT ref_verif_fasilitas_bu_kode_fasilitas_custom_fkey 
FOREIGN KEY (kode_fasilitas_custom) REFERENCES ref_fasilitas_bu_custom(kode_fasilitas);

ALTER TABLE ref_verif_fasilitas_bu 
DROP CONSTRAINT ref_verif_fasilitas_bu_kode_vendor_penjr_fkey,
ADD CONSTRAINT ref_verif_fasilitas_bu_kode_vendor_penjr_fkey 
FOREIGN KEY (kode_vendor_penjr) REFERENCES trx_vendor_penjr(kode_vendor_penjr);

ALTER TABLE ref_verif_izin_usaha_bu 
DROP CONSTRAINT ref_verif_izin_usaha_bu_kode_izin_usaha_custom_fkey,
ADD CONSTRAINT ref_verif_izin_usaha_bu_kode_izin_usaha_custom_fkey 
FOREIGN KEY (kode_izin_usaha_custom) REFERENCES ref_izin_usaha_bu_custom(kode_izin_usaha);

ALTER TABLE ref_verif_izin_usaha_bu 
DROP CONSTRAINT ref_verif_izin_usaha_bu_kode_vendor_penjr_fkey,
ADD CONSTRAINT ref_verif_izin_usaha_bu_kode_vendor_penjr_fkey 
FOREIGN KEY (kode_vendor_penjr) REFERENCES trx_vendor_penjr(kode_vendor_penjr);

ALTER TABLE ref_verif_kantor_bu 
DROP CONSTRAINT ref_verif_kantor_bu_kode_kantor_custom_fkey,
ADD CONSTRAINT ref_verif_kantor_bu_kode_kantor_custom_fkey 
FOREIGN KEY (kode_kantor_custom) REFERENCES ref_kantor_bu_custom(kode_kantor);

ALTER TABLE ref_verif_kantor_bu 
DROP CONSTRAINT ref_verif_kantor_bu_kode_vendor_penjr_fkey,
ADD CONSTRAINT ref_verif_kantor_bu_kode_vendor_penjr_fkey 
FOREIGN KEY (kode_vendor_penjr) REFERENCES trx_vendor_penjr(kode_vendor_penjr);

ALTER TABLE ref_verif_keuangan_bu 
DROP CONSTRAINT ref_verif_keuangan_bu_kode_keuangan_fkey,
ADD CONSTRAINT ref_verif_keuangan_bu_kode_keuangan_fkey 
FOREIGN KEY (kode_keuangan) REFERENCES ref_keuangan_bu(kode_keuangan);

ALTER TABLE ref_verif_keuangan_bu 
DROP CONSTRAINT ref_verif_keuangan_bu_kode_vendor_penjr_fkey,
ADD CONSTRAINT ref_verif_keuangan_bu_kode_vendor_penjr_fkey 
FOREIGN KEY (kode_vendor_penjr) REFERENCES trx_vendor_penjr(kode_vendor_penjr);

ALTER TABLE ref_verif_keuangan_pero 
DROP CONSTRAINT ref_verif_keuangan_pero_kode_keuangan_fkey,
ADD CONSTRAINT ref_verif_keuangan_pero_kode_keuangan_fkey 
FOREIGN KEY (kode_keuangan) REFERENCES ref_keuangan_pero(kode_keuangan);

ALTER TABLE ref_verif_keuangan_pero 
DROP CONSTRAINT ref_verif_keuangan_pero_kode_vendor_penjr_fkey,
ADD CONSTRAINT ref_verif_keuangan_pero_kode_vendor_penjr_fkey 
FOREIGN KEY (kode_vendor_penjr) REFERENCES trx_vendor_penjr(kode_vendor_penjr);

ALTER TABLE ref_verif_komisaris 
DROP CONSTRAINT ref_verif_komisaris_kode_komisaris_custom_fkey,
ADD CONSTRAINT ref_verif_komisaris_kode_komisaris_custom_fkey 
FOREIGN KEY (kode_komisaris_custom) REFERENCES ref_komisaris_bu_custom(kode_komisaris);

ALTER TABLE ref_verif_komisaris 
DROP CONSTRAINT ref_verif_komisaris_kode_vendor_penjr_fkey,
ADD CONSTRAINT ref_verif_komisaris_kode_vendor_penjr_fkey 
FOREIGN KEY (kode_vendor_penjr) REFERENCES trx_vendor_penjr(kode_vendor_penjr);

ALTER TABLE ref_verif_lan_hukum_bu 
DROP CONSTRAINT ref_verif_lan_hukum_bu_kode_lan_hukum_fkey,
ADD CONSTRAINT ref_verif_lan_hukum_bu_kode_lan_hukum_fkey 
FOREIGN KEY (kode_lan_hukum) REFERENCES ref_lan_hukum_bu(kode_lan_hukum);

ALTER TABLE ref_verif_lan_hukum_bu 
DROP CONSTRAINT ref_verif_lan_hukum_bu_kode_vendor_penjr_fkey,
ADD CONSTRAINT ref_verif_lan_hukum_bu_kode_vendor_penjr_fkey 
FOREIGN KEY (kode_vendor_penjr) REFERENCES trx_vendor_penjr(kode_vendor_penjr);

ALTER TABLE ref_verif_pengalaman_bu 
DROP CONSTRAINT ref_verif_pengalaman_bu_kode_pengalaman_bu_custom_fkey,
ADD CONSTRAINT ref_verif_pengalaman_bu_kode_pengalaman_bu_custom_fkey 
FOREIGN KEY (kode_pengalaman_bu_custom) REFERENCES ref_pengalaman_bu_custom(kode_pengalaman_bu);

ALTER TABLE ref_verif_pengalaman_bu 
DROP CONSTRAINT ref_verif_pengalaman_bu_kode_vendor_penjr_fkey,
ADD CONSTRAINT ref_verif_pengalaman_bu_kode_vendor_penjr_fkey 
FOREIGN KEY (kode_vendor_penjr) REFERENCES trx_vendor_penjr(kode_vendor_penjr);

ALTER TABLE ref_verif_pengalaman_pero 
DROP CONSTRAINT ref_verif_pengalaman_pero_kode_pengalaman_custom_fkey,
ADD CONSTRAINT ref_verif_pengalaman_pero_kode_pengalaman_custom_fkey 
FOREIGN KEY (kode_pengalaman_custom) REFERENCES ref_pengalaman_pero_custom(kode_pengalaman);

ALTER TABLE ref_verif_pengalaman_pero 
DROP CONSTRAINT ref_verif_pengalaman_pero_kode_vendor_penjr_fkey,
ADD CONSTRAINT ref_verif_pengalaman_pero_kode_vendor_penjr_fkey 
FOREIGN KEY (kode_vendor_penjr) REFERENCES trx_vendor_penjr(kode_vendor_penjr);

ALTER TABLE ref_verif_saham_bu 
DROP CONSTRAINT ref_verif_saham_bu_kode_saham_custom_fkey,
ADD CONSTRAINT ref_verif_saham_bu_kode_saham_custom_fkey 
FOREIGN KEY (kode_saham_custom) REFERENCES ref_saham_bu_custom(kode_saham);

ALTER TABLE ref_verif_saham_bu 
DROP CONSTRAINT ref_verif_saham_bu_kode_vendor_penjr_fkey,
ADD CONSTRAINT ref_verif_saham_bu_kode_vendor_penjr_fkey 
FOREIGN KEY (kode_vendor_penjr) REFERENCES trx_vendor_penjr(kode_vendor_penjr);

ALTER TABLE ref_verif_sertif_pero 
DROP CONSTRAINT ref_verif_sertif_pero_kode_vendor_penjr_fkey,
ADD CONSTRAINT ref_verif_sertif_pero_kode_vendor_penjr_fkey 
FOREIGN KEY (kode_vendor_penjr) REFERENCES trx_vendor_penjr(kode_vendor_penjr);

ALTER TABLE ref_verif_sertifikat_usaha_bu 
DROP CONSTRAINT ref_verif_sertifikat_usaha_bu_kode_sertifikat_usaha_custom_fkey,
ADD CONSTRAINT ref_verif_sertifikat_usaha_bu_kode_sertifikat_usaha_custom_fkey 
FOREIGN KEY (kode_sertifikat_usaha_custom) REFERENCES ref_sertifikat_usaha_bu_custom(kode_sertifikat_usaha);

ALTER TABLE ref_verif_sertifikat_usaha_bu 
DROP CONSTRAINT ref_verif_sertifikat_usaha_bu_kode_vendor_penjr_fkey,
ADD CONSTRAINT ref_verif_sertifikat_usaha_bu_kode_vendor_penjr_fkey 
FOREIGN KEY (kode_vendor_penjr) REFERENCES trx_vendor_penjr(kode_vendor_penjr);

ALTER TABLE ref_verif_tenaga_ahli_bu 
DROP CONSTRAINT ref_verif_tenaga_ahli_bu_kode_tenaga_ahli_custom_fkey,
ADD CONSTRAINT ref_verif_tenaga_ahli_bu_kode_tenaga_ahli_custom_fkey 
FOREIGN KEY (kode_tenaga_ahli_custom) REFERENCES ref_tenaga_ahli_bu_custom(kode_tenaga_ahli);

ALTER TABLE ref_verif_tenaga_ahli_bu 
DROP CONSTRAINT ref_verif_tenaga_ahli_bu_kode_vendor_penjr_fkey,
ADD CONSTRAINT ref_verif_tenaga_ahli_bu_kode_vendor_penjr_fkey 
FOREIGN KEY (kode_vendor_penjr) REFERENCES trx_vendor_penjr(kode_vendor_penjr);

ALTER TABLE ref_verif_tenaga_pendukung_bu 
DROP CONSTRAINT ref_verif_tenaga_pendukung_bu_kode_tenaga_pendukung_custom_fkey,
ADD CONSTRAINT ref_verif_tenaga_pendukung_bu_kode_tenaga_pendukung_custom_fkey 
FOREIGN KEY (kode_tenaga_pendukung_custom) REFERENCES ref_tenaga_pendukung_bu_custom(kode_tenaga_pendukung);

ALTER TABLE ref_verif_tenaga_pendukung_bu 
DROP CONSTRAINT ref_verif_tenaga_pendukung_bu_kode_vendor_penjr_fkey,
ADD CONSTRAINT ref_verif_tenaga_pendukung_bu_kode_vendor_penjr_fkey 
FOREIGN KEY (kode_vendor_penjr) REFERENCES trx_vendor_penjr(kode_vendor_penjr);

ALTER TABLE trx_custom_item 
DROP CONSTRAINT trx_custom_item_kode_vendor_fkey,
ADD CONSTRAINT trx_custom_item_kode_vendor_fkey 
FOREIGN KEY (kode_vendor) REFERENCES ref_vendor(kode_vendor);

ALTER TABLE trx_kategori 
DROP CONSTRAINT trx_kategori_kode_kategori_fkey,
ADD CONSTRAINT trx_kategori_kode_kategori_fkey 
FOREIGN KEY (kode_kategori) REFERENCES ref_kategori(kode_kategori);

ALTER TABLE trx_kehadiran_verif 
DROP CONSTRAINT trx_kehadiran_verif_kode_undangan_verif_fkey,
ADD CONSTRAINT trx_kehadiran_verif_kode_undangan_verif_fkey 
FOREIGN KEY (kode_undangan_verif) REFERENCES trx_undangan_verif(kode_undangan_verif);

ALTER TABLE trx_ketentuan_umum_khusus 
DROP CONSTRAINT trx_ketentuan_umum_khusus_kode_penjaringan_fkey,
ADD CONSTRAINT trx_ketentuan_umum_khusus_kode_penjaringan_fkey 
FOREIGN KEY (kode_penjaringan) REFERENCES trx_penjaringan(kode_penjaringan);

ALTER TABLE trx_ketentuan_umum_khusus 
DROP CONSTRAINT trx_ketentuan_umum_khusus_kode_subkat_fkey,
ADD CONSTRAINT trx_ketentuan_umum_khusus_kode_subkat_fkey 
FOREIGN KEY (kode_subkat) REFERENCES ref_subkat_persyaratan(kode_subkat);

ALTER TABLE trx_kualifikasi_usaha_penjr 
DROP CONSTRAINT trx_kualifikasi_usaha_penjr_kode_kualifikasi_usaha_fkey,
ADD CONSTRAINT trx_kualifikasi_usaha_penjr_kode_kualifikasi_usaha_fkey 
FOREIGN KEY (kode_kualifikasi_usaha) REFERENCES ref_kualifikasi_usaha(kode_kualifikasi_usaha);

ALTER TABLE trx_kualifikasi_usaha_penjr 
DROP CONSTRAINT trx_kualifikasi_usaha_penjr_kode_penjaringan_fkey,
ADD CONSTRAINT trx_kualifikasi_usaha_penjr_kode_penjaringan_fkey 
FOREIGN KEY (kode_penjaringan) REFERENCES trx_penjaringan(kode_penjaringan);

ALTER TABLE trx_nilai_akhir 
DROP CONSTRAINT trx_nilai_akhir_kode_vendor_penjr_fkey,
ADD CONSTRAINT trx_nilai_akhir_kode_vendor_penjr_fkey 
FOREIGN KEY (kode_vendor_penjr) REFERENCES trx_vendor_penjr(kode_vendor_penjr);

ALTER TABLE trx_penjaringan 
DROP CONSTRAINT trx_penjaringan_kode_jenis_pengadaan_fkey,
ADD CONSTRAINT trx_penjaringan_kode_jenis_pengadaan_fkey 
FOREIGN KEY (kode_jenis_pengadaan) REFERENCES ref_jenis_pengadaan(kode_jenis_pengadaan);

ALTER TABLE trx_penjaringan 
DROP CONSTRAINT trx_penjaringan_kode_jenis_vendor_fkey,
ADD CONSTRAINT trx_penjaringan_kode_jenis_vendor_fkey 
FOREIGN KEY (kode_jenis_vendor) REFERENCES ref_jenis_vendor(kode_jenis_vendor);

ALTER TABLE trx_penjaringan 
DROP CONSTRAINT trx_penjaringan_kode_status_pengajuan_fkey,
ADD CONSTRAINT trx_penjaringan_kode_status_pengajuan_fkey 
FOREIGN KEY (kode_status_pengajuan) REFERENCES ref_status_pengajuan(kode_status_pengajuan);

ALTER TABLE trx_penjaringan 
DROP CONSTRAINT trx_penjaringan_kode_status_penjaringan_fkey,
ADD CONSTRAINT trx_penjaringan_kode_status_penjaringan_fkey 
FOREIGN KEY (kode_status_penjaringan) REFERENCES ref_status_penjaringan(kode_status_penjaringan);

ALTER TABLE trx_penjaringan 
DROP CONSTRAINT trx_penjaringan_kode_trx_kategori_fkey,
ADD CONSTRAINT trx_penjaringan_kode_trx_kategori_fkey 
FOREIGN KEY (kode_trx_kategori) REFERENCES trx_kategori(kode_trx_kategori);

ALTER TABLE trx_tim_teknis_pendukung 
DROP CONSTRAINT trx_tim_teknis_pendukung_kode_undangan_verif_fkey,
ADD CONSTRAINT trx_tim_teknis_pendukung_kode_undangan_verif_fkey 
FOREIGN KEY (kode_undangan_verif) REFERENCES trx_undangan_verif(kode_undangan_verif);

ALTER TABLE trx_undangan_penjr 
DROP CONSTRAINT trx_undangan_penjr_kode_penjaringan_fkey,
ADD CONSTRAINT trx_undangan_penjr_kode_penjaringan_fkey 
FOREIGN KEY (kode_penjaringan) REFERENCES trx_penjaringan(kode_penjaringan);

ALTER TABLE trx_undangan_penjr 
DROP CONSTRAINT trx_undangan_penjr_kode_vendor_fkey,
ADD CONSTRAINT trx_undangan_penjr_kode_vendor_fkey 
FOREIGN KEY (kode_vendor) REFERENCES ref_vendor(kode_vendor);

ALTER TABLE trx_undangan_verif 
DROP CONSTRAINT trx_undangan_verif_kode_vendor_penjr_fkey,
ADD CONSTRAINT trx_undangan_verif_kode_vendor_penjr_fkey 
FOREIGN KEY (kode_vendor_penjr) REFERENCES trx_vendor_penjr(kode_vendor_penjr);

ALTER TABLE trx_vendor_penjr 
DROP CONSTRAINT trx_vendor_penjr_kode_penjaringan_fkey,
ADD CONSTRAINT trx_vendor_penjr_kode_penjaringan_fkey 
FOREIGN KEY (kode_penjaringan) REFERENCES trx_penjaringan(kode_penjaringan);

ALTER TABLE trx_vendor_penjr 
DROP CONSTRAINT trx_vendor_penjr_kode_vendor_fkey,
ADD CONSTRAINT trx_vendor_penjr_kode_vendor_fkey 
FOREIGN KEY (kode_vendor) REFERENCES ref_vendor(kode_vendor);

ALTER TABLE trx_verifikator_penjr 
DROP CONSTRAINT trx_verifikator_penjr_kode_penjaringan_fkey,
ADD CONSTRAINT trx_verifikator_penjr_kode_penjaringan_fkey 
FOREIGN KEY (kode_penjaringan) REFERENCES trx_penjaringan(kode_penjaringan);