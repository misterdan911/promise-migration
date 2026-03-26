


32679	Rinaldy Akbar Rifai	rinaldy@ecampus.ut.ac.id	119870707202307101
198	Ihrom Lestari	ihrom-lestari@ecampus.ut.ac.id	119930606202403101
554	Diki Senjaya Rohmatullah	dikisenjaya@ecampus.ut.ac.id	119950921202312101
12345	Al Kharisma Rizky NR	alkharisma@ecampus.ut.ac.id	119900201202312201
196	Fajar Ichwan	fajar-ichwan@ecampus.ut.ac.id	219970223202404101




id_user: 32679
id_user: 198
id_user: 554
id_user: 12345
id_user: 196





delete from trx_group_user where kode_group in (
'G01.4'
);

INSERT INTO "public"."trx_198
('G01.4', 198, '1'),
('G01.4', 32679, '1'),
('G01.4', 554, '1'),
('G01.4', 12345, '1'),
('G01.4', 196, '1')
;


INSERT INTO trx_user_tampung (nama, email, nip, kode_unit_pbj, kode_jabatan, status_aktif, kode_unit, nama_unit) VALUES
('Ihrom Lestari', 'ihrom-lestari@ecampus.ut.ac.id', '119930606202403101', 1, 4, true, 'UN31.DMAUPBJ', 'Direktorat Manajemen Aset dan Unit Pengadaan Barang dan Jasa'),
('Rinaldy Akbar Rifai', 'rinaldy@ecampus.ut.ac.id', '119870707202307101', 1, 4, true, 'UN31.DMAUPBJ', 'Direktorat Manajemen Aset dan Unit Pengadaan Barang dan Jasa'),
