/*
 Navicat Premium Dump SQL

 Source Server         : promis-devel
 Source Server Type    : PostgreSQL
 Source Server Version : 160002 (160002)
 Source Host           : 172.30.15.52:5432
 Source Catalog        : db_usman_mig
 Source Schema         : public

 Target Server Type    : PostgreSQL
 Target Server Version : 160002 (160002)
 File Encoding         : 65001

 Date: 10/02/2026 15:24:24
*/


-- ----------------------------
-- Table structure for ref_threeshold
-- ----------------------------
DROP TABLE IF EXISTS "public"."ref_threeshold";
CREATE TABLE "public"."ref_threeshold" (
  "kode_threeshold" int4 NOT NULL DEFAULT nextval('ref_threeshold_kode_threeshold_seq'::regclass),
  "nilai_min" int8,
  "nilai_max" int8,
  "kode_jenis_pengadaan" int4,
  "kode_metode_pengadaan" int4,
  "penanggung_jawab" varchar COLLATE "pg_catalog"."default"
)
;

-- ----------------------------
-- Records of ref_threeshold
-- ----------------------------
INSERT INTO "public"."ref_threeshold" VALUES (5, 200000000, 500000000, 1, 2, 'PP');
INSERT INTO "public"."ref_threeshold" VALUES (6, 200000000, 1000000000, 2, 2, 'PP');
INSERT INTO "public"."ref_threeshold" VALUES (7, 200000000, 500000000, 3, 2, 'PP');
INSERT INTO "public"."ref_threeshold" VALUES (8, 200000000, 500000000, 4, 2, 'PP');
INSERT INTO "public"."ref_threeshold" VALUES (9, 500000000, 2000000000, 1, 4, 'PPK');
INSERT INTO "public"."ref_threeshold" VALUES (10, 1000000000, 2000000000, 2, 4, 'PPK');
INSERT INTO "public"."ref_threeshold" VALUES (11, 500000000, 2000000000, 3, 4, 'PPK');
INSERT INTO "public"."ref_threeshold" VALUES (12, 500000000, 2000000000, 4, 4, 'PPK');
INSERT INTO "public"."ref_threeshold" VALUES (13, 2000000000, 50000000000, 1, 5, 'PPK');
INSERT INTO "public"."ref_threeshold" VALUES (14, 10000000000, 50000000000, 2, 5, 'PPK');
INSERT INTO "public"."ref_threeshold" VALUES (15, 2000000000, 50000000000, 3, 5, 'PPK');
INSERT INTO "public"."ref_threeshold" VALUES (16, 2000000000, 50000000000, 4, 5, 'PPK');
INSERT INTO "public"."ref_threeshold" VALUES (17, 50000000000, 999000000000, 1, 5, 'KPA');
INSERT INTO "public"."ref_threeshold" VALUES (18, 50000000000, 999000000000, 2, 5, 'KPA');
INSERT INTO "public"."ref_threeshold" VALUES (19, 50000000000, 999000000000, 3, 5, 'KPA');
INSERT INTO "public"."ref_threeshold" VALUES (20, 50000000000, 999000000000, 4, 5, 'KPA');
INSERT INTO "public"."ref_threeshold" VALUES (1, 0, 200000000, 1, 1, 'PP');
INSERT INTO "public"."ref_threeshold" VALUES (2, 0, 200000000, 2, 1, 'PP');
INSERT INTO "public"."ref_threeshold" VALUES (3, 0, 200000000, 3, 1, 'PP');
INSERT INTO "public"."ref_threeshold" VALUES (4, 0, 200000000, 4, 1, 'PP');
INSERT INTO "public"."ref_threeshold" VALUES (21, 0, 50000000000, 1, 3, 'PPK');
INSERT INTO "public"."ref_threeshold" VALUES (23, 0, 50000000000, 3, 3, 'PPK');
INSERT INTO "public"."ref_threeshold" VALUES (24, 0, 50000000000, 4, 3, 'PPK');
INSERT INTO "public"."ref_threeshold" VALUES (22, 0, 50000000000, 2, 3, 'PPK');
INSERT INTO "public"."ref_threeshold" VALUES (25, 50000000000, 999000000000, 1, 3, 'KPA');
INSERT INTO "public"."ref_threeshold" VALUES (26, 50000000000, 999000000000, 2, 3, 'KPA');
INSERT INTO "public"."ref_threeshold" VALUES (27, 50000000000, 999000000000, 3, 3, 'KPA');
INSERT INTO "public"."ref_threeshold" VALUES (28, 50000000000, 999000000000, 4, 3, 'KPA');

-- ----------------------------
-- Indexes structure for table ref_threeshold
-- ----------------------------
CREATE INDEX "idx_threeshold_min_max" ON "public"."ref_threeshold" USING btree (
  "nilai_min" "pg_catalog"."int8_ops" ASC NULLS LAST,
  "nilai_max" "pg_catalog"."int8_ops" ASC NULLS LAST
);

-- ----------------------------
-- Primary Key structure for table ref_threeshold
-- ----------------------------
ALTER TABLE "public"."ref_threeshold" ADD CONSTRAINT "ref_threeshold_pk" PRIMARY KEY ("kode_threeshold");

-- ----------------------------
-- Foreign Keys structure for table ref_threeshold
-- ----------------------------
ALTER TABLE "public"."ref_threeshold" ADD CONSTRAINT "ref_threeshold_jenis_pengadaan_fk" FOREIGN KEY ("kode_jenis_pengadaan") REFERENCES "public"."ref_jenis_pengadaan" ("kode_jenis_pengadaan") ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE "public"."ref_threeshold" ADD CONSTRAINT "ref_threeshold_metode_pengadaan_fk" FOREIGN KEY ("kode_metode_pengadaan") REFERENCES "public"."ref_metode_pengadaan" ("kode_metode_pengadaan") ON DELETE CASCADE ON UPDATE CASCADE;
