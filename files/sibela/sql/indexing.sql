-- ref_ba_pemeriksaan table indexes
CREATE INDEX idx_ref_ba_pemeriksaan_kode_trx_riwayat_pelaksanaan ON ref_ba_pemeriksaan(kode_trx_riwayat_pelaksanaan);
CREATE INDEX idx_ref_ba_pemeriksaan_kode_tte ON ref_ba_pemeriksaan(kode_tte);

-- ref_ba_pemeriksaan_st table indexes
CREATE INDEX idx_ref_ba_pemeriksaan_st_kode_serah_terima ON ref_ba_pemeriksaan_st(kode_serah_terima);
CREATE INDEX idx_ref_ba_pemeriksaan_st_kode_tte ON ref_ba_pemeriksaan_st(kode_tte);

-- ref_detail_aspek table indexes
CREATE INDEX idx_ref_detail_aspek_kode_aspek ON ref_detail_aspek(kode_aspek);

-- ref_keluaran_proses_kontrak table indexes
CREATE INDEX idx_ref_keluaran_proses_kontrak_kode_proses_kontrak ON ref_keluaran_proses_kontrak(kode_proses_kontrak);

-- ref_permintaan table indexes
CREATE INDEX idx_ref_permintaan_kode_jenis_kontrak ON ref_permintaan(kode_jenis_kontrak);
CREATE INDEX idx_ref_permintaan_kode_skema_pembayaran ON ref_permintaan(kode_skema_pembayaran);
CREATE INDEX idx_ref_permintaan_kode_status_permintaan ON ref_permintaan(kode_status_permintaan);

-- ref_permintaan_addendum table indexes
CREATE INDEX idx_ref_permintaan_addendum_kode_addendum ON ref_permintaan_addendum(kode_addendum);

-- ref_proses_kontrak table indexes
CREATE INDEX idx_ref_proses_kontrak_kode_permintaan ON ref_proses_kontrak(kode_permintaan);
CREATE INDEX idx_ref_proses_kontrak_kode_status_kontrak ON ref_proses_kontrak(kode_status_kontrak);
CREATE INDEX idx_ref_proses_kontrak_kode_step_persiapan_kontrak ON ref_proses_kontrak(kode_step_persiapan_kontrak);

-- ref_riwayat_pelaksanaan table indexes
CREATE INDEX idx_ref_riwayat_pelaksanaan_kode_proses_kontrak ON ref_riwayat_pelaksanaan(kode_proses_kontrak);
CREATE INDEX idx_ref_riwayat_pelaksanaan_kode_trx_jenis_sispembayaran ON ref_riwayat_pelaksanaan(kode_trx_jenis_sispembayaran);

-- ref_serah_terima table indexes
CREATE INDEX idx_ref_serah_terima_kode_proses_kontrak ON ref_serah_terima(kode_proses_kontrak);
CREATE INDEX idx_ref_serah_terima_kode_step_serah_terima ON ref_serah_terima(kode_step_serah_terima);

-- ref_sptjm table indexes
CREATE INDEX idx_ref_sptjm_kode_trx_riwayat_pelaksanaan ON ref_sptjm(kode_trx_riwayat_pelaksanaan);

-- trx_addendum table indexes
CREATE INDEX idx_trx_addendum_kode_addendum ON trx_addendum(kode_addendum);
CREATE INDEX idx_trx_addendum_kode_kategori_addendum ON trx_addendum(kode_kategori_addendum);

-- trx_addendum_biaya table indexes
CREATE INDEX idx_trx_addendum_biaya_kode_trx_addendum ON trx_addendum_biaya(kode_trx_addendum);

-- trx_addendum_jangka_waktu table indexes
CREATE INDEX idx_trx_addendum_jangka_waktu_kode_trx_addendum ON trx_addendum_jangka_waktu(kode_trx_addendum);

-- trx_addendum_spek_teknis table indexes
CREATE INDEX idx_trx_addendum_spek_teknis_kode_trx_addendum ON trx_addendum_spek_teknis(kode_trx_addendum);

-- trx_ba_pemeriksaan table indexes
CREATE INDEX idx_trx_ba_pemeriksaan_kode_trx_riwayat_pelaksanaan ON trx_ba_pemeriksaan(kode_trx_riwayat_pelaksanaan);

-- trx_ba_pemeriksaan_st table indexes
CREATE INDEX idx_trx_ba_pemeriksaan_st_kode_serah_terima ON trx_ba_pemeriksaan_st(kode_serah_terima);

-- trx_bast table indexes
CREATE INDEX idx_trx_bast_kode_trx_riwayat_pelaksanaan ON trx_bast(kode_trx_riwayat_pelaksanaan);

-- trx_bast_st table indexes
CREATE INDEX idx_trx_bast_st_kode_serah_terima ON trx_bast_st(kode_serah_terima);
CREATE INDEX idx_trx_bast_st_kode_tte ON trx_bast_st(kode_tte);

-- trx_detail_permintaan table indexes
CREATE INDEX idx_trx_detail_permintaan_kode_permintaan ON trx_detail_permintaan(kode_permintaan);

-- trx_dokumen_kontrak table indexes
CREATE INDEX idx_trx_dokumen_kontrak_kode_bentuk_kontrak ON trx_dokumen_kontrak(kode_bentuk_kontrak);
CREATE INDEX idx_trx_dokumen_kontrak_kode_proses_kontrak ON trx_dokumen_kontrak(kode_proses_kontrak);
CREATE INDEX idx_trx_dokumen_kontrak_kode_tte ON trx_dokumen_kontrak(kode_tte);

-- trx_hasil_pajak table indexes
CREATE INDEX idx_trx_hasil_pajak_kode_pajak ON trx_hasil_pajak(kode_pajak);

-- trx_jangka_waktu table indexes
CREATE INDEX idx_trx_jangka_waktu_kode_proses_kontrak ON trx_jangka_waktu(kode_proses_kontrak);

-- trx_jenis_sispembayaran table indexes
CREATE INDEX idx_trx_jenis_sispembayaran_kode_sistem_pembayaran ON trx_jenis_sispembayaran(kode_sistem_pembayaran);

-- trx_keluaran_output table indexes
CREATE INDEX idx_trx_keluaran_output_kode_keluaran ON trx_keluaran_output(kode_keluaran);
CREATE INDEX idx_trx_keluaran_output_kode_trx_riwayat_pelaksanaan ON trx_keluaran_output(kode_trx_riwayat_pelaksanaan);

-- trx_keluaran_output_new table indexes
CREATE INDEX idx_trx_keluaran_output_new_kode_keluaran ON trx_keluaran_output_new(kode_keluaran);
CREATE INDEX idx_trx_keluaran_output_new_kode_proses_kontrak ON trx_keluaran_output_new(kode_proses_kontrak);

-- trx_kwitansi table indexes
CREATE INDEX idx_trx_kwitansi_kode_trx_riwayat_pelaksanaan ON trx_kwitansi(kode_trx_riwayat_pelaksanaan);

-- trx_monitoring table indexes
CREATE INDEX idx_trx_monitoring_kode_trx_riwayat_pelaksanaan ON trx_monitoring(kode_trx_riwayat_pelaksanaan);

-- trx_monitoring_new table indexes
CREATE INDEX idx_trx_monitoring_new_kode_proses_kontrak ON trx_monitoring_new(kode_proses_kontrak);

-- trx_nego_harga table indexes
CREATE INDEX idx_trx_nego_harga_kode_detail_permintaan ON trx_nego_harga(kode_detail_permintaan);

-- trx_nego_teknis table indexes
CREATE INDEX idx_trx_nego_teknis_kode_permintaan ON trx_nego_teknis(kode_permintaan);

-- trx_nilai_addendum table indexes
CREATE INDEX idx_trx_nilai_addendum_kode_trx_addendum ON trx_nilai_addendum(kode_trx_addendum);

-- trx_pajak table indexes
CREATE INDEX idx_trx_pajak_kode_trx_riwayat_pelaksanaan ON trx_pajak(kode_trx_riwayat_pelaksanaan);

-- trx_pembayaran table indexes
CREATE INDEX idx_trx_pembayaran_kode_trx_riwayat_pelaksanaan ON trx_pembayaran(kode_trx_riwayat_pelaksanaan);

-- trx_penilaian_pembayaran table indexes
CREATE INDEX idx_trx_penilaian_pembayaran_kode_detail_aspek ON trx_penilaian_pembayaran(kode_detail_aspek);
CREATE INDEX idx_trx_penilaian_pembayaran_kode_trx_riwayat_pelaksanaan ON trx_penilaian_pembayaran(kode_trx_riwayat_pelaksanaan);

-- trx_pesanan_addendum table indexes
CREATE INDEX idx_trx_pesanan_addendum_kode_trx_addendum ON trx_pesanan_addendum(kode_trx_addendum);

-- trx_proses_pajak table indexes
CREATE INDEX idx_trx_proses_pajak_kode_proses_kontrak ON trx_proses_pajak(kode_proses_kontrak);

-- trx_riwayat_pelaksanaan table indexes
CREATE INDEX idx_trx_riwayat_pelaksanaan_kode_riwayat_pelaksanaan ON trx_riwayat_pelaksanaan(kode_riwayat_pelaksanaan);
CREATE INDEX idx_trx_riwayat_pelaksanaan_kode_step_riwayat_pelaksanaan ON trx_riwayat_pelaksanaan(kode_step_riwayat_pelaksanaan);

-- trx_serah_terima table indexes
CREATE INDEX idx_trx_serah_terima_kode_proses_kontrak ON trx_serah_terima(kode_proses_kontrak);

-- trx_sistem_pembayaran table indexes
CREATE INDEX idx_trx_sistem_pembayaran_kode_proses_kontrak ON trx_sistem_pembayaran(kode_proses_kontrak);

-- trx_sptjm table indexes
CREATE INDEX idx_trx_sptjm_kode_trx_riwayat_pelaksanaan ON trx_sptjm(kode_trx_riwayat_pelaksanaan);

-- trx_tte table indexes
CREATE INDEX idx_trx_tte_kode_permintaan ON trx_tte(kode_permintaan);