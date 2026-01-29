select id, email from ref_user where email = 'ihrom-lestari@ecampus.ut.ac.id';

-- ihrom-lestari@ecampus.ut.ac.id
-- ihrom sebagai super admin
insert into trx_group_user
(kode_group,  id_user,  status)
values
('G00.6',  '198',  '1');


-- ihrom sebagai verifikator sidapet
insert into trx_group_user
(kode_group,  id_user,  status)
values
('G01.4',  '198',  '1');




INSERT INTO public.trx_user_tampung
(nama, email, nip, kode_unit_pbj, kode_jabatan, status_aktif, sk, encrypt_key, kode_unit, nama_unit)
VALUES('Ihrom Lestari', 'ihrom-lestari@ecampus.ut.ac.id', '119930606202403101', 1, 1, true, NULL, NULL, 'UN31.DMAUPBJ', 'Direktorat Manajemen Aset dan Unit Pengadaan Barang dan Jasa');



-- Arief Rahman Susila, S.E., M.Si.
-- ariefrs@ecampus.ut.ac.id
-- --------------------------------------------
-- sebagai Direktur PBJ Sidapet
insert into trx_group_user
(  kode_group,  id_user,  status)
values
( 'G01.11',  '10195',  '1');




-- Agus Saeful Mujab, S.E., M.M.
-- agussm@ecampus.ut.ac.id
-- -------------------------------------------

-- sebagai PPK Sidapet
insert into trx_group_user
(  kode_group,  id_user,  status)
values
(  'G01.2',  '11',  '1');

-- agussm sebagai PPK Sibela
insert into trx_group_user
(  kode_group,  id_user,  status)
values
(  'G04.4',  '11',  '1');

-- sebagai PPK Siplang
insert into trx_group_user
(  kode_group,  id_user,  status)
values
(  'G05.4',  '11',  '1');





-- Milda Ayudia, S.S.
-- imel@ecampus.ut.ac.id
-- --------------------------------------------

-- sebagai PP Sidapet
insert into trx_group_user
(  kode_group,  id_user,  status)
values
(  'G01.5',  '12985',  '1');


-- sebagai PP Sibela
insert into trx_group_user
(  kode_group,  id_user,  status)
values
(  'G04.2',  '12985',  '1');

-- sebagai PP Siplang
insert into trx_group_user
(  kode_group,  id_user,  status)
values
(  'G05.2',  '12985',  '1');



-- delete from trx_group_user where kode_group = '';

update ref_user set password = '$2b$12$K4DoerR.bOMqWyPPAhUGo.JQvzb1jz4L28HgY7.RUxt8EcOlo5E8i' where email = 'ihrom-lestari@ecampus.ut.ac.id';

update ref_user set password = '$2b$12$K4DoerR.bOMqWyPPAhUGo.JQvzb1jz4L28HgY7.RUxt8EcOlo5E8i' where email = 'adrian@ecampus.ut.ac.id';
update ref_user set password = '$2b$12$K4DoerR.bOMqWyPPAhUGo.JQvzb1jz4L28HgY7.RUxt8EcOlo5E8i' where email = 'agussm@ecampus.ut.ac.id';
update ref_user set password = '$2b$12$K4DoerR.bOMqWyPPAhUGo.JQvzb1jz4L28HgY7.RUxt8EcOlo5E8i' where email = 'ariefrs@ecampus.ut.ac.id';
update ref_user set password = '$2b$12$K4DoerR.bOMqWyPPAhUGo.JQvzb1jz4L28HgY7.RUxt8EcOlo5E8i' where email = 'imel@ecampus.ut.ac.id';

update ref_user set password = '$2b$12$K4DoerR.bOMqWyPPAhUGo.JQvzb1jz4L28HgY7.RUxt8EcOlo5E8i' where email = 'dharmaputracv10@gmail.com';

-- PT. Gramedia
update ref_user set password = '$2b$12$K4DoerR.bOMqWyPPAhUGo.JQvzb1jz4L28HgY7.RUxt8EcOlo5E8i' where email = 'paletadang@gmail.com';


update ref_user set password = '$2b$12$K4DoerR.bOMqWyPPAhUGo.JQvzb1jz4L28HgY7.RUxt8EcOlo5E8i' where email = 'franciskapuspadewi@gmail.com';

-- franciskapuspadewi@gmail.com ke siplang
insert into trx_group_user
(  kode_group,  id_user,  status)
values
(  'G05.3',  32070,  '1');



$2b$12$K4DoerR.bOMqWyPPAhUGo.JQvzb1jz4L28HgY7.RUxt8EcOlo5E8i



delete from trx_user_tampung where kode_user_tampung not in (29,33,120,124,125,134,144,188);
delete from trx_group_user where id_user != 52;



$2b$10$8GAbCMKFD7JrpstMQu1nwOeQiMys5bradHi0I71v0HDMyVL9Dsvky

