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

 Date: 10/02/2026 15:23:25
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
