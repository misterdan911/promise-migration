ALTER TABLE ref_akta_perusahaan DROP CONSTRAINT ref_akta_perusahaan_kode_vendor_fkey;
ALTER TABLE ref_cabang_ut DROP CONSTRAINT ref_cabang_ut_kode_ppk_fkey;
ALTER TABLE ref_direksi_perusahaan DROP CONSTRAINT ref_direksi_perusahaan_kode_vendor_fkey;
ALTER TABLE ref_fasilitas_perusahaan DROP CONSTRAINT ref_fasilitas_perusahaan_kode_vendor_fkey;
ALTER TABLE ref_ijin_usaha_perusahaan DROP CONSTRAINT ref_ijin_usaha_perusahaan_kode_vendor_fkey;
ALTER TABLE ref_item_penilaian DROP CONSTRAINT ref_item_penilaian_kode_kelompok_item_penilaian_fkey;
ALTER TABLE ref_item_tanya DROP CONSTRAINT ref_item_tanya_tipe_input_fkey;
ALTER TABLE ref_item_tanya DROP CONSTRAINT ref_item_tanya_kode_kat_item_tanya_fkey;
ALTER TABLE ref_item_tanya DROP CONSTRAINT ref_item_tanya_kode_trx_kategori_fkey;
ALTER TABLE ref_kat_dokumen_vendor DROP CONSTRAINT ref_kat_dokumen_vendor_kode_jenis_vendor_fkey;
ALTER TABLE ref_kat_item_tanya DROP CONSTRAINT ref_kat_item_tanya_kode_kat_dokumen_vendor_fkey;
ALTER TABLE ref_komisaris_perusahaan DROP CONSTRAINT ref_komisaris_perusahaan_kode_vendor_fkey;
ALTER TABLE ref_pengalaman DROP CONSTRAINT ref_pengalaman_kode_vendor_fkey;
ALTER TABLE ref_pengalaman_perorangan DROP CONSTRAINT ref_pengalaman_perorangan_kode_vendor_fkey;
ALTER TABLE ref_pengalaman_sekarang DROP CONSTRAINT ref_pengalaman_sekarang_kode_vendor_fkey;
ALTER TABLE ref_personalia_perusahaan DROP CONSTRAINT ref_personalia_perusahaan_kode_vendor_fkey;
ALTER TABLE ref_saham_perusahaan DROP CONSTRAINT ref_saham_perusahaan_kode_vendor_fkey;
ALTER TABLE ref_sertif_perorangan DROP CONSTRAINT ref_sertif_perorangan_kode_vendor_fkey;
ALTER TABLE ref_vendor DROP CONSTRAINT ref_vendor_kode_jenis_vendor_fkey;
ALTER TABLE ref_vendor_blacklist DROP CONSTRAINT ref_vendor_blacklist_kode_vendor_fkey;
ALTER TABLE ref_vendor_reg_history DROP CONSTRAINT ref_vendor_reg_history_kode_vendor_fkey;
ALTER TABLE ref_vendor_register DROP CONSTRAINT ref_vendor_register_kode_vendor_fkey;
ALTER TABLE ref_vendor_register DROP CONSTRAINT ref_vendor_register_kode_jenis_vendor_fkey;
ALTER TABLE trx_eval_vendor DROP CONSTRAINT trx_eval_vendor_kode_vendor_penjr_fkey;
ALTER TABLE trx_jawab_item DROP CONSTRAINT trx_jawab_item_kode_paket_fkey;
ALTER TABLE trx_jawab_item DROP CONSTRAINT trx_jawab_item_kode_vendor_fkey;
ALTER TABLE trx_jawab_item DROP CONSTRAINT trx_jawab_item_kode_item_fkey;
ALTER TABLE trx_jawab_profil DROP CONSTRAINT trx_jawab_profil_kode_vendor_fkey;
ALTER TABLE trx_jawab_profil DROP CONSTRAINT trx_jawab_profil_kode_item_fkey;
ALTER TABLE trx_kat_dok_komplit DROP CONSTRAINT trx_kat_dok_komplit_kode_vendor_fkey;
ALTER TABLE trx_kat_dok_komplit DROP CONSTRAINT trx_kat_dok_komplit_kode_kat_dokumen_vendor_fkey;
ALTER TABLE trx_kat_j_vendor DROP CONSTRAINT trx_kat_j_vendor_kode_jenis_vendor_fkey;
ALTER TABLE trx_kat_j_vendor DROP CONSTRAINT trx_kat_j_vendor_kode_trx_kategori_fkey;
ALTER TABLE trx_kategori DROP CONSTRAINT trx_kategori_kode_jenis_pengadaan_fkey;
ALTER TABLE trx_kategori DROP CONSTRAINT trx_kategori_kode_cabang_ut_fkey;
ALTER TABLE trx_kategori DROP CONSTRAINT trx_kategori_kode_kategori_fkey;
ALTER TABLE trx_ketentuan_umum_khusus DROP CONSTRAINT trx_ketentuan_umum_khusus_kode_trx_kategori_fkey;
ALTER TABLE trx_ketentuan_umum_khusus DROP CONSTRAINT trx_ketentuan_umum_khusus_kode_kat_item_tanya_fkey;
ALTER TABLE trx_komen_verif DROP CONSTRAINT trx_komen_verif_kode_vendor_fkey;
ALTER TABLE trx_komen_verif DROP CONSTRAINT trx_komen_verif_kode_kat_item_tanya_fkey;
ALTER TABLE trx_penilaian DROP CONSTRAINT trx_penilaian_kode_item_penilaian_fkey;
ALTER TABLE trx_penilaian DROP CONSTRAINT trx_penilaian_kode_eval_vendor_fkey;
ALTER TABLE trx_penjaringan DROP CONSTRAINT trx_penjaringan_kode_trx_kategori_fkey;
ALTER TABLE trx_undangan_penjr DROP CONSTRAINT trx_undangan_penjr_kode_penjaringan_fkey;
ALTER TABLE trx_vendor_penjr DROP CONSTRAINT trx_vendor_penjr_kode_vendor_fkey;
ALTER TABLE trx_vendor_penjr DROP CONSTRAINT trx_vendor_penjr_kode_penjaringan_fkey;
ALTER TABLE trx_verifikator_penjr DROP CONSTRAINT trx_verifikator_penjr_kode_penjaringan_fkey;