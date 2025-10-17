SELECT setval('ref_permintaan_kode_permintaan_seq', (SELECT MAX(kode_permintaan) FROM ref_permintaan));
SELECT setval('trx_detail_permintaan_kode_detail_permintaan_seq', (SELECT MAX(kode_detail_permintaan) FROM trx_detail_permintaaan));
