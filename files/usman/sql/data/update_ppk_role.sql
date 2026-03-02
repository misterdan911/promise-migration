DELETE FROM trx_group_user WHERE id_user = (SELECT id FROM ref_user WHERE email = 'adrian@ecampus.ut.ac.id');
DELETE FROM trx_user_tampung WHERE email = 'adrian@ecampus.ut.ac.id';

INSERT INTO trx_user_tampung (nama, email, nip, kode_unit_pbj, kode_jabatan, status_aktif, kode_unit, nama_unit)
VALUES ('"&A2&"', '"&B2&"', '"&D2&"', '"&F2&"', '"&G2&"', '"&H2&"', '"&E2&"', '"&C2&"' );

INSERT INTO trx_group_user (kode_group,	id_user, status) VALUES ('G01.2', (SELECT id FROM ref_user WHERE email = 'adrian@ecampus.ut.ac.id'), '1');
INSERT INTO trx_group_user (kode_group,	id_user, status) VALUES ('G03.2', (SELECT id FROM ref_user WHERE email = 'adrian@ecampus.ut.ac.id'), '1');
INSERT INTO trx_group_user (kode_group,	id_user, status) VALUES ('G04.4', (SELECT id FROM ref_user WHERE email = 'adrian@ecampus.ut.ac.id'), '1');
INSERT INTO trx_group_user (kode_group,	id_user, status) VALUES ('G05.4', (SELECT id FROM ref_user WHERE email = 'adrian@ecampus.ut.ac.id'), '1');

-- INSERT INTO trx_group_user (kode_group, id_user, status) VALUES ('G01.2', (SELECT id FROM ref_user WHERE email = '"&B2&"'), '1');
-- INSERT INTO trx_group_user (kode_group, id_user, status) VALUES ('G03.2', (SELECT id FROM ref_user WHERE email = '"&B2&"'), '1');
-- INSERT INTO trx_group_user (kode_group, id_user, status) VALUES ('G04.4', (SELECT id FROM ref_user WHERE email = '"&B2&"'), '1');
-- INSERT INTO trx_group_user (kode_group, id_user, status) VALUES ('G05.4', (SELECT id FROM ref_user WHERE email = '"&B2&"'), '1');




DELETE FROM trx_group_user WHERE id_user = (SELECT id FROM ref_user WHERE email = 'aguss@ecampus.ut.ac.id');
DELETE FROM trx_user_tampung WHERE email = 'aguss@ecampus.ut.ac.id';
INSERT INTO trx_user_tampung (nama, email, nip, kode_unit_pbj, kode_jabatan, status_aktif, kode_unit, nama_unit) VALUES  ('Prof. Dr. Agus Santoso, M.Si.', 'aguss@ecampus.ut.ac.id', '196402171993031001', '32', '7', '1', 'UN31.UT19', 'Universitas Terbuka Yogyakarta');
INSERT INTO trx_group_user (kode_group, id_user, status) VALUES ('G01.2', (SELECT id FROM ref_user WHERE email = 'aguss@ecampus.ut.ac.id'), '1');
INSERT INTO trx_group_user (kode_group, id_user, status) VALUES ('G03.2', (SELECT id FROM ref_user WHERE email = 'aguss@ecampus.ut.ac.id'), '1');
INSERT INTO trx_group_user (kode_group, id_user, status) VALUES ('G04.4', (SELECT id FROM ref_user WHERE email = 'aguss@ecampus.ut.ac.id'), '1');
INSERT INTO trx_group_user (kode_group, id_user, status) VALUES ('G05.4', (SELECT id FROM ref_user WHERE email = 'aguss@ecampus.ut.ac.id'), '1');

