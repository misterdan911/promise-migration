SELECT setval('ref_user_id_seq', (SELECT MAX(id) FROM ref_user));
SELECT setval('ref_user_internal_id_seq', (SELECT MAX(id) FROM ref_user_internal));
SELECT setval('ref_user_external_id_seq', (SELECT MAX(id) FROM ref_user_external));
SELECT setval('trx_user_tampung_kode_user_tampung_seq', (SELECT MAX(kode_user_tampung) FROM trx_user_tampung));
SELECT setval('trx_group_user_id_seq', (SELECT MAX(id_group_user) FROM trx_group_user));
