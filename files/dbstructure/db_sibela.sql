/*
 Navicat Premium Dump SQL

 Source Server         : promis-prod-dbmodul
 Source Server Type    : PostgreSQL
 Source Server Version : 160011 (160011)
 Source Host           : 172.30.10.24:5432
 Source Catalog        : db_sibela
 Source Schema         : public

 Target Server Type    : PostgreSQL
 Target Server Version : 160011 (160011)
 File Encoding         : 65001

 Date: 04/02/2026 15:27:13
*/


-- ----------------------------
-- Type structure for jenis_aset
-- ----------------------------
DROP TYPE IF EXISTS "public"."jenis_aset";
CREATE TYPE "public"."jenis_aset" AS ENUM (
  'persediaan',
  'aset_tetap',
  'barang_habis_pakai'
);
ALTER TYPE "public"."jenis_aset" OWNER TO "postgres";

-- ----------------------------
-- Type structure for jenis_penyedia
-- ----------------------------
DROP TYPE IF EXISTS "public"."jenis_penyedia";
CREATE TYPE "public"."jenis_penyedia" AS ENUM (
  'dpt',
  'luar_dpt'
);
ALTER TYPE "public"."jenis_penyedia" OWNER TO "postgres";

-- ----------------------------
-- Type structure for kategori_bentuk_kontrak
-- ----------------------------
DROP TYPE IF EXISTS "public"."kategori_bentuk_kontrak";
CREATE TYPE "public"."kategori_bentuk_kontrak" AS ENUM (
  'upload',
  'tamplate',
  'template'
);
ALTER TYPE "public"."kategori_bentuk_kontrak" OWNER TO "postgres";

-- ----------------------------
-- Type structure for kategori_nilai_transaksi
-- ----------------------------
DROP TYPE IF EXISTS "public"."kategori_nilai_transaksi";
CREATE TYPE "public"."kategori_nilai_transaksi" AS ENUM (
  'nilai_kontrak',
  'management_fee'
);
ALTER TYPE "public"."kategori_nilai_transaksi" OWNER TO "postgres";

-- ----------------------------
-- Type structure for kategori_serah_terima
-- ----------------------------
DROP TYPE IF EXISTS "public"."kategori_serah_terima";
CREATE TYPE "public"."kategori_serah_terima" AS ENUM (
  'sekaligus',
  'sebagian'
);
ALTER TYPE "public"."kategori_serah_terima" OWNER TO "postgres";

-- ----------------------------
-- Type structure for kategori_sispembayaran
-- ----------------------------
DROP TYPE IF EXISTS "public"."kategori_sispembayaran";
CREATE TYPE "public"."kategori_sispembayaran" AS ENUM (
  'sekaligus',
  'termin'
);
ALTER TYPE "public"."kategori_sispembayaran" OWNER TO "postgres";

-- ----------------------------
-- Type structure for kategori_tte
-- ----------------------------
DROP TYPE IF EXISTS "public"."kategori_tte";
CREATE TYPE "public"."kategori_tte" AS ENUM (
  'ba_negosiasi',
  'ba_hasil_pemilihan',
  'surat_pesanan',
  'ba_pemeriksaan',
  'ba_serah_terima',
  'sptjm',
  'bast_sementara',
  's_perjanjian_pembayaran',
  's_pernyataan_kesanggupan',
  's_pembayaran',
  'ba_pemeriksaan_akhir',
  'ba_serah_terima_akhir'
);
ALTER TYPE "public"."kategori_tte" OWNER TO "postgres";

-- ----------------------------
-- Type structure for klmpk_status_permintaan
-- ----------------------------
DROP TYPE IF EXISTS "public"."klmpk_status_permintaan";
CREATE TYPE "public"."klmpk_status_permintaan" AS ENUM (
  'baru',
  'proses',
  'selesai'
);
ALTER TYPE "public"."klmpk_status_permintaan" OWNER TO "postgres";

-- ----------------------------
-- Type structure for negotiator
-- ----------------------------
DROP TYPE IF EXISTS "public"."negotiator";
CREATE TYPE "public"."negotiator" AS ENUM (
  'pp',
  'penyedia'
);
ALTER TYPE "public"."negotiator" OWNER TO "postgres";

-- ----------------------------
-- Type structure for skema_pembayaran
-- ----------------------------
DROP TYPE IF EXISTS "public"."skema_pembayaran";
CREATE TYPE "public"."skema_pembayaran" AS ENUM (
  'langsung',
  'uang_persediaan',
  'kredit',
  'debit'
);
ALTER TYPE "public"."skema_pembayaran" OWNER TO "postgres";

-- ----------------------------
-- Sequence structure for ref_ba_pemeriksaan_kode_ba_pemerikasaan_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."ref_ba_pemeriksaan_kode_ba_pemerikasaan_seq";
CREATE SEQUENCE "public"."ref_ba_pemeriksaan_kode_ba_pemerikasaan_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 2147483647
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for ref_ba_pemeriksaan_st_kode_bap_st_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."ref_ba_pemeriksaan_st_kode_bap_st_seq";
CREATE SEQUENCE "public"."ref_ba_pemeriksaan_st_kode_bap_st_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 2147483647
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for ref_bentuk_kontrak_kode_bentuk_kontrak_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."ref_bentuk_kontrak_kode_bentuk_kontrak_seq";
CREATE SEQUENCE "public"."ref_bentuk_kontrak_kode_bentuk_kontrak_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 2147483647
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for ref_detail_aspek_kode_detail_aspek_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."ref_detail_aspek_kode_detail_aspek_seq";
CREATE SEQUENCE "public"."ref_detail_aspek_kode_detail_aspek_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 2147483647
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for ref_dok_detail_transaksi_kode_dok_detail_transaksi_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."ref_dok_detail_transaksi_kode_dok_detail_transaksi_seq";
CREATE SEQUENCE "public"."ref_dok_detail_transaksi_kode_dok_detail_transaksi_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 2147483647
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for ref_jenis_laporan_kode_jenis_laporan_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."ref_jenis_laporan_kode_jenis_laporan_seq";
CREATE SEQUENCE "public"."ref_jenis_laporan_kode_jenis_laporan_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 2147483647
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for ref_kategori_addendum_kode_kategori_addendum_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."ref_kategori_addendum_kode_kategori_addendum_seq";
CREATE SEQUENCE "public"."ref_kategori_addendum_kode_kategori_addendum_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 2147483647
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for ref_keluaran_proses_kontrak_kode_keluaran_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."ref_keluaran_proses_kontrak_kode_keluaran_seq";
CREATE SEQUENCE "public"."ref_keluaran_proses_kontrak_kode_keluaran_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 2147483647
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for ref_permintaan_kode_permintaan_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."ref_permintaan_kode_permintaan_seq";
CREATE SEQUENCE "public"."ref_permintaan_kode_permintaan_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 2147483647
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for ref_proses_kontrak_kode_proses_kontrak_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."ref_proses_kontrak_kode_proses_kontrak_seq";
CREATE SEQUENCE "public"."ref_proses_kontrak_kode_proses_kontrak_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 2147483647
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for ref_riwayat_pelaksanaan_kode_riwayat_pelaksanaan_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."ref_riwayat_pelaksanaan_kode_riwayat_pelaksanaan_seq";
CREATE SEQUENCE "public"."ref_riwayat_pelaksanaan_kode_riwayat_pelaksanaan_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 2147483647
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for ref_serah_terima_kode_serah_terima_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."ref_serah_terima_kode_serah_terima_seq";
CREATE SEQUENCE "public"."ref_serah_terima_kode_serah_terima_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 2147483647
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for ref_sptjm_kode_sptjm_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."ref_sptjm_kode_sptjm_seq";
CREATE SEQUENCE "public"."ref_sptjm_kode_sptjm_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 2147483647
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for ref_status_kontrak_kode_status_kontrak_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."ref_status_kontrak_kode_status_kontrak_seq";
CREATE SEQUENCE "public"."ref_status_kontrak_kode_status_kontrak_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 2147483647
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for ref_step_persiapan_kontrak_kode_step_persiapan_kontrak_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."ref_step_persiapan_kontrak_kode_step_persiapan_kontrak_seq";
CREATE SEQUENCE "public"."ref_step_persiapan_kontrak_kode_step_persiapan_kontrak_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 2147483647
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for tbl_sptb_pl_id_sptb_pl_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."tbl_sptb_pl_id_sptb_pl_seq";
CREATE SEQUENCE "public"."tbl_sptb_pl_id_sptb_pl_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 2147483647
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for tbl_sptbdpt_pl_id_sptb_dptpl_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."tbl_sptbdpt_pl_id_sptb_dptpl_seq";
CREATE SEQUENCE "public"."tbl_sptbdpt_pl_id_sptb_dptpl_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 2147483647
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for trx_addendum_biaya_kode_trx_addendum_biaya_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."trx_addendum_biaya_kode_trx_addendum_biaya_seq";
CREATE SEQUENCE "public"."trx_addendum_biaya_kode_trx_addendum_biaya_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 2147483647
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for trx_addendum_jangka_waktu_kode_trx_addendum_jangka_waktu_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."trx_addendum_jangka_waktu_kode_trx_addendum_jangka_waktu_seq";
CREATE SEQUENCE "public"."trx_addendum_jangka_waktu_kode_trx_addendum_jangka_waktu_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 2147483647
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for trx_addendum_kode_trx_addendum_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."trx_addendum_kode_trx_addendum_seq";
CREATE SEQUENCE "public"."trx_addendum_kode_trx_addendum_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 2147483647
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for trx_addendum_spek_teknis_kode_trx_addendum_st_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."trx_addendum_spek_teknis_kode_trx_addendum_st_seq";
CREATE SEQUENCE "public"."trx_addendum_spek_teknis_kode_trx_addendum_st_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 2147483647
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for trx_ba_pemeriksaan_kode_trx_ba_pemeriksaan_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."trx_ba_pemeriksaan_kode_trx_ba_pemeriksaan_seq";
CREATE SEQUENCE "public"."trx_ba_pemeriksaan_kode_trx_ba_pemeriksaan_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 2147483647
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for trx_ba_pemeriksaan_st_kode_trx_bap_st_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."trx_ba_pemeriksaan_st_kode_trx_bap_st_seq";
CREATE SEQUENCE "public"."trx_ba_pemeriksaan_st_kode_trx_bap_st_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 2147483647
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for trx_bast_kode_bast_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."trx_bast_kode_bast_seq";
CREATE SEQUENCE "public"."trx_bast_kode_bast_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 2147483647
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for trx_bast_st_kode_bast_st_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."trx_bast_st_kode_bast_st_seq";
CREATE SEQUENCE "public"."trx_bast_st_kode_bast_st_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 2147483647
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for trx_detail_permintaan_kode_detail_permintaan_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."trx_detail_permintaan_kode_detail_permintaan_seq";
CREATE SEQUENCE "public"."trx_detail_permintaan_kode_detail_permintaan_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 2147483647
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for trx_dokumen_kontrak_kode_dokumen_kontrak_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."trx_dokumen_kontrak_kode_dokumen_kontrak_seq";
CREATE SEQUENCE "public"."trx_dokumen_kontrak_kode_dokumen_kontrak_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 2147483647
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for trx_hasil_pajak_id_hasil_pajak_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."trx_hasil_pajak_id_hasil_pajak_seq";
CREATE SEQUENCE "public"."trx_hasil_pajak_id_hasil_pajak_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 2147483647
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for trx_jangka_waktu_kode_jangka_waktu_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."trx_jangka_waktu_kode_jangka_waktu_seq";
CREATE SEQUENCE "public"."trx_jangka_waktu_kode_jangka_waktu_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 2147483647
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for trx_jenis_laporan_kode_trx_jenis_laporan_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."trx_jenis_laporan_kode_trx_jenis_laporan_seq";
CREATE SEQUENCE "public"."trx_jenis_laporan_kode_trx_jenis_laporan_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 2147483647
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for trx_jenis_sispembayaran_kode_trx_jenis_sispembayaran_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."trx_jenis_sispembayaran_kode_trx_jenis_sispembayaran_seq";
CREATE SEQUENCE "public"."trx_jenis_sispembayaran_kode_trx_jenis_sispembayaran_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 2147483647
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for trx_keluaran_output_kode_keluaran_output_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."trx_keluaran_output_kode_keluaran_output_seq";
CREATE SEQUENCE "public"."trx_keluaran_output_kode_keluaran_output_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 2147483647
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for trx_keluaran_output_new_kode_keluaran_output_new_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."trx_keluaran_output_new_kode_keluaran_output_new_seq";
CREATE SEQUENCE "public"."trx_keluaran_output_new_kode_keluaran_output_new_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 2147483647
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for trx_kwitansi_kode_kwitansi_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."trx_kwitansi_kode_kwitansi_seq";
CREATE SEQUENCE "public"."trx_kwitansi_kode_kwitansi_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 2147483647
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for trx_monitoring_kode_monitoring_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."trx_monitoring_kode_monitoring_seq";
CREATE SEQUENCE "public"."trx_monitoring_kode_monitoring_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 2147483647
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for trx_monitoring_new_kode_trx_monitoring_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."trx_monitoring_new_kode_trx_monitoring_seq";
CREATE SEQUENCE "public"."trx_monitoring_new_kode_trx_monitoring_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 2147483647
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for trx_nego_harga_kode_nego_harga_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."trx_nego_harga_kode_nego_harga_seq";
CREATE SEQUENCE "public"."trx_nego_harga_kode_nego_harga_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 2147483647
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for trx_nego_teknis_kode_nego_teknis_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."trx_nego_teknis_kode_nego_teknis_seq";
CREATE SEQUENCE "public"."trx_nego_teknis_kode_nego_teknis_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 2147483647
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for trx_nilai_addendum_kode_nilai_addendum_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."trx_nilai_addendum_kode_nilai_addendum_seq";
CREATE SEQUENCE "public"."trx_nilai_addendum_kode_nilai_addendum_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 2147483647
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for trx_pajak_kode_pajak_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."trx_pajak_kode_pajak_seq";
CREATE SEQUENCE "public"."trx_pajak_kode_pajak_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 2147483647
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for trx_pembayaran_kode_trx_pencarian_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."trx_pembayaran_kode_trx_pencarian_seq";
CREATE SEQUENCE "public"."trx_pembayaran_kode_trx_pencarian_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 2147483647
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for trx_penambahan_jangka_waktu_kode_trx_penambahan_jw_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."trx_penambahan_jangka_waktu_kode_trx_penambahan_jw_seq";
CREATE SEQUENCE "public"."trx_penambahan_jangka_waktu_kode_trx_penambahan_jw_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 2147483647
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for trx_penilaian_pembayaran_kode_penilaian_pembayaran_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."trx_penilaian_pembayaran_kode_penilaian_pembayaran_seq";
CREATE SEQUENCE "public"."trx_penilaian_pembayaran_kode_penilaian_pembayaran_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 2147483647
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for trx_proses_pajak_kode_proses_pajak_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."trx_proses_pajak_kode_proses_pajak_seq";
CREATE SEQUENCE "public"."trx_proses_pajak_kode_proses_pajak_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 2147483647
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for trx_riwayat_pelaksanaan_kode_trx_riwayat_pelaksanaan_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."trx_riwayat_pelaksanaan_kode_trx_riwayat_pelaksanaan_seq";
CREATE SEQUENCE "public"."trx_riwayat_pelaksanaan_kode_trx_riwayat_pelaksanaan_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 2147483647
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for trx_serah_terima_kode_serah_terima_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."trx_serah_terima_kode_serah_terima_seq";
CREATE SEQUENCE "public"."trx_serah_terima_kode_serah_terima_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 2147483647
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for trx_sistem_pembayaran_kode_sistem_pembayaran_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."trx_sistem_pembayaran_kode_sistem_pembayaran_seq";
CREATE SEQUENCE "public"."trx_sistem_pembayaran_kode_sistem_pembayaran_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 2147483647
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for trx_sptjm_kode_trx_sptjm_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."trx_sptjm_kode_trx_sptjm_seq";
CREATE SEQUENCE "public"."trx_sptjm_kode_trx_sptjm_seq" 
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
-- Table structure for m_aspek
-- ----------------------------
DROP TABLE IF EXISTS "public"."m_aspek";
CREATE TABLE "public"."m_aspek" (
  "kode_aspek" char(1) COLLATE "pg_catalog"."default" NOT NULL,
  "nama_aspek" varchar COLLATE "pg_catalog"."default" NOT NULL,
  "ucr" varchar COLLATE "pg_catalog"."default" NOT NULL,
  "uch" varchar COLLATE "pg_catalog"."default",
  "udcr" timestamp(6) DEFAULT CURRENT_TIMESTAMP,
  "udch" timestamp(6) DEFAULT CURRENT_TIMESTAMP
)
;

-- ----------------------------
-- Table structure for ref_ba_pemeriksaan
-- ----------------------------
DROP TABLE IF EXISTS "public"."ref_ba_pemeriksaan";
CREATE TABLE "public"."ref_ba_pemeriksaan" (
  "kode_ba_pemerikasaan" int4 NOT NULL DEFAULT nextval('ref_ba_pemeriksaan_kode_ba_pemerikasaan_seq'::regclass),
  "kode_trx_riwayat_pelaksanaan" int4 NOT NULL,
  "kode_tte" int4 NOT NULL,
  "tanggal_bap" timestamp(6),
  "denda" numeric,
  "dok_hasil_pekerjaan" varchar COLLATE "pg_catalog"."default",
  "catatan" text COLLATE "pg_catalog"."default",
  "nama_pemeriksa" varchar COLLATE "pg_catalog"."default",
  "ucr" varchar COLLATE "pg_catalog"."default",
  "uch" varchar COLLATE "pg_catalog"."default",
  "udcr" timestamp(6) DEFAULT CURRENT_TIMESTAMP,
  "udch" timestamp(6) DEFAULT CURRENT_TIMESTAMP
)
;

-- ----------------------------
-- Table structure for ref_ba_pemeriksaan_st
-- ----------------------------
DROP TABLE IF EXISTS "public"."ref_ba_pemeriksaan_st";
CREATE TABLE "public"."ref_ba_pemeriksaan_st" (
  "kode_bap_st" int4 NOT NULL DEFAULT nextval('ref_ba_pemeriksaan_st_kode_bap_st_seq'::regclass),
  "kode_serah_terima" int4 NOT NULL,
  "kode_tte" int4 NOT NULL,
  "tanggal_bap" timestamp(6),
  "denda" numeric,
  "dok_hasil_pekerjaan" varchar COLLATE "pg_catalog"."default",
  "catatan" text COLLATE "pg_catalog"."default",
  "nama_pemeriksa" varchar COLLATE "pg_catalog"."default",
  "ucr" varchar COLLATE "pg_catalog"."default",
  "uch" varchar COLLATE "pg_catalog"."default",
  "udcr" timestamp(6) DEFAULT CURRENT_TIMESTAMP,
  "udch" timestamp(6) DEFAULT CURRENT_TIMESTAMP
)
;

-- ----------------------------
-- Table structure for ref_bentuk_kontrak
-- ----------------------------
DROP TABLE IF EXISTS "public"."ref_bentuk_kontrak";
CREATE TABLE "public"."ref_bentuk_kontrak" (
  "kode_bentuk_kontrak" int4 NOT NULL DEFAULT nextval('ref_bentuk_kontrak_kode_bentuk_kontrak_seq'::regclass),
  "nama_bentuk_kontrak" varchar COLLATE "pg_catalog"."default" NOT NULL,
  "kategori_bentuk_kontrak" "public"."kategori_bentuk_kontrak" NOT NULL,
  "nama_template_dok" varchar COLLATE "pg_catalog"."default"
)
;

-- ----------------------------
-- Table structure for ref_detail_aspek
-- ----------------------------
DROP TABLE IF EXISTS "public"."ref_detail_aspek";
CREATE TABLE "public"."ref_detail_aspek" (
  "kode_detail_aspek" int4 NOT NULL DEFAULT nextval('ref_detail_aspek_kode_detail_aspek_seq'::regclass),
  "kode_aspek" char(1) COLLATE "pg_catalog"."default" NOT NULL,
  "nama_detail_aspek" varchar COLLATE "pg_catalog"."default" NOT NULL,
  "kategori_detail_aspek" varchar COLLATE "pg_catalog"."default" NOT NULL,
  "ucr" varchar COLLATE "pg_catalog"."default" NOT NULL,
  "uch" varchar COLLATE "pg_catalog"."default",
  "udcr" timestamp(6) DEFAULT CURRENT_TIMESTAMP,
  "udch" timestamp(6) DEFAULT CURRENT_TIMESTAMP
)
;

-- ----------------------------
-- Table structure for ref_dok_detail_transaksi
-- ----------------------------
DROP TABLE IF EXISTS "public"."ref_dok_detail_transaksi";
CREATE TABLE "public"."ref_dok_detail_transaksi" (
  "kode_dok_detail_transaksi" int4 NOT NULL DEFAULT nextval('ref_dok_detail_transaksi_kode_dok_detail_transaksi_seq'::regclass),
  "kode_transaksi" int4 NOT NULL,
  "nama_dokumen" varchar COLLATE "pg_catalog"."default" NOT NULL,
  "keyy_dok" varchar COLLATE "pg_catalog"."default" NOT NULL,
  "keterangan_dok" varchar COLLATE "pg_catalog"."default",
  "kategori_transaksi" varchar COLLATE "pg_catalog"."default"
)
;

-- ----------------------------
-- Table structure for ref_jenis_kontrak
-- ----------------------------
DROP TABLE IF EXISTS "public"."ref_jenis_kontrak";
CREATE TABLE "public"."ref_jenis_kontrak" (
  "kode_jenis_kontrak" int4 NOT NULL,
  "jenis_kontrak" varchar(255) COLLATE "pg_catalog"."default"
)
;

-- ----------------------------
-- Table structure for ref_jenis_laporan
-- ----------------------------
DROP TABLE IF EXISTS "public"."ref_jenis_laporan";
CREATE TABLE "public"."ref_jenis_laporan" (
  "kode_jenis_laporan" int4 NOT NULL DEFAULT nextval('ref_jenis_laporan_kode_jenis_laporan_seq'::regclass),
  "nama_laporan" varchar COLLATE "pg_catalog"."default" NOT NULL,
  "ucr" varchar COLLATE "pg_catalog"."default" NOT NULL,
  "udcr" timestamp(6) DEFAULT CURRENT_TIMESTAMP
)
;

-- ----------------------------
-- Table structure for ref_kategori_addendum
-- ----------------------------
DROP TABLE IF EXISTS "public"."ref_kategori_addendum";
CREATE TABLE "public"."ref_kategori_addendum" (
  "kode_kategori_addendum" int4 NOT NULL DEFAULT nextval('ref_kategori_addendum_kode_kategori_addendum_seq'::regclass),
  "kategori_addendum" varchar COLLATE "pg_catalog"."default" NOT NULL
)
;

-- ----------------------------
-- Table structure for ref_keluaran_proses_kontrak
-- ----------------------------
DROP TABLE IF EXISTS "public"."ref_keluaran_proses_kontrak";
CREATE TABLE "public"."ref_keluaran_proses_kontrak" (
  "kode_keluaran" int4 NOT NULL DEFAULT nextval('ref_keluaran_proses_kontrak_kode_keluaran_seq'::regclass),
  "kode_proses_kontrak" int4 NOT NULL,
  "keluaran" varchar COLLATE "pg_catalog"."default" NOT NULL,
  "ucr" varchar COLLATE "pg_catalog"."default" NOT NULL,
  "uch" varchar COLLATE "pg_catalog"."default",
  "udcr" timestamp(6) DEFAULT CURRENT_TIMESTAMP,
  "udch" timestamp(6) DEFAULT CURRENT_TIMESTAMP,
  "status_aktif" int2 NOT NULL DEFAULT '1'::smallint
)
;

-- ----------------------------
-- Table structure for ref_permintaan
-- ----------------------------
DROP TABLE IF EXISTS "public"."ref_permintaan";
CREATE TABLE "public"."ref_permintaan" (
  "kode_permintaan" int4 NOT NULL DEFAULT nextval('ref_permintaan_kode_permintaan_seq'::regclass),
  "kode_unit" varchar(20) COLLATE "pg_catalog"."default",
  "jenis_penyedia" "public"."jenis_penyedia",
  "kode_vendor" int4,
  "nama_paket" varchar(255) COLLATE "pg_catalog"."default" DEFAULT NULL::character varying,
  "kode_skema_pembayaran" int4,
  "kode_jenis_pengadaan" int4,
  "kode_jenis_aset" varchar(255) COLLATE "pg_catalog"."default",
  "kode_uraian_klmpk" varchar(255) COLLATE "pg_catalog"."default",
  "file_kerangka_ak" varchar(100) COLLATE "pg_catalog"."default",
  "nilai_hps" int4,
  "file_rincian_hps" varchar(100) COLLATE "pg_catalog"."default",
  "file_dok_pendukung" varchar(100) COLLATE "pg_catalog"."default",
  "file_dok_pendukung_penyedia" varchar(100) COLLATE "pg_catalog"."default",
  "kode_jenis_kontrak" int4,
  "tgl_kirim_ke_penyedia" timestamptz(6),
  "tgl_selesai_kontrak" timestamptz(6),
  "tgl_berita_acara" timestamptz(6),
  "isi_berita_acara" text COLLATE "pg_catalog"."default",
  "kode_status_permintaan" int4,
  "ucr" varchar(255) COLLATE "pg_catalog"."default" DEFAULT NULL::character varying,
  "uch" varchar(255) COLLATE "pg_catalog"."default" DEFAULT NULL::character varying,
  "udcr" timestamptz(6),
  "udch" timestamptz(6),
  "ruang_lingkup" text COLLATE "pg_catalog"."default",
  "nama_unit" varchar(255) COLLATE "pg_catalog"."default" DEFAULT NULL::character varying,
  "deskripsi_pendukung_penyedia" text COLLATE "pg_catalog"."default",
  "kode_rup" int4,
  "tgl_selesai_negosiasi" timestamptz(6)
)
;
COMMENT ON COLUMN "public"."ref_permintaan"."kode_unit" IS 'Supaya nyambung ke Unit di aplikasi HRIS';
COMMENT ON COLUMN "public"."ref_permintaan"."kode_vendor" IS 'Ambil dari sidapet';
COMMENT ON COLUMN "public"."ref_permintaan"."nama_paket" IS 'Tulis manual';
COMMENT ON COLUMN "public"."ref_permintaan"."kode_skema_pembayaran" IS 'Langsung, Kredit, Debit';
COMMENT ON COLUMN "public"."ref_permintaan"."kode_jenis_pengadaan" IS 'terisi otomatis saat memilih rup (Barang, Jasa Konsultansi, Konstruksi, Jasa Lainnya)';
COMMENT ON COLUMN "public"."ref_permintaan"."kode_jenis_aset" IS 'Ambil dari E-Asset';
COMMENT ON COLUMN "public"."ref_permintaan"."kode_uraian_klmpk" IS 'Ambil dari E-Asset';
COMMENT ON COLUMN "public"."ref_permintaan"."file_kerangka_ak" IS 'Kerangka Acuan Kerja';
COMMENT ON COLUMN "public"."ref_permintaan"."nilai_hps" IS 'Harga Pokok Satuan';
COMMENT ON COLUMN "public"."ref_permintaan"."kode_rup" IS 'ambil dari sippan';

-- ----------------------------
-- Table structure for ref_proses_kontrak
-- ----------------------------
DROP TABLE IF EXISTS "public"."ref_proses_kontrak";
CREATE TABLE "public"."ref_proses_kontrak" (
  "kode_proses_kontrak" int4 NOT NULL DEFAULT nextval('ref_proses_kontrak_kode_proses_kontrak_seq'::regclass),
  "kode_permintaan" int4 NOT NULL,
  "kode_status_kontrak" int4 NOT NULL,
  "kode_step_persiapan_kontrak" int4,
  "ucr" varchar COLLATE "pg_catalog"."default" NOT NULL,
  "uch" varchar COLLATE "pg_catalog"."default",
  "udcr" timestamp(6) DEFAULT CURRENT_TIMESTAMP,
  "udch" timestamp(6) DEFAULT CURRENT_TIMESTAMP,
  "status_pengisian" varchar COLLATE "pg_catalog"."default"
)
;

-- ----------------------------
-- Table structure for ref_riwayat_pelaksanaan
-- ----------------------------
DROP TABLE IF EXISTS "public"."ref_riwayat_pelaksanaan";
CREATE TABLE "public"."ref_riwayat_pelaksanaan" (
  "kode_riwayat_pelaksanaan" int4 NOT NULL DEFAULT nextval('ref_riwayat_pelaksanaan_kode_riwayat_pelaksanaan_seq'::regclass),
  "kode_proses_kontrak" int4 NOT NULL,
  "kode_trx_jenis_sispembayaran" int4 NOT NULL,
  "status_riwayat_pelaksanaan" varchar COLLATE "pg_catalog"."default" DEFAULT 'proses'::character varying,
  "ucr" varchar COLLATE "pg_catalog"."default" NOT NULL,
  "uch" varchar COLLATE "pg_catalog"."default",
  "udcr" timestamp(6) DEFAULT CURRENT_TIMESTAMP,
  "udch" timestamp(6) DEFAULT CURRENT_TIMESTAMP
)
;

-- ----------------------------
-- Table structure for ref_serah_terima
-- ----------------------------
DROP TABLE IF EXISTS "public"."ref_serah_terima";
CREATE TABLE "public"."ref_serah_terima" (
  "kode_serah_terima" int4 NOT NULL DEFAULT nextval('ref_serah_terima_kode_serah_terima_seq'::regclass),
  "kode_proses_kontrak" int4 NOT NULL,
  "kode_step_serah_terima" int4 NOT NULL,
  "status_step" varchar COLLATE "pg_catalog"."default" DEFAULT 'belum diisi'::character varying,
  "ucr" varchar COLLATE "pg_catalog"."default" NOT NULL,
  "uch" varchar COLLATE "pg_catalog"."default",
  "udcr" timestamp(6) DEFAULT CURRENT_TIMESTAMP,
  "udch" timestamp(6) DEFAULT CURRENT_TIMESTAMP
)
;

-- ----------------------------
-- Table structure for ref_skema_pembayaran
-- ----------------------------
DROP TABLE IF EXISTS "public"."ref_skema_pembayaran";
CREATE TABLE "public"."ref_skema_pembayaran" (
  "kode_skema_pembayaran" int4 NOT NULL,
  "skema_pembayaran" varchar(30) COLLATE "pg_catalog"."default",
  "is_aktif" bool
)
;

-- ----------------------------
-- Table structure for ref_sptjm
-- ----------------------------
DROP TABLE IF EXISTS "public"."ref_sptjm";
CREATE TABLE "public"."ref_sptjm" (
  "kode_sptjm" int4 NOT NULL DEFAULT nextval('ref_sptjm_kode_sptjm_seq'::regclass),
  "kode_trx_riwayat_pelaksanaan" int4 NOT NULL,
  "nama_bank" varchar COLLATE "pg_catalog"."default",
  "nominal_jaminan" numeric,
  "ucr" varchar COLLATE "pg_catalog"."default" NOT NULL,
  "uch" varchar COLLATE "pg_catalog"."default",
  "udcr" timestamp(6) DEFAULT CURRENT_TIMESTAMP,
  "udch" timestamp(6) DEFAULT CURRENT_TIMESTAMP,
  "dokumen_jaminan" varchar COLLATE "pg_catalog"."default",
  "status_button_tte" bool DEFAULT true
)
;

-- ----------------------------
-- Table structure for ref_status_kontrak
-- ----------------------------
DROP TABLE IF EXISTS "public"."ref_status_kontrak";
CREATE TABLE "public"."ref_status_kontrak" (
  "kode_status_kontrak" int4 NOT NULL DEFAULT nextval('ref_status_kontrak_kode_status_kontrak_seq'::regclass),
  "nama_status_kontrak" varchar COLLATE "pg_catalog"."default" NOT NULL,
  "kategori_status_kontrak" varchar COLLATE "pg_catalog"."default" NOT NULL,
  "urutan_status_kontrak" int2
)
;

-- ----------------------------
-- Table structure for ref_status_permintaan
-- ----------------------------
DROP TABLE IF EXISTS "public"."ref_status_permintaan";
CREATE TABLE "public"."ref_status_permintaan" (
  "kode_status_permintaan" int4 NOT NULL,
  "nm_status" varchar(100) COLLATE "pg_catalog"."default" DEFAULT NULL::character varying,
  "klmpk_status" "public"."klmpk_status_permintaan"
)
;

-- ----------------------------
-- Table structure for ref_step_persiapan_kontrak
-- ----------------------------
DROP TABLE IF EXISTS "public"."ref_step_persiapan_kontrak";
CREATE TABLE "public"."ref_step_persiapan_kontrak" (
  "kode_step_persiapan_kontrak" int4 NOT NULL DEFAULT nextval('ref_step_persiapan_kontrak_kode_step_persiapan_kontrak_seq'::regclass),
  "nama_step_persiapan_kontrak" varchar COLLATE "pg_catalog"."default" NOT NULL,
  "status_aktif" int2 NOT NULL DEFAULT 1,
  "urutan" int2
)
;

-- ----------------------------
-- Table structure for ref_step_riwayat_pelaksanaan
-- ----------------------------
DROP TABLE IF EXISTS "public"."ref_step_riwayat_pelaksanaan";
CREATE TABLE "public"."ref_step_riwayat_pelaksanaan" (
  "kode_step_riwayat_pelaksanaan" int4 NOT NULL,
  "step_riwayat_pelaksanaan" varchar COLLATE "pg_catalog"."default" NOT NULL,
  "kategori_step" varchar COLLATE "pg_catalog"."default" NOT NULL,
  "urutan" int2 NOT NULL,
  "keterangan_step" varchar COLLATE "pg_catalog"."default" NOT NULL
)
;

-- ----------------------------
-- Table structure for ref_step_serah_terima
-- ----------------------------
DROP TABLE IF EXISTS "public"."ref_step_serah_terima";
CREATE TABLE "public"."ref_step_serah_terima" (
  "kode_step_serah_terima" int4 NOT NULL,
  "step_serah_terima" varchar COLLATE "pg_catalog"."default" NOT NULL,
  "keterangan_step" varchar COLLATE "pg_catalog"."default" NOT NULL,
  "kategori_step" varchar COLLATE "pg_catalog"."default" NOT NULL,
  "urutan" int2 NOT NULL
)
;

-- ----------------------------
-- Table structure for tbl_sptb_pl
-- ----------------------------
DROP TABLE IF EXISTS "public"."tbl_sptb_pl";
CREATE TABLE "public"."tbl_sptb_pl" (
  "id_sptb_pl" int4 NOT NULL DEFAULT nextval('tbl_sptb_pl_id_sptb_pl_seq'::regclass),
  "id_termin_pl" int4,
  "nomor_sptb" varchar(255) COLLATE "pg_catalog"."default",
  "jenis_objek_pajak" varchar(255) COLLATE "pg_catalog"."default",
  "jenis_pengadaan" varchar(255) COLLATE "pg_catalog"."default",
  "biaya_bukan_objek_pajak" varchar(255) COLLATE "pg_catalog"."default",
  "nilai_perhitungan" varchar(255) COLLATE "pg_catalog"."default",
  "dpp_ppn" varchar(255) COLLATE "pg_catalog"."default",
  "dpp_pph" varchar(255) COLLATE "pg_catalog"."default",
  "ppn_sptb" varchar(25) COLLATE "pg_catalog"."default",
  "pph_sptb" varchar(25) COLLATE "pg_catalog"."default",
  "jenis_pph" varchar(255) COLLATE "pg_catalog"."default",
  "id_objek_pajak" int4,
  "additional" varchar(100) COLLATE "pg_catalog"."default",
  "dok_non_pkp" varchar(255) COLLATE "pg_catalog"."default",
  "dok_ketentuan_khusus" varchar(255) COLLATE "pg_catalog"."default",
  "dok_ketentuan_khusus_jenis" varchar(255) COLLATE "pg_catalog"."default",
  "ketentuan_khusus" varchar(255) COLLATE "pg_catalog"."default",
  "ketentuan_khusus_keterangan" varchar(255) COLLATE "pg_catalog"."default",
  "ketentuan_khusus_dpp" varchar(50) COLLATE "pg_catalog"."default",
  "ketentuan_khusus_jenis" varchar(50) COLLATE "pg_catalog"."default",
  "sptb_file" varchar(255) COLLATE "pg_catalog"."default",
  "hash_dokumen_sptb" varchar(255) COLLATE "pg_catalog"."default",
  "file_scan_sptb" varchar(255) COLLATE "pg_catalog"."default",
  "ringkasankontrak_file" varchar(255) COLLATE "pg_catalog"."default",
  "hash_dokumen_ringkasankontrak" varchar(255) COLLATE "pg_catalog"."default",
  "file_scan_rk" varchar(255) COLLATE "pg_catalog"."default",
  "nomor_faktur_pajak" varchar(255) COLLATE "pg_catalog"."default",
  "tanggal_faktur_pajak" varchar(255) COLLATE "pg_catalog"."default",
  "faktur_pajak_file" varchar(255) COLLATE "pg_catalog"."default",
  "hash_dokumen_faktur_pajak" varchar(255) COLLATE "pg_catalog"."default",
  "ssp_file" varchar(255) COLLATE "pg_catalog"."default",
  "hash_dokumen_ssp" varchar(255) COLLATE "pg_catalog"."default",
  "ppn_persen" varchar(10) COLLATE "pg_catalog"."default",
  "pph_persen" varchar(10) COLLATE "pg_catalog"."default",
  "transaksi" varchar(25) COLLATE "pg_catalog"."default",
  "tertanggal_sptb" timestamptz(6) DEFAULT CURRENT_TIMESTAMP
)
;

-- ----------------------------
-- Table structure for tbl_sptbdpt_pl
-- ----------------------------
DROP TABLE IF EXISTS "public"."tbl_sptbdpt_pl";
CREATE TABLE "public"."tbl_sptbdpt_pl" (
  "id_sptb_dptpl" int4 NOT NULL DEFAULT nextval('tbl_sptbdpt_pl_id_sptb_dptpl_seq'::regclass),
  "id_termin_dptpl" int4,
  "nomor_sptb" varchar(255) COLLATE "pg_catalog"."default",
  "jenis_objek_pajak" varchar(255) COLLATE "pg_catalog"."default",
  "jenis_pengadaan" varchar(255) COLLATE "pg_catalog"."default",
  "biaya_bukan_objek_pajak" varchar(255) COLLATE "pg_catalog"."default",
  "nilai_perhitungan" varchar(255) COLLATE "pg_catalog"."default",
  "dpp_ppn" varchar(255) COLLATE "pg_catalog"."default",
  "dpp_pph" varchar(255) COLLATE "pg_catalog"."default",
  "ppn_dptsptb" varchar(25) COLLATE "pg_catalog"."default",
  "pph_dptsptb" varchar(25) COLLATE "pg_catalog"."default",
  "jenis_pph" varchar(255) COLLATE "pg_catalog"."default",
  "id_objek_pajak" int4,
  "additional" varchar(100) COLLATE "pg_catalog"."default",
  "dok_non_pkp" varchar(255) COLLATE "pg_catalog"."default",
  "dok_ketentuan_khusus" varchar(255) COLLATE "pg_catalog"."default",
  "dok_ketentuan_khusus_jenis" varchar(255) COLLATE "pg_catalog"."default",
  "ketentuan_khusus_keterangan" varchar(255) COLLATE "pg_catalog"."default",
  "ketentuan_khusus" varchar(255) COLLATE "pg_catalog"."default",
  "ketentuan_khusus_dpp" varchar(255) COLLATE "pg_catalog"."default",
  "ketentuan_khusus_jenis" varchar(255) COLLATE "pg_catalog"."default",
  "sptb_file" varchar(255) COLLATE "pg_catalog"."default",
  "hash_dokumen_sptb" varchar(255) COLLATE "pg_catalog"."default",
  "file_scan_sptb" varchar(255) COLLATE "pg_catalog"."default",
  "ringkasankontrak_file" varchar(255) COLLATE "pg_catalog"."default",
  "hash_dokumen_ringkasankontrak" varchar(255) COLLATE "pg_catalog"."default",
  "file_scan_rk" varchar(255) COLLATE "pg_catalog"."default",
  "nomor_faktur_pajak" varchar(255) COLLATE "pg_catalog"."default",
  "tanggal_faktur_pajak" varchar(255) COLLATE "pg_catalog"."default",
  "faktur_pajak_file" varchar(255) COLLATE "pg_catalog"."default",
  "hash_dokumen_faktur_pajak" varchar(255) COLLATE "pg_catalog"."default",
  "ssp_file" varchar(255) COLLATE "pg_catalog"."default",
  "hash_dokumen_ssp" varchar(255) COLLATE "pg_catalog"."default",
  "ppn_persen" varchar(10) COLLATE "pg_catalog"."default",
  "pph_persen" varchar(10) COLLATE "pg_catalog"."default",
  "transaksi" varchar(25) COLLATE "pg_catalog"."default",
  "tertanggal_dptsptb" timestamptz(6) DEFAULT CURRENT_TIMESTAMP
)
;

-- ----------------------------
-- Table structure for trx_addendum
-- ----------------------------
DROP TABLE IF EXISTS "public"."trx_addendum";
CREATE TABLE "public"."trx_addendum" (
  "kode_trx_addendum" int4 NOT NULL DEFAULT nextval('trx_addendum_kode_trx_addendum_seq'::regclass),
  "kode_kategori_addendum" int4 NOT NULL,
  "kode_permintaan" int4 NOT NULL,
  "tgl_addendum" timestamp(6),
  "kode_tte" int4,
  "status_proses" varchar COLLATE "pg_catalog"."default" DEFAULT 'proses'::character varying,
  "addendum_ke" int2 NOT NULL,
  "ucr" varchar COLLATE "pg_catalog"."default" NOT NULL,
  "uch" varchar COLLATE "pg_catalog"."default",
  "udcr" timestamp(6),
  "udch" timestamp(6)
)
;

-- ----------------------------
-- Table structure for trx_addendum_biaya
-- ----------------------------
DROP TABLE IF EXISTS "public"."trx_addendum_biaya";
CREATE TABLE "public"."trx_addendum_biaya" (
  "kode_trx_addendum_biaya" int4 NOT NULL DEFAULT nextval('trx_addendum_biaya_kode_trx_addendum_biaya_seq'::regclass),
  "kode_trx_addendum" int4 NOT NULL,
  "nama_pembayaran_eks" varchar COLLATE "pg_catalog"."default" NOT NULL,
  "persentase_eks" numeric NOT NULL,
  "nilai_rupiah_eks" numeric NOT NULL,
  "nama_pembayaran_new" varchar COLLATE "pg_catalog"."default" NOT NULL,
  "persentase_new" numeric NOT NULL,
  "nilai_rupiah_new" numeric NOT NULL
)
;

-- ----------------------------
-- Table structure for trx_addendum_jangka_waktu
-- ----------------------------
DROP TABLE IF EXISTS "public"."trx_addendum_jangka_waktu";
CREATE TABLE "public"."trx_addendum_jangka_waktu" (
  "kode_trx_addendum_jangka_waktu" int4 NOT NULL DEFAULT nextval('trx_addendum_jangka_waktu_kode_trx_addendum_jangka_waktu_seq'::regclass),
  "kode_trx_addendum" int4 NOT NULL,
  "sampai_dengan_eks" timestamp(6) NOT NULL,
  "jangka_waktu_eks" int4 NOT NULL,
  "sampai_dengan_new" timestamp(6),
  "jangka_waktu_new" int4
)
;

-- ----------------------------
-- Table structure for trx_addendum_spek_teknis
-- ----------------------------
DROP TABLE IF EXISTS "public"."trx_addendum_spek_teknis";
CREATE TABLE "public"."trx_addendum_spek_teknis" (
  "kode_trx_addendum_st" int4 NOT NULL DEFAULT nextval('trx_addendum_spek_teknis_kode_trx_addendum_st_seq'::regclass),
  "kode_trx_addendum" int4 NOT NULL,
  "spek_teknis_eks" text COLLATE "pg_catalog"."default" NOT NULL,
  "spek_teknis_new" text COLLATE "pg_catalog"."default" NOT NULL
)
;

-- ----------------------------
-- Table structure for trx_ba_pemeriksaan
-- ----------------------------
DROP TABLE IF EXISTS "public"."trx_ba_pemeriksaan";
CREATE TABLE "public"."trx_ba_pemeriksaan" (
  "kode_trx_ba_pemeriksaan" int4 NOT NULL DEFAULT nextval('trx_ba_pemeriksaan_kode_trx_ba_pemeriksaan_seq'::regclass),
  "kode_trx_riwayat_pelaksanaan" int4 NOT NULL,
  "ketentuan" text COLLATE "pg_catalog"."default" NOT NULL,
  "konfirmasi" bool NOT NULL,
  "nip_pemeriksa" varchar COLLATE "pg_catalog"."default" NOT NULL,
  "nama_pemeriksa" varchar COLLATE "pg_catalog"."default" NOT NULL,
  "ucr" varchar COLLATE "pg_catalog"."default" NOT NULL,
  "uch" varchar COLLATE "pg_catalog"."default",
  "udcr" timestamp(6) DEFAULT CURRENT_TIMESTAMP,
  "udch" timestamp(6) DEFAULT CURRENT_TIMESTAMP
)
;

-- ----------------------------
-- Table structure for trx_ba_pemeriksaan_st
-- ----------------------------
DROP TABLE IF EXISTS "public"."trx_ba_pemeriksaan_st";
CREATE TABLE "public"."trx_ba_pemeriksaan_st" (
  "kode_trx_bap_st" int4 NOT NULL DEFAULT nextval('trx_ba_pemeriksaan_st_kode_trx_bap_st_seq'::regclass),
  "kode_serah_terima" int4 NOT NULL,
  "ketentuan" text COLLATE "pg_catalog"."default" NOT NULL,
  "konfirmasi" bool NOT NULL,
  "nip_pemeriksa" varchar COLLATE "pg_catalog"."default" NOT NULL,
  "nama_pemeriksa" varchar COLLATE "pg_catalog"."default" NOT NULL,
  "ucr" varchar COLLATE "pg_catalog"."default" NOT NULL,
  "uch" varchar COLLATE "pg_catalog"."default",
  "udcr" timestamp(6) DEFAULT CURRENT_TIMESTAMP,
  "udch" timestamp(6) DEFAULT CURRENT_TIMESTAMP,
  "catatan_trx_bap" text COLLATE "pg_catalog"."default" NOT NULL
)
;

-- ----------------------------
-- Table structure for trx_bast
-- ----------------------------
DROP TABLE IF EXISTS "public"."trx_bast";
CREATE TABLE "public"."trx_bast" (
  "kode_bast" int4 NOT NULL DEFAULT nextval('trx_bast_kode_bast_seq'::regclass),
  "kode_trx_riwayat_pelaksanaan" int4 NOT NULL,
  "kode_tte" int4 NOT NULL,
  "ucr" varchar COLLATE "pg_catalog"."default" NOT NULL,
  "uch" varchar COLLATE "pg_catalog"."default",
  "udcr" timestamp(6) DEFAULT CURRENT_TIMESTAMP,
  "udch" timestamp(6) DEFAULT CURRENT_TIMESTAMP,
  "tgl_surat" timestamp(6)
)
;

-- ----------------------------
-- Table structure for trx_bast_st
-- ----------------------------
DROP TABLE IF EXISTS "public"."trx_bast_st";
CREATE TABLE "public"."trx_bast_st" (
  "kode_bast_st" int4 NOT NULL DEFAULT nextval('trx_bast_st_kode_bast_st_seq'::regclass),
  "kode_serah_terima" int4 NOT NULL,
  "kode_tte" int4 NOT NULL,
  "ucr" varchar COLLATE "pg_catalog"."default" NOT NULL,
  "uch" varchar COLLATE "pg_catalog"."default",
  "udcr" timestamp(6) DEFAULT CURRENT_TIMESTAMP,
  "udch" timestamp(6) DEFAULT CURRENT_TIMESTAMP,
  "tgl_surat" timestamp(6)
)
;

-- ----------------------------
-- Table structure for trx_detail_permintaan
-- ----------------------------
DROP TABLE IF EXISTS "public"."trx_detail_permintaan";
CREATE TABLE "public"."trx_detail_permintaan" (
  "kode_detail_permintaan" int4 NOT NULL DEFAULT nextval('trx_detail_permintaan_kode_detail_permintaan_seq'::regclass),
  "kode_permintaan" int4,
  "kode_bmut" varchar COLLATE "pg_catalog"."default",
  "kode_ruang" varchar COLLATE "pg_catalog"."default",
  "merk" text COLLATE "pg_catalog"."default",
  "deskripsi" text COLLATE "pg_catalog"."default",
  "kuantitas" int4,
  "satuan" varchar(255) COLLATE "pg_catalog"."default",
  "harga" int4
)
;
COMMENT ON COLUMN "public"."trx_detail_permintaan"."kode_bmut" IS 'terintegrasi dengan e-asset';
COMMENT ON COLUMN "public"."trx_detail_permintaan"."kode_ruang" IS 'terintegrasi dengan e-asset';
COMMENT ON COLUMN "public"."trx_detail_permintaan"."deskripsi" IS 'Diisi kalau jenis Non-Barang';
COMMENT ON COLUMN "public"."trx_detail_permintaan"."satuan" IS 'Diisi kalau jenis Non-Barang';
COMMENT ON COLUMN "public"."trx_detail_permintaan"."harga" IS 'Harga satuan, akan terakumulasi ke field nilai_hps';

-- ----------------------------
-- Table structure for trx_dokumen_kontrak
-- ----------------------------
DROP TABLE IF EXISTS "public"."trx_dokumen_kontrak";
CREATE TABLE "public"."trx_dokumen_kontrak" (
  "kode_dokumen_kontrak" int4 NOT NULL DEFAULT nextval('trx_dokumen_kontrak_kode_dokumen_kontrak_seq'::regclass),
  "kode_proses_kontrak" int4 NOT NULL,
  "tgl_surat" timestamp(6),
  "kode_tte" int4,
  "ucr" varchar COLLATE "pg_catalog"."default" NOT NULL,
  "uch" varchar COLLATE "pg_catalog"."default",
  "udcr" timestamp(6) DEFAULT CURRENT_TIMESTAMP,
  "udch" timestamp(6) DEFAULT CURRENT_TIMESTAMP,
  "kode_bentuk_kontrak" int4 NOT NULL,
  "nomor_surat_pesanan" varchar COLLATE "pg_catalog"."default"
)
;

-- ----------------------------
-- Table structure for trx_hasil_pajak
-- ----------------------------
DROP TABLE IF EXISTS "public"."trx_hasil_pajak";
CREATE TABLE "public"."trx_hasil_pajak" (
  "id_hasil_pajak" int4 NOT NULL DEFAULT nextval('trx_hasil_pajak_id_hasil_pajak_seq'::regclass),
  "kode_pajak" int4 NOT NULL,
  "kategori_pajak" varchar COLLATE "pg_catalog"."default",
  "nama_formula" varchar COLLATE "pg_catalog"."default",
  "formula" varchar COLLATE "pg_catalog"."default",
  "nilai_persentase_formula" int4,
  "perhitungan_formula" varchar COLLATE "pg_catalog"."default",
  "hasil" numeric,
  "id_sptb_pl" int4,
  "kategori" varchar(50) COLLATE "pg_catalog"."default",
  "nilai" float4
)
;

-- ----------------------------
-- Table structure for trx_jangka_waktu
-- ----------------------------
DROP TABLE IF EXISTS "public"."trx_jangka_waktu";
CREATE TABLE "public"."trx_jangka_waktu" (
  "kode_jangka_waktu" int4 NOT NULL DEFAULT nextval('trx_jangka_waktu_kode_jangka_waktu_seq'::regclass),
  "kode_proses_kontrak" int4 NOT NULL,
  "jangka_waktu" numeric NOT NULL,
  "dari" timestamp(6) NOT NULL,
  "sampai_dengan" timestamp(6) NOT NULL,
  "ucr" varchar COLLATE "pg_catalog"."default" NOT NULL,
  "uch" varchar COLLATE "pg_catalog"."default",
  "udcr" timestamp(6) DEFAULT CURRENT_TIMESTAMP,
  "udch" timestamp(6) DEFAULT CURRENT_TIMESTAMP,
  "satuan_jangka_waktu" varchar COLLATE "pg_catalog"."default"
)
;

-- ----------------------------
-- Table structure for trx_jenis_laporan
-- ----------------------------
DROP TABLE IF EXISTS "public"."trx_jenis_laporan";
CREATE TABLE "public"."trx_jenis_laporan" (
  "kode_trx_jenis_laporan" int4 NOT NULL DEFAULT nextval('trx_jenis_laporan_kode_trx_jenis_laporan_seq'::regclass),
  "kode_proses_kontrak" int4 NOT NULL,
  "path_dokumen" varchar COLLATE "pg_catalog"."default",
  "ucr" varchar COLLATE "pg_catalog"."default" NOT NULL,
  "uch" varchar COLLATE "pg_catalog"."default",
  "udcr" timestamp(6) DEFAULT CURRENT_TIMESTAMP,
  "udch" timestamp(6) DEFAULT CURRENT_TIMESTAMP,
  "nama_laporan" varchar COLLATE "pg_catalog"."default" NOT NULL
)
;

-- ----------------------------
-- Table structure for trx_jenis_sispembayaran
-- ----------------------------
DROP TABLE IF EXISTS "public"."trx_jenis_sispembayaran";
CREATE TABLE "public"."trx_jenis_sispembayaran" (
  "kode_trx_jenis_sispembayaran" int4 NOT NULL DEFAULT nextval('trx_jenis_sispembayaran_kode_trx_jenis_sispembayaran_seq'::regclass),
  "kode_sistem_pembayaran" int4 NOT NULL,
  "nama_sispembayaran" varchar COLLATE "pg_catalog"."default" NOT NULL,
  "persentase" numeric NOT NULL,
  "nilai_rupiah" numeric NOT NULL,
  "status_sispembayaran" int2 DEFAULT 1
)
;

-- ----------------------------
-- Table structure for trx_keluaran_output
-- ----------------------------
DROP TABLE IF EXISTS "public"."trx_keluaran_output";
CREATE TABLE "public"."trx_keluaran_output" (
  "kode_keluaran_output" int4 NOT NULL DEFAULT nextval('trx_keluaran_output_kode_keluaran_output_seq'::regclass),
  "kode_trx_riwayat_pelaksanaan" int4 NOT NULL,
  "kode_keluaran" int4 NOT NULL,
  "path_dokumen" varchar COLLATE "pg_catalog"."default",
  "key_pass" varchar COLLATE "pg_catalog"."default",
  "verifikasi_keluaran_output" bool,
  "ucr" varchar COLLATE "pg_catalog"."default" NOT NULL,
  "uch" varchar COLLATE "pg_catalog"."default",
  "udcr" timestamp(6) DEFAULT CURRENT_TIMESTAMP,
  "udch" timestamp(6) DEFAULT CURRENT_TIMESTAMP
)
;

-- ----------------------------
-- Table structure for trx_keluaran_output_new
-- ----------------------------
DROP TABLE IF EXISTS "public"."trx_keluaran_output_new";
CREATE TABLE "public"."trx_keluaran_output_new" (
  "kode_keluaran_output_new" int4 NOT NULL DEFAULT nextval('trx_keluaran_output_new_kode_keluaran_output_new_seq'::regclass),
  "kode_proses_kontrak" int4 NOT NULL,
  "kode_keluaran" int4 NOT NULL,
  "path_dokumen" varchar COLLATE "pg_catalog"."default",
  "key_pass" varchar COLLATE "pg_catalog"."default",
  "verifikasi_keluaran_output" bool,
  "status_proses" varchar COLLATE "pg_catalog"."default" DEFAULT 'belum diisi'::character varying,
  "ucr" varchar COLLATE "pg_catalog"."default" NOT NULL,
  "uch" varchar COLLATE "pg_catalog"."default",
  "udcr" timestamp(6) DEFAULT CURRENT_TIMESTAMP,
  "udch" timestamp(6) DEFAULT CURRENT_TIMESTAMP
)
;

-- ----------------------------
-- Table structure for trx_kwitansi
-- ----------------------------
DROP TABLE IF EXISTS "public"."trx_kwitansi";
CREATE TABLE "public"."trx_kwitansi" (
  "kode_kwitansi" int4 NOT NULL DEFAULT nextval('trx_kwitansi_kode_kwitansi_seq'::regclass),
  "kode_trx_riwayat_pelaksanaan" int4 NOT NULL,
  "nomor_kwitansi" varchar COLLATE "pg_catalog"."default",
  "nama_dok_kwitansi" varchar COLLATE "pg_catalog"."default",
  "nama_dok_kwitansi_selesai" varchar COLLATE "pg_catalog"."default",
  "kategori_input" varchar COLLATE "pg_catalog"."default",
  "ucr" varchar COLLATE "pg_catalog"."default" NOT NULL,
  "uch" varchar COLLATE "pg_catalog"."default",
  "udcr" timestamp(6) DEFAULT CURRENT_TIMESTAMP,
  "udch" timestamp(6) DEFAULT CURRENT_TIMESTAMP,
  "nama_uploader" varchar COLLATE "pg_catalog"."default",
  "tanggal_kwitansi" timestamp(6)
)
;

-- ----------------------------
-- Table structure for trx_monitoring
-- ----------------------------
DROP TABLE IF EXISTS "public"."trx_monitoring";
CREATE TABLE "public"."trx_monitoring" (
  "kode_monitoring" int4 NOT NULL DEFAULT nextval('trx_monitoring_kode_monitoring_seq'::regclass),
  "kode_trx_riwayat_pelaksanaan" int4 NOT NULL,
  "nama_progres" varchar COLLATE "pg_catalog"."default" NOT NULL,
  "output_progres" varchar COLLATE "pg_catalog"."default" NOT NULL,
  "dokumen_output_progres" varchar COLLATE "pg_catalog"."default",
  "catatan" text COLLATE "pg_catalog"."default",
  "evaluasi" text COLLATE "pg_catalog"."default",
  "pengendalian" text COLLATE "pg_catalog"."default",
  "dokumen_lainnya" varchar COLLATE "pg_catalog"."default",
  "ucr" varchar COLLATE "pg_catalog"."default" NOT NULL,
  "uch" varchar COLLATE "pg_catalog"."default",
  "udcr" timestamp(6) DEFAULT CURRENT_TIMESTAMP,
  "udch" timestamp(6) DEFAULT CURRENT_TIMESTAMP
)
;

-- ----------------------------
-- Table structure for trx_monitoring_new
-- ----------------------------
DROP TABLE IF EXISTS "public"."trx_monitoring_new";
CREATE TABLE "public"."trx_monitoring_new" (
  "kode_trx_monitoring" int4 NOT NULL DEFAULT nextval('trx_monitoring_new_kode_trx_monitoring_seq'::regclass),
  "kode_proses_kontrak" int4 NOT NULL,
  "nama_progres" varchar COLLATE "pg_catalog"."default" NOT NULL,
  "output_progres" varchar COLLATE "pg_catalog"."default" NOT NULL,
  "dokumen_output_progres" varchar COLLATE "pg_catalog"."default",
  "catatan" text COLLATE "pg_catalog"."default",
  "evaluasi" text COLLATE "pg_catalog"."default",
  "pengendalian" text COLLATE "pg_catalog"."default",
  "dokumen_lainnya" varchar COLLATE "pg_catalog"."default",
  "status_proses" varchar COLLATE "pg_catalog"."default" DEFAULT 'belum diisi'::character varying,
  "ucr" varchar COLLATE "pg_catalog"."default" NOT NULL,
  "uch" varchar COLLATE "pg_catalog"."default",
  "udcr" timestamp(6) DEFAULT CURRENT_TIMESTAMP,
  "udch" timestamp(6) DEFAULT CURRENT_TIMESTAMP
)
;

-- ----------------------------
-- Table structure for trx_nego_harga
-- ----------------------------
DROP TABLE IF EXISTS "public"."trx_nego_harga";
CREATE TABLE "public"."trx_nego_harga" (
  "kode_nego_harga" int4 NOT NULL DEFAULT nextval('trx_nego_harga_kode_nego_harga_seq'::regclass),
  "kode_detail_permintaan" int4,
  "harga_awal" int8,
  "harga_nego" int8,
  "negotiator" "public"."negotiator",
  "tgl_nego" timestamptz(6) DEFAULT CURRENT_TIMESTAMP,
  "tahapan" int2,
  "persetujuan" bool
)
;
COMMENT ON COLUMN "public"."trx_nego_harga"."tahapan" IS 'tahapan negosiasi';

-- ----------------------------
-- Table structure for trx_nego_teknis
-- ----------------------------
DROP TABLE IF EXISTS "public"."trx_nego_teknis";
CREATE TABLE "public"."trx_nego_teknis" (
  "kode_nego_teknis" int4 NOT NULL DEFAULT nextval('trx_nego_teknis_kode_nego_teknis_seq'::regclass),
  "kode_permintaan" int4,
  "spek_awal" text COLLATE "pg_catalog"."default",
  "spek_nego" text COLLATE "pg_catalog"."default",
  "negotiator" "public"."negotiator",
  "tgl_nego" timestamptz(6) DEFAULT CURRENT_TIMESTAMP,
  "tahapan" int2,
  "persetujuan" bool
)
;
COMMENT ON COLUMN "public"."trx_nego_teknis"."tahapan" IS 'tahapan negosiasi';

-- ----------------------------
-- Table structure for trx_nilai_addendum
-- ----------------------------
DROP TABLE IF EXISTS "public"."trx_nilai_addendum";
CREATE TABLE "public"."trx_nilai_addendum" (
  "kode_nilai_addendum" int4 NOT NULL DEFAULT nextval('trx_nilai_addendum_kode_nilai_addendum_seq'::regclass),
  "kode_trx_addendum" int4 NOT NULL,
  "nilai_eks" numeric NOT NULL,
  "nilai_perubahan" numeric,
  "nilai_new" numeric
)
;

-- ----------------------------
-- Table structure for trx_pajak
-- ----------------------------
DROP TABLE IF EXISTS "public"."trx_pajak";
CREATE TABLE "public"."trx_pajak" (
  "kode_pajak" int4 NOT NULL DEFAULT nextval('trx_pajak_kode_pajak_seq'::regclass),
  "kode_trx_riwayat_pelaksanaan" int4,
  "kategori_nilai_transaksi" "public"."kategori_nilai_transaksi",
  "manajemen_fee" numeric,
  "nilai_transaksi" numeric,
  "jenis_mata_uang" varchar COLLATE "pg_catalog"."default",
  "kurs_asing" numeric,
  "kurs_bank" numeric,
  "kurs_kmk" numeric,
  "tax_treaty" numeric,
  "kode_jenis_transaksi" int4,
  "jenis_transaksi" varchar COLLATE "pg_catalog"."default",
  "kode_objek_pajak" varchar COLLATE "pg_catalog"."default",
  "objek_pajak" varchar COLLATE "pg_catalog"."default",
  "kode_detail_transaksi" int4,
  "detail_transaksi" varchar COLLATE "pg_catalog"."default",
  "ucr" varchar COLLATE "pg_catalog"."default",
  "uch" varchar COLLATE "pg_catalog"."default",
  "udcr" timestamp(6) DEFAULT CURRENT_TIMESTAMP,
  "udch" timestamp(6) DEFAULT CURRENT_TIMESTAMP,
  "nama_dok_efaktur" varchar COLLATE "pg_catalog"."default",
  "nomor_efaktur" varchar COLLATE "pg_catalog"."default",
  "tanggal_efaktur" timestamp(6),
  "nama_tabel_lama" varchar(20) COLLATE "pg_catalog"."default",
  "id_sptb" int4
)
;

-- ----------------------------
-- Table structure for trx_pembayaran
-- ----------------------------
DROP TABLE IF EXISTS "public"."trx_pembayaran";
CREATE TABLE "public"."trx_pembayaran" (
  "kode_trx_pencarian" int4 NOT NULL DEFAULT nextval('trx_pembayaran_kode_trx_pencarian_seq'::regclass),
  "kode_trx_riwayat_pelaksanaan" int4 NOT NULL,
  "kode_tte" int4,
  "tgl_surat_spp" timestamp(6),
  "tgl_surat_sptjb" timestamp(6),
  "tgl_surat_srk" timestamp(6),
  "no_surat_spp" varchar COLLATE "pg_catalog"."default" NOT NULL,
  "no_surat_sptjb" varchar COLLATE "pg_catalog"."default" NOT NULL,
  "no_surat_srk" varchar COLLATE "pg_catalog"."default" NOT NULL,
  "ucr" varchar COLLATE "pg_catalog"."default" NOT NULL,
  "uch" varchar COLLATE "pg_catalog"."default",
  "udcr" timestamp(6) DEFAULT CURRENT_TIMESTAMP,
  "udch" timestamp(6) DEFAULT CURRENT_TIMESTAMP,
  "kode_permintaan_pencairan" int4,
  "status_pengusulan" varchar COLLATE "pg_catalog"."default"
)
;

-- ----------------------------
-- Table structure for trx_penambahan_jangka_waktu
-- ----------------------------
DROP TABLE IF EXISTS "public"."trx_penambahan_jangka_waktu";
CREATE TABLE "public"."trx_penambahan_jangka_waktu" (
  "kode_trx_penambahan_jw" int4 NOT NULL DEFAULT nextval('trx_penambahan_jangka_waktu_kode_trx_penambahan_jw_seq'::regclass),
  "kode_permintaan" int4 NOT NULL,
  "penambahan_jw" int4 NOT NULL
)
;

-- ----------------------------
-- Table structure for trx_penilaian_pembayaran
-- ----------------------------
DROP TABLE IF EXISTS "public"."trx_penilaian_pembayaran";
CREATE TABLE "public"."trx_penilaian_pembayaran" (
  "kode_penilaian_pembayaran" int4 NOT NULL DEFAULT nextval('trx_penilaian_pembayaran_kode_penilaian_pembayaran_seq'::regclass),
  "kode_trx_riwayat_pelaksanaan" int4 NOT NULL,
  "kode_detail_aspek" int4 NOT NULL,
  "nilai" int2,
  "tgl_penilaian" timestamp(6) NOT NULL,
  "ucr" varchar COLLATE "pg_catalog"."default" NOT NULL,
  "uch" varchar COLLATE "pg_catalog"."default",
  "udcr" timestamp(6) DEFAULT CURRENT_TIMESTAMP,
  "udch" timestamp(6) DEFAULT CURRENT_TIMESTAMP
)
;

-- ----------------------------
-- Table structure for trx_proses_pajak
-- ----------------------------
DROP TABLE IF EXISTS "public"."trx_proses_pajak";
CREATE TABLE "public"."trx_proses_pajak" (
  "kode_proses_pajak" int4 NOT NULL DEFAULT nextval('trx_proses_pajak_kode_proses_pajak_seq'::regclass),
  "kode_proses_kontrak" int4 NOT NULL,
  "kategori_nilai_transaksi" "public"."kategori_nilai_transaksi",
  "nilai_transaksi" numeric NOT NULL,
  "kode_jenis_transaksi" int4 NOT NULL,
  "jenis_transaksi" varchar COLLATE "pg_catalog"."default" NOT NULL,
  "kode_objek_pajak" varchar COLLATE "pg_catalog"."default" NOT NULL,
  "objek_pajak" varchar COLLATE "pg_catalog"."default" NOT NULL,
  "kode_detail_transaksi" int4 NOT NULL,
  "detail_transaksi" varchar COLLATE "pg_catalog"."default" NOT NULL,
  "ucr" varchar COLLATE "pg_catalog"."default" NOT NULL,
  "uch" varchar COLLATE "pg_catalog"."default",
  "udcr" timestamp(6) DEFAULT CURRENT_TIMESTAMP,
  "udch" timestamp(6) DEFAULT CURRENT_TIMESTAMP
)
;

-- ----------------------------
-- Table structure for trx_riwayat_pelaksanaan
-- ----------------------------
DROP TABLE IF EXISTS "public"."trx_riwayat_pelaksanaan";
CREATE TABLE "public"."trx_riwayat_pelaksanaan" (
  "kode_trx_riwayat_pelaksanaan" int4 NOT NULL DEFAULT nextval('trx_riwayat_pelaksanaan_kode_trx_riwayat_pelaksanaan_seq'::regclass),
  "kode_riwayat_pelaksanaan" int4 NOT NULL,
  "kode_step_riwayat_pelaksanaan" int4 NOT NULL,
  "status_step" varchar COLLATE "pg_catalog"."default" DEFAULT 'belum diisi'::character varying,
  "ucr" varchar COLLATE "pg_catalog"."default" NOT NULL,
  "uch" varchar COLLATE "pg_catalog"."default",
  "udcr" timestamp(6) DEFAULT CURRENT_TIMESTAMP,
  "udch" timestamp(6) DEFAULT CURRENT_TIMESTAMP
)
;

-- ----------------------------
-- Table structure for trx_serah_terima
-- ----------------------------
DROP TABLE IF EXISTS "public"."trx_serah_terima";
CREATE TABLE "public"."trx_serah_terima" (
  "kode_serah_terima" int4 NOT NULL DEFAULT nextval('trx_serah_terima_kode_serah_terima_seq'::regclass),
  "kode_proses_kontrak" int4 NOT NULL,
  "kategori_serah_terima" "public"."kategori_serah_terima" NOT NULL,
  "rincian" varchar COLLATE "pg_catalog"."default" NOT NULL,
  "persentase" numeric NOT NULL,
  "nilai_rupiah" numeric,
  "status_serah_terima" int2 DEFAULT 1,
  "ucr" varchar COLLATE "pg_catalog"."default" NOT NULL,
  "uch" varchar COLLATE "pg_catalog"."default",
  "udcr" timestamp(6) DEFAULT CURRENT_TIMESTAMP,
  "udch" timestamp(6) DEFAULT CURRENT_TIMESTAMP
)
;

-- ----------------------------
-- Table structure for trx_sistem_pembayaran
-- ----------------------------
DROP TABLE IF EXISTS "public"."trx_sistem_pembayaran";
CREATE TABLE "public"."trx_sistem_pembayaran" (
  "kode_sistem_pembayaran" int4 NOT NULL DEFAULT nextval('trx_sistem_pembayaran_kode_sistem_pembayaran_seq'::regclass),
  "kode_proses_kontrak" int4 NOT NULL,
  "jenis_pembayaran" varchar COLLATE "pg_catalog"."default" NOT NULL,
  "kategori_sispembayaran" "public"."kategori_sispembayaran",
  "ucr" varchar COLLATE "pg_catalog"."default" NOT NULL,
  "uch" varchar COLLATE "pg_catalog"."default",
  "udcr" timestamp(6) DEFAULT CURRENT_TIMESTAMP,
  "udch" timestamp(6) DEFAULT CURRENT_TIMESTAMP
)
;

-- ----------------------------
-- Table structure for trx_sptjm
-- ----------------------------
DROP TABLE IF EXISTS "public"."trx_sptjm";
CREATE TABLE "public"."trx_sptjm" (
  "kode_trx_sptjm" int4 NOT NULL DEFAULT nextval('trx_sptjm_kode_trx_sptjm_seq'::regclass),
  "kode_trx_riwayat_pelaksanaan" int4 NOT NULL,
  "kode_tte" int4,
  "tgl_surat" timestamp(6),
  "kategori_surat" varchar COLLATE "pg_catalog"."default",
  "ucr" varchar COLLATE "pg_catalog"."default" NOT NULL,
  "uch" varchar COLLATE "pg_catalog"."default",
  "udcr" timestamp(6) DEFAULT CURRENT_TIMESTAMP,
  "udch" timestamp(6) DEFAULT CURRENT_TIMESTAMP
)
;

-- ----------------------------
-- Table structure for trx_tte
-- ----------------------------
DROP TABLE IF EXISTS "public"."trx_tte";
CREATE TABLE "public"."trx_tte" (
  "kode_tte" int4 NOT NULL DEFAULT nextval('trx_tte_kode_tte_seq'::regclass),
  "kode_trx_penandatangan" int4,
  "kode_permintaan" int4 NOT NULL,
  "kategori_tte" "public"."kategori_tte" NOT NULL,
  "path_dokumen" varchar COLLATE "pg_catalog"."default",
  "path_dokumen_selesai" varchar COLLATE "pg_catalog"."default",
  "tgl_selesai" timestamp(6),
  "nomor_surat" varchar COLLATE "pg_catalog"."default"
)
;

-- ----------------------------
-- Function structure for drop_all_foreign_keys
-- ----------------------------
DROP FUNCTION IF EXISTS "public"."drop_all_foreign_keys"();
CREATE OR REPLACE FUNCTION "public"."drop_all_foreign_keys"()
  RETURNS "pg_catalog"."void" AS $BODY$
DECLARE
    fk RECORD;
BEGIN
    -- Loop through all foreign key constraints in the current schema
    FOR fk IN
        SELECT conname AS constraint_name,
               conrelid::regclass AS table_name
        FROM pg_constraint
        WHERE contype = 'f' -- 'f' means foreign key
          AND connamespace = 'public'::regnamespace -- Adjust for the schema if needed
    LOOP
        -- Drop the foreign key constraint
        EXECUTE format('ALTER TABLE %s DROP CONSTRAINT %I', fk.table_name, fk.constraint_name);
        RAISE NOTICE 'Dropped foreign key: % in table: %', fk.constraint_name, fk.table_name;
    END LOOP;
END;
$BODY$
  LANGUAGE plpgsql VOLATILE
  COST 100;

-- ----------------------------
-- Function structure for view_penandatangan_params
-- ----------------------------
DROP FUNCTION IF EXISTS "public"."view_penandatangan_params"("p_kode_trx_penandatangan" int4);
CREATE OR REPLACE FUNCTION "public"."view_penandatangan_params"("p_kode_trx_penandatangan" int4)
  RETURNS TABLE("kode_trx_penandatangan" int4, "nama_aplikasi" text, "nomor_surat" text, "jenis_surat" text, "keterangan_surat" text, "path_dokumen" text, "path_dokumen_selesai" text, "tgl_selesai" timestamp, "kode_detail_penandatangan" int4, "status_jabatan_penandatangan" text, "jabatan" text, "status_penandatangan" text, "tgl_tte" timestamp, "otp" text, "kode_penandatangan" int4, "nama" text, "email" text, "nip" text, "nik" text) AS $BODY$
BEGIN
    RETURN QUERY
    SELECT a.kode_trx_penandatangan, a.nama_aplikasi, a.nomor_surat,
           a.jenis_surat, a.keterangan_surat, a.path_dokumen, a.path_dokumen_selesai, a.tgl_selesai,
           b.kode_detail_penandatangan, b.status_jabatan_penandatangan, b.jabatan, b.status_penandatangan,
           b.tgl_tte, b.otp, d.kode_penandatangan, d.nama, d.email, d.nip, d.nik
    FROM trx_penandatangan a
    JOIN trx_detail_penandatangan b
      ON a.kode_trx_penandatangan = b.kode_trx_penandatangan
    JOIN ref_penandatangan d
      ON b.kode_penandatangan = d.kode_penandatangan
    WHERE a.kode_trx_penandatangan = p_kode_trx_penandatangan;
END;
$BODY$
  LANGUAGE plpgsql VOLATILE
  COST 100
  ROWS 1000;

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "public"."ref_ba_pemeriksaan_kode_ba_pemerikasaan_seq"
OWNED BY "public"."ref_ba_pemeriksaan"."kode_ba_pemerikasaan";
SELECT setval('"public"."ref_ba_pemeriksaan_kode_ba_pemerikasaan_seq"', 8910, true);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "public"."ref_ba_pemeriksaan_st_kode_bap_st_seq"
OWNED BY "public"."ref_ba_pemeriksaan_st"."kode_bap_st";
SELECT setval('"public"."ref_ba_pemeriksaan_st_kode_bap_st_seq"', 1, true);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "public"."ref_bentuk_kontrak_kode_bentuk_kontrak_seq"
OWNED BY "public"."ref_bentuk_kontrak"."kode_bentuk_kontrak";
SELECT setval('"public"."ref_bentuk_kontrak_kode_bentuk_kontrak_seq"', 5, true);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "public"."ref_detail_aspek_kode_detail_aspek_seq"
OWNED BY "public"."ref_detail_aspek"."kode_detail_aspek";
SELECT setval('"public"."ref_detail_aspek_kode_detail_aspek_seq"', 39, true);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "public"."ref_dok_detail_transaksi_kode_dok_detail_transaksi_seq"
OWNED BY "public"."ref_dok_detail_transaksi"."kode_dok_detail_transaksi";
SELECT setval('"public"."ref_dok_detail_transaksi_kode_dok_detail_transaksi_seq"', 7640, true);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "public"."ref_jenis_laporan_kode_jenis_laporan_seq"
OWNED BY "public"."ref_jenis_laporan"."kode_jenis_laporan";
SELECT setval('"public"."ref_jenis_laporan_kode_jenis_laporan_seq"', 7, true);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "public"."ref_kategori_addendum_kode_kategori_addendum_seq"
OWNED BY "public"."ref_kategori_addendum"."kode_kategori_addendum";
SELECT setval('"public"."ref_kategori_addendum_kode_kategori_addendum_seq"', 3, true);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "public"."ref_keluaran_proses_kontrak_kode_keluaran_seq"
OWNED BY "public"."ref_keluaran_proses_kontrak"."kode_keluaran";
SELECT setval('"public"."ref_keluaran_proses_kontrak_kode_keluaran_seq"', 7479, true);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "public"."ref_permintaan_kode_permintaan_seq"
OWNED BY "public"."ref_permintaan"."kode_permintaan";
SELECT setval('"public"."ref_permintaan_kode_permintaan_seq"', 7646, true);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "public"."ref_proses_kontrak_kode_proses_kontrak_seq"
OWNED BY "public"."ref_proses_kontrak"."kode_proses_kontrak";
SELECT setval('"public"."ref_proses_kontrak_kode_proses_kontrak_seq"', 22918, true);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "public"."ref_riwayat_pelaksanaan_kode_riwayat_pelaksanaan_seq"
OWNED BY "public"."ref_riwayat_pelaksanaan"."kode_riwayat_pelaksanaan";
SELECT setval('"public"."ref_riwayat_pelaksanaan_kode_riwayat_pelaksanaan_seq"', 8910, true);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "public"."ref_serah_terima_kode_serah_terima_seq"
OWNED BY "public"."ref_serah_terima"."kode_serah_terima";
SELECT setval('"public"."ref_serah_terima_kode_serah_terima_seq"', 1, true);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "public"."ref_sptjm_kode_sptjm_seq"
OWNED BY "public"."ref_sptjm"."kode_sptjm";
SELECT setval('"public"."ref_sptjm_kode_sptjm_seq"', 408, true);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "public"."ref_status_kontrak_kode_status_kontrak_seq"
OWNED BY "public"."ref_status_kontrak"."kode_status_kontrak";
SELECT setval('"public"."ref_status_kontrak_kode_status_kontrak_seq"', 5, true);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "public"."ref_step_persiapan_kontrak_kode_step_persiapan_kontrak_seq"
OWNED BY "public"."ref_step_persiapan_kontrak"."kode_step_persiapan_kontrak";
SELECT setval('"public"."ref_step_persiapan_kontrak_kode_step_persiapan_kontrak_seq"', 6, true);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "public"."tbl_sptb_pl_id_sptb_pl_seq"
OWNED BY "public"."tbl_sptb_pl"."id_sptb_pl";
SELECT setval('"public"."tbl_sptb_pl_id_sptb_pl_seq"', 1, false);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "public"."tbl_sptbdpt_pl_id_sptb_dptpl_seq"
OWNED BY "public"."tbl_sptbdpt_pl"."id_sptb_dptpl";
SELECT setval('"public"."tbl_sptbdpt_pl_id_sptb_dptpl_seq"', 1, false);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "public"."trx_addendum_biaya_kode_trx_addendum_biaya_seq"
OWNED BY "public"."trx_addendum_biaya"."kode_trx_addendum_biaya";
SELECT setval('"public"."trx_addendum_biaya_kode_trx_addendum_biaya_seq"', 1, false);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "public"."trx_addendum_jangka_waktu_kode_trx_addendum_jangka_waktu_seq"
OWNED BY "public"."trx_addendum_jangka_waktu"."kode_trx_addendum_jangka_waktu";
SELECT setval('"public"."trx_addendum_jangka_waktu_kode_trx_addendum_jangka_waktu_seq"', 1, false);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "public"."trx_addendum_kode_trx_addendum_seq"
OWNED BY "public"."trx_addendum"."kode_trx_addendum";
SELECT setval('"public"."trx_addendum_kode_trx_addendum_seq"', 1, false);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "public"."trx_addendum_spek_teknis_kode_trx_addendum_st_seq"
OWNED BY "public"."trx_addendum_spek_teknis"."kode_trx_addendum_st";
SELECT setval('"public"."trx_addendum_spek_teknis_kode_trx_addendum_st_seq"', 1, false);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "public"."trx_ba_pemeriksaan_kode_trx_ba_pemeriksaan_seq"
OWNED BY "public"."trx_ba_pemeriksaan"."kode_trx_ba_pemeriksaan";
SELECT setval('"public"."trx_ba_pemeriksaan_kode_trx_ba_pemeriksaan_seq"', 1, true);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "public"."trx_ba_pemeriksaan_st_kode_trx_bap_st_seq"
OWNED BY "public"."trx_ba_pemeriksaan_st"."kode_trx_bap_st";
SELECT setval('"public"."trx_ba_pemeriksaan_st_kode_trx_bap_st_seq"', 1, true);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "public"."trx_bast_kode_bast_seq"
OWNED BY "public"."trx_bast"."kode_bast";
SELECT setval('"public"."trx_bast_kode_bast_seq"', 8910, true);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "public"."trx_bast_st_kode_bast_st_seq"
OWNED BY "public"."trx_bast_st"."kode_bast_st";
SELECT setval('"public"."trx_bast_st_kode_bast_st_seq"', 1, true);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "public"."trx_detail_permintaan_kode_detail_permintaan_seq"
OWNED BY "public"."trx_detail_permintaan"."kode_detail_permintaan";
SELECT setval('"public"."trx_detail_permintaan_kode_detail_permintaan_seq"', 27514, true);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "public"."trx_dokumen_kontrak_kode_dokumen_kontrak_seq"
OWNED BY "public"."trx_dokumen_kontrak"."kode_dokumen_kontrak";
SELECT setval('"public"."trx_dokumen_kontrak_kode_dokumen_kontrak_seq"', 7640, true);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "public"."trx_hasil_pajak_id_hasil_pajak_seq"
OWNED BY "public"."trx_hasil_pajak"."id_hasil_pajak";
SELECT setval('"public"."trx_hasil_pajak_id_hasil_pajak_seq"', 30016, true);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "public"."trx_jangka_waktu_kode_jangka_waktu_seq"
OWNED BY "public"."trx_jangka_waktu"."kode_jangka_waktu";
SELECT setval('"public"."trx_jangka_waktu_kode_jangka_waktu_seq"', 7479, true);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "public"."trx_jenis_laporan_kode_trx_jenis_laporan_seq"
OWNED BY "public"."trx_jenis_laporan"."kode_trx_jenis_laporan";
SELECT setval('"public"."trx_jenis_laporan_kode_trx_jenis_laporan_seq"', 7640, true);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "public"."trx_jenis_sispembayaran_kode_trx_jenis_sispembayaran_seq"
OWNED BY "public"."trx_jenis_sispembayaran"."kode_trx_jenis_sispembayaran";
SELECT setval('"public"."trx_jenis_sispembayaran_kode_trx_jenis_sispembayaran_seq"', 8910, true);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "public"."trx_keluaran_output_kode_keluaran_output_seq"
OWNED BY "public"."trx_keluaran_output"."kode_keluaran_output";
SELECT setval('"public"."trx_keluaran_output_kode_keluaran_output_seq"', 1, true);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "public"."trx_keluaran_output_new_kode_keluaran_output_new_seq"
OWNED BY "public"."trx_keluaran_output_new"."kode_keluaran_output_new";
SELECT setval('"public"."trx_keluaran_output_new_kode_keluaran_output_new_seq"', 1, true);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "public"."trx_kwitansi_kode_kwitansi_seq"
OWNED BY "public"."trx_kwitansi"."kode_kwitansi";
SELECT setval('"public"."trx_kwitansi_kode_kwitansi_seq"', 17819, true);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "public"."trx_monitoring_kode_monitoring_seq"
OWNED BY "public"."trx_monitoring"."kode_monitoring";
SELECT setval('"public"."trx_monitoring_kode_monitoring_seq"', 1, true);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "public"."trx_monitoring_new_kode_trx_monitoring_seq"
OWNED BY "public"."trx_monitoring_new"."kode_trx_monitoring";
SELECT setval('"public"."trx_monitoring_new_kode_trx_monitoring_seq"', 1, true);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "public"."trx_nego_harga_kode_nego_harga_seq"
OWNED BY "public"."trx_nego_harga"."kode_nego_harga";
SELECT setval('"public"."trx_nego_harga_kode_nego_harga_seq"', 93805, true);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "public"."trx_nego_teknis_kode_nego_teknis_seq"
OWNED BY "public"."trx_nego_teknis"."kode_nego_teknis";
SELECT setval('"public"."trx_nego_teknis_kode_nego_teknis_seq"', 19653, true);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "public"."trx_nilai_addendum_kode_nilai_addendum_seq"
OWNED BY "public"."trx_nilai_addendum"."kode_nilai_addendum";
SELECT setval('"public"."trx_nilai_addendum_kode_nilai_addendum_seq"', 1, false);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "public"."trx_pajak_kode_pajak_seq"
OWNED BY "public"."trx_pajak"."kode_pajak";
SELECT setval('"public"."trx_pajak_kode_pajak_seq"', 8910, true);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "public"."trx_pembayaran_kode_trx_pencarian_seq"
OWNED BY "public"."trx_pembayaran"."kode_trx_pencarian";
SELECT setval('"public"."trx_pembayaran_kode_trx_pencarian_seq"', 8910, true);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "public"."trx_penambahan_jangka_waktu_kode_trx_penambahan_jw_seq"
OWNED BY "public"."trx_penambahan_jangka_waktu"."kode_trx_penambahan_jw";
SELECT setval('"public"."trx_penambahan_jangka_waktu_kode_trx_penambahan_jw_seq"', 1, false);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "public"."trx_penilaian_pembayaran_kode_penilaian_pembayaran_seq"
OWNED BY "public"."trx_penilaian_pembayaran"."kode_penilaian_pembayaran";
SELECT setval('"public"."trx_penilaian_pembayaran_kode_penilaian_pembayaran_seq"', 1, true);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "public"."trx_proses_pajak_kode_proses_pajak_seq"
OWNED BY "public"."trx_proses_pajak"."kode_proses_pajak";
SELECT setval('"public"."trx_proses_pajak_kode_proses_pajak_seq"', 1, true);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "public"."trx_riwayat_pelaksanaan_kode_trx_riwayat_pelaksanaan_seq"
OWNED BY "public"."trx_riwayat_pelaksanaan"."kode_trx_riwayat_pelaksanaan";
SELECT setval('"public"."trx_riwayat_pelaksanaan_kode_trx_riwayat_pelaksanaan_seq"', 43115, true);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "public"."trx_serah_terima_kode_serah_terima_seq"
OWNED BY "public"."trx_serah_terima"."kode_serah_terima";
SELECT setval('"public"."trx_serah_terima_kode_serah_terima_seq"', 7479, true);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "public"."trx_sistem_pembayaran_kode_sistem_pembayaran_seq"
OWNED BY "public"."trx_sistem_pembayaran"."kode_sistem_pembayaran";
SELECT setval('"public"."trx_sistem_pembayaran_kode_sistem_pembayaran_seq"', 7479, true);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "public"."trx_sptjm_kode_trx_sptjm_seq"
OWNED BY "public"."trx_sptjm"."kode_trx_sptjm";
SELECT setval('"public"."trx_sptjm_kode_trx_sptjm_seq"', 1629, true);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "public"."trx_tte_kode_tte_seq"
OWNED BY "public"."trx_tte"."kode_tte";
SELECT setval('"public"."trx_tte_kode_tte_seq"', 43635, true);

-- ----------------------------
-- Primary Key structure for table m_aspek
-- ----------------------------
ALTER TABLE "public"."m_aspek" ADD CONSTRAINT "m_aspek_pkey" PRIMARY KEY ("kode_aspek");

-- ----------------------------
-- Primary Key structure for table ref_ba_pemeriksaan
-- ----------------------------
ALTER TABLE "public"."ref_ba_pemeriksaan" ADD CONSTRAINT "ref_ba_pemeriksaan_pkey" PRIMARY KEY ("kode_ba_pemerikasaan");

-- ----------------------------
-- Primary Key structure for table ref_ba_pemeriksaan_st
-- ----------------------------
ALTER TABLE "public"."ref_ba_pemeriksaan_st" ADD CONSTRAINT "ref_ba_pemeriksaan_st_pkey" PRIMARY KEY ("kode_bap_st");

-- ----------------------------
-- Primary Key structure for table ref_bentuk_kontrak
-- ----------------------------
ALTER TABLE "public"."ref_bentuk_kontrak" ADD CONSTRAINT "ref_bentuk_kontrak_pkey" PRIMARY KEY ("kode_bentuk_kontrak");

-- ----------------------------
-- Primary Key structure for table ref_detail_aspek
-- ----------------------------
ALTER TABLE "public"."ref_detail_aspek" ADD CONSTRAINT "ref_detail_aspek_pkey" PRIMARY KEY ("kode_detail_aspek");

-- ----------------------------
-- Primary Key structure for table ref_dok_detail_transaksi
-- ----------------------------
ALTER TABLE "public"."ref_dok_detail_transaksi" ADD CONSTRAINT "ref_dok_detail_transaksi_pkey" PRIMARY KEY ("kode_dok_detail_transaksi");

-- ----------------------------
-- Primary Key structure for table ref_jenis_kontrak
-- ----------------------------
ALTER TABLE "public"."ref_jenis_kontrak" ADD CONSTRAINT "ref_jenis_kontrak_pkey" PRIMARY KEY ("kode_jenis_kontrak");

-- ----------------------------
-- Primary Key structure for table ref_jenis_laporan
-- ----------------------------
ALTER TABLE "public"."ref_jenis_laporan" ADD CONSTRAINT "ref_jenis_laporan_pkey" PRIMARY KEY ("kode_jenis_laporan");

-- ----------------------------
-- Primary Key structure for table ref_kategori_addendum
-- ----------------------------
ALTER TABLE "public"."ref_kategori_addendum" ADD CONSTRAINT "ref_kategori_addendum_pkey" PRIMARY KEY ("kode_kategori_addendum");

-- ----------------------------
-- Primary Key structure for table ref_keluaran_proses_kontrak
-- ----------------------------
ALTER TABLE "public"."ref_keluaran_proses_kontrak" ADD CONSTRAINT "ref_keluaran_proses_kontrak_pkey" PRIMARY KEY ("kode_keluaran");

-- ----------------------------
-- Primary Key structure for table ref_permintaan
-- ----------------------------
ALTER TABLE "public"."ref_permintaan" ADD CONSTRAINT "ref_permintaan_pkey" PRIMARY KEY ("kode_permintaan");

-- ----------------------------
-- Primary Key structure for table ref_proses_kontrak
-- ----------------------------
ALTER TABLE "public"."ref_proses_kontrak" ADD CONSTRAINT "ref_proses_kontrak_pkey" PRIMARY KEY ("kode_proses_kontrak");

-- ----------------------------
-- Primary Key structure for table ref_riwayat_pelaksanaan
-- ----------------------------
ALTER TABLE "public"."ref_riwayat_pelaksanaan" ADD CONSTRAINT "ref_riwayat_pelaksanaan_pkey" PRIMARY KEY ("kode_riwayat_pelaksanaan");

-- ----------------------------
-- Primary Key structure for table ref_serah_terima
-- ----------------------------
ALTER TABLE "public"."ref_serah_terima" ADD CONSTRAINT "ref_serah_terima_pkey" PRIMARY KEY ("kode_serah_terima");

-- ----------------------------
-- Primary Key structure for table ref_skema_pembayaran
-- ----------------------------
ALTER TABLE "public"."ref_skema_pembayaran" ADD CONSTRAINT "ref_skema_pembayaran_pkey" PRIMARY KEY ("kode_skema_pembayaran");

-- ----------------------------
-- Primary Key structure for table ref_sptjm
-- ----------------------------
ALTER TABLE "public"."ref_sptjm" ADD CONSTRAINT "ref_sptjm_pkey" PRIMARY KEY ("kode_sptjm");

-- ----------------------------
-- Primary Key structure for table ref_status_kontrak
-- ----------------------------
ALTER TABLE "public"."ref_status_kontrak" ADD CONSTRAINT "ref_status_kontrak_pkey" PRIMARY KEY ("kode_status_kontrak");

-- ----------------------------
-- Primary Key structure for table ref_status_permintaan
-- ----------------------------
ALTER TABLE "public"."ref_status_permintaan" ADD CONSTRAINT "ref_status_permintaan_pkey" PRIMARY KEY ("kode_status_permintaan");

-- ----------------------------
-- Primary Key structure for table ref_step_persiapan_kontrak
-- ----------------------------
ALTER TABLE "public"."ref_step_persiapan_kontrak" ADD CONSTRAINT "ref_step_persiapan_kontrak_pkey" PRIMARY KEY ("kode_step_persiapan_kontrak");

-- ----------------------------
-- Primary Key structure for table ref_step_riwayat_pelaksanaan
-- ----------------------------
ALTER TABLE "public"."ref_step_riwayat_pelaksanaan" ADD CONSTRAINT "ref_step_riwayat_pelaksanaan_pkey" PRIMARY KEY ("kode_step_riwayat_pelaksanaan");

-- ----------------------------
-- Primary Key structure for table ref_step_serah_terima
-- ----------------------------
ALTER TABLE "public"."ref_step_serah_terima" ADD CONSTRAINT "ref_step_serah_terima_pkey" PRIMARY KEY ("kode_step_serah_terima");

-- ----------------------------
-- Primary Key structure for table tbl_sptb_pl
-- ----------------------------
ALTER TABLE "public"."tbl_sptb_pl" ADD CONSTRAINT "tbl_sptb_pl_pkey" PRIMARY KEY ("id_sptb_pl");

-- ----------------------------
-- Primary Key structure for table tbl_sptbdpt_pl
-- ----------------------------
ALTER TABLE "public"."tbl_sptbdpt_pl" ADD CONSTRAINT "tbl_sptbdpt_pl_pkey" PRIMARY KEY ("id_sptb_dptpl");

-- ----------------------------
-- Primary Key structure for table trx_addendum
-- ----------------------------
ALTER TABLE "public"."trx_addendum" ADD CONSTRAINT "trx_addendum_pkey" PRIMARY KEY ("kode_trx_addendum");

-- ----------------------------
-- Primary Key structure for table trx_addendum_biaya
-- ----------------------------
ALTER TABLE "public"."trx_addendum_biaya" ADD CONSTRAINT "trx_addendum_biaya_pkey" PRIMARY KEY ("kode_trx_addendum_biaya");

-- ----------------------------
-- Primary Key structure for table trx_addendum_jangka_waktu
-- ----------------------------
ALTER TABLE "public"."trx_addendum_jangka_waktu" ADD CONSTRAINT "trx_addendum_jangka_waktu_pkey" PRIMARY KEY ("kode_trx_addendum_jangka_waktu");

-- ----------------------------
-- Primary Key structure for table trx_addendum_spek_teknis
-- ----------------------------
ALTER TABLE "public"."trx_addendum_spek_teknis" ADD CONSTRAINT "trx_addendum_spek_teknis_pkey" PRIMARY KEY ("kode_trx_addendum_st");

-- ----------------------------
-- Primary Key structure for table trx_ba_pemeriksaan
-- ----------------------------
ALTER TABLE "public"."trx_ba_pemeriksaan" ADD CONSTRAINT "trx_ba_pemeriksaan_pkey" PRIMARY KEY ("kode_trx_ba_pemeriksaan");

-- ----------------------------
-- Primary Key structure for table trx_ba_pemeriksaan_st
-- ----------------------------
ALTER TABLE "public"."trx_ba_pemeriksaan_st" ADD CONSTRAINT "trx_ba_pemeriksaan_st_pkey" PRIMARY KEY ("kode_trx_bap_st");

-- ----------------------------
-- Primary Key structure for table trx_bast
-- ----------------------------
ALTER TABLE "public"."trx_bast" ADD CONSTRAINT "trx_bast_pkey" PRIMARY KEY ("kode_bast");

-- ----------------------------
-- Primary Key structure for table trx_bast_st
-- ----------------------------
ALTER TABLE "public"."trx_bast_st" ADD CONSTRAINT "trx_bast_st_pkey" PRIMARY KEY ("kode_bast_st");

-- ----------------------------
-- Primary Key structure for table trx_detail_permintaan
-- ----------------------------
ALTER TABLE "public"."trx_detail_permintaan" ADD CONSTRAINT "trx_detail_permintaan_pkey" PRIMARY KEY ("kode_detail_permintaan");

-- ----------------------------
-- Primary Key structure for table trx_dokumen_kontrak
-- ----------------------------
ALTER TABLE "public"."trx_dokumen_kontrak" ADD CONSTRAINT "trx_dokumen_kontrak_pkey" PRIMARY KEY ("kode_dokumen_kontrak");

-- ----------------------------
-- Primary Key structure for table trx_hasil_pajak
-- ----------------------------
ALTER TABLE "public"."trx_hasil_pajak" ADD CONSTRAINT "trx_hasil_pajak_pkey" PRIMARY KEY ("id_hasil_pajak");

-- ----------------------------
-- Primary Key structure for table trx_jangka_waktu
-- ----------------------------
ALTER TABLE "public"."trx_jangka_waktu" ADD CONSTRAINT "trx_jangka_waktu_pkey" PRIMARY KEY ("kode_jangka_waktu");

-- ----------------------------
-- Primary Key structure for table trx_jenis_laporan
-- ----------------------------
ALTER TABLE "public"."trx_jenis_laporan" ADD CONSTRAINT "trx_jenis_laporan_pkey" PRIMARY KEY ("kode_trx_jenis_laporan");

-- ----------------------------
-- Primary Key structure for table trx_jenis_sispembayaran
-- ----------------------------
ALTER TABLE "public"."trx_jenis_sispembayaran" ADD CONSTRAINT "trx_jenis_sispembayaran_pkey" PRIMARY KEY ("kode_trx_jenis_sispembayaran");

-- ----------------------------
-- Primary Key structure for table trx_keluaran_output
-- ----------------------------
ALTER TABLE "public"."trx_keluaran_output" ADD CONSTRAINT "trx_keluaran_output_pkey" PRIMARY KEY ("kode_keluaran_output");

-- ----------------------------
-- Primary Key structure for table trx_keluaran_output_new
-- ----------------------------
ALTER TABLE "public"."trx_keluaran_output_new" ADD CONSTRAINT "trx_keluaran_output_new_pkey" PRIMARY KEY ("kode_keluaran_output_new");

-- ----------------------------
-- Primary Key structure for table trx_kwitansi
-- ----------------------------
ALTER TABLE "public"."trx_kwitansi" ADD CONSTRAINT "trx_kwitansi_pkey" PRIMARY KEY ("kode_kwitansi");

-- ----------------------------
-- Primary Key structure for table trx_monitoring
-- ----------------------------
ALTER TABLE "public"."trx_monitoring" ADD CONSTRAINT "trx_monitoring_pkey" PRIMARY KEY ("kode_monitoring");

-- ----------------------------
-- Primary Key structure for table trx_monitoring_new
-- ----------------------------
ALTER TABLE "public"."trx_monitoring_new" ADD CONSTRAINT "trx_monitoring_new_pkey" PRIMARY KEY ("kode_trx_monitoring");

-- ----------------------------
-- Primary Key structure for table trx_nego_harga
-- ----------------------------
ALTER TABLE "public"."trx_nego_harga" ADD CONSTRAINT "trx_nego_harga_pkey" PRIMARY KEY ("kode_nego_harga");

-- ----------------------------
-- Primary Key structure for table trx_nego_teknis
-- ----------------------------
ALTER TABLE "public"."trx_nego_teknis" ADD CONSTRAINT "trx_nego_teknis_pkey" PRIMARY KEY ("kode_nego_teknis");

-- ----------------------------
-- Primary Key structure for table trx_nilai_addendum
-- ----------------------------
ALTER TABLE "public"."trx_nilai_addendum" ADD CONSTRAINT "trx_nilai_addendum_pkey" PRIMARY KEY ("kode_nilai_addendum");

-- ----------------------------
-- Primary Key structure for table trx_pajak
-- ----------------------------
ALTER TABLE "public"."trx_pajak" ADD CONSTRAINT "trx_pajak_pkey" PRIMARY KEY ("kode_pajak");

-- ----------------------------
-- Primary Key structure for table trx_pembayaran
-- ----------------------------
ALTER TABLE "public"."trx_pembayaran" ADD CONSTRAINT "trx_pembayaran_pkey" PRIMARY KEY ("kode_trx_pencarian");

-- ----------------------------
-- Primary Key structure for table trx_penambahan_jangka_waktu
-- ----------------------------
ALTER TABLE "public"."trx_penambahan_jangka_waktu" ADD CONSTRAINT "trx_penambahan_jangka_waktu_pkey" PRIMARY KEY ("kode_trx_penambahan_jw");

-- ----------------------------
-- Primary Key structure for table trx_penilaian_pembayaran
-- ----------------------------
ALTER TABLE "public"."trx_penilaian_pembayaran" ADD CONSTRAINT "trx_penilaian_pembayaran_pkey" PRIMARY KEY ("kode_penilaian_pembayaran");

-- ----------------------------
-- Primary Key structure for table trx_proses_pajak
-- ----------------------------
ALTER TABLE "public"."trx_proses_pajak" ADD CONSTRAINT "trx_proses_pajak_pkey" PRIMARY KEY ("kode_proses_pajak");

-- ----------------------------
-- Primary Key structure for table trx_riwayat_pelaksanaan
-- ----------------------------
ALTER TABLE "public"."trx_riwayat_pelaksanaan" ADD CONSTRAINT "trx_riwayat_pelaksanaan_pkey" PRIMARY KEY ("kode_trx_riwayat_pelaksanaan");

-- ----------------------------
-- Primary Key structure for table trx_serah_terima
-- ----------------------------
ALTER TABLE "public"."trx_serah_terima" ADD CONSTRAINT "trx_serah_terima_pkey" PRIMARY KEY ("kode_serah_terima");

-- ----------------------------
-- Primary Key structure for table trx_sistem_pembayaran
-- ----------------------------
ALTER TABLE "public"."trx_sistem_pembayaran" ADD CONSTRAINT "trx_sistem_pembayaran_pkey" PRIMARY KEY ("kode_sistem_pembayaran");

-- ----------------------------
-- Primary Key structure for table trx_sptjm
-- ----------------------------
ALTER TABLE "public"."trx_sptjm" ADD CONSTRAINT "trx_sptjm_pkey" PRIMARY KEY ("kode_trx_sptjm");

-- ----------------------------
-- Primary Key structure for table trx_tte
-- ----------------------------
ALTER TABLE "public"."trx_tte" ADD CONSTRAINT "trx_tte_pkey" PRIMARY KEY ("kode_tte");

-- ----------------------------
-- Foreign Keys structure for table ref_ba_pemeriksaan
-- ----------------------------
ALTER TABLE "public"."ref_ba_pemeriksaan" ADD CONSTRAINT "FK_ref_ba_pemeriksaan_trx_tte" FOREIGN KEY ("kode_tte") REFERENCES "public"."trx_tte" ("kode_tte") ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE "public"."ref_ba_pemeriksaan" ADD CONSTRAINT "ref_ba_pemeriksaan_kode_trx_riwayat_pelaksanaan_fkey" FOREIGN KEY ("kode_trx_riwayat_pelaksanaan") REFERENCES "public"."trx_riwayat_pelaksanaan" ("kode_trx_riwayat_pelaksanaan") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- ----------------------------
-- Foreign Keys structure for table ref_ba_pemeriksaan_st
-- ----------------------------
ALTER TABLE "public"."ref_ba_pemeriksaan_st" ADD CONSTRAINT "fk_serah_terima" FOREIGN KEY ("kode_serah_terima") REFERENCES "public"."ref_serah_terima" ("kode_serah_terima") ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE "public"."ref_ba_pemeriksaan_st" ADD CONSTRAINT "fk_tte" FOREIGN KEY ("kode_tte") REFERENCES "public"."trx_tte" ("kode_tte") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- ----------------------------
-- Foreign Keys structure for table ref_detail_aspek
-- ----------------------------
ALTER TABLE "public"."ref_detail_aspek" ADD CONSTRAINT "ref_detail_aspek_kode_aspek_fkey" FOREIGN KEY ("kode_aspek") REFERENCES "public"."m_aspek" ("kode_aspek") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- ----------------------------
-- Foreign Keys structure for table ref_keluaran_proses_kontrak
-- ----------------------------
ALTER TABLE "public"."ref_keluaran_proses_kontrak" ADD CONSTRAINT "fk_proses_kontrak_keluaran" FOREIGN KEY ("kode_proses_kontrak") REFERENCES "public"."ref_proses_kontrak" ("kode_proses_kontrak") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- ----------------------------
-- Foreign Keys structure for table ref_permintaan
-- ----------------------------
ALTER TABLE "public"."ref_permintaan" ADD CONSTRAINT "ref_permintaan_kode_jenis_kontrak_fkey" FOREIGN KEY ("kode_jenis_kontrak") REFERENCES "public"."ref_jenis_kontrak" ("kode_jenis_kontrak") ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE "public"."ref_permintaan" ADD CONSTRAINT "ref_permintaan_kode_skema_pembayaran_fkey" FOREIGN KEY ("kode_skema_pembayaran") REFERENCES "public"."ref_skema_pembayaran" ("kode_skema_pembayaran") ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE "public"."ref_permintaan" ADD CONSTRAINT "ref_permintaan_kode_status_permintaan_fkey" FOREIGN KEY ("kode_status_permintaan") REFERENCES "public"."ref_status_permintaan" ("kode_status_permintaan") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- ----------------------------
-- Foreign Keys structure for table ref_proses_kontrak
-- ----------------------------
ALTER TABLE "public"."ref_proses_kontrak" ADD CONSTRAINT "FK_ref_proses_kontrak_ref_permintaan" FOREIGN KEY ("kode_permintaan") REFERENCES "public"."ref_permintaan" ("kode_permintaan") ON DELETE CASCADE ON UPDATE NO ACTION;
ALTER TABLE "public"."ref_proses_kontrak" ADD CONSTRAINT "fk_status_kontrak" FOREIGN KEY ("kode_status_kontrak") REFERENCES "public"."ref_status_kontrak" ("kode_status_kontrak") ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE "public"."ref_proses_kontrak" ADD CONSTRAINT "fk_step_persiapan_kontrak" FOREIGN KEY ("kode_step_persiapan_kontrak") REFERENCES "public"."ref_step_persiapan_kontrak" ("kode_step_persiapan_kontrak") ON DELETE NO ACTION ON UPDATE CASCADE;

-- ----------------------------
-- Foreign Keys structure for table ref_riwayat_pelaksanaan
-- ----------------------------
ALTER TABLE "public"."ref_riwayat_pelaksanaan" ADD CONSTRAINT "ref_riwayat_pelaksanaan_kode_proses_kontrak_fkey" FOREIGN KEY ("kode_proses_kontrak") REFERENCES "public"."ref_proses_kontrak" ("kode_proses_kontrak") ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE "public"."ref_riwayat_pelaksanaan" ADD CONSTRAINT "ref_riwayat_pelaksanaan_kode_trx_jenis_sispembayaran_fkey" FOREIGN KEY ("kode_trx_jenis_sispembayaran") REFERENCES "public"."trx_jenis_sispembayaran" ("kode_trx_jenis_sispembayaran") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- ----------------------------
-- Foreign Keys structure for table ref_serah_terima
-- ----------------------------
ALTER TABLE "public"."ref_serah_terima" ADD CONSTRAINT "fk_proses_kontrak" FOREIGN KEY ("kode_proses_kontrak") REFERENCES "public"."ref_proses_kontrak" ("kode_proses_kontrak") ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE "public"."ref_serah_terima" ADD CONSTRAINT "fk_step_serah_terima" FOREIGN KEY ("kode_step_serah_terima") REFERENCES "public"."ref_step_serah_terima" ("kode_step_serah_terima") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- ----------------------------
-- Foreign Keys structure for table ref_sptjm
-- ----------------------------
ALTER TABLE "public"."ref_sptjm" ADD CONSTRAINT "ref_sptjm_kode_trx_riwayat_pelaksanaan_fkey" FOREIGN KEY ("kode_trx_riwayat_pelaksanaan") REFERENCES "public"."trx_riwayat_pelaksanaan" ("kode_trx_riwayat_pelaksanaan") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- ----------------------------
-- Foreign Keys structure for table trx_addendum
-- ----------------------------
ALTER TABLE "public"."trx_addendum" ADD CONSTRAINT "fk_trx_addendum_kategori" FOREIGN KEY ("kode_kategori_addendum") REFERENCES "public"."ref_kategori_addendum" ("kode_kategori_addendum") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- ----------------------------
-- Foreign Keys structure for table trx_addendum_biaya
-- ----------------------------
ALTER TABLE "public"."trx_addendum_biaya" ADD CONSTRAINT "fk_addendum_biaya_trx" FOREIGN KEY ("kode_trx_addendum") REFERENCES "public"."trx_addendum" ("kode_trx_addendum") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- ----------------------------
-- Foreign Keys structure for table trx_addendum_jangka_waktu
-- ----------------------------
ALTER TABLE "public"."trx_addendum_jangka_waktu" ADD CONSTRAINT "fk_addendum_jw_trx" FOREIGN KEY ("kode_trx_addendum") REFERENCES "public"."trx_addendum" ("kode_trx_addendum") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- ----------------------------
-- Foreign Keys structure for table trx_addendum_spek_teknis
-- ----------------------------
ALTER TABLE "public"."trx_addendum_spek_teknis" ADD CONSTRAINT "fk_addendum_st_trx" FOREIGN KEY ("kode_trx_addendum") REFERENCES "public"."trx_addendum" ("kode_trx_addendum") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- ----------------------------
-- Foreign Keys structure for table trx_ba_pemeriksaan
-- ----------------------------
ALTER TABLE "public"."trx_ba_pemeriksaan" ADD CONSTRAINT "trx_ba_pemeriksaan_kode_trx_riwayat_pelaksanaan_fkey" FOREIGN KEY ("kode_trx_riwayat_pelaksanaan") REFERENCES "public"."trx_riwayat_pelaksanaan" ("kode_trx_riwayat_pelaksanaan") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- ----------------------------
-- Foreign Keys structure for table trx_ba_pemeriksaan_st
-- ----------------------------
ALTER TABLE "public"."trx_ba_pemeriksaan_st" ADD CONSTRAINT "fk_serah_terima" FOREIGN KEY ("kode_serah_terima") REFERENCES "public"."ref_serah_terima" ("kode_serah_terima") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- ----------------------------
-- Foreign Keys structure for table trx_bast
-- ----------------------------
ALTER TABLE "public"."trx_bast" ADD CONSTRAINT "FK_trx_bast_trx_riwayat_pelaksanaan" FOREIGN KEY ("kode_trx_riwayat_pelaksanaan") REFERENCES "public"."trx_riwayat_pelaksanaan" ("kode_trx_riwayat_pelaksanaan") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- ----------------------------
-- Foreign Keys structure for table trx_bast_st
-- ----------------------------
ALTER TABLE "public"."trx_bast_st" ADD CONSTRAINT "fk_serah_terima" FOREIGN KEY ("kode_serah_terima") REFERENCES "public"."ref_serah_terima" ("kode_serah_terima") ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE "public"."trx_bast_st" ADD CONSTRAINT "fk_tte" FOREIGN KEY ("kode_tte") REFERENCES "public"."trx_tte" ("kode_tte") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- ----------------------------
-- Foreign Keys structure for table trx_detail_permintaan
-- ----------------------------
ALTER TABLE "public"."trx_detail_permintaan" ADD CONSTRAINT "trx_detail_permintaan_kode_permintaan_fkey" FOREIGN KEY ("kode_permintaan") REFERENCES "public"."ref_permintaan" ("kode_permintaan") ON DELETE CASCADE ON UPDATE NO ACTION;

-- ----------------------------
-- Foreign Keys structure for table trx_dokumen_kontrak
-- ----------------------------
ALTER TABLE "public"."trx_dokumen_kontrak" ADD CONSTRAINT "FK_trx_dokumen_kontrak_ref_bentuk_kontrak" FOREIGN KEY ("kode_bentuk_kontrak") REFERENCES "public"."ref_bentuk_kontrak" ("kode_bentuk_kontrak") ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE "public"."trx_dokumen_kontrak" ADD CONSTRAINT "FK_trx_dokumen_kontrak_trx_tte" FOREIGN KEY ("kode_tte") REFERENCES "public"."trx_tte" ("kode_tte") ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE "public"."trx_dokumen_kontrak" ADD CONSTRAINT "trx_dokumen_kontrak_kode_proses_kontrak_fkey" FOREIGN KEY ("kode_proses_kontrak") REFERENCES "public"."ref_proses_kontrak" ("kode_proses_kontrak") ON DELETE CASCADE ON UPDATE NO ACTION;

-- ----------------------------
-- Foreign Keys structure for table trx_hasil_pajak
-- ----------------------------
ALTER TABLE "public"."trx_hasil_pajak" ADD CONSTRAINT "trx_hasil_pajak_kode_pajak_fkey" FOREIGN KEY ("kode_pajak") REFERENCES "public"."trx_pajak" ("kode_pajak") ON DELETE CASCADE ON UPDATE CASCADE;

-- ----------------------------
-- Foreign Keys structure for table trx_jangka_waktu
-- ----------------------------
ALTER TABLE "public"."trx_jangka_waktu" ADD CONSTRAINT "fk_proses_kontrak_jangka_waktu" FOREIGN KEY ("kode_proses_kontrak") REFERENCES "public"."ref_proses_kontrak" ("kode_proses_kontrak") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- ----------------------------
-- Foreign Keys structure for table trx_jenis_laporan
-- ----------------------------
ALTER TABLE "public"."trx_jenis_laporan" ADD CONSTRAINT "fk_proses_kontrak" FOREIGN KEY ("kode_proses_kontrak") REFERENCES "public"."ref_proses_kontrak" ("kode_proses_kontrak") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- ----------------------------
-- Foreign Keys structure for table trx_jenis_sispembayaran
-- ----------------------------
ALTER TABLE "public"."trx_jenis_sispembayaran" ADD CONSTRAINT "fk_sistem_pembayaran" FOREIGN KEY ("kode_sistem_pembayaran") REFERENCES "public"."trx_sistem_pembayaran" ("kode_sistem_pembayaran") ON DELETE CASCADE ON UPDATE CASCADE;

-- ----------------------------
-- Foreign Keys structure for table trx_keluaran_output
-- ----------------------------
ALTER TABLE "public"."trx_keluaran_output" ADD CONSTRAINT "trx_keluaran_output_kode_keluaran_fkey" FOREIGN KEY ("kode_keluaran") REFERENCES "public"."ref_keluaran_proses_kontrak" ("kode_keluaran") ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE "public"."trx_keluaran_output" ADD CONSTRAINT "trx_keluaran_output_kode_trx_riwayat_pelaksanaan_fkey" FOREIGN KEY ("kode_trx_riwayat_pelaksanaan") REFERENCES "public"."trx_riwayat_pelaksanaan" ("kode_trx_riwayat_pelaksanaan") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- ----------------------------
-- Foreign Keys structure for table trx_keluaran_output_new
-- ----------------------------
ALTER TABLE "public"."trx_keluaran_output_new" ADD CONSTRAINT "fk_keluaran" FOREIGN KEY ("kode_keluaran") REFERENCES "public"."ref_keluaran_proses_kontrak" ("kode_keluaran") ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE "public"."trx_keluaran_output_new" ADD CONSTRAINT "fk_proses_kontrak" FOREIGN KEY ("kode_proses_kontrak") REFERENCES "public"."ref_proses_kontrak" ("kode_proses_kontrak") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- ----------------------------
-- Foreign Keys structure for table trx_kwitansi
-- ----------------------------
ALTER TABLE "public"."trx_kwitansi" ADD CONSTRAINT "trx_kwitansi_kode_trx_riwayat_pelaksanaan_fkey" FOREIGN KEY ("kode_trx_riwayat_pelaksanaan") REFERENCES "public"."trx_riwayat_pelaksanaan" ("kode_trx_riwayat_pelaksanaan") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- ----------------------------
-- Foreign Keys structure for table trx_monitoring
-- ----------------------------
ALTER TABLE "public"."trx_monitoring" ADD CONSTRAINT "trx_monitoring_kode_trx_riwayat_pelaksanaan_fkey" FOREIGN KEY ("kode_trx_riwayat_pelaksanaan") REFERENCES "public"."trx_riwayat_pelaksanaan" ("kode_trx_riwayat_pelaksanaan") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- ----------------------------
-- Foreign Keys structure for table trx_monitoring_new
-- ----------------------------
ALTER TABLE "public"."trx_monitoring_new" ADD CONSTRAINT "fk_proses_kontrak" FOREIGN KEY ("kode_proses_kontrak") REFERENCES "public"."ref_proses_kontrak" ("kode_proses_kontrak") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- ----------------------------
-- Foreign Keys structure for table trx_nego_harga
-- ----------------------------
ALTER TABLE "public"."trx_nego_harga" ADD CONSTRAINT "trx_nego_harga_kode_detail_permintaan_fkey" FOREIGN KEY ("kode_detail_permintaan") REFERENCES "public"."trx_detail_permintaan" ("kode_detail_permintaan") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- ----------------------------
-- Foreign Keys structure for table trx_nego_teknis
-- ----------------------------
ALTER TABLE "public"."trx_nego_teknis" ADD CONSTRAINT "trx_nego_teknis_kode_permintaan_fkey" FOREIGN KEY ("kode_permintaan") REFERENCES "public"."ref_permintaan" ("kode_permintaan") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- ----------------------------
-- Foreign Keys structure for table trx_nilai_addendum
-- ----------------------------
ALTER TABLE "public"."trx_nilai_addendum" ADD CONSTRAINT "fk_nilai_addendum_trx" FOREIGN KEY ("kode_trx_addendum") REFERENCES "public"."trx_addendum" ("kode_trx_addendum") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- ----------------------------
-- Foreign Keys structure for table trx_pajak
-- ----------------------------
ALTER TABLE "public"."trx_pajak" ADD CONSTRAINT "trx_pajak_kode_trx_riwayat_pelaksanaan_fkey" FOREIGN KEY ("kode_trx_riwayat_pelaksanaan") REFERENCES "public"."trx_riwayat_pelaksanaan" ("kode_trx_riwayat_pelaksanaan") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- ----------------------------
-- Foreign Keys structure for table trx_pembayaran
-- ----------------------------
ALTER TABLE "public"."trx_pembayaran" ADD CONSTRAINT "trx_pembayaran_kode_trx_riwayat_pelaksanaan_fkey" FOREIGN KEY ("kode_trx_riwayat_pelaksanaan") REFERENCES "public"."trx_riwayat_pelaksanaan" ("kode_trx_riwayat_pelaksanaan") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- ----------------------------
-- Foreign Keys structure for table trx_penilaian_pembayaran
-- ----------------------------
ALTER TABLE "public"."trx_penilaian_pembayaran" ADD CONSTRAINT "trx_penilaian_pembayaran_kode_detail_aspek_fkey" FOREIGN KEY ("kode_detail_aspek") REFERENCES "public"."ref_detail_aspek" ("kode_detail_aspek") ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE "public"."trx_penilaian_pembayaran" ADD CONSTRAINT "trx_penilaian_pembayaran_kode_trx_riwayat_pelaksanaan_fkey" FOREIGN KEY ("kode_trx_riwayat_pelaksanaan") REFERENCES "public"."trx_riwayat_pelaksanaan" ("kode_trx_riwayat_pelaksanaan") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- ----------------------------
-- Foreign Keys structure for table trx_proses_pajak
-- ----------------------------
ALTER TABLE "public"."trx_proses_pajak" ADD CONSTRAINT "fk_proses_kontrak_pajak" FOREIGN KEY ("kode_proses_kontrak") REFERENCES "public"."ref_proses_kontrak" ("kode_proses_kontrak") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- ----------------------------
-- Foreign Keys structure for table trx_riwayat_pelaksanaan
-- ----------------------------
ALTER TABLE "public"."trx_riwayat_pelaksanaan" ADD CONSTRAINT "trx_riwayat_pelaksanaan_kode_riwayat_pelaksanaan_fkey" FOREIGN KEY ("kode_riwayat_pelaksanaan") REFERENCES "public"."ref_riwayat_pelaksanaan" ("kode_riwayat_pelaksanaan") ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE "public"."trx_riwayat_pelaksanaan" ADD CONSTRAINT "trx_riwayat_pelaksanaan_kode_step_riwayat_pelaksanaan_fkey" FOREIGN KEY ("kode_step_riwayat_pelaksanaan") REFERENCES "public"."ref_step_riwayat_pelaksanaan" ("kode_step_riwayat_pelaksanaan") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- ----------------------------
-- Foreign Keys structure for table trx_serah_terima
-- ----------------------------
ALTER TABLE "public"."trx_serah_terima" ADD CONSTRAINT "trx_serah_terima_kode_proses_kontrak_fkey" FOREIGN KEY ("kode_proses_kontrak") REFERENCES "public"."ref_proses_kontrak" ("kode_proses_kontrak") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- ----------------------------
-- Foreign Keys structure for table trx_sistem_pembayaran
-- ----------------------------
ALTER TABLE "public"."trx_sistem_pembayaran" ADD CONSTRAINT "fk_proses_kontrak_sispembayaran" FOREIGN KEY ("kode_proses_kontrak") REFERENCES "public"."ref_proses_kontrak" ("kode_proses_kontrak") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- ----------------------------
-- Foreign Keys structure for table trx_sptjm
-- ----------------------------
ALTER TABLE "public"."trx_sptjm" ADD CONSTRAINT "trx_sptjm_kode_trx_riwayat_pelaksanaan_fkey" FOREIGN KEY ("kode_trx_riwayat_pelaksanaan") REFERENCES "public"."trx_riwayat_pelaksanaan" ("kode_trx_riwayat_pelaksanaan") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- ----------------------------
-- Foreign Keys structure for table trx_tte
-- ----------------------------
ALTER TABLE "public"."trx_tte" ADD CONSTRAINT "fk_permintaan" FOREIGN KEY ("kode_permintaan") REFERENCES "public"."ref_permintaan" ("kode_permintaan") ON DELETE CASCADE ON UPDATE NO ACTION;
