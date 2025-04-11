ALTER TABLE "trx_kategori" ADD FOREIGN KEY ("kode_kategori") REFERENCES "ref_kategori" ("kode_kategori");

ALTER TABLE "ref_vendor_register" ADD FOREIGN KEY ("kode_vendor") REFERENCES "ref_vendor" ("kode_vendor");

ALTER TABLE "ref_vendor_reg_history" ADD FOREIGN KEY ("kode_vendor") REFERENCES "ref_vendor" ("kode_vendor");

ALTER TABLE "ref_datadiri_umum" ADD FOREIGN KEY ("kode_kualifikasi_usaha") REFERENCES "ref_kualifikasi_usaha" ("kode_kualifikasi_usaha");

ALTER TABLE "ref_vendor" ADD FOREIGN KEY ("kode_jenis_vendor") REFERENCES "ref_jenis_vendor" ("kode_jenis_vendor");

ALTER TABLE "ref_datadiri_umum" ADD FOREIGN KEY ("kode_vendor") REFERENCES "ref_vendor" ("kode_vendor");

ALTER TABLE "ref_datadiri_umum" ADD FOREIGN KEY ("kode_kab_kota_ktp") REFERENCES "ref_kab_kota" ("kode_kab_kota");

ALTER TABLE "ref_datadiri_umum" ADD FOREIGN KEY ("kode_kab_kota_domisili") REFERENCES "ref_kab_kota" ("kode_kab_kota");

ALTER TABLE "ref_komisaris_bu" ADD FOREIGN KEY ("kode_vendor") REFERENCES "ref_vendor" ("kode_vendor");

ALTER TABLE "trx_vendor_penjr" ADD FOREIGN KEY ("kode_vendor") REFERENCES "ref_vendor" ("kode_vendor");

ALTER TABLE "trx_vendor_penjr" ADD FOREIGN KEY ("kode_penjaringan") REFERENCES "trx_penjaringan" ("kode_penjaringan");

ALTER TABLE "ref_direksi_bu" ADD FOREIGN KEY ("kode_vendor") REFERENCES "ref_vendor" ("kode_vendor");

ALTER TABLE "ref_verif_komisaris" ADD FOREIGN KEY ("kode_komisaris") REFERENCES "ref_komisaris_bu" ("kode_komisaris");

ALTER TABLE "ref_verif_direksi" ADD FOREIGN KEY ("kode_direksi") REFERENCES "ref_direksi_bu" ("kode_direksi");

ALTER TABLE "trx_pengurus_bu_verif" ADD FOREIGN KEY ("kode_pengurus_bu") REFERENCES "ref_pengurus_bu" ("kode_pengurus_bu");

ALTER TABLE "ref_pakta_integritas" ADD FOREIGN KEY ("kode_vendor") REFERENCES "ref_vendor" ("kode_vendor");

ALTER TABLE "trx_kategori" ADD FOREIGN KEY ("kode_jenis_pengadaan") REFERENCES "ref_jenis_pengadaan" ("kode_jenis_pengadaan");

ALTER TABLE "trx_penjaringan" ADD FOREIGN KEY ("kode_trx_kategori") REFERENCES "trx_kategori" ("kode_trx_kategori");

ALTER TABLE "trx_kat_j_vendor" ADD FOREIGN KEY ("kode_trx_kategori") REFERENCES "trx_kategori" ("kode_trx_kategori");

ALTER TABLE "trx_kat_j_vendor" ADD FOREIGN KEY ("kode_jenis_vendor") REFERENCES "ref_jenis_vendor" ("kode_jenis_vendor");

ALTER TABLE "ref_pengalaman_pero" ADD FOREIGN KEY ("kode_personalia") REFERENCES "ref_personalia_pero" ("kode_personalia");

ALTER TABLE "ref_sertif_pero" ADD FOREIGN KEY ("kode_personalia") REFERENCES "ref_personalia_pero" ("kode_personalia");

ALTER TABLE "ref_pengurus_bu" ADD FOREIGN KEY ("kode_vendor") REFERENCES "ref_vendor" ("kode_vendor");

ALTER TABLE "ref_izin_usaha_bu" ADD FOREIGN KEY ("kode_vendor") REFERENCES "ref_vendor" ("kode_vendor");

ALTER TABLE "ref_saham_bu" ADD FOREIGN KEY ("kode_vendor") REFERENCES "ref_vendor" ("kode_vendor");

ALTER TABLE "ref_data_pajak_bu" ADD FOREIGN KEY ("kode_vendor") REFERENCES "ref_vendor" ("kode_vendor");

ALTER TABLE "ref_tenaga_ahli_bu" ADD FOREIGN KEY ("kode_vendor") REFERENCES "ref_vendor" ("kode_vendor");

ALTER TABLE "ref_pengalaman_ta" ADD FOREIGN KEY ("kode_tenaga_ahli") REFERENCES "ref_tenaga_ahli_bu" ("kode_tenaga_ahli");

ALTER TABLE "ref_tenaga_ahli_bu" ADD FOREIGN KEY ("kode_jenjang_pendidikan") REFERENCES "ref_jenjang_pendidikan" ("kode_jenjang_pendidikan");

ALTER TABLE "ref_sertif_ta" ADD FOREIGN KEY ("kode_tenaga_ahli") REFERENCES "ref_tenaga_ahli_bu" ("kode_tenaga_ahli");

ALTER TABLE "ref_pengalaman_tp" ADD FOREIGN KEY ("kode_tenaga_pendukung") REFERENCES "ref_tenaga_pendukung_bu" ("kode_tenaga_pendukung");

ALTER TABLE "ref_sertif_tp" ADD FOREIGN KEY ("kode_tenaga_pendukung") REFERENCES "ref_tenaga_pendukung_bu" ("kode_tenaga_pendukung");

ALTER TABLE "ref_tenaga_pendukung_bu" ADD FOREIGN KEY ("kode_vendor") REFERENCES "ref_vendor" ("kode_vendor");

ALTER TABLE "ref_kantor_bu" ADD FOREIGN KEY ("kode_vendor") REFERENCES "ref_vendor" ("kode_vendor");

ALTER TABLE "ref_fasilitas_bu" ADD FOREIGN KEY ("kode_vendor") REFERENCES "ref_vendor" ("kode_vendor");

ALTER TABLE "ref_pengalaman_bu" ADD FOREIGN KEY ("kode_vendor") REFERENCES "ref_vendor" ("kode_vendor");

ALTER TABLE "trx_verifikator_penjr" ADD FOREIGN KEY ("kode_penjaringan") REFERENCES "trx_penjaringan" ("kode_penjaringan");

ALTER TABLE "trx_undangan_verif" ADD FOREIGN KEY ("kode_vendor_penjr") REFERENCES "trx_vendor_penjr" ("kode_vendor_penjr");

ALTER TABLE "trx_undangan_penjr" ADD FOREIGN KEY ("kode_penjaringan") REFERENCES "trx_penjaringan" ("kode_penjaringan");

ALTER TABLE "trx_tim_teknis_pendukung" ADD FOREIGN KEY ("kode_undangan_verif") REFERENCES "trx_undangan_verif" ("kode_undangan_verif");

ALTER TABLE "ref_administrasi_pero" ADD FOREIGN KEY ("kode_vendor") REFERENCES "ref_vendor" ("kode_vendor");

ALTER TABLE "ref_verif_administrasi_pero" ADD FOREIGN KEY ("kode_vendor_penjr") REFERENCES "trx_vendor_penjr" ("kode_vendor_penjr");

ALTER TABLE "ref_verif_datadiri_umum" ADD FOREIGN KEY ("kode_datadiri_umum") REFERENCES "ref_datadiri_umum" ("kode_datadiri_umum");

ALTER TABLE "ref_verif_pengalaman_pero" ADD FOREIGN KEY ("kode_vendor_penjr") REFERENCES "trx_vendor_penjr" ("kode_vendor_penjr");

ALTER TABLE "ref_verif_pengalaman_pero" ADD FOREIGN KEY ("kode_pengalaman") REFERENCES "ref_pengalaman_pero" ("kode_pengalaman");

ALTER TABLE "ref_verif_sertif_pero" ADD FOREIGN KEY ("kode_vendor_penjr") REFERENCES "trx_vendor_penjr" ("kode_vendor_penjr");

ALTER TABLE "ref_verif_sertif_pero" ADD FOREIGN KEY ("kode_sertif") REFERENCES "ref_sertif_pero" ("kode_sertif");

ALTER TABLE "ref_v_keluar_dpt" ADD FOREIGN KEY ("kode_sanksi_vendor") REFERENCES "ref_sanksi_vendor" ("kode_sanksi_vendor");

ALTER TABLE "ref_v_keluar_dpt" ADD FOREIGN KEY ("kode_status_keluar_dpt") REFERENCES "ref_status_keluar_dpt" ("kode_status_keluar_dpt");

ALTER TABLE "ref_v_keluar_dpt" ADD FOREIGN KEY ("kode_vendor") REFERENCES "ref_vendor" ("kode_vendor");

ALTER TABLE "ref_subkat_persyaratan" ADD FOREIGN KEY ("kode_kat_persyaratan") REFERENCES "ref_kat_persyaratan" ("kode_kat_persyaratan");

ALTER TABLE "ref_kat_item_tanya" ADD FOREIGN KEY ("kode_subkat") REFERENCES "ref_subkat_persyaratan" ("kode_subkat");

ALTER TABLE "ref_item_tanya" ADD FOREIGN KEY ("kode_kat_item_tanya") REFERENCES "ref_kat_item_tanya" ("ref_kat_item_tanya");

ALTER TABLE "trx_ketentuan_umum_khusus" ADD FOREIGN KEY ("kode_subkat") REFERENCES "ref_subkat_persyaratan" ("kode_subkat");

ALTER TABLE "trx_ketentuan_umum_khusus" ADD FOREIGN KEY ("kode_trx_kategori") REFERENCES "trx_kategori" ("kode_trx_kategori");

ALTER TABLE "ref_keuangan_pero" ADD FOREIGN KEY ("kode_vendor") REFERENCES "ref_vendor" ("kode_vendor");

ALTER TABLE "ref_verif_keuangan_pero" ADD FOREIGN KEY ("kode_vendor_penjr") REFERENCES "trx_vendor_penjr" ("kode_vendor_penjr");

ALTER TABLE "ref_verif_keuangan_pero" ADD FOREIGN KEY ("kode_keuangan") REFERENCES "ref_keuangan_pero" ("kode_keuangan");

ALTER TABLE "ref_verif_adm_bu" ADD FOREIGN KEY ("kode_adm_bu") REFERENCES "ref_adm_bu" ("kode_adm_bu");

ALTER TABLE "ref_verif_adm_bu" ADD FOREIGN KEY ("kode_vendor_penjr") REFERENCES "trx_vendor_penjr" ("kode_vendor_penjr");

ALTER TABLE "ref_verif_lan_hukum_bu" ADD FOREIGN KEY ("kode_lan_hukum") REFERENCES "ref_lan_hukum_bu" ("kode_lan_hukum");

ALTER TABLE "ref_verif_lan_hukum_bu" ADD FOREIGN KEY ("kode_vendor_penjr") REFERENCES "trx_vendor_penjr" ("kode_vendor_penjr");

ALTER TABLE "trx_pengurus_bu_verif" ADD FOREIGN KEY ("kode_vendor_penjr") REFERENCES "trx_vendor_penjr" ("kode_vendor_penjr");

ALTER TABLE "ref_verif_komisaris" ADD FOREIGN KEY ("kode_vendor_penjr") REFERENCES "trx_vendor_penjr" ("kode_vendor_penjr");

ALTER TABLE "ref_verif_direksi" ADD FOREIGN KEY ("kode_vendor_penjr") REFERENCES "trx_vendor_penjr" ("kode_vendor_penjr");

ALTER TABLE "ref_verif_izin_usaha_bu" ADD FOREIGN KEY ("kode_izin_usaha") REFERENCES "ref_izin_usaha_bu" ("kode_izin_usaha");

ALTER TABLE "ref_verif_sertifikat_usaha_bu" ADD FOREIGN KEY ("kode_sertifikat_usaha") REFERENCES "ref_sertifikat_usaha_bu" ("kode_sertifikat_usaha");

ALTER TABLE "ref_verif_izin_usaha_bu" ADD FOREIGN KEY ("kode_vendor_penjr") REFERENCES "trx_vendor_penjr" ("kode_vendor_penjr");

ALTER TABLE "ref_verif_sertifikat_usaha_bu" ADD FOREIGN KEY ("kode_vendor_penjr") REFERENCES "trx_vendor_penjr" ("kode_vendor_penjr");

ALTER TABLE "ref_verif_saham_bu" ADD FOREIGN KEY ("kode_vendor_penjr") REFERENCES "trx_vendor_penjr" ("kode_vendor_penjr");

ALTER TABLE "ref_verif_saham_bu" ADD FOREIGN KEY ("kode_saham") REFERENCES "ref_saham_bu" ("kode_saham");

ALTER TABLE "ref_verif_data_pajak_bu" ADD FOREIGN KEY ("kode_vendor_penjr") REFERENCES "trx_vendor_penjr" ("kode_vendor_penjr");

ALTER TABLE "ref_verif_data_pajak_bu" ADD FOREIGN KEY ("kode_data_pajak") REFERENCES "ref_data_pajak_bu" ("kode_data_pajak");

ALTER TABLE "ref_verif_tenaga_ahli_bu" ADD FOREIGN KEY ("kode_vendor_penjr") REFERENCES "trx_vendor_penjr" ("kode_vendor_penjr");

ALTER TABLE "ref_verif_tenaga_ahli_bu" ADD FOREIGN KEY ("kode_tenaga_ahli") REFERENCES "ref_tenaga_ahli_bu" ("kode_tenaga_ahli");

ALTER TABLE "ref_verif_tenaga_pendukung_bu" ADD FOREIGN KEY ("kode_vendor_penjr") REFERENCES "trx_vendor_penjr" ("kode_vendor_penjr");

ALTER TABLE "ref_verif_tenaga_pendukung_bu" ADD FOREIGN KEY ("kode_tenaga_pendukung") REFERENCES "ref_tenaga_pendukung_bu" ("kode_tenaga_pendukung");

ALTER TABLE "ref_verif_kantor_bu" ADD FOREIGN KEY ("kode_vendor_penjr") REFERENCES "trx_vendor_penjr" ("kode_vendor_penjr");

ALTER TABLE "ref_verif_kantor_bu" ADD FOREIGN KEY ("kode_kantor") REFERENCES "ref_kantor_bu" ("kode_kantor");

ALTER TABLE "ref_verif_fasilitas_bu" ADD FOREIGN KEY ("kode_vendor_penjr") REFERENCES "trx_vendor_penjr" ("kode_vendor_penjr");

ALTER TABLE "ref_verif_fasilitas_bu" ADD FOREIGN KEY ("kode_fasilitas") REFERENCES "ref_fasilitas_bu" ("kode_fasilitas");

ALTER TABLE "ref_verif_pengalaman_bu" ADD FOREIGN KEY ("kode_vendor_penjr") REFERENCES "trx_vendor_penjr" ("kode_vendor_penjr");

ALTER TABLE "ref_verif_pengalaman_bu" ADD FOREIGN KEY ("kode_pengalaman_bu") REFERENCES "ref_pengalaman_bu" ("kode_pengalaman_bu");

ALTER TABLE "ref_item_tanya" ADD FOREIGN KEY ("tipe_input") REFERENCES "ref_tipe_input" ("tipe_input");

ALTER TABLE "ref_verif_keuangan_bu" ADD FOREIGN KEY ("kode_vendor_penjr") REFERENCES "trx_vendor_penjr" ("kode_vendor_penjr");

ALTER TABLE "ref_verif_keuangan_bu" ADD FOREIGN KEY ("kode_keuangan") REFERENCES "ref_keuangan_bu" ("kode_keuangan");

ALTER TABLE "trx_nilai_akhir" ADD FOREIGN KEY ("kode_vendor_penjr") REFERENCES "trx_vendor_penjr" ("kode_vendor_penjr");