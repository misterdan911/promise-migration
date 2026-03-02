INSERT INTO ref_unit_pbj (kode_unit, nama_unit, kode_pbj, nama_pbj) VALUES('UN31', 'Universitas Terbuka (Rektor)', 'UN31', 'Universitas Terbuka (Rektor)');
INSERT INTO ref_unit_pbj (kode_unit, nama_unit, kode_pbj, nama_pbj) VALUES('UN31.WR1', 'Bidang Akademik', 'UN31.WR1', 'Bidang Akademik');
INSERT INTO ref_unit_pbj (kode_unit, nama_unit, kode_pbj, nama_pbj) VALUES('UN31.WR2', 'Bidang Keuangan dan Umum', 'UN31.WR2', 'Bidang Keuangan dan Umum');
INSERT INTO ref_unit_pbj (kode_unit, nama_unit, kode_pbj, nama_pbj) VALUES('UN31.WR3', 'Bidang Sistem Informasi dan Kemahasiswaan', 'UN31.WR3', 'Bidang Sistem Informasi dan Kemahasiswaan');
INSERT INTO ref_unit_pbj (kode_unit, nama_unit, kode_pbj, nama_pbj) VALUES('UN31.WR4', 'Bidang Riset, Inovasi, Kerja Sama dan Bisnis', 'UN31.WR4', 'Bidang Riset, Inovasi, Kerja Sama dan Bisnis');
INSERT INTO ref_unit_pbj (kode_unit, nama_unit, kode_pbj, nama_pbj) VALUES('UN31.LPPM1', 'Pusat Penelitian Keilmuan', 'UN31.LPPM1', 'Pusat Penelitian Keilmuan');
INSERT INTO ref_unit_pbj (kode_unit, nama_unit, kode_pbj, nama_pbj) VALUES('UN31.LPPM2', 'Pusat Riset dan Inovasi Pendidikan Jarak Jauh', 'UN31.LPPM2', 'Pusat Riset dan Inovasi Pendidikan Jarak Jauh');
INSERT INTO ref_unit_pbj (kode_unit, nama_unit, kode_pbj, nama_pbj) VALUES('UN31.LPPM3', 'Pusat Pengabdian Kepada Masyarakat', 'UN31.LPPM3', 'Pusat Pengabdian Kepada Masyarakat');
INSERT INTO ref_unit_pbj (kode_unit, nama_unit, kode_pbj, nama_pbj) VALUES('UN31.LLOP', 'Lembaga Layanan Operasional Pembelajaran', 'UN31.LLOP', 'Lembaga Layanan Operasional Pembelajaran');
INSERT INTO ref_unit_pbj (kode_unit, nama_unit, kode_pbj, nama_pbj) VALUES('UN31.SVOK', 'Sekolah Vokasi', 'UN31.SVOK', 'Sekolah Vokasi');
INSERT INTO ref_unit_pbj (kode_unit, nama_unit, kode_pbj, nama_pbj) VALUES('UN31.KA', 'Komite Audit', 'UN31.KA', 'Komite Audit');
INSERT INTO ref_unit_pbj (kode_unit, nama_unit, kode_pbj, nama_pbj) VALUES('UN31.LAB', 'Unit Laboratorium Terpadu Universitas', 'UN31.LAB', 'Unit Laboratorium Terpadu Universitas');
INSERT INTO ref_unit_pbj (kode_unit, nama_unit, kode_pbj, nama_pbj) VALUES('UN31.UPASP', 'Unit Pemberdayaan Alumni, Sentra Karier, dan Penempatan Kerja', 'UN31.UPASP', 'Unit Pemberdayaan Alumni, Sentra Karier, dan Penempatan Kerja');
INSERT INTO ref_unit_pbj (kode_unit, nama_unit, kode_pbj, nama_pbj) VALUES('UN31.PMO', 'Project Management Office', 'UN31.PMO', 'Project Management Office');



UPDATE ref_unit_pbj SET kode_unit = 'UN31.DTD', kode_pbj = 'UN31.DTD', nama_unit='Direktorat Teknologi Digital', nama_pbj='Direktorat Teknologi Digital' WHERE kode_unit = 'UN31.DSI';
UPDATE ref_unit_pbj SET kode_unit = 'UN31.SEKUN', kode_pbj = 'UN31.SEKUN', nama_unit='Sekretariat Universitas', nama_pbj='Sekretariat Universitas' WHERE kode_unit = 'UN31.SRUH';
UPDATE ref_unit_pbj SET kode_unit = 'UN31.PBI', kode_pbj = 'UN31.PBI', nama_unit='Pusat Bisnis dan Investasi', nama_pbj='Pusat Bisnis dan Investasi' WHERE kode_unit = 'UN31.PPBI';
UPDATE ref_unit_pbj SET kode_unit = 'UN31.LPJJ1', kode_pbj = 'UN31.LPJJ1', nama_unit='Pusat Produksi Bahan Ajar dan Multimedia', nama_pbj='Pusat Produksi Bahan Ajar dan Multimedia' WHERE kode_unit = 'UN31.LLOP1';
UPDATE ref_unit_pbj SET kode_unit = 'UN31.LPJJ2', kode_pbj = 'UN31.LPJJ2', nama_unit='Pusat Distribusi Bahan Ajar', nama_pbj='Pusat Distribusi Bahan Ajar' WHERE kode_unit = 'UN31.LLOP2';
UPDATE ref_unit_pbj SET kode_unit = 'UN31.LPJJ3', kode_pbj = 'UN31.LPJJ3', nama_unit='Pusat Pengelolaan Pembelajaran', nama_pbj='Pusat Pengelolaan Pembelajaran' WHERE kode_unit = 'UN31.LLOP3';
UPDATE ref_unit_pbj SET kode_unit = 'UN31.LPJJ4', kode_pbj = 'UN31.LPJJ4', nama_unit='Pusat Pengelolaan Ujian', nama_pbj='Pusat Pengelolaan Ujian' WHERE kode_unit = 'UN31.LLOP4';
UPDATE ref_unit_pbj SET kode_unit = 'UN31.DSDM', kode_pbj = 'UN31.DSDM', nama_unit='Direktorat Sumber Daya Manusia', nama_pbj='Direktorat Sumber Daya Manusia' WHERE kode_unit = 'UN31.PSDM';
UPDATE ref_unit_pbj SET kode_unit = 'UN31.PKPK', kode_pbj = 'UN31.PKPK', nama_unit='Pusat Komunikasi Publik dan Kerja Sama', nama_pbj='Pusat Komunikasi Publik dan Kerja Sama' WHERE kode_unit = 'UN31.DPK';
UPDATE ref_unit_pbj SET kode_unit = 'UN31.LPPJJ', kode_pbj = 'UN31.LPPJJ', nama_unit='Lembaga Pendukung Pembelajaran Jarak Jauh', nama_pbj='Lembaga Pendukung Pembelajaran Jarak Jauh' WHERE kode_unit = 'UN31.LLOP';


drop table if exists ref_unit_pbj_history;

create table ref_unit_pbj_history(
	kode_history serial primary key,
	kode_unit_pbj int,
	kode_unit_old varchar(255),
	nama_unit_old varchar(255),
	kode_pbj_old varchar(255),
	nama_pbj_old varchar(255),
	kode_unit_new varchar(255),
	nama_unit_new varchar(255),
	kode_pbj_new varchar(255),
	nama_pbj_new varchar(255)
);

alter table ref_unit_pbj_history ADD CONSTRAINT ref_unit_pbj_history_kode_unit_pbj_fkey FOREIGN KEY (kode_unit_pbj) REFERENCES ref_unit_pbj (kode_unit_pbj);


INSERT INTO "public"."ref_unit_pbj_history" ("kode_history", "kode_unit_pbj", "kode_unit_old", "nama_unit_old", "kode_pbj_old", "nama_pbj_old", "kode_unit_new", "nama_unit_new", "kode_pbj_new", "nama_pbj_new") VALUES (1, 4, 'UN31.DSI', 'Direktorat Sistem Informasi', 'UN31.DSI', 'Direktorat Sistem Informasi', 'UN31.DTD', 'Direktorat Teknologi Digital', 'UN31.DTD', 'Direktorat Teknologi Digital');
INSERT INTO "public"."ref_unit_pbj_history" ("kode_history", "kode_unit_pbj", "kode_unit_old", "nama_unit_old", "kode_pbj_old", "nama_pbj_old", "kode_unit_new", "nama_unit_new", "kode_pbj_new", "nama_pbj_new") VALUES (2, 8, 'UN31.SRUH', 'Sekretariat Rektorat dan Urusan Hukum', 'UN31.SRUH', 'Sekretariat Rektorat dan Urusan Hukum', 'UN31.SEKUN', 'Sekretariat Universitas', 'UN31.SEKUN', 'Sekretariat Universitas');
INSERT INTO "public"."ref_unit_pbj_history" ("kode_history", "kode_unit_pbj", "kode_unit_old", "nama_unit_old", "kode_pbj_old", "nama_pbj_old", "kode_unit_new", "nama_unit_new", "kode_pbj_new", "nama_pbj_new") VALUES (3, 9, 'UN31.PPBI', 'Pusat Pengelolaan Bisnis dan Investasi', 'UN31.PPBI', 'Pusat Pengelolaan Bisnis dan Investasi', 'UN31.PBI', 'Pusat Bisnis dan Investasi', 'UN31.PBI', 'Pusat Bisnis dan Investasi');
INSERT INTO "public"."ref_unit_pbj_history" ("kode_history", "kode_unit_pbj", "kode_unit_old", "nama_unit_old", "kode_pbj_old", "nama_pbj_old", "kode_unit_new", "nama_unit_new", "kode_pbj_new", "nama_pbj_new") VALUES (4, 54, 'UN31.LLOP1', 'Pusat Produksi Bahan Ajar Multi Media', 'UN31.LLOP1', 'Pusat Produksi Bahan Ajar Multi Media', 'UN31.LPJJ1', 'Pusat Produksi Bahan Ajar dan Multimedia', 'UN31.LPJJ1', 'Pusat Produksi Bahan Ajar dan Multimedia');
INSERT INTO "public"."ref_unit_pbj_history" ("kode_history", "kode_unit_pbj", "kode_unit_old", "nama_unit_old", "kode_pbj_old", "nama_pbj_old", "kode_unit_new", "nama_unit_new", "kode_pbj_new", "nama_pbj_new") VALUES (5, 55, 'UN31.LLOP2', 'Pusat Layanan Bahan Ajar', 'UN31.LLOP2', 'Pusat Layanan Bahan Ajar', 'UN31.LPJJ2', 'Pusat Distribusi Bahan Ajar', 'UN31.LPJJ2', 'Pusat Distribusi Bahan Ajar');
INSERT INTO "public"."ref_unit_pbj_history" ("kode_history", "kode_unit_pbj", "kode_unit_old", "nama_unit_old", "kode_pbj_old", "nama_pbj_old", "kode_unit_new", "nama_unit_new", "kode_pbj_new", "nama_pbj_new") VALUES (6, 56, 'UN31.LLOP3', 'Pusat Pengelolaan Pembelajaran', 'UN31.LLOP3', 'Pusat Pengelolaan Pembelajaran', 'UN31.LPJJ3', 'Pusat Pengelolaan Pembelajaran', 'UN31.LPJJ3', 'Pusat Pengelolaan Pembelajaran');
INSERT INTO "public"."ref_unit_pbj_history" ("kode_history", "kode_unit_pbj", "kode_unit_old", "nama_unit_old", "kode_pbj_old", "nama_pbj_old", "kode_unit_new", "nama_unit_new", "kode_pbj_new", "nama_pbj_new") VALUES (7, 57, 'UN31.LLOP4', 'Pusat Pengolahan Pengujian', 'UN31.LLOP4', 'Pusat Pengolahan Pengujian', 'UN31.LPJJ4', 'Pusat Pengelolaan Ujian', 'UN31.LPJJ4', 'Pusat Pengelolaan Ujian');
INSERT INTO "public"."ref_unit_pbj_history" ("kode_history", "kode_unit_pbj", "kode_unit_old", "nama_unit_old", "kode_pbj_old", "nama_pbj_old", "kode_unit_new", "nama_unit_new", "kode_pbj_new", "nama_pbj_new") VALUES (8, 59, 'UN31.PSDM', 'Pusat Sumber Daya Manusia', 'UN31.PSDM', 'Pusat Sumber Daya Manusia', 'UN31.DSDM', 'Direktorat Sumber Daya Manusia', 'UN31.DSDM', 'Direktorat Sumber Daya Manusia');
INSERT INTO "public"."ref_unit_pbj_history" ("kode_history", "kode_unit_pbj", "kode_unit_old", "nama_unit_old", "kode_pbj_old", "nama_pbj_old", "kode_unit_new", "nama_unit_new", "kode_pbj_new", "nama_pbj_new") VALUES (9, 67, 'UN31.DPK', 'Direktorat Pemasaran dan Kerjasama', 'UN31.DPK', 'Direktorat Pemasaran dan Kerjasama', 'UN31.PKPK', 'Pusat Komunikasi Publik dan Kerja Sama', 'UN31.PKPK', 'Pusat Komunikasi Publik dan Kerja Sama');
INSERT INTO "public"."ref_unit_pbj_history" ("kode_history", "kode_unit_pbj", "kode_unit_old", "nama_unit_old", "kode_pbj_old", "nama_pbj_old", "kode_unit_new", "nama_unit_new", "kode_pbj_new", "nama_pbj_new") VALUES (10, 79, 'UN31.LLOP', 'Lembaga Layanan Operasional Pembelajaran', 'UN31.LLOP', 'Lembaga Layanan Operasional Pembelajaran', 'UN31.LPPJJ', 'Lembaga Pendukung Pembelajaran Jarak Jauh', 'UN31.LPPJJ', 'Lembaga Pendukung Pembelajaran Jarak Jauh');


UPDATE trx_user_tampung SET kode_unit = 'UN31.DTD', nama_unit='Direktorat Teknologi Digital' WHERE kode_unit = 'UN31.DSI';
UPDATE trx_user_tampung SET kode_unit = 'UN31.SEKUN', nama_unit='Sekretariat Universitas' WHERE kode_unit = 'UN31.SRUH';
UPDATE trx_user_tampung SET kode_unit = 'UN31.PBI', nama_unit='Pusat Bisnis dan Investasi' WHERE kode_unit = 'UN31.PPBI';
UPDATE trx_user_tampung SET kode_unit = 'UN31.LPJJ1', nama_unit='Pusat Produksi Bahan Ajar dan Multimedia' WHERE kode_unit = 'UN31.LLOP1';
UPDATE trx_user_tampung SET kode_unit = 'UN31.LPJJ2', nama_unit='Pusat Distribusi Bahan Ajar' WHERE kode_unit = 'UN31.LLOP2';
UPDATE trx_user_tampung SET kode_unit = 'UN31.LPJJ3', nama_unit='Pusat Pengelolaan Pembelajaran' WHERE kode_unit = 'UN31.LLOP3';
UPDATE trx_user_tampung SET kode_unit = 'UN31.LPJJ4', nama_unit='Pusat Pengelolaan Ujian' WHERE kode_unit = 'UN31.LLOP4';
UPDATE trx_user_tampung SET kode_unit = 'UN31.DSDM', nama_unit='Direktorat Sumber Daya Manusia' WHERE kode_unit = 'UN31.PSDM';
UPDATE trx_user_tampung SET kode_unit = 'UN31.PKPK', nama_unit='Pusat Komunikasi Publik dan Kerja Sama' WHERE kode_unit = 'UN31.DPK';
UPDATE trx_user_tampung SET kode_unit = 'UN31.LPPJJ', nama_unit='Lembaga Pendukung Pembelajaran Jarak Jauh' WHERE kode_unit = 'UN31.LLOP';

-- sippan
UPDATE ref_rup SET kode_unit = 'UN31.DTD' WHERE kode_unit = 'UN31.DSI';
UPDATE ref_rup SET kode_unit = 'UN31.SEKUN' WHERE kode_unit = 'UN31.SRUH';
UPDATE ref_rup SET kode_unit = 'UN31.PBI' WHERE kode_unit = 'UN31.PPBI';
UPDATE ref_rup SET kode_unit = 'UN31.LPJJ1' WHERE kode_unit = 'UN31.LLOP1';
UPDATE ref_rup SET kode_unit = 'UN31.LPJJ2' WHERE kode_unit = 'UN31.LLOP2';
UPDATE ref_rup SET kode_unit = 'UN31.LPJJ3' WHERE kode_unit = 'UN31.LLOP3';
UPDATE ref_rup SET kode_unit = 'UN31.LPJJ4' WHERE kode_unit = 'UN31.LLOP4';
UPDATE ref_rup SET kode_unit = 'UN31.DSDM' WHERE kode_unit = 'UN31.PSDM';
UPDATE ref_rup SET kode_unit = 'UN31.PKPK' WHERE kode_unit = 'UN31.DPK';
UPDATE ref_rup SET kode_unit = 'UN31.LPPJJ' WHERE kode_unit = 'UN31.LLOP';

-- sidapet
UPDATE trx_kategori SET kode_unit_pbj = 'UN31.DTD' WHERE kode_unit_pbj = 'UN31.DSI';
UPDATE trx_kategori SET kode_unit_pbj = 'UN31.SEKUN' WHERE kode_unit_pbj = 'UN31.SRUH';
UPDATE trx_kategori SET kode_unit_pbj = 'UN31.PBI' WHERE kode_unit_pbj = 'UN31.PPBI';
UPDATE trx_kategori SET kode_unit_pbj = 'UN31.LPJJ1' WHERE kode_unit_pbj = 'UN31.LLOP1';
UPDATE trx_kategori SET kode_unit_pbj = 'UN31.LPJJ2' WHERE kode_unit_pbj = 'UN31.LLOP2';
UPDATE trx_kategori SET kode_unit_pbj = 'UN31.LPJJ3' WHERE kode_unit_pbj = 'UN31.LLOP3';
UPDATE trx_kategori SET kode_unit_pbj = 'UN31.LPJJ4' WHERE kode_unit_pbj = 'UN31.LLOP4';
UPDATE trx_kategori SET kode_unit_pbj = 'UN31.DSDM' WHERE kode_unit_pbj = 'UN31.PSDM';
UPDATE trx_kategori SET kode_unit_pbj = 'UN31.PKPK' WHERE kode_unit_pbj = 'UN31.DPK';
UPDATE trx_kategori SET kode_unit_pbj = 'UN31.LPPJJ' WHERE kode_unit_pbj = 'UN31.LLOP';


UPDATE trx_penjaringan SET kode_unit_pbj = 'UN31.DTD' WHERE kode_unit_pbj = 'UN31.DSI';
UPDATE trx_penjaringan SET kode_unit_pbj = 'UN31.SEKUN' WHERE kode_unit_pbj = 'UN31.SRUH';
UPDATE trx_penjaringan SET kode_unit_pbj = 'UN31.PBI' WHERE kode_unit_pbj = 'UN31.PPBI';
UPDATE trx_penjaringan SET kode_unit_pbj = 'UN31.LPJJ1' WHERE kode_unit_pbj = 'UN31.LLOP1';
UPDATE trx_penjaringan SET kode_unit_pbj = 'UN31.LPJJ2' WHERE kode_unit_pbj = 'UN31.LLOP2';
UPDATE trx_penjaringan SET kode_unit_pbj = 'UN31.LPJJ3' WHERE kode_unit_pbj = 'UN31.LLOP3';
UPDATE trx_penjaringan SET kode_unit_pbj = 'UN31.LPJJ4' WHERE kode_unit_pbj = 'UN31.LLOP4';
UPDATE trx_penjaringan SET kode_unit_pbj = 'UN31.DSDM' WHERE kode_unit_pbj = 'UN31.PSDM';
UPDATE trx_penjaringan SET kode_unit_pbj = 'UN31.PKPK' WHERE kode_unit_pbj = 'UN31.DPK';
UPDATE trx_penjaringan SET kode_unit_pbj = 'UN31.LPPJJ' WHERE kode_unit_pbj = 'UN31.LLOP';


-- sibela & siplang
UPDATE ref_permintaan SET kode_unit = 'UN31.DTD' WHERE kode_unit = 'UN31.DSI';
UPDATE ref_permintaan SET kode_unit = 'UN31.SEKUN' WHERE kode_unit = 'UN31.SRUH';
UPDATE ref_permintaan SET kode_unit = 'UN31.PBI' WHERE kode_unit = 'UN31.PPBI';
UPDATE ref_permintaan SET kode_unit = 'UN31.LPJJ1' WHERE kode_unit = 'UN31.LLOP1';
UPDATE ref_permintaan SET kode_unit = 'UN31.LPJJ2' WHERE kode_unit = 'UN31.LLOP2';
UPDATE ref_permintaan SET kode_unit = 'UN31.LPJJ3' WHERE kode_unit = 'UN31.LLOP3';
UPDATE ref_permintaan SET kode_unit = 'UN31.LPJJ4' WHERE kode_unit = 'UN31.LLOP4';
UPDATE ref_permintaan SET kode_unit = 'UN31.DSDM' WHERE kode_unit = 'UN31.PSDM';
UPDATE ref_permintaan SET kode_unit = 'UN31.PKPK' WHERE kode_unit = 'UN31.DPK';
UPDATE ref_permintaan SET kode_unit = 'UN31.LPPJJ' WHERE kode_unit = 'UN31.LLOP';


-- --------------------------------------------------------------------------------




drop table if exists ref_unit_pbj_history;

create table ref_unit_pbj_history(
	kode_history serial primary key,
	kode_unit_pbj int,
	kode_unit_old varchar(255),
	nama_unit_old varchar(255),
	kode_pbj_old varchar(255),
	nama_pbj_old varchar(255),
	kode_unit_new varchar(255),
	nama_unit_new varchar(255),
	kode_pbj_new varchar(255),
	nama_pbj_new varchar(255)
);

alter table ref_unit_pbj_history ADD CONSTRAINT ref_unit_pbj_history_kode_unit_pbj_fkey FOREIGN KEY (kode_unit_pbj) REFERENCES ref_unit_pbj (kode_unit_pbj);


INSERT INTO "public"."ref_unit_pbj_history" ("kode_history", "kode_unit_pbj", "kode_unit_old", "nama_unit_old", "kode_pbj_old", "nama_pbj_old", "kode_unit_new", "nama_unit_new", "kode_pbj_new", "nama_pbj_new") VALUES
(1, 4, 'UN31.DSI', 'Direktorat Sistem Informasi', 'UN31.DSI', 'Direktorat Sistem Informasi', 'UN31.DTD', 'Direktorat Teknologi Digital', 'UN31.DTD', 'Direktorat Teknologi Digital'),
(2, 8, 'UN31.SRUH', 'Sekretariat Rektorat dan Urusan Hukum', 'UN31.SRUH', 'Sekretariat Rektorat dan Urusan Hukum', 'UN31.SEKUN', 'Sekretariat Universitas', 'UN31.SEKUN', 'Sekretariat Universitas'),
(3, 9, 'UN31.PPBI', 'Pusat Pengelolaan Bisnis dan Investasi', 'UN31.PPBI', 'Pusat Pengelolaan Bisnis dan Investasi', 'UN31.PBI', 'Pusat Bisnis dan Investasi', 'UN31.PBI', 'Pusat Bisnis dan Investasi'),
(4, 54, 'UN31.LLOP1', 'Pusat Produksi Bahan Ajar Multi Media', 'UN31.LLOP1', 'Pusat Produksi Bahan Ajar Multi Media', 'UN31.LPJJ1', 'Pusat Produksi Bahan Ajar dan Multimedia', 'UN31.LPPJJ1', 'Pusat Produksi Bahan Ajar dan Multimedia'),
(5, 55, 'UN31.LLOP2', 'Pusat Layanan Bahan Ajar', 'UN31.LLOP2', 'Pusat Layanan Bahan Ajar', 'UN31.LPPJJ2', 'Pusat Distribusi Bahan Ajar', 'UN31.LPPJJ2', 'Pusat Distribusi Bahan Ajar'),
(6, 56, 'UN31.LLOP3', 'Pusat Pengelolaan Pembelajaran', 'UN31.LLOP3', 'Pusat Pengelolaan Pembelajaran', 'UN31.LPPJJ3', 'Pusat Pengelolaan Pembelajaran', 'UN31.LPPJJ3', 'Pusat Pengelolaan Pembelajaran'),
(7, 57, 'UN31.LLOP4', 'Pusat Pengolahan Pengujian', 'UN31.LLOP4', 'Pusat Pengolahan Pengujian', 'UN31.LPPJJ4', 'Pusat Pengelolaan Ujian', 'UN31.LPPJJ4', 'Pusat Pengelolaan Ujian'),
(8, 59, 'UN31.PSDM', 'Pusat Sumber Daya Manusia', 'UN31.PSDM', 'Pusat Sumber Daya Manusia', 'UN31.DSDM', 'Direktorat Sumber Daya Manusia', 'UN31.DSDM', 'Direktorat Sumber Daya Manusia'),
(9, 67, 'UN31.DPK', 'Direktorat Pemasaran dan Kerjasama', 'UN31.DPK', 'Direktorat Pemasaran dan Kerjasama', 'UN31.PKPK', 'Pusat Komunikasi Publik dan Kerja Sama', 'UN31.PKPK', 'Pusat Komunikasi Publik dan Kerja Sama'),
(10, 79, 'UN31.LLOP', 'Lembaga Layanan Operasional Pembelajaran', 'UN31.LLOP', 'Lembaga Layanan Operasional Pembelajaran', 'UN31.LPPJJ', 'Lembaga Pendukung Pembelajaran Jarak Jauh', 'UN31.LPPJJ', 'Lembaga Pendukung Pembelajaran Jarak Jauh');


UPDATE public.ref_unit_pbj
SET kode_unit='UN31.LPPJJ1', nama_unit='Pusat Produksi Bahan Ajar dan Multimedia', kode_pbj='UN31.LPPJJ1', nama_pbj='Pusat Produksi Bahan Ajar dan Multimedia'
WHERE kode_unit_pbj=54;
UPDATE public.ref_unit_pbj
SET kode_unit='UN31.LPPJJ2', nama_unit='Pusat Distribusi Bahan Ajar', kode_pbj='UN31.LPPJJ2', nama_pbj='Pusat Distribusi Bahan Ajar'
WHERE kode_unit_pbj=55;
UPDATE public.ref_unit_pbj
SET kode_unit='UN31.LPPJJ3', nama_unit='Pusat Pengelolaan Pembelajaran', kode_pbj='UN31.LPPJJ3', nama_pbj='Pusat Pengelolaan Pembelajaran'
WHERE kode_unit_pbj=56;
UPDATE public.ref_unit_pbj
SET kode_unit='UN31.LPPJJ4', nama_unit='Pusat Pengelolaan Ujian', kode_pbj='UN31.LPPJJ4', nama_pbj='Pusat Pengelolaan Ujian'
WHERE kode_unit_pbj=57;


UPDATE trx_user_tampung SET kode_unit = 'UN31.LPPJJ1', nama_unit='Pusat Produksi Bahan Ajar dan Multimedia' WHERE kode_unit = 'UN31.LPJJ1';
UPDATE trx_user_tampung SET kode_unit = 'UN31.LPPJJ2', nama_unit='Pusat Distribusi Bahan Ajar' WHERE kode_unit = 'UN31.LPJJ2';
UPDATE trx_user_tampung SET kode_unit = 'UN31.LPPJJ3', nama_unit='Pusat Pengelolaan Pembelajaran' WHERE kode_unit = 'UN31.LPJJ3';
UPDATE trx_user_tampung SET kode_unit = 'UN31.LPPJJ4', nama_unit='Pusat Pengelolaan Ujian' WHERE kode_unit = 'UN31.LPJJ4';


-- sippan
UPDATE ref_rup SET kode_unit = 'UN31.LPPJJ1' WHERE kode_unit = 'UN31.LPJJ1';
UPDATE ref_rup SET kode_unit = 'UN31.LPPJJ2' WHERE kode_unit = 'UN31.LPJJ2';
UPDATE ref_rup SET kode_unit = 'UN31.LPPJJ3' WHERE kode_unit = 'UN31.LPJJ3';
UPDATE ref_rup SET kode_unit = 'UN31.LPPJJ4' WHERE kode_unit = 'UN31.LPJJ4';


-- sidapet
UPDATE trx_kategori SET kode_unit_pbj = 'UN31.LPPJJ1' WHERE kode_unit_pbj = 'UN31.LPJJ1';
UPDATE trx_kategori SET kode_unit_pbj = 'UN31.LPPJJ2' WHERE kode_unit_pbj = 'UN31.LPJJ2';
UPDATE trx_kategori SET kode_unit_pbj = 'UN31.LPPJJ3' WHERE kode_unit_pbj = 'UN31.LPJJ3';
UPDATE trx_kategori SET kode_unit_pbj = 'UN31.LPPJJ4' WHERE kode_unit_pbj = 'UN31.LPJJ4';

UPDATE trx_penjaringan SET kode_unit_pbj = 'UN31.LPPJJ1' WHERE kode_unit_pbj = 'UN31.LPJJ1';
UPDATE trx_penjaringan SET kode_unit_pbj = 'UN31.LPPJJ2' WHERE kode_unit_pbj = 'UN31.LPJJ2';
UPDATE trx_penjaringan SET kode_unit_pbj = 'UN31.LPPJJ3' WHERE kode_unit_pbj = 'UN31.LPJJ3';
UPDATE trx_penjaringan SET kode_unit_pbj = 'UN31.LPPJJ4' WHERE kode_unit_pbj = 'UN31.LPJJ4';


-- sibela & siplang
UPDATE ref_permintaan SET kode_unit = 'UN31.LPPJJ1' WHERE kode_unit = 'UN31.LPJJ1';
UPDATE ref_permintaan SET kode_unit = 'UN31.LPPJJ2' WHERE kode_unit = 'UN31.LPJJ2';
UPDATE ref_permintaan SET kode_unit = 'UN31.LPPJJ3' WHERE kode_unit = 'UN31.LPJJ3';
UPDATE ref_permintaan SET kode_unit = 'UN31.LPPJJ4' WHERE kode_unit = 'UN31.LPJJ4';

