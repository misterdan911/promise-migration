/*
 Navicat Premium Dump SQL

 Source Server         : promis-prod-dbmodul
 Source Server Type    : PostgreSQL
 Source Server Version : 160011 (160011)
 Source Host           : 172.30.10.24:5432
 Source Catalog        : db_esign
 Source Schema         : public

 Target Server Type    : PostgreSQL
 Target Server Version : 160011 (160011)
 File Encoding         : 65001

 Date: 05/02/2026 13:31:00
*/


-- ----------------------------
-- Type structure for status_jabatan_penandatangan
-- ----------------------------
DROP TYPE IF EXISTS "public"."status_jabatan_penandatangan";
CREATE TYPE "public"."status_jabatan_penandatangan" AS ENUM (
  'internal',
  'eksternal'
);
ALTER TYPE "public"."status_jabatan_penandatangan" OWNER TO "postgres";

-- ----------------------------
-- Type structure for status_penandatangan
-- ----------------------------
DROP TYPE IF EXISTS "public"."status_penandatangan";
CREATE TYPE "public"."status_penandatangan" AS ENUM (
  'sudah',
  'belum'
);
ALTER TYPE "public"."status_penandatangan" OWNER TO "postgres";

-- ----------------------------
-- Type structure for status_permohonan
-- ----------------------------
DROP TYPE IF EXISTS "public"."status_permohonan";
CREATE TYPE "public"."status_permohonan" AS ENUM (
  'baru',
  'revisi',
  'terima',
  'tolak',
  'proses'
);
ALTER TYPE "public"."status_permohonan" OWNER TO "postgres";

-- ----------------------------
-- Sequence structure for ref_penandatangan_kode_penandatangan_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."ref_penandatangan_kode_penandatangan_seq";
CREATE SEQUENCE "public"."ref_penandatangan_kode_penandatangan_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 2147483647
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for trx_detail_halaman_penandatangan_id_detail_halaman_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."trx_detail_halaman_penandatangan_id_detail_halaman_seq";
CREATE SEQUENCE "public"."trx_detail_halaman_penandatangan_id_detail_halaman_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 2147483647
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for trx_detail_penandatangan_kode_detail_penandatangan_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."trx_detail_penandatangan_kode_detail_penandatangan_seq";
CREATE SEQUENCE "public"."trx_detail_penandatangan_kode_detail_penandatangan_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 2147483647
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for trx_detail_virtual_paraf_kode_trx_detail_virtual_paraf_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."trx_detail_virtual_paraf_kode_trx_detail_virtual_paraf_seq";
CREATE SEQUENCE "public"."trx_detail_virtual_paraf_kode_trx_detail_virtual_paraf_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 2147483647
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for trx_log_aktifitas_user_kode_log_aktifitas_user_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."trx_log_aktifitas_user_kode_log_aktifitas_user_seq";
CREATE SEQUENCE "public"."trx_log_aktifitas_user_kode_log_aktifitas_user_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 2147483647
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for trx_otp_kode_otp_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."trx_otp_kode_otp_seq";
CREATE SEQUENCE "public"."trx_otp_kode_otp_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 2147483647
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for trx_penandatangan_kode_trx_penandatangan_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."trx_penandatangan_kode_trx_penandatangan_seq";
CREATE SEQUENCE "public"."trx_penandatangan_kode_trx_penandatangan_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 2147483647
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for trx_tte_kode_tte_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."trx_tte_kode_tte_seq";
CREATE SEQUENCE "public"."trx_tte_kode_tte_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 2147483647
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for trx_vitual_paraf_kode_trx_vitual_paraf_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."trx_vitual_paraf_kode_trx_vitual_paraf_seq";
CREATE SEQUENCE "public"."trx_vitual_paraf_kode_trx_vitual_paraf_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 2147483647
START 1
CACHE 1;

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
-- Table structure for ref_kelompok_penandatangan
-- ----------------------------
DROP TABLE IF EXISTS "public"."ref_kelompok_penandatangan";
CREATE TABLE "public"."ref_kelompok_penandatangan" (
  "kode_kelompok_penandatangan" int2 NOT NULL,
  "kelompok_pemohon" varchar COLLATE "pg_catalog"."default"
)
;

-- ----------------------------
-- Table structure for ref_letak_tte
-- ----------------------------
DROP TABLE IF EXISTS "public"."ref_letak_tte";
CREATE TABLE "public"."ref_letak_tte" (
  "id_letak_tte" int4 NOT NULL,
  "urutan_tte" int4,
  "x" int4,
  "y" int4,
  "total_penandatangan" int4,
  "keterangan" varchar COLLATE "pg_catalog"."default"
)
;

-- ----------------------------
-- Table structure for ref_penandatangan
-- ----------------------------
DROP TABLE IF EXISTS "public"."ref_penandatangan";
CREATE TABLE "public"."ref_penandatangan" (
  "kode_penandatangan" int4 NOT NULL DEFAULT nextval('ref_penandatangan_kode_penandatangan_seq'::regclass),
  "kode_kelompok_penandatangan" int2,
  "nama" varchar COLLATE "pg_catalog"."default",
  "email" varchar COLLATE "pg_catalog"."default",
  "no_hp" varchar COLLATE "pg_catalog"."default",
  "nip" varchar COLLATE "pg_catalog"."default",
  "nik" varchar COLLATE "pg_catalog"."default",
  "scan_ktp" varchar COLLATE "pg_catalog"."default",
  "kode_vendor" int4,
  "kode_direksi_perus" int4,
  "jabatan_direksi" varchar COLLATE "pg_catalog"."default",
  "status_permohonan" "public"."status_permohonan",
  "alasan_ditolak" text COLLATE "pg_catalog"."default",
  "user_verif" varchar COLLATE "pg_catalog"."default",
  "pin" varchar COLLATE "pg_catalog"."default",
  "tte" varchar COLLATE "pg_catalog"."default",
  "reset_token" varchar COLLATE "pg_catalog"."default",
  "token_expired_time" timestamptz(6),
  "is_user_aktif" bool,
  "user_penonaktif" varchar COLLATE "pg_catalog"."default",
  "alasan_penonaktifan" varchar COLLATE "pg_catalog"."default",
  "udcr" timestamptz(6),
  "udch" timestamptz(6),
  "key_penandatangan" varchar COLLATE "pg_catalog"."default"
)
;

-- ----------------------------
-- Table structure for trx_detail_halaman_penandatangan
-- ----------------------------
DROP TABLE IF EXISTS "public"."trx_detail_halaman_penandatangan";
CREATE TABLE "public"."trx_detail_halaman_penandatangan" (
  "id_detail_halaman" int4 NOT NULL DEFAULT nextval('trx_detail_halaman_penandatangan_id_detail_halaman_seq'::regclass),
  "kode_detail_penandatangan" int4 NOT NULL,
  "halaman" int4 NOT NULL,
  "x" int4 NOT NULL,
  "y" int4 NOT NULL
)
;

-- ----------------------------
-- Table structure for trx_detail_penandatangan
-- ----------------------------
DROP TABLE IF EXISTS "public"."trx_detail_penandatangan";
CREATE TABLE "public"."trx_detail_penandatangan" (
  "kode_detail_penandatangan" int4 NOT NULL DEFAULT nextval('trx_detail_penandatangan_kode_detail_penandatangan_seq'::regclass),
  "kode_trx_penandatangan" int4 NOT NULL,
  "status_jabatan_penandatangan" "public"."status_jabatan_penandatangan" NOT NULL,
  "jabatan" varchar COLLATE "pg_catalog"."default" NOT NULL,
  "status_penandatangan" "public"."status_penandatangan" DEFAULT 'belum'::status_penandatangan,
  "tgl_tte" timestamp(6),
  "kode_penandatangan" int4,
  "otp" varchar COLLATE "pg_catalog"."default",
  "expired_otp" timestamp(6)
)
;

-- ----------------------------
-- Table structure for trx_detail_virtual_paraf
-- ----------------------------
DROP TABLE IF EXISTS "public"."trx_detail_virtual_paraf";
CREATE TABLE "public"."trx_detail_virtual_paraf" (
  "kode_trx_detail_virtual_paraf" int4 NOT NULL DEFAULT nextval('trx_detail_virtual_paraf_kode_trx_detail_virtual_paraf_seq'::regclass),
  "kode_trx_vitual_paraf" int4 NOT NULL,
  "nama_peserta" varchar COLLATE "pg_catalog"."default" NOT NULL,
  "email_peserta" varchar COLLATE "pg_catalog"."default" NOT NULL,
  "unit_kerja" varchar COLLATE "pg_catalog"."default",
  "jabatan" varchar COLLATE "pg_catalog"."default",
  "path_qr" varchar COLLATE "pg_catalog"."default",
  "token" varchar COLLATE "pg_catalog"."default" NOT NULL,
  "status_terkirim" int2 DEFAULT 0,
  "path_paraf" varchar COLLATE "pg_catalog"."default"
)
;

-- ----------------------------
-- Table structure for trx_log_aktifitas_user
-- ----------------------------
DROP TABLE IF EXISTS "public"."trx_log_aktifitas_user";
CREATE TABLE "public"."trx_log_aktifitas_user" (
  "kode_log_aktifitas_user" int4 NOT NULL DEFAULT nextval('trx_log_aktifitas_user_kode_log_aktifitas_user_seq'::regclass),
  "email" text COLLATE "pg_catalog"."default",
  "aktifitas" text COLLATE "pg_catalog"."default",
  "udcr" timestamptz(6)
)
;

-- ----------------------------
-- Table structure for trx_otp
-- ----------------------------
DROP TABLE IF EXISTS "public"."trx_otp";
CREATE TABLE "public"."trx_otp" (
  "kode_otp" int4 NOT NULL DEFAULT nextval('trx_otp_kode_otp_seq'::regclass),
  "kode_penandatangan" int4,
  "otp" int4,
  "expired_time" timestamptz(6),
  "udcr" timestamptz(6)
)
;

-- ----------------------------
-- Table structure for trx_penandatangan
-- ----------------------------
DROP TABLE IF EXISTS "public"."trx_penandatangan";
CREATE TABLE "public"."trx_penandatangan" (
  "kode_trx_penandatangan" int4 NOT NULL DEFAULT nextval('trx_penandatangan_kode_trx_penandatangan_seq'::regclass),
  "nama_aplikasi" varchar COLLATE "pg_catalog"."default" NOT NULL,
  "nomor_surat" varchar COLLATE "pg_catalog"."default",
  "jenis_surat" varchar COLLATE "pg_catalog"."default" NOT NULL,
  "keterangan_surat" varchar COLLATE "pg_catalog"."default" NOT NULL,
  "path_dokumen" varchar COLLATE "pg_catalog"."default",
  "path_dokumen_selesai" varchar COLLATE "pg_catalog"."default",
  "tgl_selesai" timestamp(6)
)
;

-- ----------------------------
-- Table structure for trx_tte
-- ----------------------------
DROP TABLE IF EXISTS "public"."trx_tte";
CREATE TABLE "public"."trx_tte" (
  "kode_tte" int4 NOT NULL DEFAULT nextval('trx_tte_kode_tte_seq'::regclass),
  "kode_penandatangan" int4,
  "tte" varchar COLLATE "pg_catalog"."default",
  "barcode" varchar COLLATE "pg_catalog"."default",
  "dok" varchar COLLATE "pg_catalog"."default",
  "udcr" timestamptz(6)
)
;

-- ----------------------------
-- Table structure for trx_virtual_paraf
-- ----------------------------
DROP TABLE IF EXISTS "public"."trx_virtual_paraf";
CREATE TABLE "public"."trx_virtual_paraf" (
  "kode_trx_vitual_paraf" int4 NOT NULL DEFAULT nextval('trx_vitual_paraf_kode_trx_vitual_paraf_seq'::regclass),
  "nama_aplikasi" varchar COLLATE "pg_catalog"."default" NOT NULL,
  "keterangan_virtual_paraf" varchar COLLATE "pg_catalog"."default" NOT NULL,
  "tgl_pelaksanaan" timestamp(6) NOT NULL,
  "ucr" varchar COLLATE "pg_catalog"."default" NOT NULL,
  "uch" varchar COLLATE "pg_catalog"."default",
  "udcr" timestamp(6) DEFAULT CURRENT_TIMESTAMP,
  "udch" timestamp(6) DEFAULT CURRENT_TIMESTAMP
)
;

-- ----------------------------
-- Function structure for on_update_current_timestamp_log_pegawai
-- ----------------------------
DROP FUNCTION IF EXISTS "public"."on_update_current_timestamp_log_pegawai"();
CREATE OR REPLACE FUNCTION "public"."on_update_current_timestamp_log_pegawai"()
  RETURNS "pg_catalog"."trigger" AS $BODY$
BEGIN
   NEW.updated_at = now();
   RETURN NEW;
END;
$BODY$
  LANGUAGE plpgsql VOLATILE
  COST 100;

-- ----------------------------
-- Function structure for on_update_current_timestamp_log_penyedia
-- ----------------------------
DROP FUNCTION IF EXISTS "public"."on_update_current_timestamp_log_penyedia"();
CREATE OR REPLACE FUNCTION "public"."on_update_current_timestamp_log_penyedia"()
  RETURNS "pg_catalog"."trigger" AS $BODY$
BEGIN
   NEW.updated_at = now();
   RETURN NEW;
END;
$BODY$
  LANGUAGE plpgsql VOLATILE
  COST 100;

-- ----------------------------
-- Function structure for on_update_current_timestamp_pegawai
-- ----------------------------
DROP FUNCTION IF EXISTS "public"."on_update_current_timestamp_pegawai"();
CREATE OR REPLACE FUNCTION "public"."on_update_current_timestamp_pegawai"()
  RETURNS "pg_catalog"."trigger" AS $BODY$
BEGIN
   NEW.updated_at = now();
   RETURN NEW;
END;
$BODY$
  LANGUAGE plpgsql VOLATILE
  COST 100;

-- ----------------------------
-- Function structure for on_update_current_timestamp_pegawai_tutor
-- ----------------------------
DROP FUNCTION IF EXISTS "public"."on_update_current_timestamp_pegawai_tutor"();
CREATE OR REPLACE FUNCTION "public"."on_update_current_timestamp_pegawai_tutor"()
  RETURNS "pg_catalog"."trigger" AS $BODY$
BEGIN
   NEW.updated_at = now();
   RETURN NEW;
END;
$BODY$
  LANGUAGE plpgsql VOLATILE
  COST 100;

-- ----------------------------
-- Function structure for on_update_current_timestamp_pengajuan
-- ----------------------------
DROP FUNCTION IF EXISTS "public"."on_update_current_timestamp_pengajuan"();
CREATE OR REPLACE FUNCTION "public"."on_update_current_timestamp_pengajuan"()
  RETURNS "pg_catalog"."trigger" AS $BODY$
BEGIN
   NEW.updated_at = now();
   RETURN NEW;
END;
$BODY$
  LANGUAGE plpgsql VOLATILE
  COST 100;

-- ----------------------------
-- Function structure for on_update_current_timestamp_penyedia
-- ----------------------------
DROP FUNCTION IF EXISTS "public"."on_update_current_timestamp_penyedia"();
CREATE OR REPLACE FUNCTION "public"."on_update_current_timestamp_penyedia"()
  RETURNS "pg_catalog"."trigger" AS $BODY$
BEGIN
   NEW.updated_at = now();
   RETURN NEW;
END;
$BODY$
  LANGUAGE plpgsql VOLATILE
  COST 100;

-- ----------------------------
-- View structure for view_penandatangan
-- ----------------------------
DROP VIEW IF EXISTS "public"."view_penandatangan";
CREATE VIEW "public"."view_penandatangan" AS  SELECT a.kode_trx_penandatangan,
    a.nama_aplikasi,
    a.nomor_surat,
    a.jenis_surat,
    a.keterangan_surat,
    a.path_dokumen,
    a.path_dokumen_selesai,
    a.tgl_selesai,
    b.kode_detail_penandatangan,
    b.status_jabatan_penandatangan,
    b.jabatan,
    b.status_penandatangan,
    b.tgl_tte,
    b.otp,
    d.kode_penandatangan,
    d.nama,
    d.email,
    d.nip,
    d.nik
   FROM trx_penandatangan a
     JOIN trx_detail_penandatangan b ON a.kode_trx_penandatangan = b.kode_trx_penandatangan
     JOIN ref_penandatangan d ON b.kode_penandatangan = d.kode_penandatangan;

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "public"."ref_penandatangan_kode_penandatangan_seq"
OWNED BY "public"."ref_penandatangan"."kode_penandatangan";
SELECT setval('"public"."ref_penandatangan_kode_penandatangan_seq"', 38138, true);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "public"."trx_detail_halaman_penandatangan_id_detail_halaman_seq"
OWNED BY "public"."trx_detail_halaman_penandatangan"."id_detail_halaman";
SELECT setval('"public"."trx_detail_halaman_penandatangan_id_detail_halaman_seq"', 13, true);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "public"."trx_detail_penandatangan_kode_detail_penandatangan_seq"
OWNED BY "public"."trx_detail_penandatangan"."kode_detail_penandatangan";
SELECT setval('"public"."trx_detail_penandatangan_kode_detail_penandatangan_seq"', 49747, true);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "public"."trx_detail_virtual_paraf_kode_trx_detail_virtual_paraf_seq"
OWNED BY "public"."trx_detail_virtual_paraf"."kode_trx_detail_virtual_paraf";
SELECT setval('"public"."trx_detail_virtual_paraf_kode_trx_detail_virtual_paraf_seq"', 30, true);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "public"."trx_log_aktifitas_user_kode_log_aktifitas_user_seq"
OWNED BY "public"."trx_log_aktifitas_user"."kode_log_aktifitas_user";
SELECT setval('"public"."trx_log_aktifitas_user_kode_log_aktifitas_user_seq"', 29, true);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "public"."trx_otp_kode_otp_seq"
OWNED BY "public"."trx_otp"."kode_otp";
SELECT setval('"public"."trx_otp_kode_otp_seq"', 1, false);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "public"."trx_penandatangan_kode_trx_penandatangan_seq"
OWNED BY "public"."trx_penandatangan"."kode_trx_penandatangan";
SELECT setval('"public"."trx_penandatangan_kode_trx_penandatangan_seq"', 35954, true);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "public"."trx_tte_kode_tte_seq"
OWNED BY "public"."trx_tte"."kode_tte";
SELECT setval('"public"."trx_tte_kode_tte_seq"', 1, false);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "public"."trx_vitual_paraf_kode_trx_vitual_paraf_seq"
OWNED BY "public"."trx_virtual_paraf"."kode_trx_vitual_paraf";
SELECT setval('"public"."trx_vitual_paraf_kode_trx_vitual_paraf_seq"', 12, true);

-- ----------------------------
-- Primary Key structure for table ref_akses_aplikasi_eksternal
-- ----------------------------
ALTER TABLE "public"."ref_akses_aplikasi_eksternal" ADD CONSTRAINT "m_user_panutan_pkey" PRIMARY KEY ("email");

-- ----------------------------
-- Primary Key structure for table ref_kelompok_penandatangan
-- ----------------------------
ALTER TABLE "public"."ref_kelompok_penandatangan" ADD CONSTRAINT "ref_kelompok_penandatangan_pkey" PRIMARY KEY ("kode_kelompok_penandatangan");

-- ----------------------------
-- Primary Key structure for table ref_letak_tte
-- ----------------------------
ALTER TABLE "public"."ref_letak_tte" ADD CONSTRAINT "ref_letak_tte_pkey" PRIMARY KEY ("id_letak_tte");

-- ----------------------------
-- Primary Key structure for table ref_penandatangan
-- ----------------------------
ALTER TABLE "public"."ref_penandatangan" ADD CONSTRAINT "ref_penandatangan_pkey" PRIMARY KEY ("kode_penandatangan");

-- ----------------------------
-- Primary Key structure for table trx_detail_halaman_penandatangan
-- ----------------------------
ALTER TABLE "public"."trx_detail_halaman_penandatangan" ADD CONSTRAINT "trx_detail_halaman_penandatangan_pkey" PRIMARY KEY ("id_detail_halaman");

-- ----------------------------
-- Primary Key structure for table trx_detail_penandatangan
-- ----------------------------
ALTER TABLE "public"."trx_detail_penandatangan" ADD CONSTRAINT "trx_detail_penandatangan_pkey" PRIMARY KEY ("kode_detail_penandatangan");

-- ----------------------------
-- Primary Key structure for table trx_detail_virtual_paraf
-- ----------------------------
ALTER TABLE "public"."trx_detail_virtual_paraf" ADD CONSTRAINT "trx_detail_virtual_paraf_pkey" PRIMARY KEY ("kode_trx_detail_virtual_paraf");

-- ----------------------------
-- Primary Key structure for table trx_log_aktifitas_user
-- ----------------------------
ALTER TABLE "public"."trx_log_aktifitas_user" ADD CONSTRAINT "trx_log_aktifitas_user_pkey" PRIMARY KEY ("kode_log_aktifitas_user");

-- ----------------------------
-- Primary Key structure for table trx_otp
-- ----------------------------
ALTER TABLE "public"."trx_otp" ADD CONSTRAINT "trx_otp_pkey" PRIMARY KEY ("kode_otp");

-- ----------------------------
-- Primary Key structure for table trx_penandatangan
-- ----------------------------
ALTER TABLE "public"."trx_penandatangan" ADD CONSTRAINT "trx_penandatangan_pkey" PRIMARY KEY ("kode_trx_penandatangan");

-- ----------------------------
-- Primary Key structure for table trx_tte
-- ----------------------------
ALTER TABLE "public"."trx_tte" ADD CONSTRAINT "trx_tte_pkey" PRIMARY KEY ("kode_tte");

-- ----------------------------
-- Primary Key structure for table trx_virtual_paraf
-- ----------------------------
ALTER TABLE "public"."trx_virtual_paraf" ADD CONSTRAINT "trx_vitual_paraf_pkey" PRIMARY KEY ("kode_trx_vitual_paraf");

-- ----------------------------
-- Foreign Keys structure for table ref_penandatangan
-- ----------------------------
ALTER TABLE "public"."ref_penandatangan" ADD CONSTRAINT "ref_penandatangan_kode_kelompok_penandatangan_fkey" FOREIGN KEY ("kode_kelompok_penandatangan") REFERENCES "public"."ref_kelompok_penandatangan" ("kode_kelompok_penandatangan") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- ----------------------------
-- Foreign Keys structure for table trx_detail_halaman_penandatangan
-- ----------------------------
ALTER TABLE "public"."trx_detail_halaman_penandatangan" ADD CONSTRAINT "trx_detail_halaman_penandatangan_kode_detail_penandatangan_fkey" FOREIGN KEY ("kode_detail_penandatangan") REFERENCES "public"."trx_detail_penandatangan" ("kode_detail_penandatangan") ON DELETE CASCADE ON UPDATE CASCADE;

-- ----------------------------
-- Foreign Keys structure for table trx_detail_penandatangan
-- ----------------------------
ALTER TABLE "public"."trx_detail_penandatangan" ADD CONSTRAINT "FK_trx_detail_penandatangan_ref_penandatangan" FOREIGN KEY ("kode_penandatangan") REFERENCES "public"."ref_penandatangan" ("kode_penandatangan") ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE "public"."trx_detail_penandatangan" ADD CONSTRAINT "trx_detail_penandatangan_kode_trx_penandatangan_fkey" FOREIGN KEY ("kode_trx_penandatangan") REFERENCES "public"."trx_penandatangan" ("kode_trx_penandatangan") ON DELETE CASCADE ON UPDATE CASCADE;

-- ----------------------------
-- Foreign Keys structure for table trx_detail_virtual_paraf
-- ----------------------------
ALTER TABLE "public"."trx_detail_virtual_paraf" ADD CONSTRAINT "trx_detail_virtual_paraf_kode_trx_vitual_paraf_fkey" FOREIGN KEY ("kode_trx_vitual_paraf") REFERENCES "public"."trx_virtual_paraf" ("kode_trx_vitual_paraf") ON DELETE CASCADE ON UPDATE CASCADE;

-- ----------------------------
-- Foreign Keys structure for table trx_otp
-- ----------------------------
ALTER TABLE "public"."trx_otp" ADD CONSTRAINT "trx_otp_kode_penandatangan_fkey" FOREIGN KEY ("kode_penandatangan") REFERENCES "public"."ref_penandatangan" ("kode_penandatangan") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- ----------------------------
-- Foreign Keys structure for table trx_tte
-- ----------------------------
ALTER TABLE "public"."trx_tte" ADD CONSTRAINT "trx_tte_kode_penandatangan_fkey" FOREIGN KEY ("kode_penandatangan") REFERENCES "public"."ref_penandatangan" ("kode_penandatangan") ON DELETE NO ACTION ON UPDATE NO ACTION;
