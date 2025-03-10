ALTER TABLE "ref_vendor_register" ADD FOREIGN KEY ("kode_vendor") REFERENCES "ref_vendor" ("kode_vendor");

ALTER TABLE "ref_vendor_reg_history" ADD FOREIGN KEY ("kode_vendor") REFERENCES "ref_vendor" ("kode_vendor");

ALTER TABLE "ref_vendor_blacklist" ADD FOREIGN KEY ("kode_vendor") REFERENCES "ref_vendor" ("kode_vendor");

ALTER TABLE "trx_kategori" ADD FOREIGN KEY ("kode_kategori") REFERENCES "ref_kategori" ("kode_kategori");

ALTER TABLE "trx_jawab_profil" ADD FOREIGN KEY ("kode_vendor") REFERENCES "ref_vendor" ("kode_vendor");

ALTER TABLE "ref_cabang_ut" ADD FOREIGN KEY ("kode_ppk") REFERENCES "ref_ppk" ("kode_ppk");

ALTER TABLE "trx_penjaringan" ADD FOREIGN KEY ("kode_trx_kategori") REFERENCES "trx_kategori" ("kode_trx_kategori");

ALTER TABLE "trx_undangan_penjr" ADD FOREIGN KEY ("kode_penjaringan") REFERENCES "trx_penjaringan" ("kode_penjaringan");

ALTER TABLE "trx_verifikator_penjr" ADD FOREIGN KEY ("kode_penjaringan") REFERENCES "trx_penjaringan" ("kode_penjaringan");

ALTER TABLE "trx_vendor_penjr" ADD FOREIGN KEY ("kode_penjaringan") REFERENCES "trx_penjaringan" ("kode_penjaringan");

ALTER TABLE "trx_kategori" ADD FOREIGN KEY ("kode_jenis_pengadaan") REFERENCES "ref_jenis_pengadaan" ("kode_jenis_pengadaan");

ALTER TABLE "trx_eval_vendor" ADD FOREIGN KEY ("kode_vendor_penjr") REFERENCES "trx_vendor_penjr" ("kode_vendor_penjr");

ALTER TABLE "trx_vendor_penjr" ADD FOREIGN KEY ("kode_vendor") REFERENCES "ref_vendor" ("kode_vendor");

ALTER TABLE "ref_direksi_perusahaan" ADD FOREIGN KEY ("kode_vendor") REFERENCES "ref_vendor" ("kode_vendor");

ALTER TABLE "trx_ketentuan_umum_khusus" ADD FOREIGN KEY ("kode_trx_kategori") REFERENCES "trx_kategori" ("kode_trx_kategori");

ALTER TABLE "ref_item_tanya" ADD FOREIGN KEY ("kode_kat_item_tanya") REFERENCES "ref_kat_item_tanya" ("kode_kat_item_tanya");

ALTER TABLE "trx_jawab_profil" ADD FOREIGN KEY ("kode_item") REFERENCES "ref_item_tanya" ("kode_item");

ALTER TABLE "trx_penjaringan" ADD FOREIGN KEY ("kode_cabang_ut") REFERENCES "ref_cabang_ut" ("kode_cabang_ut");

ALTER TABLE "trx_jawab_item" ADD FOREIGN KEY ("kode_vendor") REFERENCES "ref_vendor" ("kode_vendor");

ALTER TABLE "ref_vendor_register" ADD FOREIGN KEY ("kode_jenis_vendor") REFERENCES "ref_jenis_vendor" ("kode_jenis_vendor");

ALTER TABLE "ref_vendor" ADD FOREIGN KEY ("kode_jenis_vendor") REFERENCES "ref_jenis_vendor" ("kode_jenis_vendor");

ALTER TABLE "ref_pengalaman_perorangan" ADD FOREIGN KEY ("kode_vendor") REFERENCES "ref_vendor" ("kode_vendor");

ALTER TABLE "ref_sertif_perorangan" ADD FOREIGN KEY ("kode_vendor") REFERENCES "ref_vendor" ("kode_vendor");

ALTER TABLE "ref_ijin_usaha_perusahaan" ADD FOREIGN KEY ("kode_vendor") REFERENCES "ref_vendor" ("kode_vendor");

ALTER TABLE "ref_akta_perusahaan" ADD FOREIGN KEY ("kode_vendor") REFERENCES "ref_vendor" ("kode_vendor");

ALTER TABLE "ref_fasilitas_perusahaan" ADD FOREIGN KEY ("kode_vendor") REFERENCES "ref_vendor" ("kode_vendor");

ALTER TABLE "ref_komisaris_perusahaan" ADD FOREIGN KEY ("kode_vendor") REFERENCES "ref_vendor" ("kode_vendor");

ALTER TABLE "ref_personalia_perusahaan" ADD FOREIGN KEY ("kode_vendor") REFERENCES "ref_vendor" ("kode_vendor");

ALTER TABLE "ref_pengalaman_sekarang" ADD FOREIGN KEY ("kode_vendor") REFERENCES "ref_vendor" ("kode_vendor");

ALTER TABLE "ref_saham_perusahaan" ADD FOREIGN KEY ("kode_vendor") REFERENCES "ref_vendor" ("kode_vendor");

ALTER TABLE "trx_komen_verif" ADD FOREIGN KEY ("kode_vendor") REFERENCES "ref_vendor" ("kode_vendor");

ALTER TABLE "trx_komen_verif" ADD FOREIGN KEY ("kode_kat_item_tanya") REFERENCES "ref_kat_item_tanya" ("kode_kat_item_tanya");

ALTER TABLE "trx_penilaian" ADD FOREIGN KEY ("kode_eval_vendor") REFERENCES "trx_eval_vendor" ("kode_eval_vendor");

ALTER TABLE "trx_penilaian" ADD FOREIGN KEY ("kode_item_penilaian") REFERENCES "ref_item_penilaian" ("kode_item_penilaian");

ALTER TABLE "ref_item_penilaian" ADD FOREIGN KEY ("kode_kelompok_item_penilaian") REFERENCES "ref_kelompok_item_penilaian" ("kode_kelompok_item_penilaian");

ALTER TABLE "ref_kat_dokumen_vendor" ADD FOREIGN KEY ("kode_jenis_vendor") REFERENCES "ref_jenis_vendor" ("kode_jenis_vendor");

ALTER TABLE "ref_kat_item_tanya" ADD FOREIGN KEY ("kode_kat_dokumen_vendor") REFERENCES "ref_kat_dokumen_vendor" ("kode_kat_dokumen_vendor");

ALTER TABLE "ref_pengalaman" ADD FOREIGN KEY ("kode_vendor") REFERENCES "ref_vendor" ("kode_vendor");

ALTER TABLE "trx_kat_dok_komplit" ADD FOREIGN KEY ("kode_kat_dokumen_vendor") REFERENCES "ref_kat_dokumen_vendor" ("kode_kat_dokumen_vendor");

ALTER TABLE "trx_kat_dok_komplit" ADD FOREIGN KEY ("kode_vendor") REFERENCES "ref_vendor" ("kode_vendor");

ALTER TABLE "ref_item_tanya" ADD FOREIGN KEY ("tipe_input") REFERENCES "ref_tipe_input" ("tipe_input");

ALTER TABLE "trx_jawab_item" ADD FOREIGN KEY ("kode_item") REFERENCES "ref_item_tanya" ("kode_item");

ALTER TABLE "trx_jawab_item" ADD FOREIGN KEY ("kode_paket") REFERENCES "trx_kategori" ("kode_trx_kategori");

ALTER TABLE "trx_ketentuan_umum_khusus" ADD FOREIGN KEY ("kode_kat_item_tanya") REFERENCES "ref_kat_item_tanya" ("kode_kat_item_tanya");

ALTER TABLE "trx_kat_j_vendor" ADD FOREIGN KEY ("kode_trx_kategori") REFERENCES "trx_kategori" ("kode_trx_kategori");

ALTER TABLE "trx_kat_j_vendor" ADD FOREIGN KEY ("kode_jenis_vendor") REFERENCES "ref_jenis_vendor" ("kode_jenis_vendor");

ALTER TABLE "ref_item_tanya" ADD FOREIGN KEY ("kode_trx_kategori") REFERENCES "trx_kategori" ("kode_trx_kategori");
