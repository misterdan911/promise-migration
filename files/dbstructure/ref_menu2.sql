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

 Date: 10/02/2026 15:00:29
*/


-- ----------------------------
-- Table structure for ref_menu2
-- ----------------------------
DROP TABLE IF EXISTS "public"."ref_menu2";
CREATE TABLE "public"."ref_menu2" (
  "kode_aplikasi" varchar(255) COLLATE "pg_catalog"."default",
  "kode_menu1" char(10) COLLATE "pg_catalog"."default" NOT NULL,
  "kode_menu2" char(13) COLLATE "pg_catalog"."default" NOT NULL,
  "nama_menu2" varchar(255) COLLATE "pg_catalog"."default",
  "keterangan_menu" varchar(255) COLLATE "pg_catalog"."default",
  "icon" varchar(255) COLLATE "pg_catalog"."default",
  "link" varchar(255) COLLATE "pg_catalog"."default",
  "status" "public"."enum_ref_menu2_status",
  "on_update" "public"."enum_ref_menu2_on_update",
  "on_create" "public"."enum_ref_menu2_on_create",
  "on_delete" "public"."enum_ref_menu2_on_delete",
  "on_view" "public"."enum_ref_menu2_on_view",
  "ucr" varchar(255) COLLATE "pg_catalog"."default",
  "uch" varchar(255) COLLATE "pg_catalog"."default",
  "udcr" timestamptz(6),
  "udch" timestamptz(6)
)
;
COMMENT ON COLUMN "public"."ref_menu2"."status" IS '0=sembunyi, 1=tampil';

-- ----------------------------
-- Records of ref_menu2
-- ----------------------------
INSERT INTO "public"."ref_menu2" VALUES ('01', 'M01.01.21 ', 'M01.02.21.01 ', 'Vendor Tetap', 'Sub-menu untuk Vendor Tetap', 'perm_contact_calender', '/landingpromise/sidapet/kepalaupbj/penilaiankinerjapenyedia/vendortetap', '1', '1', '1', '1', '1', 'tes', NULL, '2024-04-30 12:27:03.182+07', '2024-04-30 12:28:13.569+07');
INSERT INTO "public"."ref_menu2" VALUES ('01', 'M01.01.22 ', 'M01.02.22.01 ', 'Vendor Tetap', 'Sub-menu untuk Vendor Tetap', 'perm_contact_calender', '/landingpromise/sidapet/pengendalikualitas/penilaiankinerjapenyedia/vendortetap', '1', '1', '1', '1', '1', 'tes', NULL, '2024-04-30 12:31:57.446+07', '2024-04-30 12:31:57.446+07');
INSERT INTO "public"."ref_menu2" VALUES ('01', 'M01.01.02 ', 'M01.02.02.02 ', 'Vendor non tetap', 'Menu master vendor non tetap', 'blur_circular', '/landingpromise/sidapet/kpi/penilaiankinerjapenyedia/vendornontetap', '1', '1', '1', '1', '1', 'tes', NULL, '2024-04-29 10:54:49.636+07', '2024-04-30 12:53:37.068+07');
INSERT INTO "public"."ref_menu2" VALUES ('01', 'M01.01.22 ', 'M01.02.22.02 ', 'Vendor Non Tetap', 'Sub-menu untuk Vendor Non Tetap', 'assignment_ind', '/landingpromise/sidapet/pengendalikualitas/penilaiankinerjapenyedia/vendornontetap', '1', '1', '1', '1', '1', 'tes', NULL, '2024-04-30 12:32:39.682+07', '2024-04-30 12:32:39.682+07');
INSERT INTO "public"."ref_menu2" VALUES ('01', 'M01.01.07 ', 'M01.02.07.01 ', 'Vendor Tetap', 'Sub-menu untuk Vendor Tetap', 'group', '/landingpromise/sidapet/kepalaupbj/monitoring/vendortetap', '1', '1', '1', '1', '1', 'tes', NULL, '2024-04-29 11:31:10.294+07', '2024-04-29 11:31:10.294+07');
INSERT INTO "public"."ref_menu2" VALUES ('01', 'M01.01.07 ', 'M01.02.07.02 ', 'Vendor Non Tetap', 'Sub-menu untuk Vendor Non Tetap', 'group', '/landingpromise/sidapet/kepalaupbj/monitoring/vendornontetap', '1', '1', '1', '1', '1', 'tes', NULL, '2024-04-29 11:31:35.99+07', '2024-04-29 11:31:35.99+07');
INSERT INTO "public"."ref_menu2" VALUES ('01', 'M01.01.21 ', 'M01.02.21.02 ', 'Vendor Non Tetap', 'Sub-menu untuk Vendor Non Tetap', 'assignment_ind', '/landingpromise/sidapet/kepalaupbj/penilaiankinerjapenyedia/vendornontetap', '1', '1', '1', '1', '1', 'tes', NULL, '2024-04-30 12:33:35.364+07', '2024-04-30 12:33:35.364+07');
INSERT INTO "public"."ref_menu2" VALUES ('01', 'M01.01.23 ', 'M01.02.23.01 ', 'Vendor Tetap', 'Sub-menu untuk Vendor Tetap', 'perm_contact_calender', '/landingpromise/sidapet/pokja/penilaiankinerjapenyedia/vendortetap', '1', '1', '1', '1', '1', 'tes', NULL, '2024-04-30 12:34:48.15+07', '2024-04-30 12:34:48.15+07');
INSERT INTO "public"."ref_menu2" VALUES ('01', 'M01.01.23 ', 'M01.02.23.02 ', 'Vendor Non Tetap', 'Sub-menu untuk Vendor Non Tetap', 'assignment_ind', '/landingpromise/sidapet/pokja/penilaiankinerjapenyedia/vendornontetap', '1', '1', '1', '1', '1', 'tes', NULL, '2024-04-30 12:35:13.29+07', '2024-04-30 12:35:13.29+07');
INSERT INTO "public"."ref_menu2" VALUES ('01', 'M01.01.24 ', 'M01.02.24.01 ', 'Vendor Tetap', 'Sub-menu untuk Vendor Tetap', 'perm_contact_calender', '/landingpromise/sidapet/pp/penilaiankinerjapenyedia/vendortetap', '1', '1', '1', '1', '1', 'tes', NULL, '2024-04-30 12:38:18.669+07', '2024-04-30 12:38:18.669+07');
INSERT INTO "public"."ref_menu2" VALUES ('01', 'M01.01.24 ', 'M01.02.24.02 ', 'Vendor Non Tetap', 'Sub-menu untuk Vendor Non Tetap', 'assignment_ind', '/landingpromise/sidapet/pp/penilaiankinerjapenyedia/vendornontetap', '1', '1', '1', '1', '1', 'tes', NULL, '2024-04-30 12:38:41.941+07', '2024-04-30 12:38:41.941+07');
INSERT INTO "public"."ref_menu2" VALUES ('01', 'M01.01.26 ', 'M01.02.26.01 ', 'Vendor Tetap', 'Sub-menu untuk Vendor Tetap', 'perm_contact_calender', '/landingpromise/sidapet/verifikator/penilaiankinerjapenyedia/vendortetap', '1', '1', '1', '1', '1', 'tes', NULL, '2024-04-30 12:41:06.516+07', '2024-04-30 12:41:06.516+07');
INSERT INTO "public"."ref_menu2" VALUES ('01', 'M01.01.26 ', 'M01.02.26.02 ', 'Vendor Non Tetap', 'Sub-menu untuk Vendor Non Tetap', 'assignment_ind', '/landingpromise/sidapet/verifikator/penilaiankinerjapenyedia/vendornontetap', '1', '1', '1', '1', '1', 'tes', NULL, '2024-04-30 12:41:32.731+07', '2024-04-30 12:41:32.731+07');
INSERT INTO "public"."ref_menu2" VALUES ('01', 'M01.01.27 ', 'M01.02.27.01 ', 'Vendor Tetap', 'Sub-menu untuk Vendor Tetap', 'perm_contact_calender', '/landingpromise/sidapet/kepalaupbj/blacklistpenyedia/vendortetap', '1', '1', '1', '1', '1', 'tes', NULL, '2024-04-30 12:43:34.185+07', '2024-04-30 12:43:34.185+07');
INSERT INTO "public"."ref_menu2" VALUES ('01', 'M01.01.27 ', 'M01.02.27.02 ', 'Vendor Non Tetap', 'Sub-menu untuk Vendor Non Tetap', 'assignment_ind', '/landingpromise/sidapet/kepalaupbj/blacklistpenyedia/vendornontetap', '1', '1', '1', '1', '1', 'tes', NULL, '2024-04-30 12:43:53.805+07', '2024-04-30 12:43:53.805+07');
INSERT INTO "public"."ref_menu2" VALUES ('01', 'M01.01.28 ', 'M01.02.28.01 ', 'Vendor Tetap', 'Sub-menu untuk Vendor Tetap', 'perm_contact_calender', '/landingpromise/sidapet/pengendalikualitas/blacklistpenyedia/vendortetap', '1', '1', '1', '1', '1', 'tes', NULL, '2024-04-30 12:45:08.785+07', '2024-04-30 12:45:08.785+07');
INSERT INTO "public"."ref_menu2" VALUES ('01', 'M01.01.28 ', 'M01.02.28.02 ', 'Vendor Non Tetap', 'Sub-menu untuk Vendor Non Tetap', 'assignment_ind', '/landingpromise/sidapet/pengendalikualitas/blacklistpenyedia/vendornontetap', '1', '1', '1', '1', '1', 'tes', NULL, '2024-04-30 12:45:34.132+07', '2024-04-30 12:45:34.132+07');
INSERT INTO "public"."ref_menu2" VALUES ('01', 'M01.01.29 ', 'M01.02.29.01 ', 'Vendor Tetap', 'Sub-menu untuk Vendor Tetap', 'perm_contact_calender', '/landingpromise/sidapet/pokja/blacklistpenyedia/vendortetap', '1', '1', '1', '1', '1', 'tes', NULL, '2024-04-30 12:46:41.874+07', '2024-04-30 12:46:41.874+07');
INSERT INTO "public"."ref_menu2" VALUES ('01', 'M01.01.03 ', 'M01.02.03.02 ', 'Vendor non tetap', 'Master data vendor non tetap', 'blur_circular', '/landingpromise/sidapet/kpi/blacklistpenyedia/vendornontetap', '1', '1', '1', '1', '1', 'tes', NULL, '2024-04-29 11:19:41.75+07', '2024-04-30 12:55:04.491+07');
INSERT INTO "public"."ref_menu2" VALUES ('01', 'M01.01.03 ', 'M01.02.03.01 ', 'Vendor tetap', 'Master data blacklist vendor tetap', 'blur_circular', '/landingpromise/sidapet/kpi/blacklistpenyedia/vendortetap', '1', '1', '1', '1', '1', 'tes', NULL, '2024-04-29 11:18:29.428+07', '2024-04-30 12:55:21.161+07');
INSERT INTO "public"."ref_menu2" VALUES ('01', 'M01.01.29 ', 'M01.02.29.02 ', 'Vendor Non Tetap', 'Sub-menu untuk Vendor Non Tetap', 'assignment_ind', '/landingpromise/sidapet/pokja/blacklistpenyedia/vendornontetap', '1', '1', '1', '1', '1', 'tes', NULL, '2024-04-30 12:47:05.334+07', '2024-04-30 12:47:05.334+07');
INSERT INTO "public"."ref_menu2" VALUES ('01', 'M01.01.30 ', 'M01.02.30.01 ', 'Vendor Tetap', 'Sub-menu untuk Vendor Tetap', 'perm_contact_calender', '/landingpromise/sidapet/pp/blacklistpenyedia/vendortetap', '1', '1', '1', '1', '1', 'tes', NULL, '2024-04-30 12:48:11.574+07', '2024-04-30 12:48:11.574+07');
INSERT INTO "public"."ref_menu2" VALUES ('01', 'M01.01.32 ', 'M01.02.32.02 ', 'Vendor Non Tetap', 'Sub-menu untuk Vendor Non Tetap', 'assignment_ind', '/landingpromise/sidapet/verifikator/blacklistpenyedia/vendornontetap', '1', '1', '1', '1', '1', 'tes', NULL, '2024-04-30 12:51:09.898+07', '2024-04-30 12:51:09.898+07');
INSERT INTO "public"."ref_menu2" VALUES ('01', 'M01.01.30 ', 'M01.02.30.02 ', 'Vendor Non Tetap', 'Sub-menu untuk Vendor Non Tetap', 'assignment_ind', '/landingpromise/sidapet/pp/blacklistpenyedia/vendornontetap', '1', '1', '1', '1', '1', 'tes', NULL, '2024-04-30 12:48:34.351+07', '2024-04-30 12:48:34.351+07');
INSERT INTO "public"."ref_menu2" VALUES ('01', 'M01.01.32 ', 'M01.02.32.01 ', 'Vendor Tetap', 'Sub-menu untuk Vendor Tetap', 'perm_contact_calender', '/landingpromise/sidapet/verifikator/blacklistpenyedia/vendortetap', '1', '1', '1', '1', '1', 'tes', NULL, '2024-04-30 12:50:40.457+07', '2024-04-30 12:50:40.457+07');
INSERT INTO "public"."ref_menu2" VALUES ('01', 'M01.01.02 ', 'M01.02.02.01 ', 'Vendor tetap', 'Menu master vendor tetap', 'blur_circular', '/landingpromise/sidapet/kpi/penilaiankinerjapenyedia/vendortetap', '1', '1', '1', '1', '1', 'tes', NULL, '2024-04-29 10:53:18.475+07', '2024-04-30 12:53:11.997+07');
INSERT INTO "public"."ref_menu2" VALUES ('01', 'M01.01.46 ', 'M01.02.46.01 ', 'Penyedia Terpilih', 'Sub Menu  Penyedia Terpilih untuk Verifikator ', 'circle', '/landingpromise/sidapet/verifikator/dpt/penyedia-terpilih', '1', '1', '1', '1', '1', 'unknown', NULL, '2025-03-04 11:17:08.062+07', '2025-03-04 11:17:08.062+07');
INSERT INTO "public"."ref_menu2" VALUES ('01', 'M01.01.46 ', 'M01.02.46.03 ', 'Pengumuman', 'Sub Menu Pengumuman DPT untuk Verifikator', 'circle', '/landingpromise/sidapet/verifikator/dpt/pengumuman', '1', '1', '1', '1', '1', 'unknown', NULL, '2025-03-04 11:19:44.036+07', '2025-03-04 11:19:44.036+07');
INSERT INTO "public"."ref_menu2" VALUES ('01', 'M01.01.48 ', 'M01.02.48.01 ', 'Master kategori DPT', 'Menu kontrol kategori DPT Verifikator ', 'label', '/landingpromise/sidapet/verifikator/master/master-kategori', '1', '1', '1', '1', '1', 'unknown', NULL, '2025-05-11 23:17:10.896+07', '2025-05-11 23:17:10.896+07');
INSERT INTO "public"."ref_menu2" VALUES ('01', 'M01.01.48 ', 'M01.02.48.02 ', 'Master Item Tanya', 'Kelola pertanyaan penjaringan', 'lightbulb', '/landingpromise/sidapet/verifikator/master/master-item-tanya', '1', '1', '1', '1', '1', 'unknown', NULL, '2025-05-15 10:30:23.373+07', '2025-05-15 10:30:23.373+07');
INSERT INTO "public"."ref_menu2" VALUES ('00', 'M00.01.05 ', 'M00.02.05.01 ', 'Master User', 'Pengaturan master user', 'fiber_manual_record', '/landingpromise/user-management/userregister', '1', '1', '1', '1', '1', 'tes', NULL, '2024-04-25 11:56:18.149+07', '2024-04-25 11:56:18.149+07');
INSERT INTO "public"."ref_menu2" VALUES ('00', 'M00.01.05 ', 'M00.02.05.02 ', 'Role Register', 'Registrasi role user', 'fiber_manual_record', '/landingpromise/user-management/userroleregister', '1', '1', '1', '1', '1', 'tes', NULL, '2024-04-25 11:57:35.465+07', '2024-04-25 11:57:58.528+07');
INSERT INTO "public"."ref_menu2" VALUES ('00', 'M00.01.05 ', 'M00.02.05.03 ', 'Registrasi Jabatan User', 'Menu pengaturan jabatan user', 'fiber_manual_record', '/landingpromise/user-management/register-jabatan', '1', '1', '1', '1', '1', 'dholy', 'dholy', '2024-11-29 14:05:54.326+07', '2024-11-29 14:06:50.232+07');
INSERT INTO "public"."ref_menu2" VALUES ('01', 'M01.01.46 ', 'M01.02.46.02 ', 'Verifikasi Persyaratan Penjaringan', 'Sub Menu Verifikasi DPT untuk Verifikator', 'circle', '/landingpromise/sidapet/verifikator/dpt/verifikasi-persyaratan-penjaringan', '1', '1', '1', '1', '1', 'unknown', 'unknown', '2025-03-04 11:18:37.338+07', '2025-06-04 15:32:30.894+07');
INSERT INTO "public"."ref_menu2" VALUES ('01', 'M01.01.46 ', 'M01.02.46.04 ', 'Verifikasi Pendaftaran DPT', 'Menu verifikasi pendaftaran dpt', 'fact_check', '/landingpromise/sidapet/verifikator/dpt/verifikasi-pendaftaran-dpt', '1', '1', '1', '1', '1', 'unknown', 'unknown', '2025-07-17 14:59:41.117+07', '2025-07-17 15:13:38.816+07');
INSERT INTO "public"."ref_menu2" VALUES ('01', 'M01.01.49 ', 'M01.02.49.01 ', 'Semua Kategori', 'Menu Kategori untuk verifikator', 'circle', '/landingpromise/sidapet/verifikator/kategori', '1', '1', '1', '1', '1', 'unknown', 'unknown', '2025-08-22 14:04:22.575+07', '2025-08-22 14:17:13.573+07');
INSERT INTO "public"."ref_menu2" VALUES ('01', 'M01.01.49 ', 'M01.02.49.02 ', 'Kategori Baru', 'Menu Kategori Baru untuk verifikator', 'circle', '/landingpromise/sidapet/verifikator/kategori-baru', '1', '1', '1', '1', '1', 'unknown', 'unknown', '2025-08-22 14:05:15.344+07', '2025-08-22 14:17:25.852+07');
INSERT INTO "public"."ref_menu2" VALUES ('00', 'M00.01.04 ', 'M00.02.04.01 ', 'Daftar Aplikasi', 'Registrasi aplikasi', 'fiber_manual_record', '/landingpromise/user-management/daftaraplikasi', '1', '1', '1', '1', '1', 'tes', NULL, '2024-04-25 11:49:14.506+07', '2024-04-25 11:49:14.506+07');
INSERT INTO "public"."ref_menu2" VALUES ('00', 'M00.01.04 ', 'M00.02.04.02 ', 'Group / Role Aplikasi', 'Pengaturan group / role ke menu aplikasi', 'fiber_manual_record', '/landingpromise/user-management/groupaplikasi', '1', '1', '1', '1', '1', 'tes', NULL, '2024-04-25 11:53:43.182+07', '2024-04-25 11:53:43.182+07');

-- ----------------------------
-- Indexes structure for table ref_menu2
-- ----------------------------
CREATE INDEX "fki_ref_menu2_ref_menu1_pkey" ON "public"."ref_menu2" USING btree (
  "kode_menu1" COLLATE "pg_catalog"."default" "pg_catalog"."bpchar_ops" ASC NULLS LAST
);
CREATE INDEX "idx_menu2_kode_aplikasi" ON "public"."ref_menu2" USING btree (
  "kode_aplikasi" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
);
CREATE INDEX "idx_menu2_status" ON "public"."ref_menu2" USING btree (
  "status" "pg_catalog"."enum_ops" ASC NULLS LAST
);

-- ----------------------------
-- Primary Key structure for table ref_menu2
-- ----------------------------
ALTER TABLE "public"."ref_menu2" ADD CONSTRAINT "ref_menu2_pkey" PRIMARY KEY ("kode_menu2");

-- ----------------------------
-- Foreign Keys structure for table ref_menu2
-- ----------------------------
ALTER TABLE "public"."ref_menu2" ADD CONSTRAINT "ref_menu2_ref_menu1_pkey" FOREIGN KEY ("kode_menu1") REFERENCES "public"."ref_menu1" ("kode_menu1") ON DELETE CASCADE ON UPDATE CASCADE;
