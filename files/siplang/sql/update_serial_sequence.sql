-- SELECT setval('ref_permintaan_kode_permintaan_seq', (SELECT MAX(kode_permintaan) FROM ref_permintaan), false);
-- SELECT setval('trx_detail_permintaan_kode_detail_permintaan_seq', (SELECT MAX(kode_detail_permintaan) FROM trx_detail_permintaan), false);

SELECT setval('ref_ba_pemeriksaan_kode_ba_pemerikasaan_seq', (SELECT COALESCE(MAX(kode_ba_pemerikasaan), 1) FROM ref_ba_pemeriksaan), false);
SELECT setval('ref_ba_pemeriksaan_st_kode_bap_st_seq', (SELECT COALESCE(MAX(kode_bap_st), 1) FROM ref_ba_pemeriksaan_st), false);
SELECT setval('ref_bentuk_kontrak_kode_bentuk_kontrak_seq', (SELECT COALESCE(MAX(kode_bentuk_kontrak), 1) FROM ref_bentuk_kontrak), false);
SELECT setval('ref_detail_aspek_kode_detail_aspek_seq', (SELECT COALESCE(MAX(kode_detail_aspek), 1) FROM ref_detail_aspek), false);
SELECT setval('ref_dok_detail_transaksi_kode_dok_detail_transaksi_seq', (SELECT COALESCE(MAX(kode_dok_detail_transaksi), 1) FROM ref_dok_detail_transaksi), false);
SELECT setval('ref_jenis_laporan_kode_jenis_laporan_seq', (SELECT COALESCE(MAX(kode_jenis_laporan), 1) FROM ref_jenis_laporan), false);
SELECT setval('ref_keluaran_proses_kontrak_kode_keluaran_seq', (SELECT COALESCE(MAX(kode_keluaran), 1) FROM ref_keluaran_proses_kontrak), false);
SELECT setval('ref_permintaan_kode_permintaan_seq', (SELECT COALESCE(MAX(kode_permintaan), 1) FROM ref_permintaan), false);
SELECT setval('ref_proses_kontrak_kode_proses_kontrak_seq', (SELECT COALESCE(MAX(kode_proses_kontrak), 1) FROM ref_proses_kontrak), false);
SELECT setval('ref_riwayat_pelaksanaan_kode_riwayat_pelaksanaan_seq', (SELECT COALESCE(MAX(kode_riwayat_pelaksanaan), 1) FROM ref_riwayat_pelaksanaan), false);
SELECT setval('ref_serah_terima_kode_serah_terima_seq', (SELECT COALESCE(MAX(kode_serah_terima), 1) FROM ref_serah_terima), false);
SELECT setval('ref_sptjm_kode_sptjm_seq', (SELECT COALESCE(MAX(kode_sptjm), 1) FROM ref_sptjm), false);
SELECT setval('ref_status_kontrak_kode_status_kontrak_seq', (SELECT COALESCE(MAX(kode_status_kontrak), 1) FROM ref_status_kontrak), false);
SELECT setval('ref_step_persiapan_kontrak_kode_step_persiapan_kontrak_seq', (SELECT COALESCE(MAX(kode_step_persiapan_kontrak), 1) FROM ref_step_persiapan_kontrak), false);
SELECT setval('trx_ba_pemeriksaan_kode_trx_ba_pemeriksaan_seq', (SELECT COALESCE(MAX(kode_trx_ba_pemeriksaan), 1) FROM trx_ba_pemeriksaan), false);
SELECT setval('trx_ba_pemeriksaan_st_kode_trx_bap_st_seq', (SELECT COALESCE(MAX(kode_trx_bap_st), 1) FROM trx_ba_pemeriksaan_st), false);
SELECT setval('trx_bast_kode_bast_seq', (SELECT COALESCE(MAX(kode_bast), 1) FROM trx_bast), false);
SELECT setval('trx_bast_st_kode_bast_st_seq', (SELECT COALESCE(MAX(kode_bast_st), 1) FROM trx_bast_st), false);
SELECT setval('trx_detail_permintaan_kode_detail_permintaan_seq', (SELECT COALESCE(MAX(kode_detail_permintaan), 1) FROM trx_detail_permintaan), false);
SELECT setval('trx_dokumen_kontrak_kode_dokumen_kontrak_seq', (SELECT COALESCE(MAX(kode_dokumen_kontrak), 1) FROM trx_dokumen_kontrak), false);
SELECT setval('trx_jangka_waktu_kode_jangka_waktu_seq', (SELECT COALESCE(MAX(kode_jangka_waktu), 1) FROM trx_jangka_waktu), false);
SELECT setval('trx_jenis_laporan_kode_trx_jenis_laporan_seq', (SELECT COALESCE(MAX(kode_trx_jenis_laporan), 1) FROM trx_jenis_laporan), false);
SELECT setval('trx_jenis_sispembayaran_kode_trx_jenis_sispembayaran_seq', (SELECT COALESCE(MAX(kode_trx_jenis_sispembayaran), 1) FROM trx_jenis_sispembayaran), false);
SELECT setval('trx_keluaran_output_kode_keluaran_output_seq', (SELECT COALESCE(MAX(kode_keluaran_output), 1) FROM trx_keluaran_output), false);
SELECT setval('trx_keluaran_output_new_kode_keluaran_output_new_seq', (SELECT COALESCE(MAX(kode_keluaran_output_new), 1) FROM trx_keluaran_output_new), false);
SELECT setval('trx_kwitansi_kode_kwitansi_seq', (SELECT COALESCE(MAX(kode_kwitansi), 1) FROM trx_kwitansi), false);
SELECT setval('trx_monitoring_kode_monitoring_seq', (SELECT COALESCE(MAX(kode_monitoring), 1) FROM trx_monitoring), false);
SELECT setval('trx_monitoring_new_kode_trx_monitoring_seq', (SELECT COALESCE(MAX(kode_trx_monitoring), 1) FROM trx_monitoring_new), false);
SELECT setval('trx_nego_harga_kode_nego_harga_seq', (SELECT COALESCE(MAX(kode_nego_harga), 1) FROM trx_nego_harga), false);
SELECT setval('trx_nego_teknis_kode_nego_teknis_seq', (SELECT COALESCE(MAX(kode_nego_teknis), 1) FROM trx_nego_teknis), false);

SELECT setval('trx_pajak_kode_pajak_seq', (SELECT COALESCE(MAX(kode_pajak), 1) FROM trx_pajak), false);
SELECT setval('trx_hasil_pajak_id_hasil_pajak_seq', (SELECT COALESCE(MAX(id_hasil_pajak), 1) FROM trx_hasil_pajak), false);


SELECT setval('trx_pembayaran_kode_trx_pencarian_seq', (SELECT COALESCE(MAX(kode_trx_pencarian), 1) FROM trx_pembayaran), false);
SELECT setval('trx_penilaian_pembayaran_kode_penilaian_pembayaran_seq', (SELECT COALESCE(MAX(kode_penilaian_pembayaran), 1) FROM trx_penilaian_pembayaran), false);
SELECT setval('trx_proses_pajak_kode_proses_pajak_seq', (SELECT COALESCE(MAX(kode_proses_pajak), 1) FROM trx_proses_pajak), false);
SELECT setval('trx_riwayat_pelaksanaan_kode_trx_riwayat_pelaksanaan_seq', (SELECT COALESCE(MAX(kode_trx_riwayat_pelaksanaan), 1) FROM trx_riwayat_pelaksanaan), false);
SELECT setval('trx_serah_terima_kode_serah_terima_seq', (SELECT COALESCE(MAX(kode_serah_terima), 1) FROM trx_serah_terima), false);
SELECT setval('trx_sistem_pembayaran_kode_sistem_pembayaran_seq', (SELECT COALESCE(MAX(kode_sistem_pembayaran), 1) FROM trx_sistem_pembayaran), false);
SELECT setval('trx_sptjm_kode_trx_sptjm_seq', (SELECT COALESCE(MAX(kode_trx_sptjm), 1) FROM trx_sptjm), false);
SELECT setval('trx_tte_kode_tte_seq', (SELECT COALESCE(MAX(kode_tte), 1) FROM trx_tte), false);
