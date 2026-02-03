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

 Date: 03/02/2026 18:11:30
*/


-- ----------------------------
-- Type structure for enum_ref_menu1_on_create
-- ----------------------------
DROP TYPE IF EXISTS "public"."enum_ref_menu1_on_create";
CREATE TYPE "public"."enum_ref_menu1_on_create" AS ENUM (
  '0',
  '1'
);
ALTER TYPE "public"."enum_ref_menu1_on_create" OWNER TO "postgres";

-- ----------------------------
-- Type structure for enum_ref_menu1_on_delete
-- ----------------------------
DROP TYPE IF EXISTS "public"."enum_ref_menu1_on_delete";
CREATE TYPE "public"."enum_ref_menu1_on_delete" AS ENUM (
  '0',
  '1'
);
ALTER TYPE "public"."enum_ref_menu1_on_delete" OWNER TO "postgres";

-- ----------------------------
-- Type structure for enum_ref_menu1_on_update
-- ----------------------------
DROP TYPE IF EXISTS "public"."enum_ref_menu1_on_update";
CREATE TYPE "public"."enum_ref_menu1_on_update" AS ENUM (
  '0',
  '1'
);
ALTER TYPE "public"."enum_ref_menu1_on_update" OWNER TO "postgres";

-- ----------------------------
-- Type structure for enum_ref_menu1_on_view
-- ----------------------------
DROP TYPE IF EXISTS "public"."enum_ref_menu1_on_view";
CREATE TYPE "public"."enum_ref_menu1_on_view" AS ENUM (
  '0',
  '1'
);
ALTER TYPE "public"."enum_ref_menu1_on_view" OWNER TO "postgres";

-- ----------------------------
-- Type structure for enum_ref_menu1_status
-- ----------------------------
DROP TYPE IF EXISTS "public"."enum_ref_menu1_status";
CREATE TYPE "public"."enum_ref_menu1_status" AS ENUM (
  '0',
  '1'
);
ALTER TYPE "public"."enum_ref_menu1_status" OWNER TO "postgres";

-- ----------------------------
-- Type structure for enum_ref_menu2_on_create
-- ----------------------------
DROP TYPE IF EXISTS "public"."enum_ref_menu2_on_create";
CREATE TYPE "public"."enum_ref_menu2_on_create" AS ENUM (
  '0',
  '1'
);
ALTER TYPE "public"."enum_ref_menu2_on_create" OWNER TO "postgres";

-- ----------------------------
-- Type structure for enum_ref_menu2_on_delete
-- ----------------------------
DROP TYPE IF EXISTS "public"."enum_ref_menu2_on_delete";
CREATE TYPE "public"."enum_ref_menu2_on_delete" AS ENUM (
  '0',
  '1'
);
ALTER TYPE "public"."enum_ref_menu2_on_delete" OWNER TO "postgres";

-- ----------------------------
-- Type structure for enum_ref_menu2_on_update
-- ----------------------------
DROP TYPE IF EXISTS "public"."enum_ref_menu2_on_update";
CREATE TYPE "public"."enum_ref_menu2_on_update" AS ENUM (
  '0',
  '1'
);
ALTER TYPE "public"."enum_ref_menu2_on_update" OWNER TO "postgres";

-- ----------------------------
-- Type structure for enum_ref_menu2_on_view
-- ----------------------------
DROP TYPE IF EXISTS "public"."enum_ref_menu2_on_view";
CREATE TYPE "public"."enum_ref_menu2_on_view" AS ENUM (
  '0',
  '1'
);
ALTER TYPE "public"."enum_ref_menu2_on_view" OWNER TO "postgres";

-- ----------------------------
-- Type structure for enum_ref_menu2_status
-- ----------------------------
DROP TYPE IF EXISTS "public"."enum_ref_menu2_status";
CREATE TYPE "public"."enum_ref_menu2_status" AS ENUM (
  '0',
  '1'
);
ALTER TYPE "public"."enum_ref_menu2_status" OWNER TO "postgres";

-- ----------------------------
-- Type structure for enum_ref_menu3_on_create
-- ----------------------------
DROP TYPE IF EXISTS "public"."enum_ref_menu3_on_create";
CREATE TYPE "public"."enum_ref_menu3_on_create" AS ENUM (
  '0',
  '1'
);
ALTER TYPE "public"."enum_ref_menu3_on_create" OWNER TO "postgres";

-- ----------------------------
-- Type structure for enum_ref_menu3_on_delete
-- ----------------------------
DROP TYPE IF EXISTS "public"."enum_ref_menu3_on_delete";
CREATE TYPE "public"."enum_ref_menu3_on_delete" AS ENUM (
  '0',
  '1'
);
ALTER TYPE "public"."enum_ref_menu3_on_delete" OWNER TO "postgres";

-- ----------------------------
-- Type structure for enum_ref_menu3_on_update
-- ----------------------------
DROP TYPE IF EXISTS "public"."enum_ref_menu3_on_update";
CREATE TYPE "public"."enum_ref_menu3_on_update" AS ENUM (
  '0',
  '1'
);
ALTER TYPE "public"."enum_ref_menu3_on_update" OWNER TO "postgres";

-- ----------------------------
-- Type structure for enum_ref_menu3_on_view
-- ----------------------------
DROP TYPE IF EXISTS "public"."enum_ref_menu3_on_view";
CREATE TYPE "public"."enum_ref_menu3_on_view" AS ENUM (
  '0',
  '1'
);
ALTER TYPE "public"."enum_ref_menu3_on_view" OWNER TO "postgres";

-- ----------------------------
-- Type structure for enum_ref_menu3_status
-- ----------------------------
DROP TYPE IF EXISTS "public"."enum_ref_menu3_status";
CREATE TYPE "public"."enum_ref_menu3_status" AS ENUM (
  '0',
  '1'
);
ALTER TYPE "public"."enum_ref_menu3_status" OWNER TO "postgres";

-- ----------------------------
-- Type structure for enum_trx_group_menu_akses
-- ----------------------------
DROP TYPE IF EXISTS "public"."enum_trx_group_menu_akses";
CREATE TYPE "public"."enum_trx_group_menu_akses" AS ENUM (
  '0',
  '1'
);
ALTER TYPE "public"."enum_trx_group_menu_akses" OWNER TO "postgres";

-- ----------------------------
-- Type structure for enum_trx_group_user_status
-- ----------------------------
DROP TYPE IF EXISTS "public"."enum_trx_group_user_status";
CREATE TYPE "public"."enum_trx_group_user_status" AS ENUM (
  '1',
  '0'
);
ALTER TYPE "public"."enum_trx_group_user_status" OWNER TO "postgres";

-- ----------------------------
-- Type structure for enum_trx_jabatan_user
-- ----------------------------
DROP TYPE IF EXISTS "public"."enum_trx_jabatan_user";
CREATE TYPE "public"."enum_trx_jabatan_user" AS ENUM (
  'aktif',
  'non_aktif'
);
ALTER TYPE "public"."enum_trx_jabatan_user" OWNER TO "postgres";

-- ----------------------------
-- Sequence structure for ref_jabatan_kode_jabatan_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."ref_jabatan_kode_jabatan_seq";
CREATE SEQUENCE "public"."ref_jabatan_kode_jabatan_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 2147483647
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for ref_jenis_pengadaan_kode_jenis_pengadaan_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."ref_jenis_pengadaan_kode_jenis_pengadaan_seq";
CREATE SEQUENCE "public"."ref_jenis_pengadaan_kode_jenis_pengadaan_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 2147483647
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for ref_ket_pertor_kode_ket_pertor_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."ref_ket_pertor_kode_ket_pertor_seq";
CREATE SEQUENCE "public"."ref_ket_pertor_kode_ket_pertor_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 2147483647
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for ref_level_kode_level_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."ref_level_kode_level_seq";
CREATE SEQUENCE "public"."ref_level_kode_level_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 9223372036854775807
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for ref_metode_pengadaan_kode_metode_pengadaan_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."ref_metode_pengadaan_kode_metode_pengadaan_seq";
CREATE SEQUENCE "public"."ref_metode_pengadaan_kode_metode_pengadaan_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 2147483647
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for ref_threeshold_kode_threeshold_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."ref_threeshold_kode_threeshold_seq";
CREATE SEQUENCE "public"."ref_threeshold_kode_threeshold_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 2147483647
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for ref_unit_pbj_kode_unit_pbj_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."ref_unit_pbj_kode_unit_pbj_seq";
CREATE SEQUENCE "public"."ref_unit_pbj_kode_unit_pbj_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 2147483647
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for ref_user_external_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."ref_user_external_id_seq";
CREATE SEQUENCE "public"."ref_user_external_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 9223372036854775807
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for ref_user_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."ref_user_id_seq";
CREATE SEQUENCE "public"."ref_user_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 2147483647
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for ref_user_internal_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."ref_user_internal_id_seq";
CREATE SEQUENCE "public"."ref_user_internal_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 9223372036854775807
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for trx_group_menu_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."trx_group_menu_id_seq";
CREATE SEQUENCE "public"."trx_group_menu_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 9223372036854775807
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for trx_group_user_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."trx_group_user_id_seq";
CREATE SEQUENCE "public"."trx_group_user_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 9223372036854775807
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for trx_user_tampung_kode_user_tampung_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."trx_user_tampung_kode_user_tampung_seq";
CREATE SEQUENCE "public"."trx_user_tampung_kode_user_tampung_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 2147483647
START 1
CACHE 1;

-- ----------------------------
-- Table structure for bridging_vmsdb_user_id
-- ----------------------------
DROP TABLE IF EXISTS "public"."bridging_vmsdb_user_id";
CREATE TABLE "public"."bridging_vmsdb_user_id" (
  "id" int4 NOT NULL,
  "name" varchar(255) COLLATE "pg_catalog"."default",
  "email" varchar(255) COLLATE "pg_catalog"."default",
  "email_real" varchar(255) COLLATE "pg_catalog"."default",
  "id_level" int4,
  "id_real" int4
)
;

-- ----------------------------
-- Table structure for helper_user_kodeunit
-- ----------------------------
DROP TABLE IF EXISTS "public"."helper_user_kodeunit";
CREATE TABLE "public"."helper_user_kodeunit" (
  "id" int4 NOT NULL,
  "email" varchar(255) COLLATE "pg_catalog"."default",
  "kode_unit" varchar(255) COLLATE "pg_catalog"."default",
  "nip" varchar(255) COLLATE "pg_catalog"."default"
)
;

-- ----------------------------
-- Table structure for mapping_vmsdb_user_id_real
-- ----------------------------
DROP TABLE IF EXISTS "public"."mapping_vmsdb_user_id_real";
CREATE TABLE "public"."mapping_vmsdb_user_id_real" (
  "id" int4 NOT NULL,
  "id_real" int4
)
;

-- ----------------------------
-- Table structure for ref_akses_aplikasi_eksternal
-- ----------------------------
DROP TABLE IF EXISTS "public"."ref_akses_aplikasi_eksternal";
CREATE TABLE "public"."ref_akses_aplikasi_eksternal" (
  "email" varchar COLLATE "pg_catalog"."default" NOT NULL,
  "password" varchar COLLATE "pg_catalog"."default",
  "akses_token" text COLLATE "pg_catalog"."default",
  "aplikasi" varchar COLLATE "pg_catalog"."default"
)
;

-- ----------------------------
-- Table structure for ref_aplikasi
-- ----------------------------
DROP TABLE IF EXISTS "public"."ref_aplikasi";
CREATE TABLE "public"."ref_aplikasi" (
  "kode_aplikasi" char(2) COLLATE "pg_catalog"."default" NOT NULL,
  "nama_aplikasi" varchar(255) COLLATE "pg_catalog"."default",
  "keterangan" varchar(255) COLLATE "pg_catalog"."default",
  "status" varchar(255) COLLATE "pg_catalog"."default",
  "images" varchar(255) COLLATE "pg_catalog"."default",
  "url" varchar(255) COLLATE "pg_catalog"."default",
  "ucr" varchar(255) COLLATE "pg_catalog"."default",
  "udcr" timestamptz(6),
  "udch" timestamptz(6),
  "uch" varchar(255) COLLATE "pg_catalog"."default",
  "url_token" varchar(255) COLLATE "pg_catalog"."default",
  "path_folder_pdf_asli" varchar(255) COLLATE "pg_catalog"."default" DEFAULT NULL::character varying,
  "path_folder_pdf_encrypt" varchar(255) COLLATE "pg_catalog"."default" DEFAULT NULL::character varying,
  "path_folder_img_asli" varchar(255) COLLATE "pg_catalog"."default" DEFAULT NULL::character varying,
  "path_folder_img_encrypt" varchar(255) COLLATE "pg_catalog"."default" DEFAULT NULL::character varying,
  "kode_metode_pengadaan" int4,
  "path_folder_excel_asli" varchar(255) COLLATE "pg_catalog"."default" DEFAULT NULL::character varying,
  "path_folder_excel_encrypt" varchar(255) COLLATE "pg_catalog"."default" DEFAULT NULL::character varying,
  "keterangan_threshold_apk" text COLLATE "pg_catalog"."default",
  "deskripsi_threshold_apk" text COLLATE "pg_catalog"."default"
)
;

-- ----------------------------
-- Table structure for ref_group
-- ----------------------------
DROP TABLE IF EXISTS "public"."ref_group";
CREATE TABLE "public"."ref_group" (
  "kode_group" char(10) COLLATE "pg_catalog"."default" NOT NULL,
  "nama_group" varchar(255) COLLATE "pg_catalog"."default",
  "kode_aplikasi" char(10) COLLATE "pg_catalog"."default" NOT NULL,
  "kode_level" int4 NOT NULL,
  "ucr" varchar(255) COLLATE "pg_catalog"."default",
  "uch" varchar(255) COLLATE "pg_catalog"."default",
  "udcr" timestamptz(6),
  "udch" timestamptz(6),
  "kode_jabatan" int4
)
;

-- ----------------------------
-- Table structure for ref_jabatan
-- ----------------------------
DROP TABLE IF EXISTS "public"."ref_jabatan";
CREATE TABLE "public"."ref_jabatan" (
  "kode_jabatan" int4 NOT NULL DEFAULT nextval('ref_jabatan_kode_jabatan_seq'::regclass),
  "nama_jabatan" varchar COLLATE "pg_catalog"."default",
  "keterangan" varchar COLLATE "pg_catalog"."default"
)
;

-- ----------------------------
-- Table structure for ref_jabatan_struktural
-- ----------------------------
DROP TABLE IF EXISTS "public"."ref_jabatan_struktural";
CREATE TABLE "public"."ref_jabatan_struktural" (
  "kode_jabatan_struktural" char(3) COLLATE "pg_catalog"."default" NOT NULL,
  "nama_jabatan_struktural" varchar(255) COLLATE "pg_catalog"."default",
  "udcr" timestamptz(6),
  "udch" timestamptz(6)
)
;

-- ----------------------------
-- Table structure for ref_jabatan_struktural_sub
-- ----------------------------
DROP TABLE IF EXISTS "public"."ref_jabatan_struktural_sub";
CREATE TABLE "public"."ref_jabatan_struktural_sub" (
  "kode_jabatan_struktural" char(3) COLLATE "pg_catalog"."default",
  "kode_jabatan_struktural_sub" char(6) COLLATE "pg_catalog"."default" NOT NULL,
  "nama_jabatan_struktural_sub" varchar(255) COLLATE "pg_catalog"."default",
  "udcr" timestamptz(6),
  "udch" timestamptz(6)
)
;

-- ----------------------------
-- Table structure for ref_jenis_pengadaan
-- ----------------------------
DROP TABLE IF EXISTS "public"."ref_jenis_pengadaan";
CREATE TABLE "public"."ref_jenis_pengadaan" (
  "kode_jenis_pengadaan" int4 NOT NULL DEFAULT nextval('ref_jenis_pengadaan_kode_jenis_pengadaan_seq'::regclass),
  "jenis_pengadaan" varchar COLLATE "pg_catalog"."default"
)
;

-- ----------------------------
-- Table structure for ref_kat_metode
-- ----------------------------
DROP TABLE IF EXISTS "public"."ref_kat_metode";
CREATE TABLE "public"."ref_kat_metode" (
  "kode_kat_metode" int4 NOT NULL,
  "kat_metode" varchar COLLATE "pg_catalog"."default",
  "status_threeshold" int2 DEFAULT '0'::smallint
)
;

-- ----------------------------
-- Table structure for ref_ket_pertor
-- ----------------------------
DROP TABLE IF EXISTS "public"."ref_ket_pertor";
CREATE TABLE "public"."ref_ket_pertor" (
  "kode_ket_pertor" int4 NOT NULL DEFAULT nextval('ref_ket_pertor_kode_ket_pertor_seq'::regclass),
  "ket_pertor" text COLLATE "pg_catalog"."default",
  "is_terbaru" bool
)
;

-- ----------------------------
-- Table structure for ref_level
-- ----------------------------
DROP TABLE IF EXISTS "public"."ref_level";
CREATE TABLE "public"."ref_level" (
  "kode_level" int4 NOT NULL,
  "nama_level" varchar(255) COLLATE "pg_catalog"."default",
  "udcr" timestamptz(6),
  "udch" timestamptz(6)
)
;

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
-- Table structure for ref_menu3
-- ----------------------------
DROP TABLE IF EXISTS "public"."ref_menu3";
CREATE TABLE "public"."ref_menu3" (
  "kode_aplikasi" varchar(255) COLLATE "pg_catalog"."default",
  "kode_menu2" char(13) COLLATE "pg_catalog"."default" NOT NULL,
  "kode_menu3" char(16) COLLATE "pg_catalog"."default" NOT NULL,
  "nama_menu3" varchar(255) COLLATE "pg_catalog"."default",
  "keterangan_menu" varchar(255) COLLATE "pg_catalog"."default",
  "icon" varchar(255) COLLATE "pg_catalog"."default",
  "link" varchar(255) COLLATE "pg_catalog"."default",
  "status" "public"."enum_ref_menu3_status",
  "on_update" "public"."enum_ref_menu3_on_update",
  "on_create" "public"."enum_ref_menu3_on_create",
  "on_delete" "public"."enum_ref_menu3_on_delete",
  "on_view" "public"."enum_ref_menu3_on_view",
  "ucr" varchar(255) COLLATE "pg_catalog"."default",
  "uch" varchar(255) COLLATE "pg_catalog"."default",
  "udcr" timestamptz(6),
  "udch" timestamptz(6)
)
;
COMMENT ON COLUMN "public"."ref_menu3"."status" IS '0=sembunyi, 1=tampil';

-- ----------------------------
-- Table structure for ref_metode_pengadaan
-- ----------------------------
DROP TABLE IF EXISTS "public"."ref_metode_pengadaan";
CREATE TABLE "public"."ref_metode_pengadaan" (
  "kode_metode_pengadaan" int4 NOT NULL DEFAULT nextval('ref_metode_pengadaan_kode_metode_pengadaan_seq'::regclass),
  "metode_pengadaan" varchar COLLATE "pg_catalog"."default",
  "kode_kat_metode" int4,
  "kode_ket_pertor" int4
)
;

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
-- Table structure for ref_token_app
-- ----------------------------
DROP TABLE IF EXISTS "public"."ref_token_app";
CREATE TABLE "public"."ref_token_app" (
  "id" varchar(20) COLLATE "pg_catalog"."default" NOT NULL,
  "id_user" int4 NOT NULL,
  "kode_group" char(10) COLLATE "pg_catalog"."default" NOT NULL DEFAULT 'NULL::bpchar'::bpchar,
  "token" varchar(255) COLLATE "pg_catalog"."default" NOT NULL,
  "created_at" timestamptz(6),
  "updated_at" timestamptz(6)
)
;

-- ----------------------------
-- Table structure for ref_unit_pbj
-- ----------------------------
DROP TABLE IF EXISTS "public"."ref_unit_pbj";
CREATE TABLE "public"."ref_unit_pbj" (
  "kode_unit_pbj" int4 NOT NULL DEFAULT nextval('ref_unit_pbj_kode_unit_pbj_seq'::regclass),
  "kode_unit" varchar COLLATE "pg_catalog"."default",
  "nama_unit" varchar COLLATE "pg_catalog"."default",
  "kode_pbj" varchar COLLATE "pg_catalog"."default",
  "nama_pbj" varchar COLLATE "pg_catalog"."default"
)
;

-- ----------------------------
-- Table structure for ref_user
-- ----------------------------
DROP TABLE IF EXISTS "public"."ref_user";
CREATE TABLE "public"."ref_user" (
  "id" int4 NOT NULL DEFAULT nextval('ref_user_id_seq'::regclass),
  "email" varchar(100) COLLATE "pg_catalog"."default" NOT NULL,
  "password" varchar(100) COLLATE "pg_catalog"."default",
  "api_token" varchar(255) COLLATE "pg_catalog"."default",
  "is_login" varchar(2) COLLATE "pg_catalog"."default" DEFAULT NULL::character varying,
  "ucr" varchar(100) COLLATE "pg_catalog"."default" DEFAULT NULL::character varying,
  "uch" varchar(100) COLLATE "pg_catalog"."default" DEFAULT NULL::character varying,
  "udcr" timestamptz(6),
  "udch" timestamptz(6),
  "user_photo" varchar(255) COLLATE "pg_catalog"."default",
  "status_user" varchar(50) COLLATE "pg_catalog"."default" DEFAULT 'internal'::character varying,
  "forget_token_pass" varchar(255) COLLATE "pg_catalog"."default" DEFAULT 'NULL::character varying'::character varying,
  "otp" char(6) COLLATE "pg_catalog"."default",
  "otp_time" timestamptz(6)
)
;

-- ----------------------------
-- Table structure for ref_user_external
-- ----------------------------
DROP TABLE IF EXISTS "public"."ref_user_external";
CREATE TABLE "public"."ref_user_external" (
  "id_user" int4 NOT NULL,
  "username" varchar(255) COLLATE "pg_catalog"."default" DEFAULT 'NULL::character varying'::character varying,
  "nama" varchar(255) COLLATE "pg_catalog"."default" DEFAULT 'NULL::character varying'::character varying,
  "nik" varchar(40) COLLATE "pg_catalog"."default" DEFAULT 'NULL::character varying'::character varying,
  "siup" varchar(40) COLLATE "pg_catalog"."default" DEFAULT 'NULL::character varying'::character varying,
  "status_pengguna" varchar(40) COLLATE "pg_catalog"."default" DEFAULT 'NULL::character varying'::character varying,
  "udcr" timestamptz(6),
  "udch" timestamptz(6),
  "id" int4 NOT NULL
)
;

-- ----------------------------
-- Table structure for ref_user_internal
-- ----------------------------
DROP TABLE IF EXISTS "public"."ref_user_internal";
CREATE TABLE "public"."ref_user_internal" (
  "id_user" int4,
  "nip" varchar(40) COLLATE "pg_catalog"."default" DEFAULT NULL::character varying,
  "username" varchar(255) COLLATE "pg_catalog"."default" DEFAULT NULL::character varying,
  "udcr" timestamptz(6),
  "udch" timestamptz(6),
  "id" int4 NOT NULL DEFAULT nextval('ref_user_internal_id_seq'::regclass)
)
;

-- ----------------------------
-- Table structure for trx_group_menu
-- ----------------------------
DROP TABLE IF EXISTS "public"."trx_group_menu";
CREATE TABLE "public"."trx_group_menu" (
  "id_group_menu" int4 NOT NULL DEFAULT nextval('trx_group_menu_id_seq'::regclass),
  "kode_group" char(10) COLLATE "pg_catalog"."default" NOT NULL,
  "kode_menu1" char(10) COLLATE "pg_catalog"."default",
  "kode_menu2" char(13) COLLATE "pg_catalog"."default",
  "kode_menu3" char(16) COLLATE "pg_catalog"."default",
  "akses" "public"."enum_trx_group_menu_akses" NOT NULL,
  "ucr" varchar(255) COLLATE "pg_catalog"."default",
  "uch" varchar(255) COLLATE "pg_catalog"."default",
  "udcr" timestamptz(6),
  "udch" timestamptz(6),
  "urut" int4
)
;
COMMENT ON COLUMN "public"."trx_group_menu"."akses" IS '0=tidak aktif, 1=aktif';

-- ----------------------------
-- Table structure for trx_group_user
-- ----------------------------
DROP TABLE IF EXISTS "public"."trx_group_user";
CREATE TABLE "public"."trx_group_user" (
  "id_group_user" int4 NOT NULL DEFAULT nextval('trx_group_user_id_seq'::regclass),
  "kode_group" char(10) COLLATE "pg_catalog"."default" DEFAULT 'NULL::bpchar'::bpchar,
  "id_user" int4 NOT NULL,
  "status" "public"."enum_trx_group_user_status",
  "ucr" varchar(255) COLLATE "pg_catalog"."default",
  "uch" varchar(255) COLLATE "pg_catalog"."default",
  "udcr" varchar(255) COLLATE "pg_catalog"."default",
  "udch" varchar(255) COLLATE "pg_catalog"."default"
)
;

-- ----------------------------
-- Table structure for trx_jabatan_struktural
-- ----------------------------
DROP TABLE IF EXISTS "public"."trx_jabatan_struktural";
CREATE TABLE "public"."trx_jabatan_struktural" (
  "kode_trx_jabatan_struktural" char(9) COLLATE "pg_catalog"."default" NOT NULL,
  "kode_jabatan_struktural" char(3) COLLATE "pg_catalog"."default",
  "kode_jabatan_struktrual_sub" char(6) COLLATE "pg_catalog"."default",
  "id_user" int4,
  "status_aktif" char(1) COLLATE "pg_catalog"."default" DEFAULT '1'::bpchar,
  "ucr" varchar(100) COLLATE "pg_catalog"."default",
  "uch" varchar(100) COLLATE "pg_catalog"."default",
  "udcr" timestamptz(6),
  "udch" timestamptz(6)
)
;
COMMENT ON COLUMN "public"."trx_jabatan_struktural"."status_aktif" IS '0 = Tidak Aktif | 1 = Aktif';

-- ----------------------------
-- Table structure for trx_user_tampung
-- ----------------------------
DROP TABLE IF EXISTS "public"."trx_user_tampung";
CREATE TABLE "public"."trx_user_tampung" (
  "kode_user_tampung" int4 NOT NULL DEFAULT nextval('trx_user_tampung_kode_user_tampung_seq'::regclass),
  "nama" varchar COLLATE "pg_catalog"."default",
  "email" varchar COLLATE "pg_catalog"."default",
  "nip" varchar COLLATE "pg_catalog"."default",
  "kode_unit_pbj" int4,
  "kode_jabatan" int4,
  "status_aktif" bool DEFAULT true,
  "sk" varchar COLLATE "pg_catalog"."default",
  "encrypt_key" varchar COLLATE "pg_catalog"."default",
  "kode_unit" varchar COLLATE "pg_catalog"."default",
  "nama_unit" varchar COLLATE "pg_catalog"."default"
)
;

-- ----------------------------
-- Function structure for drop_all_foreign_keys
-- ----------------------------
DROP FUNCTION IF EXISTS "public"."drop_all_foreign_keys"("table_name" text);
CREATE OR REPLACE FUNCTION "public"."drop_all_foreign_keys"("table_name" text)
  RETURNS "pg_catalog"."void" AS $BODY$
DECLARE
    fk_name text;
BEGIN
    FOR fk_name IN
        SELECT conname
        FROM pg_constraint
        WHERE conrelid = table_name::regclass AND contype = 'f'
    LOOP
        EXECUTE 'ALTER TABLE ' || table_name || ' DROP CONSTRAINT ' || quote_ident(fk_name);
    END LOOP;
END;
$BODY$
  LANGUAGE plpgsql VOLATILE
  COST 100;

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "public"."ref_jabatan_kode_jabatan_seq"
OWNED BY "public"."ref_jabatan"."kode_jabatan";
SELECT setval('"public"."ref_jabatan_kode_jabatan_seq"', 40, true);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "public"."ref_jenis_pengadaan_kode_jenis_pengadaan_seq"
OWNED BY "public"."ref_jenis_pengadaan"."kode_jenis_pengadaan";
SELECT setval('"public"."ref_jenis_pengadaan_kode_jenis_pengadaan_seq"', 4, true);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "public"."ref_ket_pertor_kode_ket_pertor_seq"
OWNED BY "public"."ref_ket_pertor"."kode_ket_pertor";
SELECT setval('"public"."ref_ket_pertor_kode_ket_pertor_seq"', 1, true);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "public"."ref_level_kode_level_seq"
OWNED BY "public"."ref_level"."kode_level";
SELECT setval('"public"."ref_level_kode_level_seq"', 1, false);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "public"."ref_metode_pengadaan_kode_metode_pengadaan_seq"
OWNED BY "public"."ref_metode_pengadaan"."kode_metode_pengadaan";
SELECT setval('"public"."ref_metode_pengadaan_kode_metode_pengadaan_seq"', 8, true);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "public"."ref_threeshold_kode_threeshold_seq"
OWNED BY "public"."ref_threeshold"."kode_threeshold";
SELECT setval('"public"."ref_threeshold_kode_threeshold_seq"', 1, false);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "public"."ref_unit_pbj_kode_unit_pbj_seq"
OWNED BY "public"."ref_unit_pbj"."kode_unit_pbj";
SELECT setval('"public"."ref_unit_pbj_kode_unit_pbj_seq"', 70, true);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
SELECT setval('"public"."ref_user_external_id_seq"', 32433, true);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "public"."ref_user_id_seq"
OWNED BY "public"."ref_user"."id";
SELECT setval('"public"."ref_user_id_seq"', 32522, true);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
SELECT setval('"public"."ref_user_internal_id_seq"', 2089, true);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
SELECT setval('"public"."trx_group_menu_id_seq"', 193, true);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
SELECT setval('"public"."trx_group_user_id_seq"', 283915, true);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "public"."trx_user_tampung_kode_user_tampung_seq"
OWNED BY "public"."trx_user_tampung"."kode_user_tampung";
SELECT setval('"public"."trx_user_tampung_kode_user_tampung_seq"', 2613, true);

-- ----------------------------
-- Primary Key structure for table bridging_vmsdb_user_id
-- ----------------------------
ALTER TABLE "public"."bridging_vmsdb_user_id" ADD CONSTRAINT "bridging_vmsdb_user_id_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table helper_user_kodeunit
-- ----------------------------
ALTER TABLE "public"."helper_user_kodeunit" ADD CONSTRAINT "helper_user_kodeunit_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table mapping_vmsdb_user_id_real
-- ----------------------------
ALTER TABLE "public"."mapping_vmsdb_user_id_real" ADD CONSTRAINT "mapping_vmsdb_user_id_real_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table ref_aplikasi
-- ----------------------------
ALTER TABLE "public"."ref_aplikasi" ADD CONSTRAINT "ref_aplikasi_pkey" PRIMARY KEY ("kode_aplikasi");

-- ----------------------------
-- Primary Key structure for table ref_group
-- ----------------------------
ALTER TABLE "public"."ref_group" ADD CONSTRAINT "ref_group_pkey" PRIMARY KEY ("kode_group");

-- ----------------------------
-- Primary Key structure for table ref_jabatan
-- ----------------------------
ALTER TABLE "public"."ref_jabatan" ADD CONSTRAINT "ref_jabatan_pk" PRIMARY KEY ("kode_jabatan");

-- ----------------------------
-- Primary Key structure for table ref_jabatan_struktural
-- ----------------------------
ALTER TABLE "public"."ref_jabatan_struktural" ADD CONSTRAINT "ref_jabatan_struktural_pkey" PRIMARY KEY ("kode_jabatan_struktural");

-- ----------------------------
-- Primary Key structure for table ref_jabatan_struktural_sub
-- ----------------------------
ALTER TABLE "public"."ref_jabatan_struktural_sub" ADD CONSTRAINT "ref_jabatan_struktural_sub_pkey" PRIMARY KEY ("kode_jabatan_struktural_sub");

-- ----------------------------
-- Primary Key structure for table ref_jenis_pengadaan
-- ----------------------------
ALTER TABLE "public"."ref_jenis_pengadaan" ADD CONSTRAINT "ref_jenis_pengadaan_pk" PRIMARY KEY ("kode_jenis_pengadaan");

-- ----------------------------
-- Primary Key structure for table ref_ket_pertor
-- ----------------------------
ALTER TABLE "public"."ref_ket_pertor" ADD CONSTRAINT "ref_ket_pertor_pkey" PRIMARY KEY ("kode_ket_pertor");

-- ----------------------------
-- Primary Key structure for table ref_level
-- ----------------------------
ALTER TABLE "public"."ref_level" ADD CONSTRAINT "ref_level_pkey" PRIMARY KEY ("kode_level");

-- ----------------------------
-- Primary Key structure for table ref_menu1
-- ----------------------------
ALTER TABLE "public"."ref_menu1" ADD CONSTRAINT "ref_menu1_pkey" PRIMARY KEY ("kode_menu1");

-- ----------------------------
-- Indexes structure for table ref_menu2
-- ----------------------------
CREATE INDEX "fki_ref_menu2_ref_menu1_pkey" ON "public"."ref_menu2" USING btree (
  "kode_menu1" COLLATE "pg_catalog"."default" "pg_catalog"."bpchar_ops" ASC NULLS LAST
);

-- ----------------------------
-- Primary Key structure for table ref_menu2
-- ----------------------------
ALTER TABLE "public"."ref_menu2" ADD CONSTRAINT "ref_menu2_pkey" PRIMARY KEY ("kode_menu2");

-- ----------------------------
-- Indexes structure for table ref_menu3
-- ----------------------------
CREATE INDEX "fki_M" ON "public"."ref_menu3" USING btree (
  "kode_menu2" COLLATE "pg_catalog"."default" "pg_catalog"."bpchar_ops" ASC NULLS LAST
);
CREATE INDEX "fki_ref_menu3_ref_menu2_fkey" ON "public"."ref_menu3" USING btree (
  "kode_menu2" COLLATE "pg_catalog"."default" "pg_catalog"."bpchar_ops" ASC NULLS LAST
);

-- ----------------------------
-- Primary Key structure for table ref_menu3
-- ----------------------------
ALTER TABLE "public"."ref_menu3" ADD CONSTRAINT "ref_menu3_pkey" PRIMARY KEY ("kode_menu3");

-- ----------------------------
-- Primary Key structure for table ref_metode_pengadaan
-- ----------------------------
ALTER TABLE "public"."ref_metode_pengadaan" ADD CONSTRAINT "ref_metode_pengadaan_pk" PRIMARY KEY ("kode_metode_pengadaan");

-- ----------------------------
-- Primary Key structure for table ref_threeshold
-- ----------------------------
ALTER TABLE "public"."ref_threeshold" ADD CONSTRAINT "ref_threeshold_pk" PRIMARY KEY ("kode_threeshold");

-- ----------------------------
-- Primary Key structure for table ref_token_app
-- ----------------------------
ALTER TABLE "public"."ref_token_app" ADD CONSTRAINT "ref_token_app_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table ref_unit_pbj
-- ----------------------------
ALTER TABLE "public"."ref_unit_pbj" ADD CONSTRAINT "ref_unit_pbj_pk" PRIMARY KEY ("kode_unit_pbj");

-- ----------------------------
-- Primary Key structure for table ref_user
-- ----------------------------
ALTER TABLE "public"."ref_user" ADD CONSTRAINT "ref_user_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table ref_user_external
-- ----------------------------
ALTER TABLE "public"."ref_user_external" ADD CONSTRAINT "ref_user_external_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table ref_user_internal
-- ----------------------------
ALTER TABLE "public"."ref_user_internal" ADD CONSTRAINT "ref_user_internal_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table trx_group_menu
-- ----------------------------
ALTER TABLE "public"."trx_group_menu" ADD CONSTRAINT "trx_group_menu_pkey" PRIMARY KEY ("id_group_menu");

-- ----------------------------
-- Primary Key structure for table trx_group_user
-- ----------------------------
ALTER TABLE "public"."trx_group_user" ADD CONSTRAINT "trx_group_user_pkey" PRIMARY KEY ("id_group_user");

-- ----------------------------
-- Primary Key structure for table trx_jabatan_struktural
-- ----------------------------
ALTER TABLE "public"."trx_jabatan_struktural" ADD CONSTRAINT "trx_jabatan_struktural_pkey" PRIMARY KEY ("kode_trx_jabatan_struktural");

-- ----------------------------
-- Primary Key structure for table trx_user_tampung
-- ----------------------------
ALTER TABLE "public"."trx_user_tampung" ADD CONSTRAINT "trx_user_tampung_pk" PRIMARY KEY ("kode_user_tampung");

-- ----------------------------
-- Foreign Keys structure for table ref_aplikasi
-- ----------------------------
ALTER TABLE "public"."ref_aplikasi" ADD CONSTRAINT "ref_aplikasi_fk" FOREIGN KEY ("kode_metode_pengadaan") REFERENCES "public"."ref_metode_pengadaan" ("kode_metode_pengadaan") ON DELETE CASCADE ON UPDATE CASCADE;

-- ----------------------------
-- Foreign Keys structure for table ref_group
-- ----------------------------
ALTER TABLE "public"."ref_group" ADD CONSTRAINT "FK_ref_group_ref_level" FOREIGN KEY ("kode_level") REFERENCES "public"."ref_level" ("kode_level") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- ----------------------------
-- Foreign Keys structure for table ref_menu1
-- ----------------------------
ALTER TABLE "public"."ref_menu1" ADD CONSTRAINT "FK_ref_menu1_ref_level" FOREIGN KEY ("kode_level") REFERENCES "public"."ref_level" ("kode_level") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- ----------------------------
-- Foreign Keys structure for table ref_menu2
-- ----------------------------
ALTER TABLE "public"."ref_menu2" ADD CONSTRAINT "ref_menu2_ref_menu1_pkey" FOREIGN KEY ("kode_menu1") REFERENCES "public"."ref_menu1" ("kode_menu1") ON DELETE CASCADE ON UPDATE CASCADE;

-- ----------------------------
-- Foreign Keys structure for table ref_menu3
-- ----------------------------
ALTER TABLE "public"."ref_menu3" ADD CONSTRAINT "ref_menu3_ref_menu2_fkey" FOREIGN KEY ("kode_menu2") REFERENCES "public"."ref_menu2" ("kode_menu2") ON DELETE CASCADE ON UPDATE CASCADE;

-- ----------------------------
-- Foreign Keys structure for table ref_threeshold
-- ----------------------------
ALTER TABLE "public"."ref_threeshold" ADD CONSTRAINT "ref_threeshold_jenis_pengadaan_fk" FOREIGN KEY ("kode_jenis_pengadaan") REFERENCES "public"."ref_jenis_pengadaan" ("kode_jenis_pengadaan") ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE "public"."ref_threeshold" ADD CONSTRAINT "ref_threeshold_metode_pengadaan_fk" FOREIGN KEY ("kode_metode_pengadaan") REFERENCES "public"."ref_metode_pengadaan" ("kode_metode_pengadaan") ON DELETE CASCADE ON UPDATE CASCADE;

-- ----------------------------
-- Foreign Keys structure for table ref_user_external
-- ----------------------------
ALTER TABLE "public"."ref_user_external" ADD CONSTRAINT "FK_ref_user_external_ref_user" FOREIGN KEY ("id_user") REFERENCES "public"."ref_user" ("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- ----------------------------
-- Foreign Keys structure for table ref_user_internal
-- ----------------------------
ALTER TABLE "public"."ref_user_internal" ADD CONSTRAINT "FK_ref_user_internal_ref_user" FOREIGN KEY ("id_user") REFERENCES "public"."ref_user" ("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- ----------------------------
-- Foreign Keys structure for table trx_group_menu
-- ----------------------------
ALTER TABLE "public"."trx_group_menu" ADD CONSTRAINT "FK_trx_group_menu_ref_group" FOREIGN KEY ("kode_group") REFERENCES "public"."ref_group" ("kode_group") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- ----------------------------
-- Foreign Keys structure for table trx_group_user
-- ----------------------------
ALTER TABLE "public"."trx_group_user" ADD CONSTRAINT "FK_trx_group_user_ref_user" FOREIGN KEY ("id_user") REFERENCES "public"."ref_user" ("id") ON DELETE CASCADE ON UPDATE NO ACTION;

-- ----------------------------
-- Foreign Keys structure for table trx_user_tampung
-- ----------------------------
ALTER TABLE "public"."trx_user_tampung" ADD CONSTRAINT "trx_user_tampung_ref_jabatan_fk" FOREIGN KEY ("kode_jabatan") REFERENCES "public"."ref_jabatan" ("kode_jabatan") ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE "public"."trx_user_tampung" ADD CONSTRAINT "trx_user_tampung_ref_unit_pbj_fk" FOREIGN KEY ("kode_unit_pbj") REFERENCES "public"."ref_unit_pbj" ("kode_unit_pbj") ON DELETE CASCADE ON UPDATE CASCADE;
