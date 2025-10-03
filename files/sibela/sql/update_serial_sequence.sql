SELECT setval('ref_permintaan_kode_permintaan_seq', (SELECT MAX(kode_permintaan) FROM ref_permintaan));
