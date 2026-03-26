sidapet -> direktur pbj, PPK, verifikator, kasubdit PBJ, penyedia
siplang -> PPK, penyedia, PK, PP
sibela -> PPK, penyedia, PK, PP
sippan -> PPK
user-management -> superadmin


-- 198 - Ihrom
-- Delete all G01.1 - KPI Sidapet
-- Ihrom - KPI
INSERT INTO trx_group_user (id_group_user, kode_group, id_user, status, ucr, uch, udcr, udch) VALUES(12258, 'G01.1     ', 198, '1'::public.enum_trx_group_user_status, NULL, NULL, NULL, NULL);

-- Delete all G01.3 - Kepala UPBJ Sidapet
-- Ihrom - Kepala UPBJ
INSERT INTO trx_group_user (id_group_user, kode_group, id_user, status, ucr, uch, udcr, udch) VALUES(12249, 'G01.3     ', 198, '1'::public.enum_trx_group_user_status, NULL, NULL, NULL, NULL);

-- G01.6 - admin sidapet
INSERT INTO trx_group_user (id_group_user, kode_group, id_user, status, ucr, uch, udcr, udch) VALUES(12257, 'G01.6     ', 198, '1'::public.enum_trx_group_user_status, NULL, NULL, NULL, NULL);


-- G01.4 - Verifikator sidapet
delete from trx_group_user where kode_group = 'G01.4' and id_user in (
12389,
188,
18577,
18590,
195,
12384,
32728
);
INSERT INTO trx_group_user (id_group_user, kode_group, id_user, status, ucr, uch, udcr, udch) VALUES(5171, 'G01.4     ', 554, '1'::public.enum_trx_group_user_status, NULL, NULL, NULL, NULL);
INSERT INTO trx_group_user (id_group_user, kode_group, id_user, status, ucr, uch, udcr, udch) VALUES(5172, 'G01.4     ', 12389, '1'::public.enum_trx_group_user_status, NULL, NULL, NULL, NULL);
INSERT INTO trx_group_user (id_group_user, kode_group, id_user, status, ucr, uch, udcr, udch) VALUES(5173, 'G01.4     ', 32679, '1'::public.enum_trx_group_user_status, NULL, NULL, NULL, NULL);
INSERT INTO trx_group_user (id_group_user, kode_group, id_user, status, ucr, uch, udcr, udch) VALUES(5174, 'G01.4     ', 188, '1'::public.enum_trx_group_user_status, NULL, NULL, NULL, NULL);
INSERT INTO trx_group_user (id_group_user, kode_group, id_user, status, ucr, uch, udcr, udch) VALUES(5175, 'G01.4     ', 12345, '1'::public.enum_trx_group_user_status, NULL, NULL, NULL, NULL);
INSERT INTO trx_group_user (id_group_user, kode_group, id_user, status, ucr, uch, udcr, udch) VALUES(5176, 'G01.4     ', 18577, '1'::public.enum_trx_group_user_status, NULL, NULL, NULL, NULL);
INSERT INTO trx_group_user (id_group_user, kode_group, id_user, status, ucr, uch, udcr, udch) VALUES(5177, 'G01.4     ', 18590, '1'::public.enum_trx_group_user_status, NULL, NULL, NULL, NULL);
INSERT INTO trx_group_user (id_group_user, kode_group, id_user, status, ucr, uch, udcr, udch) VALUES(5178, 'G01.4     ', 195, '1'::public.enum_trx_group_user_status, NULL, NULL, NULL, NULL);
INSERT INTO trx_group_user (id_group_user, kode_group, id_user, status, ucr, uch, udcr, udch) VALUES(5179, 'G01.4     ', 198, '1'::public.enum_trx_group_user_status, NULL, NULL, NULL, NULL);
INSERT INTO trx_group_user (id_group_user, kode_group, id_user, status, ucr, uch, udcr, udch) VALUES(5180, 'G01.4     ', 196, '1'::public.enum_trx_group_user_status, NULL, NULL, NULL, NULL);
INSERT INTO trx_group_user (id_group_user, kode_group, id_user, status, ucr, uch, udcr, udch) VALUES(5181, 'G01.4     ', 12384, '1'::public.enum_trx_group_user_status, NULL, NULL, NULL, NULL);
INSERT INTO trx_group_user (id_group_user, kode_group, id_user, status, ucr, uch, udcr, udch) VALUES(12275, 'G01.4     ', 32728, '1'::public.enum_trx_group_user_status, NULL, NULL, NULL, NULL);


-- G01.9 - Direktur DMAUPBJ
-- ihrom
INSERT INTO trx_group_user (id_group_user, kode_group, id_user, status, ucr, uch, udcr, udch) VALUES(12256, 'G01.9     ', 198, '1'::public.enum_trx_group_user_status, NULL, NULL, NULL, NULL);
-- arief
INSERT INTO trx_group_user (id_group_user, kode_group, id_user, status, ucr, uch, udcr, udch) VALUES(12264, 'G01.9     ', 10195, '1'::public.enum_trx_group_user_status, NULL, NULL, NULL, NULL);

-- G01.7 - Sidapet Pokja
INSERT INTO trx_group_user (id_group_user, kode_group, id_user, status, ucr, uch, udcr, udch) VALUES(4894, 'G01.7     ', 35, '1'::public.enum_trx_group_user_status, NULL, NULL, NULL, NULL);
INSERT INTO trx_group_user (id_group_user, kode_group, id_user, status, ucr, uch, udcr, udch) VALUES(4895, 'G01.7     ', 9, '1'::public.enum_trx_group_user_status, NULL, NULL, NULL, NULL);
INSERT INTO trx_group_user (id_group_user, kode_group, id_user, status, ucr, uch, udcr, udch) VALUES(4896, 'G01.7     ', 196, '1'::public.enum_trx_group_user_status, NULL, NULL, NULL, NULL);
INSERT INTO trx_group_user (id_group_user, kode_group, id_user, status, ucr, uch, udcr, udch) VALUES(4897, 'G01.7     ', 200, '1'::public.enum_trx_group_user_status, NULL, NULL, NULL, NULL);
INSERT INTO trx_group_user (id_group_user, kode_group, id_user, status, ucr, uch, udcr, udch) VALUES(4898, 'G01.7     ', 32, '1'::public.enum_trx_group_user_status, NULL, NULL, NULL, NULL);
INSERT INTO trx_group_user (id_group_user, kode_group, id_user, status, ucr, uch, udcr, udch) VALUES(4899, 'G01.7     ', 12327, '1'::public.enum_trx_group_user_status, NULL, NULL, NULL, NULL);
INSERT INTO trx_group_user (id_group_user, kode_group, id_user, status, ucr, uch, udcr, udch) VALUES(4900, 'G01.7     ', 34, '1'::public.enum_trx_group_user_status, NULL, NULL, NULL, NULL);
INSERT INTO trx_group_user (id_group_user, kode_group, id_user, status, ucr, uch, udcr, udch) VALUES(4901, 'G01.7     ', 11494, '1'::public.enum_trx_group_user_status, NULL, NULL, NULL, NULL);
INSERT INTO trx_group_user (id_group_user, kode_group, id_user, status, ucr, uch, udcr, udch) VALUES(4902, 'G01.7     ', 33, '1'::public.enum_trx_group_user_status, NULL, NULL, NULL, NULL);
INSERT INTO trx_group_user (id_group_user, kode_group, id_user, status, ucr, uch, udcr, udch) VALUES(4903, 'G01.7     ', 11509, '1'::public.enum_trx_group_user_status, NULL, NULL, NULL, NULL);
INSERT INTO trx_group_user (id_group_user, kode_group, id_user, status, ucr, uch, udcr, udch) VALUES(4904, 'G01.7     ', 12464, '1'::public.enum_trx_group_user_status, NULL, NULL, NULL, NULL);
INSERT INTO trx_group_user (id_group_user, kode_group, id_user, status, ucr, uch, udcr, udch) VALUES(4905, 'G01.7     ', 23, '1'::public.enum_trx_group_user_status, NULL, NULL, NULL, NULL);
INSERT INTO trx_group_user (id_group_user, kode_group, id_user, status, ucr, uch, udcr, udch) VALUES(4906, 'G01.7     ', 198, '1'::public.enum_trx_group_user_status, NULL, NULL, NULL, NULL);
INSERT INTO trx_group_user (id_group_user, kode_group, id_user, status, ucr, uch, udcr, udch) VALUES(4907, 'G01.7     ', 10, '1'::public.enum_trx_group_user_status, NULL, NULL, NULL, NULL);
INSERT INTO trx_group_user (id_group_user, kode_group, id_user, status, ucr, uch, udcr, udch) VALUES(4908, 'G01.7     ', 40, '1'::public.enum_trx_group_user_status, NULL, NULL, NULL, NULL);
INSERT INTO trx_group_user (id_group_user, kode_group, id_user, status, ucr, uch, udcr, udch) VALUES(4909, 'G01.7     ', 12397, '1'::public.enum_trx_group_user_status, NULL, NULL, NULL, NULL);
INSERT INTO trx_group_user (id_group_user, kode_group, id_user, status, ucr, uch, udcr, udch) VALUES(4910, 'G01.7     ', 12439, '1'::public.enum_trx_group_user_status, NULL, NULL, NULL, NULL);
INSERT INTO trx_group_user (id_group_user, kode_group, id_user, status, ucr, uch, udcr, udch) VALUES(4911, 'G01.7     ', 12320, '1'::public.enum_trx_group_user_status, NULL, NULL, NULL, NULL);


-- yg seharusnya dihapus dari ref_group - kode aplikasi = '01' - sidapet (gak usah dihapus jadinya)
-- INSERT INTO ref_group (kode_group, nama_group, kode_aplikasi, kode_level, ucr, uch, udcr, udch, kode_jabatan) VALUES('G01.1     ', 'KPI', '01        ', 1, NULL, NULL, '2024-04-29 10:33:25.765', '2024-04-29 10:33:25.765', NULL);
-- INSERT INTO ref_group (kode_group, nama_group, kode_aplikasi, kode_level, ucr, uch, udcr, udch, kode_jabatan) VALUES('G01.3     ', 'Kepala UPBJ', '01        ', 2, NULL, NULL, '2024-04-29 10:34:09.383', '2024-04-29 10:34:09.383', NULL);
-- INSERT INTO ref_group (kode_group, nama_group, kode_aplikasi, kode_level, ucr, uch, udcr, udch, kode_jabatan) VALUES('G01.6     ', 'admin', '01        ', 4, NULL, NULL, '2024-04-29 10:37:04.951', '2024-04-29 10:37:04.951', NULL);
-- INSERT INTO ref_group (kode_group, nama_group, kode_aplikasi, kode_level, ucr, uch, udcr, udch, kode_jabatan) VALUES('G01.9     ', 'Direktur DMAUPBJ', '01        ', 2, 'irgy', NULL, '2024-11-21 14:18:39.769', '2024-11-21 14:18:39.769', NULL);
-- INSERT INTO ref_group (kode_group, nama_group, kode_aplikasi, kode_level, ucr, uch, udcr, udch, kode_jabatan) VALUES('G01.7     ', 'Pokja', '01        ', 4, NULL, NULL, '2024-04-29 10:37:17.451', '2024-04-29 10:37:17.451', 2);



-- Si-PPan -------------------------------------

-- G03.1 - sippan admin
INSERT INTO trx_group_user (id_group_user, kode_group, id_user, status, ucr, uch, udcr, udch) VALUES(12260, 'G03.1     ', 198, '1'::public.enum_trx_group_user_status, NULL, NULL, NULL, NULL);
INSERT INTO trx_group_user (id_group_user, kode_group, id_user, status, ucr, uch, udcr, udch) VALUES(12281, 'G03.1     ', 32739, '1'::public.enum_trx_group_user_status, NULL, NULL, '2026-03-25 04:55:54.194 +00:00', '2026-03-25 04:55:54.194 +00:00');
INSERT INTO trx_group_user (id_group_user, kode_group, id_user, status, ucr, uch, udcr, udch) VALUES(12283, 'G03.1     ', 12397, '1'::public.enum_trx_group_user_status, NULL, NULL, '2026-03-25 05:49:08.559 +00:00', '2026-03-25 05:49:08.559 +00:00');
INSERT INTO trx_group_user (id_group_user, kode_group, id_user, status, ucr, uch, udcr, udch) VALUES(12295, 'G03.1     ', 32742, '1'::public.enum_trx_group_user_status, NULL, NULL, '2026-03-25 09:12:49.460 +00:00', '2026-03-25 09:12:49.460 +00:00');




-- Si-Bela -------------------------------------
Aman



-- Si-Plang -------------------------------------










