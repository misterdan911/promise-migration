/*
 Navicat Premium Dump SQL

 Source Server         : promis-prod-dbmodul
 Source Server Type    : PostgreSQL
 Source Server Version : 160011 (160011)
 Source Host           : 172.30.10.24:5432
 Source Catalog        : db_usman
 Source Schema         : public

 Target Server Type    : PostgreSQL
 Target Server Version : 160011 (160011)
 File Encoding         : 65001

 Date: 10/02/2026 14:59:37
*/


-- ----------------------------
-- Table structure for ref_menu1
-- ----------------------------
DROP TABLE IF EXISTS "public"."ref_menu1";
CREATE TABLE "public"."ref_menu1" (
  "kode_aplikasi" char(2) COLLATE "pg_catalog"."default" NOT NULL,
  "kode_menu1" char(10) COLLATE "pg_catalog"."default" NOT NULL,
  "nama_menu1" varchar(255) COLLATE "pg_catalog"."default",
  "keterangan_menu" varchar(255) COLLATE "pg_catalog"."default",
  "icon" varchar(255) COLLATE "pg_catalog"."default",
  "link" varchar(255) COLLATE "pg_catalog"."default",
  "status" "public"."enum_ref_menu1_status",
  "on_update" "public"."enum_ref_menu1_on_update",
  "on_create" "public"."enum_ref_menu1_on_create",
  "on_delete" "public"."enum_ref_menu1_on_delete",
  "on_view" "public"."enum_ref_menu1_on_view",
  "ucr" varchar(255) COLLATE "pg_catalog"."default",
  "uch" varchar(255) COLLATE "pg_catalog"."default",
  "udcr" timestamptz(6),
  "udch" timestamptz(6),
  "kode_level" int4 NOT NULL
)
;
COMMENT ON COLUMN "public"."ref_menu1"."status" IS '0=sembunyi, 1=tampil';

-- ----------------------------
-- Records of ref_menu1
-- ----------------------------
INSERT INTO "public"."ref_menu1" VALUES ('01', 'M01.01.23 ', 'Penilaian Kinerja Penyedia', 'Menu untuk Penilaian Kinerja Penyedia Pokja', 'flag', '/landingpromise/sidapet/pokja/penilaiankinerjapenyedia', '1', '1', '1', '1', '1', 'tes', 'tes', '2024-04-30 12:34:22.704+07', '2024-04-30 16:37:34.151+07', 4);
INSERT INTO "public"."ref_menu1" VALUES ('00', 'M00.01.05 ', 'Manajemen User', 'Pengaturan user pada aplikasi', 'settings', '', '1', '1', '1', '1', '1', 'tes', 'tes', '2024-04-25 11:54:41.027+07', '2024-04-25 11:54:41.027+07', 1);
INSERT INTO "public"."ref_menu1" VALUES ('01', 'M01.01.01 ', 'Dashboard', 'Dashboard KPI', 'speed', '/landingpromise/sidapet/kpi/dashboard', '1', '1', '1', '1', '1', 'tes', 'tes', '2024-04-29 10:42:36.417+07', '2024-04-29 10:45:34.291+07', 1);
INSERT INTO "public"."ref_menu1" VALUES ('01', 'M01.01.02 ', 'Penilaian Kinerja Penyedia', 'Menu Untuk Penilaian Penyedia KPI', 'flag', '/landingpromise/sidapet/kpi/penilaiankinerjapenyedia', '1', '1', '1', '1', '1', 'tes', 'tes', '2024-04-29 10:47:22.047+07', '2024-04-29 16:01:27.908+07', 1);
INSERT INTO "public"."ref_menu1" VALUES ('01', 'M01.01.03 ', 'Blacklist Penyedia', 'Menu master data  blacklist vendor untuk KPI', 'priority_high', '/landingpromise/sidapet/kpi/blacklistpenyedia', '1', '1', '1', '1', '1', 'tes', 'tes', '2024-04-29 10:57:30.607+07', '2024-04-29 16:04:38.261+07', 1);
INSERT INTO "public"."ref_menu1" VALUES ('01', 'M01.01.05 ', 'Paket', 'Menu Paket', 'dataset', '/landingpromise/sidapet/kepalaupbj/paket', '1', '1', '1', '1', '1', 'tes', 'tes', '2024-04-29 11:22:37.056+07', '2024-04-29 11:24:33.454+07', 2);
INSERT INTO "public"."ref_menu1" VALUES ('01', 'M01.01.07 ', 'Monitoring', 'Menu untuk monitoring Kepala UPBJ', 'monitoring', '/landingpromise/sidapet/kepalaupbj/monitoring', '1', '1', '1', '1', '1', 'tes', 'tes', '2024-04-29 11:26:13.287+07', '2024-04-29 11:26:13.287+07', 2);
INSERT INTO "public"."ref_menu1" VALUES ('01', 'M01.01.13 ', 'Dashboard', 'Menu untuk dashboard kepala upbj', 'speed', '/landingpromise/sidapet/kepalaupbj/dashboard/', '1', '1', '1', '1', '1', 'tes', 'tes', '2024-04-30 12:00:44.875+07', '2024-04-30 12:01:00.565+07', 2);
INSERT INTO "public"."ref_menu1" VALUES ('01', 'M01.01.15 ', 'Dashboard', 'Menu untuk dashboard admin', 'speed', '/landingpromise/sidapet/admin/dashboard', '1', '1', '1', '1', '1', 'tes', 'tes', '2024-04-30 12:05:27.303+07', '2024-04-30 12:23:54.114+07', 4);
INSERT INTO "public"."ref_menu1" VALUES ('01', 'M01.01.16 ', 'Dashboard', 'Menu untuk dashboard Pokja', 'speed', '/landingpromise/sidapet/pokja/dashboard', '1', '1', '1', '1', '1', 'tes', 'tes', '2024-04-30 12:06:38.577+07', '2024-04-30 12:25:04.717+07', 4);
INSERT INTO "public"."ref_menu1" VALUES ('01', 'M01.01.17 ', 'Dashboard', 'Menu untuk dashboard PP', 'speed', '/landingpromise/sidapet/pp/dashboard', '1', '1', '1', '1', '1', 'tes', 'tes', '2024-04-30 12:07:33.324+07', '2024-04-30 12:25:23.09+07', 3);
INSERT INTO "public"."ref_menu1" VALUES ('01', 'M01.01.21 ', 'Penilaian Kinerja Penyedia', 'Menu untuk Penilaian Kinerja Penyedia Kepala UPBJ', 'flag', '/landingpromise/sidapet/kepalaupbj/penilaiankinerjapenyedia', '1', '1', '1', '1', '1', 'tes', 'dholy', '2024-04-30 12:10:50.733+07', '2024-07-09 22:16:07.653+07', 2);
INSERT INTO "public"."ref_menu1" VALUES ('01', 'M01.01.22 ', 'Penilaian Kinerja Penyedia', 'Menu untuk Penilaian Kinerja Penyedia Pengendali Kualitas', 'flag', '/landingpromise/sidapet/pengendalikualitas/penilaiankinerjapenyedia', '1', '1', '1', '1', '1', 'tes', 'tes', '2024-04-30 12:30:40.133+07', '2024-04-30 16:36:56.724+07', 2);
INSERT INTO "public"."ref_menu1" VALUES ('01', 'M01.01.24 ', 'Penilaian Kinerja Penyedia', 'Menu untuk Penilaian Kinerja Penyedia PP', 'flag', '/landingpromise/sidapet/pp/penilaiankinerjapenyedia', '1', '1', '1', '1', '1', 'tes', 'tes', '2024-04-30 12:35:43.037+07', '2024-04-30 16:37:47.415+07', 3);
INSERT INTO "public"."ref_menu1" VALUES ('00', 'M00.01.04 ', 'Manajemen Aplikasi Web', 'Manajemen aplikasi website', 'settings_applications', '', '1', '1', '1', '1', '1', 'tes', 'unknown', '2024-04-25 11:45:09.653+07', '2025-02-10 14:36:18.644+07', 1);
INSERT INTO "public"."ref_menu1" VALUES ('01', 'M01.01.26 ', 'Penilaian Kinerja Penyedia', 'Menu untuk Penilaian Kinerja Penyedia Verifikator', 'flag', '/landingpromise/sidapet/verifikator/penilaiankinerjapenyedia', '1', '1', '1', '1', '1', 'tes', 'tes', '2024-04-30 12:40:37.126+07', '2024-04-30 16:38:14.921+07', 3);
INSERT INTO "public"."ref_menu1" VALUES ('01', 'M01.01.27 ', 'Blacklist Penyedia', 'Menu untuk Blacklist Penyedia Kepala UPBJ', 'priority_high', '/landingpromise/sidapet/kepalaupbj/blacklistpenyedia', '1', '1', '1', '1', '1', 'tes', 'tes', '2024-04-30 12:43:04.759+07', '2024-04-30 16:38:33.506+07', 2);
INSERT INTO "public"."ref_menu1" VALUES ('01', 'M01.01.28 ', 'Blacklist Penyedia', 'Menu untuk Blacklist Penyedia Pengendali Kualitas', 'priority_high', '/landingpromise/sidapet/pengendalikualitas/blacklistpenyedia', '1', '1', '1', '1', '1', 'tes', 'tes', '2024-04-30 12:44:37.954+07', '2024-04-30 16:38:51.724+07', 2);
INSERT INTO "public"."ref_menu1" VALUES ('01', 'M01.01.29 ', 'Blacklist Penyedia', 'Menu untuk Blacklist Penyedia Pokja', 'priority_high', '/landingpromise/sidapet/pokja/blacklistpenyedia', '1', '1', '1', '1', '1', 'tes', 'tes', '2024-04-30 12:46:10.919+07', '2024-04-30 16:39:04.223+07', 4);
INSERT INTO "public"."ref_menu1" VALUES ('01', 'M01.01.30 ', 'Blacklist Penyedia', 'Menu untuk Blacklist Penyedia PP', 'priority_high', '/landingpromise/sidapet/pp/blacklistpenyedia', '1', '1', '1', '1', '1', 'tes', 'tes', '2024-04-30 12:47:43.796+07', '2024-04-30 16:39:27.351+07', 3);
INSERT INTO "public"."ref_menu1" VALUES ('01', 'M01.01.32 ', 'Blacklist Penyedia', 'Menu untuk Blacklist Penyedia Verifikator', 'priority_high', '/landingpromise/sidapet/verifikator/blacklistpenyedia', '1', '1', '1', '1', '1', 'tes', 'tes', '2024-04-30 12:49:33.87+07', '2024-04-30 16:39:45.248+07', 3);
INSERT INTO "public"."ref_menu1" VALUES ('01', 'M01.01.20 ', 'Dashboard', 'Menu untuk dashboard Verifikator', 'speed', '/landingpromise/sidapet/verifikator/dashboard', '1', '1', '1', '1', '1', 'tes', 'tes', '2024-04-30 12:09:28.157+07', '2024-04-30 12:09:28.157+07', 4);
INSERT INTO "public"."ref_menu1" VALUES ('03', 'M03.01.01 ', 'Dashboard', 'Dashboard SI-PPan', 'home', '/landingpromise/SI-PPan', '1', '1', '1', '1', '1', 'dholy', 'tes', '2024-07-16 14:44:28.166+07', '2024-07-16 14:44:28.166+07', 5);
INSERT INTO "public"."ref_menu1" VALUES ('10', 'M10.01.01 ', 'Dashboard', 'Dashboard untuk super admin', 'dashboard', '/landingpromise/bimtekmonev/dashboard/superadmin', '1', '1', '1', '1', '1', 'wulan', 'tes', '2024-08-06 14:55:32.213+07', '2024-08-06 14:55:32.213+07', 1);
INSERT INTO "public"."ref_menu1" VALUES ('01', 'M01.01.08 ', 'Verifikasi Akun', 'Menu untuk verifikasi akun', 'verified', '/landingpromise/sidapet/verifikator/verifikasiakun', '1', '1', '1', '1', '1', 'tes', 'dholy', '2024-04-29 11:35:44.042+07', '2024-06-26 14:28:37.711+07', 4);
INSERT INTO "public"."ref_menu1" VALUES ('05', 'M05.01.01 ', 'Dashboard', 'Dashboard untuk super admin', 'dashboard', '/landingpromise/siplang/dashboard/superadmin', '1', '1', '1', '1', '1', 'wulan', 'tes', '2024-08-06 15:03:07.869+07', '2024-08-06 15:03:07.869+07', 1);
INSERT INTO "public"."ref_menu1" VALUES ('11', 'M11.01.01 ', 'Dashboard', 'Dashboard untuk super admin', 'dashboard', '/landingpromise/e-sign/dashboard/superadmin', '1', '1', '1', '1', '1', 'wulan', 'tes', '2024-08-06 15:04:55.68+07', '2024-08-06 15:04:55.68+07', 1);
INSERT INTO "public"."ref_menu1" VALUES ('08', 'M08.01.01 ', 'Dashboard', 'Dashboard untuk super admin', 'dashboard', '/landingpromise/e-katalog/dashboard/superadmin', '1', '1', '1', '1', '1', 'wulan', 'tes', '2024-08-06 15:06:13.515+07', '2024-08-06 15:06:13.515+07', 1);
INSERT INTO "public"."ref_menu1" VALUES ('12', 'M12.01.01 ', 'Dashboard', 'Dashboard untuk super admin', 'dashboard', '/landingpromise/e-audit/dashboard/superadmin', '1', '1', '1', '1', '1', 'wulan', 'tes', '2024-08-06 15:10:22.542+07', '2024-08-06 15:10:22.542+07', 1);
INSERT INTO "public"."ref_menu1" VALUES ('14', 'M14.01.01 ', 'Dashboard', 'Dashboard untuk super admin', 'dashboard', '/landingpromise/simanje/dashboard/superadmin', '1', '1', '1', '1', '1', 'wulan', 'tes', '2024-08-06 15:11:19.747+07', '2024-08-06 15:11:19.747+07', 1);
INSERT INTO "public"."ref_menu1" VALUES ('13', 'M13.01.01 ', 'Dashboard', 'Dashboard untuk super admin', 'dashboard', '/landingpromise/e-ticketing/dashboard/superadmin', '1', '1', '1', '1', '1', 'wulan', 'tes', '2024-08-06 15:12:16.852+07', '2024-08-06 15:12:16.852+07', 1);
INSERT INTO "public"."ref_menu1" VALUES ('07', 'M07.01.01 ', 'Dashboard', 'Dashboard untuk super admin', 'dashboard', '/landingpromise/tender/dashboard/superadmin', '1', '1', '1', '1', '1', 'wulan', 'tes', '2024-08-06 15:13:04.256+07', '2024-08-06 15:13:04.256+07', 1);
INSERT INTO "public"."ref_menu1" VALUES ('04', 'M04.01.01 ', 'Dashboard', 'Dashboard untuk super admin', 'dashboard', '/landingpromise/sibela/dashboard/superadmin', '1', '1', '1', '1', '1', 'wulan', 'tes', '2024-08-06 15:14:29.039+07', '2024-08-06 15:14:29.039+07', 1);
INSERT INTO "public"."ref_menu1" VALUES ('09', 'M09.01.01 ', 'Dashboard', 'Dashboard untuk super admin', 'dashboard', '/landingpromise/swakelola/dashboard/superadmin', '1', '1', '1', '1', '1', 'wulan', 'tes', '2024-08-06 15:15:24.068+07', '2024-08-06 15:15:24.068+07', 1);
INSERT INTO "public"."ref_menu1" VALUES ('01', 'M01.01.40 ', 'Pengeluaran Penyedia', 'Menu Pengeluaran Penyedia Untuk Ka.Subdit PBJ', 'work', '/landingpromise/sidapet/kasubdit-pbj/pengeluaran-penyedia', '1', '1', '1', '1', '1', 'unknown', 'tes', '2025-02-24 16:15:08.698+07', '2025-02-24 16:15:08.698+07', 3);
INSERT INTO "public"."ref_menu1" VALUES ('01', 'M01.01.37 ', 'DPT', 'Daftar Penyedia Tetap Untuk Ka.Subdit PBJ', 'work', '/landingpromise/sidapet/kasubdit-pbj/dpt', '1', '1', '1', '1', '1', 'unknown', 'unknown', '2025-02-24 16:05:29.135+07', '2025-02-24 16:25:03.807+07', 3);
INSERT INTO "public"."ref_menu1" VALUES ('02', 'M02.01.01 ', 'dashboard', 'dashboard untuk super admin', 'dashboard', '/landingpromise/sipung/dashboard', '1', '1', '1', '1', '1', 'dholy', 'unknown', '2024-07-10 10:50:35.916+07', '2024-08-06 15:34:34.487+07', 1);
INSERT INTO "public"."ref_menu1" VALUES ('01', 'M01.01.19 ', 'Beranda', 'Menu untuk dashboard Vendor', 'speed', '/landingpromise/sidapet/vendor/beranda', '1', '1', '1', '1', '1', 'tes', 'dholy', '2024-04-30 12:08:45.809+07', '2024-09-11 10:58:33.79+07', 5);
INSERT INTO "public"."ref_menu1" VALUES ('11', 'M11.01.02 ', 'Profil', 'Menu Profil Untuk Pegawai', 'speed', '/landingpromise/e-sign/pegawai/profil', '1', '1', '1', '1', '1', 'dholy', 'tes', '2024-09-17 11:15:14.314+07', '2024-09-17 11:15:14.314+07', 5);
INSERT INTO "public"."ref_menu1" VALUES ('11', 'M11.01.03 ', 'Profil', 'Menu Profil Untuk Vendor', 'speed', '/landingpromise/e-sign/vendor/profil', '1', '1', '1', '1', '1', 'dholy', 'tes', '2024-09-17 11:37:55.366+07', '2024-09-17 11:37:55.366+07', 5);
INSERT INTO "public"."ref_menu1" VALUES ('03', 'M03.01.02 ', 'Dashboard', 'Dashboard untuk PPK Unit', 'speed', '/landingpromise/si-ppan/ppk/dashboard', '1', '1', '1', '1', '1', 'dholy', 'tes', '2024-09-17 13:13:13.51+07', '2024-09-17 13:13:13.51+07', 2);
INSERT INTO "public"."ref_menu1" VALUES ('03', 'M03.01.04 ', 'RUP', 'Menu RUP untuk PPK', 'description', '/landingpromise/si-ppan/ppk/rup', '1', '1', '1', '1', '1', 'dholy', 'tes', '2024-09-17 13:16:47.487+07', '2024-09-17 13:16:47.487+07', 2);
INSERT INTO "public"."ref_menu1" VALUES ('01', 'M01.01.41 ', 'Dashboard', 'Dashboard untuk Direktur PBJ', 'dashboard', '/landingpromise/sidapet/direktur-pbj/dashboard', '1', '1', '1', '1', '1', 'unknown', 'unknown', '2025-02-27 13:44:10.438+07', '2025-02-27 13:50:30.733+07', 2);
INSERT INTO "public"."ref_menu1" VALUES ('03', 'M03.01.03 ', 'DRA-UK', 'Menu DRA-UK untuk PPK', 'business_center', '/landingpromise/si-ppan/ppk/rka-unit', '1', '1', '1', '1', '1', 'dholy', 'wulan', '2024-09-17 13:15:22.86+07', '2024-10-18 10:57:36.28+07', 2);
INSERT INTO "public"."ref_menu1" VALUES ('11', 'M11.01.04 ', 'Pengajuan TTE', 'Menu Verifikasi pendaftaran TTE', 'safety_check', '/landingpromise/e-sign/verifikator/pengajuan-tte', '1', '1', '1', '1', '1', 'dholy', 'dholy', '2024-11-05 13:45:37.935+07', '2024-11-06 09:59:43.653+07', 3);
INSERT INTO "public"."ref_menu1" VALUES ('01', 'M01.01.33 ', 'Dashboard', 'Menu beranda untuk PPK', 'home', '/landingpromise/sidapet/ppk/dashboard', '1', '1', '1', '1', '1', 'unknown', 'tes', '2024-12-20 15:06:27.394+07', '2024-12-20 15:06:27.394+07', 2);
INSERT INTO "public"."ref_menu1" VALUES ('01', 'M01.01.35 ', 'Permintaan', 'Menu Permintaan DPT PPK', 'monitoring', '/landingpromise/sidapet/ppk/permintaan', '1', '1', '1', '1', '1', 'unknown', 'tes', '2024-12-20 15:09:37.341+07', '2024-12-20 15:09:37.341+07', 2);
INSERT INTO "public"."ref_menu1" VALUES ('01', 'M01.01.34 ', 'DPT', 'Menu Daftar Penyedia Terpilih Untuk PPK', 'work', '/landingpromise/sidapet/ppk/dpt', '1', '1', '1', '1', '1', 'unknown', 'unknown', '2024-12-20 15:08:03.542+07', '2024-12-20 15:10:00.491+07', 2);
INSERT INTO "public"."ref_menu1" VALUES ('04', 'M04.01.02 ', 'Dashboard', 'Dashboard Untuk Pejabat Penyedia', 'dashboard', '/landingpromise/sibela/pp/dashboard', '1', '1', '1', '1', '1', 'irgy', 'irgy', '2025-02-11 13:02:21.455+07', '2025-02-11 14:46:21.314+07', 2);
INSERT INTO "public"."ref_menu1" VALUES ('01', 'M01.01.42 ', 'Paket', 'Menu Paket untuk Direktur PBJ', 'work', '/landingpromise/sidapet/direktur-pbj/paket', '1', '1', '1', '1', '1', 'unknown', 'tes', '2025-02-27 13:52:40.616+07', '2025-02-27 13:52:40.616+07', 2);
INSERT INTO "public"."ref_menu1" VALUES ('04', 'M04.01.04 ', 'Dashboard', 'Dashboard Untuk Penyedia', 'dashboard', '/landingpromise/sibela/penyedia/dashboard', '1', '1', '1', '1', '1', 'unknown', 'tes', '2025-02-17 12:12:27.898+07', '2025-02-17 12:12:27.898+07', 5);
INSERT INTO "public"."ref_menu1" VALUES ('04', 'M04.01.05 ', 'Paket', 'Paket Permintaan', 'local_shipping', '/landingpromise/sibela/penyedia/paket', '1', '1', '1', '1', '1', 'unknown', 'tes', '2025-02-17 12:13:39.085+07', '2025-02-17 12:13:39.085+07', 5);
INSERT INTO "public"."ref_menu1" VALUES ('01', 'M01.01.36 ', 'Dashboard', 'Dashboard Ka.Subdit PBJ ', 'dashboard', '/landingpromise/sidapet/kasubdit-pbj/dashboard', '1', '1', '1', '1', '1', 'unknown', 'tes', '2025-02-24 16:01:15.777+07', '2025-02-24 16:01:15.777+07', 3);
INSERT INTO "public"."ref_menu1" VALUES ('01', 'M01.01.38 ', 'Luar DPT', 'Luar DPT untuk Ka.Subdit PBJ', 'work', '/landingpromise/sidapet/kasubdit-pbj/luar-dpt', '1', '1', '1', '1', '1', 'unknown', 'tes', '2025-02-24 16:07:24.547+07', '2025-02-24 16:07:24.547+07', 3);
INSERT INTO "public"."ref_menu1" VALUES ('01', 'M01.01.39 ', 'Paket', 'Menu Paket untuk Ka.Subdit PBJ', 'work', '/landingpromise/sidapet/kasubdit-pbj/paket', '1', '1', '1', '1', '1', 'unknown', 'tes', '2025-02-24 16:10:04.033+07', '2025-02-24 16:10:04.033+07', 3);
INSERT INTO "public"."ref_menu1" VALUES ('01', 'M01.01.43 ', 'DPT', 'Menu DPT  untuk Direktur PBJ', 'work', '/landingpromise/sidapet/direktur-pbj/dpt', '1', '1', '1', '1', '1', 'unknown', 'tes', '2025-02-27 13:53:48.445+07', '2025-02-27 13:53:48.445+07', 2);
INSERT INTO "public"."ref_menu1" VALUES ('01', 'M01.01.44 ', 'Luar DPT', 'Menu Luar DPT untuk Direktur PBJ', 'work', '/landingpromise/sidapet/direktur-pbj/luar-dpt', '1', '1', '1', '1', '1', 'unknown', 'tes', '2025-02-27 13:54:43.728+07', '2025-02-27 13:54:43.728+07', 2);
INSERT INTO "public"."ref_menu1" VALUES ('01', 'M01.01.45 ', 'Pengeluaran Penyedia', 'Menu Pengeluaran Penyedia untuk Direktur PBJ', 'work', '/landingpromise/sidapet/direktur-pbj/pengeluaran-penyedia', '1', '1', '1', '1', '1', 'unknown', 'tes', '2025-02-27 13:56:05.388+07', '2025-02-27 13:56:05.388+07', 2);
INSERT INTO "public"."ref_menu1" VALUES ('05', 'M05.01.04 ', 'Kontrak', 'Menu Kontrak untuk PP', 'description', '/landingpromise/siplang/pp/kontrak', '1', '1', '1', '1', '1', 'unknown', 'unknown', '2025-03-08 19:31:24.076+07', '2025-03-14 14:59:31.694+07', 2);
INSERT INTO "public"."ref_menu1" VALUES ('05', 'M05.01.02 ', 'Dashboard', 'Dashboard untuk PP', 'dashboard', '/landingpromise/siplang/pp/dashboard', '1', '1', '1', '1', '1', 'unknown', 'tes', '2025-03-08 19:28:23.575+07', '2025-03-08 19:28:23.575+07', 2);
INSERT INTO "public"."ref_menu1" VALUES ('05', 'M05.01.03 ', 'Permintaan', 'Permintaan DPT', 'local_shipping', '/landingpromise/siplang/pp/permintaan', '1', '1', '1', '1', '1', 'unknown', 'unknown', '2025-03-08 19:29:44.071+07', '2025-03-08 19:29:53.798+07', 2);
INSERT INTO "public"."ref_menu1" VALUES ('01', 'M01.01.46 ', 'DPT', 'Menu untuk verifikator', 'work', '', '1', '1', '1', '1', '1', 'unknown', 'tes', '2025-03-04 11:13:55.252+07', '2025-03-04 11:13:55.252+07', 4);
INSERT INTO "public"."ref_menu1" VALUES ('04', 'M04.01.06 ', 'Kontrak', 'Menu Kontrak untuk PP', 'description', '/landingpromise/sibela/pp/kontrak', '1', '1', '1', '1', '1', 'unknown', 'unknown', '2025-03-13 08:23:56.532+07', '2025-03-13 08:26:27.269+07', 2);
INSERT INTO "public"."ref_menu1" VALUES ('04', 'M04.01.03 ', 'Permintaan', 'Permintaan DPT', 'inventory_2', '/landingpromise/sibela/pp/permintaan', '1', '1', '1', '1', '1', 'irgy', 'unknown', '2025-02-10 10:30:26.694+07', '2025-03-13 08:38:40.65+07', 2);
INSERT INTO "public"."ref_menu1" VALUES ('04', 'M04.01.08 ', 'Kontrak', 'Menu Kontrak untuk Penyedia', 'description', '/landingpromise/sibela/penyedia/kontrak', '1', '1', '1', '1', '1', 'unknown', 'tes', '2025-03-14 08:37:01.206+07', '2025-03-14 08:37:01.206+07', 5);
INSERT INTO "public"."ref_menu1" VALUES ('05', 'M05.01.05 ', 'Pembayaran', 'Menu Pembayaran untuk PP', 'payments', '/landingpromise/siplang/pp/pembayaran', '1', '1', '1', '1', '1', 'unknown', 'tes', '2025-03-14 15:22:30.323+07', '2025-03-14 15:22:30.323+07', 2);
INSERT INTO "public"."ref_menu1" VALUES ('05', 'M05.01.07 ', 'Paket', 'Paket Permintaan Penyedia', 'local_shipping', '/landingpromise/siplang/penyedia/paket', '1', '1', '1', '1', '1', 'unknown', 'unknown', '2025-04-23 17:02:56.916+07', '2025-04-23 17:18:07.205+07', 5);
INSERT INTO "public"."ref_menu1" VALUES ('05', 'M05.01.06 ', 'Dashboard', 'Dashboard Permintaan', 'dashboard', '/landingpromise/siplang/penyedia/dashboard', '1', '1', '1', '1', '1', 'unknown', 'unknown', '2025-04-23 17:04:33.592+07', '2025-04-23 17:18:39.62+07', 5);
INSERT INTO "public"."ref_menu1" VALUES ('01', 'M01.01.47 ', 'Pengajuan TTE', 'Pengajuan TTE untuk vendor', 'key', '/landingpromise/sidapet/vendor/pengajuan-tte', '1', '1', '1', '1', '1', 'unknown', 'tes', '2025-05-11 23:08:12.565+07', '2025-05-11 23:08:12.565+07', 5);
INSERT INTO "public"."ref_menu1" VALUES ('01', 'M01.01.48 ', 'Master', 'Menu master data verifikator', 'storage', '', '1', '1', '1', '1', '1', 'unknown', 'unknown', '2025-05-11 23:14:10.68+07', '2025-05-11 23:15:16.953+07', 4);
INSERT INTO "public"."ref_menu1" VALUES ('05', 'M05.01.08 ', 'Dashboard', 'Dashboard Permintaan PPK', 'dashboard', '/landingpromise/siplang/ppk/dashboard', '1', '1', '1', '1', '1', 'unknown', 'tes', '2025-05-19 14:24:05.547+07', '2025-05-19 14:24:05.547+07', 2);
INSERT INTO "public"."ref_menu1" VALUES ('05', 'M05.01.09 ', 'Permintaan', 'Permintaan DPT PPK', 'local_shipping', '/landingpromise/siplang/ppk/permintaan', '1', '1', '1', '1', '1', 'unknown', 'unknown', '2025-05-19 14:25:05.599+07', '2025-05-19 14:27:32.656+07', 2);
INSERT INTO "public"."ref_menu1" VALUES ('04', 'M04.01.10 ', 'Dashboard', 'Dashboard PPK', 'dashboard', '/landingpromise/sibela/ppk/dashboard', '1', '1', '1', '1', '1', 'unknown', 'unknown', '2025-06-30 15:00:32.034+07', '2025-06-30 16:37:23.927+07', 2);
INSERT INTO "public"."ref_menu1" VALUES ('04', 'M04.01.11 ', 'Kontrak', 'Menu kontrak untuk PPK', 'description', '/landingpromise/sibela/ppk/kontrak', '1', '1', '1', '1', '1', 'irgy', 'irgy', '2025-06-26 11:57:45.855+07', '2025-06-26 11:58:52.3+07', 2);
INSERT INTO "public"."ref_menu1" VALUES ('04', 'M04.01.13 ', 'Dashboard', 'Menu Dashboard untuk Pengendali Kualitas (PK)', 'dashboard', '/landingpromise/sibela/pk/dashboard', '1', '1', '1', '1', '1', 'unknown', 'tes', '2025-07-03 17:01:16.196+07', '2025-07-03 17:01:16.196+07', 2);
INSERT INTO "public"."ref_menu1" VALUES ('04', 'M04.01.14 ', 'Kontrak', 'Menu Kontrak untuk PK', 'description', '/landingpromise/sibela/pk/kontrak', '1', '1', '1', '1', '1', 'unknown', 'tes', '2025-07-03 17:05:07.78+07', '2025-07-03 17:05:07.78+07', 2);
INSERT INTO "public"."ref_menu1" VALUES ('01', 'M01.01.49 ', 'Kategori', 'Menu Kategori Untuk Verifikator', 'wc', '/landingpromise/sidapet/verifikator/kategori', '1', '1', '1', '1', '1', 'unknown', 'unknown', '2025-08-22 14:02:21.793+07', '2025-08-22 14:19:26.952+07', 4);
INSERT INTO "public"."ref_menu1" VALUES ('01', 'M01.01.50 ', 'Luar DPT', 'Menu luar DPT untuk Verifikator', 'bar_chart', '/landingpromise/sidapet/verifikator/luar-dpt', '1', '1', '1', '1', '1', 'unknown', 'unknown', '2025-08-28 10:49:26.305+07', '2025-08-28 10:59:19.95+07', 4);
INSERT INTO "public"."ref_menu1" VALUES ('06', 'M06.01.02 ', 'Dashboard', 'Dashboard PPK', 'dashboard', '/landingpromise/siqut/ppk/dashboard', '1', '1', '1', '1', '1', 'unknown', 'tes', '2025-09-30 10:20:38.196+07', '2025-09-30 10:20:38.196+07', 2);
INSERT INTO "public"."ref_menu1" VALUES ('11', 'M11.01.05 ', 'Beranda', 'menu beranda untuk pegawai', 'home', '/landingpromise/e-sign/pegawai/dashboard', '1', '1', '1', '1', '1', 'unknown', 'Ihrom Lestari', '2025-09-21 21:42:28.197+07', '2026-01-09 11:09:04.871+07', 5);
INSERT INTO "public"."ref_menu1" VALUES ('06', 'M06.01.03 ', 'Perencanaan', 'Perencanaan Menu', 'description', '/landingpromise/siqut/ppk/perencanaan', '1', '1', '1', '1', '1', 'unknown', 'unknown', '2025-09-30 10:21:19.941+07', '2025-10-03 14:11:04.716+07', 2);
INSERT INTO "public"."ref_menu1" VALUES ('06', 'M06.01.01 ', 'Dashboard', 'Dashboard untuk super admin', 'dashboard', '/landingpromise/siqut/superadmin/dashboard', '1', '1', '1', '1', '1', 'wulan', 'unknown', '2024-08-06 15:00:01.697+07', '2025-10-06 11:17:46.506+07', 1);
INSERT INTO "public"."ref_menu1" VALUES ('05', 'M05.01.10 ', 'Dashboard', 'Dashboard PK', 'dashboard', '/landingpromise/siplang/pk/dashboard', '1', '1', '1', '1', '1', 'unknown', 'tes', '2025-10-26 01:42:38.156+07', '2025-10-26 01:42:38.156+07', 2);
INSERT INTO "public"."ref_menu1" VALUES ('05', 'M05.01.11 ', 'Kontrak', 'Menu Kontrak PK', 'description', '/landingpromise/siplang/pk/kontrak', '1', '1', '1', '1', '1', 'unknown', 'tes', '2025-10-26 01:43:19.65+07', '2025-10-26 01:43:19.65+07', 2);
INSERT INTO "public"."ref_menu1" VALUES ('05', 'M05.01.12 ', 'Kontrak', 'Menu Kontrak PPK', 'description', '/landingpromise/siplang/ppk/kontrak', '1', '1', '1', '1', '1', 'unknown', 'tes', '2025-10-26 01:43:44.354+07', '2025-10-26 01:43:44.354+07', 2);
INSERT INTO "public"."ref_menu1" VALUES ('05', 'M05.01.13 ', 'Kontrak', 'Menu Kontrak penyedia', 'description', '/landingpromise/siplang/penyedia/kontrak', '1', '1', '1', '1', '1', 'unknown', 'tes', '2025-10-26 01:44:52.263+07', '2025-10-26 01:44:52.263+07', 5);
INSERT INTO "public"."ref_menu1" VALUES ('02', 'M02.01.02 ', 'Dashboard', 'Dashboard PPK', 'dashboard', '/landingpromise/sipung/ppk/dashboard', '1', '1', '1', '1', '1', 'unknown', 'tes', '2025-10-28 16:18:29.915+07', '2025-10-28 16:18:29.915+07', 2);
INSERT INTO "public"."ref_menu1" VALUES ('02', 'M02.01.03 ', 'Perencanaan', 'Perencanaan Menu PPK', 'assessment', '/landingpromise/sipung/ppk/perencanaan', '1', '1', '1', '1', '1', 'unknown', 'unknown', '2025-10-28 16:19:55.262+07', '2025-10-28 16:20:31.969+07', 2);
INSERT INTO "public"."ref_menu1" VALUES ('02', 'M02.01.04 ', 'Kontrak', 'Kontrak Menu PPK', 'description', '/landingpromise/sipung/ppk/kontrak', '1', '1', '1', '1', '1', 'unknown', 'tes', '2025-10-28 16:20:52.177+07', '2025-10-28 16:20:52.177+07', 2);
INSERT INTO "public"."ref_menu1" VALUES ('00', 'M00.01.03 ', 'Dashboard', 'Dashboard super admin', 'dashboard', '/landingpromise/user-management/dashboard', '1', '1', '1', '1', '1', 'tes', 'tes', '2024-04-25 11:33:41.145+07', '2024-04-26 16:04:34.89+07', 1);

-- ----------------------------
-- Indexes structure for table ref_menu1
-- ----------------------------
CREATE INDEX "idx_menu1_kode_aplikasi" ON "public"."ref_menu1" USING btree (
  "kode_aplikasi" COLLATE "pg_catalog"."default" "pg_catalog"."bpchar_ops" ASC NULLS LAST
);
CREATE INDEX "idx_menu1_kode_level" ON "public"."ref_menu1" USING btree (
  "kode_level" "pg_catalog"."int4_ops" ASC NULLS LAST
);
CREATE INDEX "idx_menu1_status" ON "public"."ref_menu1" USING btree (
  "status" "pg_catalog"."enum_ops" ASC NULLS LAST
);

-- ----------------------------
-- Primary Key structure for table ref_menu1
-- ----------------------------
ALTER TABLE "public"."ref_menu1" ADD CONSTRAINT "ref_menu1_pkey" PRIMARY KEY ("kode_menu1");

-- ----------------------------
-- Foreign Keys structure for table ref_menu1
-- ----------------------------
ALTER TABLE "public"."ref_menu1" ADD CONSTRAINT "FK_ref_menu1_ref_level" FOREIGN KEY ("kode_level") REFERENCES "public"."ref_level" ("kode_level") ON DELETE NO ACTION ON UPDATE NO ACTION;
