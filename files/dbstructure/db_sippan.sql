/*
 Navicat Premium Dump SQL

 Source Server         : promis-devel
 Source Server Type    : PostgreSQL
 Source Server Version : 160002 (160002)
 Source Host           : 172.30.15.52:5432
 Source Catalog        : db_sippan_mig
 Source Schema         : public

 Target Server Type    : PostgreSQL
 Target Server Version : 160002 (160002)
 File Encoding         : 65001

 Date: 03/02/2026 18:18:11
*/


-- ----------------------------
-- Type structure for kategori_dipa
-- ----------------------------
DROP TYPE IF EXISTS "public"."kategori_dipa";
CREATE TYPE "public"."kategori_dipa" AS ENUM (
  'pra_dipa',
  'dipa'
);
ALTER TYPE "public"."kategori_dipa" OWNER TO "postgres";

-- ----------------------------
-- Type structure for kategori_usaha
-- ----------------------------
DROP TYPE IF EXISTS "public"."kategori_usaha";
CREATE TYPE "public"."kategori_usaha" AS ENUM (
  'usaha_kecil',
  'usaha_non_kecil'
);
ALTER TYPE "public"."kategori_usaha" OWNER TO "postgres";

-- ----------------------------
-- Type structure for ket_penggunaan
-- ----------------------------
DROP TYPE IF EXISTS "public"."ket_penggunaan";
CREATE TYPE "public"."ket_penggunaan" AS ENUM (
  'rencana_penggunaan',
  'batal_digunakan',
  'proses_pencairan',
  'sudah_cair',
  'batal_pencairan'
);
ALTER TYPE "public"."ket_penggunaan" OWNER TO "postgres";

-- ----------------------------
-- Type structure for status_permintaan_pencairan
-- ----------------------------
DROP TYPE IF EXISTS "public"."status_permintaan_pencairan";
CREATE TYPE "public"."status_permintaan_pencairan" AS ENUM (
  'success',
  'revisi',
  'open',
  'close'
);
ALTER TYPE "public"."status_permintaan_pencairan" OWNER TO "postgres";

-- ----------------------------
-- Type structure for status_rup
-- ----------------------------
DROP TYPE IF EXISTS "public"."status_rup";
CREATE TYPE "public"."status_rup" AS ENUM (
  'draft',
  'diajukan'
);
ALTER TYPE "public"."status_rup" OWNER TO "postgres";

-- ----------------------------
-- Type structure for ya_tidak
-- ----------------------------
DROP TYPE IF EXISTS "public"."ya_tidak";
CREATE TYPE "public"."ya_tidak" AS ENUM (
  'ya',
  'tidak'
);
ALTER TYPE "public"."ya_tidak" OWNER TO "postgres";

-- ----------------------------
-- Sequence structure for ref_det_penggunaan_pagu_kode_detail_pp_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."ref_det_penggunaan_pagu_kode_detail_pp_seq";
CREATE SEQUENCE "public"."ref_det_penggunaan_pagu_kode_detail_pp_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 2147483647
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for ref_keyword_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."ref_keyword_id_seq";
CREATE SEQUENCE "public"."ref_keyword_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 2147483647
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for ref_rup_kode_rup_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."ref_rup_kode_rup_seq";
CREATE SEQUENCE "public"."ref_rup_kode_rup_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 2147483647
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for trx_permintaan_pencairan_kode_permintaan_pencairan_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."trx_permintaan_pencairan_kode_permintaan_pencairan_seq";
CREATE SEQUENCE "public"."trx_permintaan_pencairan_kode_permintaan_pencairan_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 2147483647
START 1
CACHE 1;

-- ----------------------------
-- Table structure for ref_det_penggunaan_pagu
-- ----------------------------
DROP TABLE IF EXISTS "public"."ref_det_penggunaan_pagu";
CREATE TABLE "public"."ref_det_penggunaan_pagu" (
  "kode_detail_pp" int4 NOT NULL DEFAULT nextval('ref_det_penggunaan_pagu_kode_detail_pp_seq'::regclass),
  "no_drauk" int4,
  "kode_unit" varchar(20) COLLATE "pg_catalog"."default",
  "ket_penggunaan" "public"."ket_penggunaan",
  "operator" varchar COLLATE "pg_catalog"."default",
  "nominal" numeric,
  "udcr" timestamptz(6),
  "kode_rup" int4 NOT NULL,
  "kode_permintaan_pencairan" int4
)
;

-- ----------------------------
-- Table structure for ref_jenis_pengadaan
-- ----------------------------
DROP TABLE IF EXISTS "public"."ref_jenis_pengadaan";
CREATE TABLE "public"."ref_jenis_pengadaan" (
  "kode_jenis_pengadaan" int2 NOT NULL,
  "jenis_pengadaan" varchar COLLATE "pg_catalog"."default"
)
;
COMMENT ON TABLE "public"."ref_jenis_pengadaan" IS 'Tabel ini harusnya udah gak dipake karena sudah dipindahkan ke db_usman';

-- ----------------------------
-- Table structure for ref_kab_kota
-- ----------------------------
DROP TABLE IF EXISTS "public"."ref_kab_kota";
CREATE TABLE "public"."ref_kab_kota" (
  "kode_kab_kota" varchar(5) COLLATE "pg_catalog"."default" NOT NULL,
  "kode_provinsi" varchar(5) COLLATE "pg_catalog"."default",
  "kab_kota" varchar COLLATE "pg_catalog"."default"
)
;

-- ----------------------------
-- Table structure for ref_keyword
-- ----------------------------
DROP TABLE IF EXISTS "public"."ref_keyword";
CREATE TABLE "public"."ref_keyword" (
  "id" int4 NOT NULL DEFAULT nextval('ref_keyword_id_seq'::regclass),
  "kw_lokasi" varchar COLLATE "pg_catalog"."default",
  "kw_detail_lokasi" varchar COLLATE "pg_catalog"."default",
  "kode_kab_kota" varchar COLLATE "pg_catalog"."default"
)
;

-- ----------------------------
-- Table structure for ref_provinsi
-- ----------------------------
DROP TABLE IF EXISTS "public"."ref_provinsi";
CREATE TABLE "public"."ref_provinsi" (
  "kode_provinsi" varchar(5) COLLATE "pg_catalog"."default" NOT NULL,
  "provinsi" varchar COLLATE "pg_catalog"."default"
)
;

-- ----------------------------
-- Table structure for ref_rup
-- ----------------------------
DROP TABLE IF EXISTS "public"."ref_rup";
CREATE TABLE "public"."ref_rup" (
  "kode_rup" int4 NOT NULL DEFAULT nextval('ref_rup_kode_rup_seq'::regclass),
  "no_rup" varchar COLLATE "pg_catalog"."default",
  "no_drauk" int4,
  "kode_unit" varchar(20) COLLATE "pg_catalog"."default",
  "sumber_dana" varchar COLLATE "pg_catalog"."default",
  "nama_paket" varchar COLLATE "pg_catalog"."default",
  "uraian_spek_kerja" text COLLATE "pg_catalog"."default",
  "volume_pekerjaan" varchar COLLATE "pg_catalog"."default",
  "satuan_volume" varchar COLLATE "pg_catalog"."default",
  "kode_kab_kota" varchar COLLATE "pg_catalog"."default",
  "lokasi" varchar COLLATE "pg_catalog"."default",
  "detail_lokasi" varchar COLLATE "pg_catalog"."default",
  "tahun_anggaran" int4,
  "prod_dalam_negri" "public"."ya_tidak",
  "is_kualifikasi_k" bool,
  "is_kualifikasi_m" bool,
  "is_kualifikasi_b" bool,
  "jml_pagu" numeric,
  "is_pra_drauk" bool,
  "kode_jenis_pengadaan" int2,
  "kode_kat_metode" int4,
  "kode_metode_pengadaan" int4,
  "tgl_renc_pemilihan_awal" date,
  "tgl_renc_pemilihan_akhir" date,
  "tgl_renc_pelaksanaan_awal" date,
  "tgl_renc_pelaksanaan_akhir" date,
  "tgl_renc_pemanfaatan_awal" date,
  "tgl_renc_pemanfaatan_akhir" date,
  "status_rup" "public"."status_rup",
  "ucr" varchar COLLATE "pg_catalog"."default",
  "uch" varchar COLLATE "pg_catalog"."default",
  "udcr" timestamptz(6),
  "udch" timestamptz(6),
  "status_rup_digunakan" varchar COLLATE "pg_catalog"."default" NOT NULL DEFAULT 'Unposted'::character varying,
  "multi_years" bool NOT NULL DEFAULT false,
  "jml_pagu_eks" numeric
)
;

-- ----------------------------
-- Table structure for trx_permintaan_pencairan
-- ----------------------------
DROP TABLE IF EXISTS "public"."trx_permintaan_pencairan";
CREATE TABLE "public"."trx_permintaan_pencairan" (
  "kode_permintaan_pencairan" int4 NOT NULL DEFAULT nextval('trx_permintaan_pencairan_kode_permintaan_pencairan_seq'::regclass),
  "nama_aplikasi" varchar COLLATE "pg_catalog"."default" NOT NULL,
  "kode_usulan" varchar COLLATE "pg_catalog"."default",
  "tgl_permintaan_pencairan" timestamp(6) DEFAULT CURRENT_TIMESTAMP,
  "kode_rup" int4,
  "kode_kontrak" int4 NOT NULL
)
;

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "public"."ref_det_penggunaan_pagu_kode_detail_pp_seq"
OWNED BY "public"."ref_det_penggunaan_pagu"."kode_detail_pp";
SELECT setval('"public"."ref_det_penggunaan_pagu_kode_detail_pp_seq"', 86, true);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "public"."ref_keyword_id_seq"
OWNED BY "public"."ref_keyword"."id";
SELECT setval('"public"."ref_keyword_id_seq"', 1, false);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "public"."ref_rup_kode_rup_seq"
OWNED BY "public"."ref_rup"."kode_rup";
SELECT setval('"public"."ref_rup_kode_rup_seq"', 9474, true);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "public"."trx_permintaan_pencairan_kode_permintaan_pencairan_seq"
OWNED BY "public"."trx_permintaan_pencairan"."kode_permintaan_pencairan";
SELECT setval('"public"."trx_permintaan_pencairan_kode_permintaan_pencairan_seq"', 33, true);

-- ----------------------------
-- Primary Key structure for table ref_det_penggunaan_pagu
-- ----------------------------
ALTER TABLE "public"."ref_det_penggunaan_pagu" ADD CONSTRAINT "ref_det_penggunaan_pagu_pkey" PRIMARY KEY ("kode_detail_pp");

-- ----------------------------
-- Primary Key structure for table ref_jenis_pengadaan
-- ----------------------------
ALTER TABLE "public"."ref_jenis_pengadaan" ADD CONSTRAINT "ref_jenis_pengadaan_pkey" PRIMARY KEY ("kode_jenis_pengadaan");

-- ----------------------------
-- Primary Key structure for table ref_kab_kota
-- ----------------------------
ALTER TABLE "public"."ref_kab_kota" ADD CONSTRAINT "ref_kab_kota_pkey" PRIMARY KEY ("kode_kab_kota");

-- ----------------------------
-- Primary Key structure for table ref_keyword
-- ----------------------------
ALTER TABLE "public"."ref_keyword" ADD CONSTRAINT "ref_keyword_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Indexes structure for table ref_provinsi
-- ----------------------------
CREATE INDEX "provinsi_index" ON "public"."ref_provinsi" USING btree (
  "provinsi" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
);

-- ----------------------------
-- Primary Key structure for table ref_provinsi
-- ----------------------------
ALTER TABLE "public"."ref_provinsi" ADD CONSTRAINT "ref_provinsi_pkey" PRIMARY KEY ("kode_provinsi");

-- ----------------------------
-- Primary Key structure for table ref_rup
-- ----------------------------
ALTER TABLE "public"."ref_rup" ADD CONSTRAINT "ref_rup_pkey" PRIMARY KEY ("kode_rup");

-- ----------------------------
-- Primary Key structure for table trx_permintaan_pencairan
-- ----------------------------
ALTER TABLE "public"."trx_permintaan_pencairan" ADD CONSTRAINT "trx_permintaan_pencairan_pkey" PRIMARY KEY ("kode_permintaan_pencairan");

-- ----------------------------
-- Foreign Keys structure for table ref_det_penggunaan_pagu
-- ----------------------------
ALTER TABLE "public"."ref_det_penggunaan_pagu" ADD CONSTRAINT "FK_ref_det_penggunaan_pagu_ref_rup" FOREIGN KEY ("kode_rup") REFERENCES "public"."ref_rup" ("kode_rup") ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE "public"."ref_det_penggunaan_pagu" ADD CONSTRAINT "FK_ref_det_penggunaan_pagu_trx_permintaan_pencairan" FOREIGN KEY ("kode_permintaan_pencairan") REFERENCES "public"."trx_permintaan_pencairan" ("kode_permintaan_pencairan") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- ----------------------------
-- Foreign Keys structure for table ref_kab_kota
-- ----------------------------
ALTER TABLE "public"."ref_kab_kota" ADD CONSTRAINT "ref_kabupaten_kota_kode_provinsi_fkey" FOREIGN KEY ("kode_provinsi") REFERENCES "public"."ref_provinsi" ("kode_provinsi") ON DELETE NO ACTION ON UPDATE NO ACTION;
