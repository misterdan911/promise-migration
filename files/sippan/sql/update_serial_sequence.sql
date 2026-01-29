SELECT setval('ref_rup_kode_rup_seq', (SELECT MAX(kode_rup) FROM ref_rup));
