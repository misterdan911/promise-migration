COMMENT ON TABLE "helper_kategori_kw" IS 'table sementara untuk bantu migrasi';

COMMENT ON TABLE "helper_pengusul_pjr" IS 'table sementara untuk bantu migrasi';

COMMENT ON COLUMN "ref_item_tanya"."jenis_item" IS 'default, custom';

COMMENT ON TABLE "ref_item_tanya_tpl" IS 'Master Custom Item';

COMMENT ON TABLE "ref_kategori" IS 'Daftar kategori yang bisa digunakan PPK bila ada pengajuan';

COMMENT ON TABLE "ref_jenis_pengadaan" IS 'Barang, Jasa Konsultansi, Konstruksi, Jasa Lainnya';

COMMENT ON TABLE "trx_kategori" IS 'Paket pengadaan disebut dengan istilah "Kategori"';

COMMENT ON COLUMN "trx_kategori"."status_persetujuan" IS 'Flag pengajuan paket diterima atau tidak (belum_diproses, proses, terima, tolak)';

COMMENT ON COLUMN "trx_kategori"."kode_unit_pbj" IS 'Unit yang mengajukan kategori, ambil dari ???';

COMMENT ON COLUMN "trx_kategori"."ucr" IS 'Email User yang membuat paket';

COMMENT ON COLUMN "trx_penjaringan"."metode" IS 'pengumuman, undangan';

COMMENT ON COLUMN "trx_penjaringan"."file_persyaratan" IS 'File PDF Persyaratan';

COMMENT ON COLUMN "trx_penjaringan"."status_persetujuan" IS 'Flag pengajuan paket diterima atau tidak (belum_diproses, proses, terima, tolak)';

COMMENT ON COLUMN "trx_penjaringan"."user_persetujuan" IS 'Email user yang menerima atau menolak pengajuan penjaringan';

COMMENT ON COLUMN "trx_penjaringan"."status_pengajuan_pjr" IS 'draft, proses_di_kasubdit, proses_di_verifikator, selesai';

COMMENT ON COLUMN "trx_penjaringan"."status_proses_pjr" IS 'belum_waktu_verifikasi, proses, proses_verifikasi, proses_evaluasi, selesai';

COMMENT ON COLUMN "trx_penjaringan"."status_pengumuman_dpt" IS 'belum_diumumkan, diproses_ke_kasubdit, selesai';

COMMENT ON COLUMN "trx_penjaringan"."status_s_tugas" IS 'belum_diproses, proses_ke_direktur, selesai';

COMMENT ON COLUMN "trx_penjaringan"."ucr" IS 'Email User yang mengusulkan penjaringan';

COMMENT ON TABLE "trx_verifikator_penjr" IS 'verifikator yang dapat surat tugas untuk memverifikasi vendor di penjaringan';

COMMENT ON COLUMN "trx_verifikator_penjr"."kode_verifikator_penjr" IS 'kode verifikator penjaringan';

COMMENT ON COLUMN "trx_verifikator_penjr"."user_verif" IS 'email user verifikator';

COMMENT ON COLUMN "trx_undangan_penjr"."kode_und_penjr" IS 'kode undangan penjaringan';

COMMENT ON TABLE "trx_vendor_penjr" IS 'mencatat vendor yang memilih paket';

COMMENT ON COLUMN "trx_vendor_penjr"."status_verifikasi" IS 'belum_diproses, proses_verifikasi, perbaikan_data, diterima, ditolak';

COMMENT ON COLUMN "trx_vendor_penjr"."alasan_ditolak" IS 'Alasan hasil evaluasi ditolak';

COMMENT ON COLUMN "trx_vendor_penjr"."alasan_tidak_terpilih" IS 'Alasan tidak terpilih sebagai DPT';

COMMENT ON TABLE "trx_undangan_verif" IS 'Untuk mencatat jadwal verifikasi penyedia dengan DMAU';

COMMENT ON TABLE "ref_jenis_vendor" IS 'Badan Usaha, Perorangan';

COMMENT ON TABLE "ref_kualifikasi_usaha" IS 'Kecil, Menengah, Besar';

COMMENT ON TABLE "ref_vendor_register" IS 'Vendor yang baru register ditampung disini dulu untuk diverifikasi';

COMMENT ON COLUMN "ref_vendor_register"."no_telp" IS 'No Handphone whatsapp aktif kalau perorangan/ No. Telp kantor kalau badan usaha';

COMMENT ON COLUMN "ref_vendor_register"."status_register" IS 'status akun yang baru daftar (belum_diproses, proses, terima, tolak)';

COMMENT ON COLUMN "ref_vendor_register"."user_verif" IS 'Email user yang memverifikasi';

COMMENT ON TABLE "ref_vendor_reg_history" IS 'Vendor yang sudah diverifikasi (diterima/ditolak) dicatat kesini';

COMMENT ON COLUMN "ref_vendor_reg_history"."no_telp" IS 'No Handphone whatsapp aktif kalau perorangan/ No. Telp kantor kalau badan usaha';

COMMENT ON COLUMN "ref_vendor_reg_history"."status_register" IS 'status akun yang baru daftar (belum_diproses, proses, terima, tolak)';

COMMENT ON COLUMN "ref_vendor_reg_history"."user_verif" IS 'Email user yang memverifikasi';

COMMENT ON TABLE "ref_vendor" IS 'Vendor adalah Penyedia - Vendor yang lolos verifikasi registrasi, disimpan disini';

COMMENT ON TABLE "ref_datadiri_umum" IS 'Untuk menyimpan ''Data Diri / Umum'' Perorangan dan Badan Usaha';

COMMENT ON COLUMN "ref_datadiri_umum"."nama" IS 'Nama penyedia perorangan';

COMMENT ON COLUMN "ref_datadiri_umum"."nama_narahubung" IS 'Contact Person';

COMMENT ON COLUMN "ref_datadiri_umum"."nomor_telp" IS 'Nomor telepon kantor atau rumah';

COMMENT ON COLUMN "ref_datadiri_umum"."no_handphone" IS 'Nomor HP Whatsapp';

COMMENT ON COLUMN "ref_datadiri_umum"."is_alamat_sama" IS 'Apakah alamat KTP dg Domisili sama ?';

COMMENT ON COLUMN "ref_datadiri_umum"."file_skt" IS 'Surat Keterangan Domisili';

COMMENT ON COLUMN "ref_datadiri_umum"."is_skt_selamanya" IS 'Apakah Surat Keterangan Domisili berlaku selamanya?';

COMMENT ON COLUMN "ref_administrasi_pero"."file_skd" IS 'Surat Kebenaran Data';

COMMENT ON COLUMN "ref_administrasi_pero"."is_skd_selamanya" IS 'Apakah Surat Kebenaran Data berlaku selamanya?';

COMMENT ON COLUMN "ref_administrasi_pero"."npwp" IS 'Nomor NPWP';

COMMENT ON COLUMN "ref_administrasi_pero"."is_npwp_selamanya" IS 'Apakah berlaku selamanya?';

COMMENT ON COLUMN "ref_administrasi_pero"."is_bukti_spt_selamanya" IS 'Apakah Bukti SPT berlaku selamanya?';

COMMENT ON COLUMN "ref_administrasi_pero"."file_skb_pph23" IS 'Surat Keterangan Bebas PPh 23';

COMMENT ON COLUMN "ref_administrasi_pero"."is_skb_pph23_selamanya" IS 'Apakah selamanya?';

COMMENT ON COLUMN "ref_administrasi_pero"."file_sk_pp23" IS 'Surat Keterangan PP 23';

COMMENT ON COLUMN "ref_administrasi_pero"."is_sk_pp23_selamanya" IS 'Apakah berlaku selamanya?';

COMMENT ON TABLE "trx_nilai_akhir" IS 'hasil akhir penilaian perorangan & badan usaha di simpan disini';

COMMENT ON COLUMN "trx_nilai_akhir"."is_keuangan_lolos" IS 'Untuk peorangan, nilai akhir keuangan adah lolos atau tidak lolos';

COMMENT ON COLUMN "trx_nilai_akhir"."nilai_lap_keu" IS 'Untuk badan usaha, keuangan dinilai dengan angka';

COMMENT ON TABLE "ref_personalia_pero" IS 'Teknis (Perorangan)';

COMMENT ON COLUMN "ref_personalia_pero"."is_ktp_selamanya" IS 'Apakah KTP berlaku selamanya?';

COMMENT ON COLUMN "ref_personalia_pero"."is_ijazah_selamanya" IS 'Apakah Ijazah berlaku selamanya?';

COMMENT ON COLUMN "ref_personalia_pero"."is_cv_selamanya" IS 'Apakah CV berlaku selamanya?';

COMMENT ON TABLE "ref_keuangan_pero" IS 'Data Keuangan Perorangan';

COMMENT ON COLUMN "ref_keuangan_pero"."is_buku_rek_selamanya" IS 'Apakah Buku Rekening berlaku selamanya?';

COMMENT ON TABLE "ref_keuangan_bu" IS 'Data Keuangan Badan Usaha';

COMMENT ON COLUMN "ref_keuangan_bu"."is_buku_rek_selamanya" IS 'Apakah Buku Rekening berlaku selamanya?';

COMMENT ON TABLE "ref_adm_bu" IS 'Administrasi (Badan Usaha)';

COMMENT ON COLUMN "ref_adm_bu"."file_fis" IS 'Form Ikut Serta';

COMMENT ON COLUMN "ref_adm_bu"."is_fis_selamanya" IS 'Apakah Form Ikut Serta berlaku selamanya?';

COMMENT ON COLUMN "ref_adm_bu"."file_s_kuasa" IS 'Surat Kuasa';

COMMENT ON COLUMN "ref_adm_bu"."is_s_kuasa_selamanya" IS 'Apakah Surat Kuasa berlaku selamanya?';

COMMENT ON COLUMN "ref_adm_bu"."file_spkd" IS 'Surat Pernyataan Kebenaran Data';

COMMENT ON COLUMN "ref_adm_bu"."is_spkd_selamanya" IS 'Apakah Surat Pernyataan Kebenaran Data berlaku selamanya?';

COMMENT ON TABLE "ref_lan_hukum_bu" IS 'Landasan Hukum Pendirian Badan Usaha';

COMMENT ON COLUMN "ref_lan_hukum_bu"."no_sah_awal" IS 'Nomor Pengesahan / Pendaftaran';

COMMENT ON COLUMN "ref_lan_hukum_bu"."file_akta_awal" IS 'Scan Akta Pendirian Awal';

COMMENT ON COLUMN "ref_lan_hukum_bu"."is_akta_awal_selamanya" IS 'Apakah Akta Awal berlaku selamanya?';

COMMENT ON COLUMN "ref_lan_hukum_bu"."no_akta_rubah" IS 'No. Akta setelah Perubahan Terakhir Akta Pendirian Badan Usaha /Anggaran Dasar Koperasi';

COMMENT ON COLUMN "ref_lan_hukum_bu"."no_sah_rubah" IS 'Nomor Pengesahan / Pendaftaran';

COMMENT ON COLUMN "ref_lan_hukum_bu"."file_akta_rubah" IS 'Scan Akta Pendirian Terakhir';

COMMENT ON COLUMN "ref_lan_hukum_bu"."is_akta_rubah_selamanya" IS 'Apakah Akta Terakhir berlaku selamanya?';

COMMENT ON COLUMN "ref_komisaris_bu"."is_ktp_selamanya" IS 'Apakah KTP berlaku selamanya?';

COMMENT ON TABLE "ref_pengurus_bu" IS 'Pengurus badan usaha';

COMMENT ON COLUMN "ref_pengurus_bu"."bentuk_bu" IS 'Bentuk Badan Usaha';

COMMENT ON COLUMN "ref_direksi_bu"."is_ktp_selamanya" IS 'Apakah KTP berlaku selamanya?';

COMMENT ON COLUMN "ref_izin_usaha_bu"."jenis_izin_usaha" IS 'nib, sbu, lainya';

COMMENT ON COLUMN "ref_izin_usaha_bu"."kode" IS 'Kalau jenis izinnya NIB, masukan Kode KBLI / Kalau jenis izinnya SBU, masukan Kode SBU';

COMMENT ON COLUMN "ref_izin_usaha_bu"."is_izin_selamanya" IS 'Apakah Izin berlaku selamanya?';

COMMENT ON COLUMN "ref_sertifikat_usaha_bu"."is_sertif_selamanya" IS 'Apakah sertifikat berlaku selamanya?';

COMMENT ON COLUMN "ref_saham_bu"."nm_saham" IS 'Nama pemegang saham';

COMMENT ON COLUMN "ref_saham_bu"."is_saham_selamanya" IS 'Apakah file berlaku selamanya?';

COMMENT ON TABLE "ref_data_pajak_bu" IS 'Data Pajak (Badan Usaha)';

COMMENT ON COLUMN "ref_data_pajak_bu"."npwp" IS 'Nomor NPWP';

COMMENT ON COLUMN "ref_data_pajak_bu"."is_npwp_selamanya" IS 'Apakah NPWP berlaku selamanya?';

COMMENT ON COLUMN "ref_data_pajak_bu"."file_bukti_kswp" IS 'Bukti KSWP';

COMMENT ON COLUMN "ref_data_pajak_bu"."is_bukti_kswp_selamanya" IS 'Apakah berlaku selamanya?';

COMMENT ON COLUMN "ref_data_pajak_bu"."file_bukti_spt" IS 'Bukti Penyampaian SPT';

COMMENT ON COLUMN "ref_data_pajak_bu"."is_bukti_spt_selamanya" IS 'Apakah berlaku selamanya?';

COMMENT ON COLUMN "ref_data_pajak_bu"."file_skb_pph23" IS 'Surat Keterangan Bebas PPh 23';

COMMENT ON COLUMN "ref_data_pajak_bu"."is_skb_pph23_selamanya" IS 'Apakah berlaku selamanya?';

COMMENT ON COLUMN "ref_data_pajak_bu"."file_sk_pp23" IS 'Surat Keterangan PP 23';

COMMENT ON COLUMN "ref_data_pajak_bu"."is_sk_pp23_selamanya" IS 'Apakah berlaku selamanya?';

COMMENT ON COLUMN "ref_verif_data_pajak_bu"."npwp" IS 'Nomor NPWP';

COMMENT ON COLUMN "ref_verif_data_pajak_bu"."file_bukti_spt" IS 'NPWP';

COMMENT ON COLUMN "ref_verif_data_pajak_bu"."file_skb_pph23" IS 'NPWP';

COMMENT ON COLUMN "ref_verif_data_pajak_bu"."file_sk_pp23" IS 'NPWP';

COMMENT ON COLUMN "ref_tenaga_ahli_bu"."is_ktp_selamanya" IS 'Apakah KTP berlaku selamanya?';

COMMENT ON COLUMN "ref_tenaga_ahli_bu"."is_ijazah_selamanya" IS 'Apakah ijazah berlaku selamanya?';

COMMENT ON COLUMN "ref_tenaga_ahli_bu"."is_cv_selamanya" IS 'Apakah cv berlaku selamanya?';

COMMENT ON COLUMN "ref_tenaga_pendukung_bu"."is_ktp_selamanya" IS 'Apakah KTP berlaku selamanya?';

COMMENT ON COLUMN "ref_tenaga_pendukung_bu"."is_ijazah_selamanya" IS 'Apakah ijazah berlaku selamanya?';

COMMENT ON COLUMN "ref_tenaga_pendukung_bu"."is_cv_selamanya" IS 'Apakah cv berlaku selamanya?';

COMMENT ON TABLE "ref_pengalaman_ta" IS 'Daftar pengalaman tenaga ahli badan usaha';

COMMENT ON TABLE "ref_sertif_ta" IS 'Daftar sertifikat tenaga ahli badan usaha';

COMMENT ON TABLE "ref_pengalaman_tp" IS 'Daftar pengalaman tenaga pendukung badan usaha';

COMMENT ON TABLE "ref_sertif_tp" IS 'Daftar sertifikat tenaga pendukung badan usaha';

COMMENT ON COLUMN "ref_kantor_bu"."file_bukti" IS 'Bukti kepemilikan';

COMMENT ON COLUMN "ref_kantor_bu"."is_bukti_selamanya" IS 'Apakah berlaku selamanya?';

COMMENT ON COLUMN "ref_kantor_bu"."is_foto_selamanya" IS 'Apakah foto berlaku selamanya?';

COMMENT ON COLUMN "ref_fasilitas_bu"."is_kepemilikan_selamanya" IS 'Apakah kepemilikan berlaku selamanya?';

COMMENT ON COLUMN "ref_fasilitas_bu"."is_foto_selamanya" IS 'Apakah foto berlaku selamanya?';

COMMENT ON COLUMN "ref_pengalaman_bu"."is_kontrak_selamanya" IS 'Apakah kontrak berlaku selamanya?';

COMMENT ON COLUMN "ref_pengalaman_bu"."is_bast_selamanya" IS 'Apakah bast berlaku selamanya?';

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

ALTER TABLE "trx_penjaringan" ADD FOREIGN KEY ("kode_jenis_pengadaan") REFERENCES "ref_jenis_pengadaan" ("kode_jenis_pengadaan");

ALTER TABLE "trx_penjaringan" ADD FOREIGN KEY ("kode_trx_kategori") REFERENCES "trx_kategori" ("kode_trx_kategori");

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

ALTER TABLE "ref_item_tanya" ADD FOREIGN KEY ("kode_kat_item_tanya") REFERENCES "ref_kat_item_tanya" ("kode_kat_item_tanya");

ALTER TABLE "trx_ketentuan_umum_khusus" ADD FOREIGN KEY ("kode_subkat") REFERENCES "ref_subkat_persyaratan" ("kode_subkat");

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

ALTER TABLE "ref_item_tanya_tpl" ADD FOREIGN KEY ("tipe_input") REFERENCES "ref_tipe_input" ("tipe_input");

ALTER TABLE "ref_verif_keuangan_bu" ADD FOREIGN KEY ("kode_vendor_penjr") REFERENCES "trx_vendor_penjr" ("kode_vendor_penjr");

ALTER TABLE "ref_verif_keuangan_bu" ADD FOREIGN KEY ("kode_keuangan") REFERENCES "ref_keuangan_bu" ("kode_keuangan");

ALTER TABLE "trx_nilai_akhir" ADD FOREIGN KEY ("kode_vendor_penjr") REFERENCES "trx_vendor_penjr" ("kode_vendor_penjr");

ALTER TABLE "ref_adm_bu" ADD FOREIGN KEY ("kode_vendor") REFERENCES "ref_vendor" ("kode_vendor");

ALTER TABLE "ref_lan_hukum_bu" ADD FOREIGN KEY ("kode_vendor") REFERENCES "ref_vendor" ("kode_vendor");

ALTER TABLE "ref_keuangan_bu" ADD FOREIGN KEY ("kode_vendor") REFERENCES "ref_vendor" ("kode_vendor");

ALTER TABLE "ref_pengalaman_pero" ADD FOREIGN KEY ("kode_vendor") REFERENCES "ref_vendor" ("kode_vendor");

ALTER TABLE "ref_sertif_pero" ADD FOREIGN KEY ("kode_vendor") REFERENCES "ref_vendor" ("kode_vendor");

ALTER TABLE "ref_kantor_bu" ADD FOREIGN KEY ("kode_kepemilikan") REFERENCES "ref_kepemilikan" ("kode_kepemilikan");

ALTER TABLE "ref_fasilitas_bu" ADD FOREIGN KEY ("kode_kepemilikan") REFERENCES "ref_kepemilikan" ("kode_kepemilikan");

ALTER TABLE "trx_penjaringan" ADD FOREIGN KEY ("kode_jenis_vendor") REFERENCES "ref_jenis_vendor" ("kode_jenis_vendor");

ALTER TABLE "trx_ketentuan_umum_khusus" ADD FOREIGN KEY ("kode_penjaringan") REFERENCES "trx_penjaringan" ("kode_penjaringan");

ALTER TABLE "ref_kantor_bu" ADD FOREIGN KEY ("kode_kondisi") REFERENCES "ref_kondisi" ("kode_kondisi");

ALTER TABLE "trx_penjaringan" ADD FOREIGN KEY ("kode_kualifikasi_usaha") REFERENCES "ref_kualifikasi_usaha" ("kode_kualifikasi_usaha");

ALTER TABLE "ref_item_tanya" ADD FOREIGN KEY ("kode_penjaringan") REFERENCES "trx_penjaringan" ("kode_penjaringan");

ALTER TABLE "ref_item_tanya_tpl" ADD FOREIGN KEY ("kode_kat_item_tanya") REFERENCES "ref_kat_item_tanya" ("kode_kat_item_tanya");
