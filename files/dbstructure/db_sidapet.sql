/*
 Navicat Premium Dump SQL

 Source Server         : promis-prod-dbmodul
 Source Server Type    : PostgreSQL
 Source Server Version : 160011 (160011)
 Source Host           : 172.30.10.24:5432
 Source Catalog        : db_sidapet
 Source Schema         : public

 Target Server Type    : PostgreSQL
 Target Server Version : 160011 (160011)
 File Encoding         : 65001

 Date: 04/02/2026 13:51:52
*/


-- ----------------------------
-- Type structure for bentuk_bu
-- ----------------------------
DROP TYPE IF EXISTS "public"."bentuk_bu";
CREATE TYPE "public"."bentuk_bu" AS ENUM (
  'pt',
  'cv'
);
ALTER TYPE "public"."bentuk_bu" OWNER TO "postgres";

-- ----------------------------
-- Type structure for jabatan_penandatangan
-- ----------------------------
DROP TYPE IF EXISTS "public"."jabatan_penandatangan";
CREATE TYPE "public"."jabatan_penandatangan" AS ENUM (
  'komisaris',
  'direksi',
  'admin',
  'perorangan'
);
ALTER TYPE "public"."jabatan_penandatangan" OWNER TO "postgres";

-- ----------------------------
-- Type structure for jenis_item
-- ----------------------------
DROP TYPE IF EXISTS "public"."jenis_item";
CREATE TYPE "public"."jenis_item" AS ENUM (
  'default',
  'custom'
);
ALTER TYPE "public"."jenis_item" OWNER TO "postgres";

-- ----------------------------
-- Type structure for jenis_item_tanya
-- ----------------------------
DROP TYPE IF EXISTS "public"."jenis_item_tanya";
CREATE TYPE "public"."jenis_item_tanya" AS ENUM (
  'default',
  'custom'
);
ALTER TYPE "public"."jenis_item_tanya" OWNER TO "postgres";

-- ----------------------------
-- Type structure for jenis_izin
-- ----------------------------
DROP TYPE IF EXISTS "public"."jenis_izin";
CREATE TYPE "public"."jenis_izin" AS ENUM (
  'kbli',
  'sbu'
);
ALTER TYPE "public"."jenis_izin" OWNER TO "postgres";

-- ----------------------------
-- Type structure for jenis_izin_usaha
-- ----------------------------
DROP TYPE IF EXISTS "public"."jenis_izin_usaha";
CREATE TYPE "public"."jenis_izin_usaha" AS ENUM (
  'nib',
  'sbu',
  'lainnya'
);
ALTER TYPE "public"."jenis_izin_usaha" OWNER TO "postgres";

-- ----------------------------
-- Type structure for kondisi_barang
-- ----------------------------
DROP TYPE IF EXISTS "public"."kondisi_barang";
CREATE TYPE "public"."kondisi_barang" AS ENUM (
  'baik',
  'sedang',
  'kurang_baik'
);
ALTER TYPE "public"."kondisi_barang" OWNER TO "postgres";

-- ----------------------------
-- Type structure for metode_penjaringan
-- ----------------------------
DROP TYPE IF EXISTS "public"."metode_penjaringan";
CREATE TYPE "public"."metode_penjaringan" AS ENUM (
  'pengumuman',
  'undangan'
);
ALTER TYPE "public"."metode_penjaringan" OWNER TO "postgres";

-- ----------------------------
-- Type structure for status_aktif
-- ----------------------------
DROP TYPE IF EXISTS "public"."status_aktif";
CREATE TYPE "public"."status_aktif" AS ENUM (
  'aktif',
  'tidak_aktif'
);
ALTER TYPE "public"."status_aktif" OWNER TO "postgres";

-- ----------------------------
-- Type structure for status_aktivasi
-- ----------------------------
DROP TYPE IF EXISTS "public"."status_aktivasi";
CREATE TYPE "public"."status_aktivasi" AS ENUM (
  'non_aktif',
  'belum_aktif',
  'aktif'
);
ALTER TYPE "public"."status_aktivasi" OWNER TO "postgres";

-- ----------------------------
-- Type structure for status_dpt
-- ----------------------------
DROP TYPE IF EXISTS "public"."status_dpt";
CREATE TYPE "public"."status_dpt" AS ENUM (
  'belum_ditetapkan',
  'belum_penetapan',
  'terpilih',
  'tidak_terpilih'
);
ALTER TYPE "public"."status_dpt" OWNER TO "postgres";

-- ----------------------------
-- Type structure for status_form_dpt
-- ----------------------------
DROP TYPE IF EXISTS "public"."status_form_dpt";
CREATE TYPE "public"."status_form_dpt" AS ENUM (
  'proses',
  'ajukan_perubahan',
  'selesai',
  'proses_verifikasi',
  'perbaikan_verifikasi]',
  'belum_proses'
);
ALTER TYPE "public"."status_form_dpt" OWNER TO "postgres";

-- ----------------------------
-- Type structure for status_form_luar_dpt
-- ----------------------------
DROP TYPE IF EXISTS "public"."status_form_luar_dpt";
CREATE TYPE "public"."status_form_luar_dpt" AS ENUM (
  'proses',
  'ajukan_perubahan',
  'selesai',
  'proses_verifikasi',
  'perbaikan_verifikasi',
  'belum_proses'
);
ALTER TYPE "public"."status_form_luar_dpt" OWNER TO "postgres";

-- ----------------------------
-- Type structure for status_isian_vendor
-- ----------------------------
DROP TYPE IF EXISTS "public"."status_isian_vendor";
CREATE TYPE "public"."status_isian_vendor" AS ENUM (
  'pengisian',
  'screening',
  'perbaikan',
  'selesai'
);
ALTER TYPE "public"."status_isian_vendor" OWNER TO "postgres";

-- ----------------------------
-- Type structure for status_pembuatan_s_tugas
-- ----------------------------
DROP TYPE IF EXISTS "public"."status_pembuatan_s_tugas";
CREATE TYPE "public"."status_pembuatan_s_tugas" AS ENUM (
  'belum_diproses',
  'proses_ke_direktur',
  'selesai'
);
ALTER TYPE "public"."status_pembuatan_s_tugas" OWNER TO "postgres";

-- ----------------------------
-- Type structure for status_pengajuan_kat
-- ----------------------------
DROP TYPE IF EXISTS "public"."status_pengajuan_kat";
CREATE TYPE "public"."status_pengajuan_kat" AS ENUM (
  'draft',
  'proses_di_kasubdit',
  'proses_di_verifikator',
  'selesai'
);
ALTER TYPE "public"."status_pengajuan_kat" OWNER TO "postgres";

-- ----------------------------
-- Type structure for status_pengajuan_pjr
-- ----------------------------
DROP TYPE IF EXISTS "public"."status_pengajuan_pjr";
CREATE TYPE "public"."status_pengajuan_pjr" AS ENUM (
  'draft',
  'proses_di_kasubdit',
  'proses_di_verifikator',
  'selesai',
  'tolak'
);
ALTER TYPE "public"."status_pengajuan_pjr" OWNER TO "postgres";

-- ----------------------------
-- Type structure for status_pengisian_data_dpt
-- ----------------------------
DROP TYPE IF EXISTS "public"."status_pengisian_data_dpt";
CREATE TYPE "public"."status_pengisian_data_dpt" AS ENUM (
  'belum',
  'sudah'
);
ALTER TYPE "public"."status_pengisian_data_dpt" OWNER TO "postgres";

-- ----------------------------
-- Type structure for status_persetujuan
-- ----------------------------
DROP TYPE IF EXISTS "public"."status_persetujuan";
CREATE TYPE "public"."status_persetujuan" AS ENUM (
  'belum_diproses',
  'proses',
  'terima',
  'tolak'
);
ALTER TYPE "public"."status_persetujuan" OWNER TO "postgres";

-- ----------------------------
-- Type structure for status_proses_dpt
-- ----------------------------
DROP TYPE IF EXISTS "public"."status_proses_dpt";
CREATE TYPE "public"."status_proses_dpt" AS ENUM (
  'belum_diumumkan',
  'diproses_ke_kasubdit',
  'selesai'
);
ALTER TYPE "public"."status_proses_dpt" OWNER TO "postgres";

-- ----------------------------
-- Type structure for status_proses_pjr
-- ----------------------------
DROP TYPE IF EXISTS "public"."status_proses_pjr";
CREATE TYPE "public"."status_proses_pjr" AS ENUM (
  'belum_waktu_verifikasi',
  'proses',
  'proses_verifikasi',
  'proses_evaluasi',
  'selesai'
);
ALTER TYPE "public"."status_proses_pjr" OWNER TO "postgres";

-- ----------------------------
-- Type structure for status_undang
-- ----------------------------
DROP TYPE IF EXISTS "public"."status_undang";
CREATE TYPE "public"."status_undang" AS ENUM (
  'sudah_kirim_email',
  'belum_kirim_email'
);
ALTER TYPE "public"."status_undang" OWNER TO "postgres";

-- ----------------------------
-- Type structure for status_undang_vendor
-- ----------------------------
DROP TYPE IF EXISTS "public"."status_undang_vendor";
CREATE TYPE "public"."status_undang_vendor" AS ENUM (
  'undang',
  'tidak_undang'
);
ALTER TYPE "public"."status_undang_vendor" OWNER TO "postgres";

-- ----------------------------
-- Type structure for status_vendor
-- ----------------------------
DROP TYPE IF EXISTS "public"."status_vendor";
CREATE TYPE "public"."status_vendor" AS ENUM (
  'aktif',
  'dibekukan',
  'dikeluarkan'
);
ALTER TYPE "public"."status_vendor" OWNER TO "postgres";

-- ----------------------------
-- Type structure for status_verifikasi
-- ----------------------------
DROP TYPE IF EXISTS "public"."status_verifikasi";
CREATE TYPE "public"."status_verifikasi" AS ENUM (
  'belum_diproses',
  'proses_verifikasi',
  'perbaikan_data',
  'proses_evaluasi',
  'diterima',
  'ditolak',
  'proses_ba_verifikasi'
);
ALTER TYPE "public"."status_verifikasi" OWNER TO "postgres";

-- ----------------------------
-- Sequence structure for bridging_id_direksi_kode_bridging_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."bridging_id_direksi_kode_bridging_seq";
CREATE SEQUENCE "public"."bridging_id_direksi_kode_bridging_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 2147483647
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for helper_bank_kw_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."helper_bank_kw_id_seq";
CREATE SEQUENCE "public"."helper_bank_kw_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 2147483647
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for helper_dokumen_kode_helper_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."helper_dokumen_kode_helper_seq";
CREATE SEQUENCE "public"."helper_dokumen_kode_helper_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 2147483647
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for helper_jenjang_pendidikan_kw_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."helper_jenjang_pendidikan_kw_id_seq";
CREATE SEQUENCE "public"."helper_jenjang_pendidikan_kw_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 2147483647
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for helper_kategori_kw_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."helper_kategori_kw_id_seq";
CREATE SEQUENCE "public"."helper_kategori_kw_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 2147483647
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for helper_pengusul_pjr_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."helper_pengusul_pjr_id_seq";
CREATE SEQUENCE "public"."helper_pengusul_pjr_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 2147483647
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for helper_user_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."helper_user_id_seq";
CREATE SEQUENCE "public"."helper_user_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 2147483647
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for helper_user_nip_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."helper_user_nip_id_seq";
CREATE SEQUENCE "public"."helper_user_nip_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 2147483647
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for ref_adm_bu_kode_adm_bu_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."ref_adm_bu_kode_adm_bu_seq";
CREATE SEQUENCE "public"."ref_adm_bu_kode_adm_bu_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 2147483647
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for ref_administrasi_pero_kode_adm_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."ref_administrasi_pero_kode_adm_seq";
CREATE SEQUENCE "public"."ref_administrasi_pero_kode_adm_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 2147483647
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for ref_ambang_batas_penilaian_kode_ambang_batas_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."ref_ambang_batas_penilaian_kode_ambang_batas_seq";
CREATE SEQUENCE "public"."ref_ambang_batas_penilaian_kode_ambang_batas_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 2147483647
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for ref_bank_kode_bank_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."ref_bank_kode_bank_seq";
CREATE SEQUENCE "public"."ref_bank_kode_bank_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 2147483647
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for ref_data_pajak_bu_kode_data_pajak_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."ref_data_pajak_bu_kode_data_pajak_seq";
CREATE SEQUENCE "public"."ref_data_pajak_bu_kode_data_pajak_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 2147483647
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for ref_datadiri_kode_datadiri_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."ref_datadiri_kode_datadiri_seq";
CREATE SEQUENCE "public"."ref_datadiri_kode_datadiri_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 2147483647
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for ref_datadiri_umum_kode_datadiri_umum_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."ref_datadiri_umum_kode_datadiri_umum_seq";
CREATE SEQUENCE "public"."ref_datadiri_umum_kode_datadiri_umum_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 2147483647
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for ref_default_master_kode_default_master_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."ref_default_master_kode_default_master_seq";
CREATE SEQUENCE "public"."ref_default_master_kode_default_master_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 2147483647
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for ref_direksi_bu_custom_kode_direksi_custom_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."ref_direksi_bu_custom_kode_direksi_custom_seq";
CREATE SEQUENCE "public"."ref_direksi_bu_custom_kode_direksi_custom_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 2147483647
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for ref_direksi_bu_kode_direksi_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."ref_direksi_bu_kode_direksi_seq";
CREATE SEQUENCE "public"."ref_direksi_bu_kode_direksi_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 2147483647
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for ref_fasilitas_bu_custom_kode_fasilitas_custom_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."ref_fasilitas_bu_custom_kode_fasilitas_custom_seq";
CREATE SEQUENCE "public"."ref_fasilitas_bu_custom_kode_fasilitas_custom_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 2147483647
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for ref_fasilitas_bu_kode_fasilitas_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."ref_fasilitas_bu_kode_fasilitas_seq";
CREATE SEQUENCE "public"."ref_fasilitas_bu_kode_fasilitas_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 2147483647
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for ref_file_saham_kode_file_saham_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."ref_file_saham_kode_file_saham_seq";
CREATE SEQUENCE "public"."ref_file_saham_kode_file_saham_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 2147483647
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for ref_history_adm_bu_kode_adm_bu_history_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."ref_history_adm_bu_kode_adm_bu_history_seq";
CREATE SEQUENCE "public"."ref_history_adm_bu_kode_adm_bu_history_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 2147483647
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for ref_history_administrasi_pero_kode_adm_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."ref_history_administrasi_pero_kode_adm_seq";
CREATE SEQUENCE "public"."ref_history_administrasi_pero_kode_adm_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 2147483647
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for ref_history_data_pajak_bu_kode_data_pajak_history_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."ref_history_data_pajak_bu_kode_data_pajak_history_seq";
CREATE SEQUENCE "public"."ref_history_data_pajak_bu_kode_data_pajak_history_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 2147483647
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for ref_history_datadiri_umum_kode_datadiri_umum_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."ref_history_datadiri_umum_kode_datadiri_umum_seq";
CREATE SEQUENCE "public"."ref_history_datadiri_umum_kode_datadiri_umum_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 2147483647
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for ref_history_direksi_bu_kode_direksi_history_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."ref_history_direksi_bu_kode_direksi_history_seq";
CREATE SEQUENCE "public"."ref_history_direksi_bu_kode_direksi_history_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 2147483647
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for ref_history_fasilitas_bu_kode_fasilitas_history_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."ref_history_fasilitas_bu_kode_fasilitas_history_seq";
CREATE SEQUENCE "public"."ref_history_fasilitas_bu_kode_fasilitas_history_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 2147483647
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for ref_history_izin_usaha_bu_kode_izin_usaha_history_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."ref_history_izin_usaha_bu_kode_izin_usaha_history_seq";
CREATE SEQUENCE "public"."ref_history_izin_usaha_bu_kode_izin_usaha_history_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 2147483647
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for ref_history_kantor_bu_kode_kantor_history_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."ref_history_kantor_bu_kode_kantor_history_seq";
CREATE SEQUENCE "public"."ref_history_kantor_bu_kode_kantor_history_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 2147483647
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for ref_history_keuangan_bu_kode_keuangan_history_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."ref_history_keuangan_bu_kode_keuangan_history_seq";
CREATE SEQUENCE "public"."ref_history_keuangan_bu_kode_keuangan_history_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 2147483647
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for ref_history_keuangan_pero_kode_keuangan_history_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."ref_history_keuangan_pero_kode_keuangan_history_seq";
CREATE SEQUENCE "public"."ref_history_keuangan_pero_kode_keuangan_history_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 2147483647
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for ref_history_komisaris_bu_kode_komisaris_history_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."ref_history_komisaris_bu_kode_komisaris_history_seq";
CREATE SEQUENCE "public"."ref_history_komisaris_bu_kode_komisaris_history_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 2147483647
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for ref_history_lan_hukum_bu_kode_lan_hukum_history_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."ref_history_lan_hukum_bu_kode_lan_hukum_history_seq";
CREATE SEQUENCE "public"."ref_history_lan_hukum_bu_kode_lan_hukum_history_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 2147483647
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for ref_history_pengalaman_bu_kode_pengalaman_bu_history_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."ref_history_pengalaman_bu_kode_pengalaman_bu_history_seq";
CREATE SEQUENCE "public"."ref_history_pengalaman_bu_kode_pengalaman_bu_history_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 2147483647
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for ref_history_pengalaman_pero_kode_pengalaman_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."ref_history_pengalaman_pero_kode_pengalaman_seq";
CREATE SEQUENCE "public"."ref_history_pengalaman_pero_kode_pengalaman_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 2147483647
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for ref_history_pengalaman_ta_kode_pengalaman_ta_history_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."ref_history_pengalaman_ta_kode_pengalaman_ta_history_seq";
CREATE SEQUENCE "public"."ref_history_pengalaman_ta_kode_pengalaman_ta_history_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 2147483647
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for ref_history_pengalaman_tp_kode_pengalaman_tp_history_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."ref_history_pengalaman_tp_kode_pengalaman_tp_history_seq";
CREATE SEQUENCE "public"."ref_history_pengalaman_tp_kode_pengalaman_tp_history_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 2147483647
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for ref_history_pengurus_bu_kode_pengurus_bu_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."ref_history_pengurus_bu_kode_pengurus_bu_seq";
CREATE SEQUENCE "public"."ref_history_pengurus_bu_kode_pengurus_bu_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 2147483647
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for ref_history_personalia_pero_kode_personalia_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."ref_history_personalia_pero_kode_personalia_seq";
CREATE SEQUENCE "public"."ref_history_personalia_pero_kode_personalia_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 2147483647
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for ref_history_saham_bu_kode_saham_history_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."ref_history_saham_bu_kode_saham_history_seq";
CREATE SEQUENCE "public"."ref_history_saham_bu_kode_saham_history_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 2147483647
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for ref_history_sertif_pero_kode_sertif_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."ref_history_sertif_pero_kode_sertif_seq";
CREATE SEQUENCE "public"."ref_history_sertif_pero_kode_sertif_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 2147483647
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for ref_history_sertif_ta_kode_sertif_ta_history_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."ref_history_sertif_ta_kode_sertif_ta_history_seq";
CREATE SEQUENCE "public"."ref_history_sertif_ta_kode_sertif_ta_history_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 2147483647
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for ref_history_sertif_tp_kode_sertif_tp_history_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."ref_history_sertif_tp_kode_sertif_tp_history_seq";
CREATE SEQUENCE "public"."ref_history_sertif_tp_kode_sertif_tp_history_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 2147483647
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for ref_history_sertifikat_usaha__kode_sertifikat_usaha_history_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."ref_history_sertifikat_usaha__kode_sertifikat_usaha_history_seq";
CREATE SEQUENCE "public"."ref_history_sertifikat_usaha__kode_sertifikat_usaha_history_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 2147483647
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for ref_history_tenaga_ahli_bu_kode_tenaga_ahli_history_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."ref_history_tenaga_ahli_bu_kode_tenaga_ahli_history_seq";
CREATE SEQUENCE "public"."ref_history_tenaga_ahli_bu_kode_tenaga_ahli_history_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 2147483647
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for ref_history_tenaga_pendukung__kode_tenaga_pendukung_history_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."ref_history_tenaga_pendukung__kode_tenaga_pendukung_history_seq";
CREATE SEQUENCE "public"."ref_history_tenaga_pendukung__kode_tenaga_pendukung_history_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 2147483647
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for ref_history_umum_kode_umum_history_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."ref_history_umum_kode_umum_history_seq";
CREATE SEQUENCE "public"."ref_history_umum_kode_umum_history_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 2147483647
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for ref_history_vendor_kode_vendor_history_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."ref_history_vendor_kode_vendor_history_seq";
CREATE SEQUENCE "public"."ref_history_vendor_kode_vendor_history_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 2147483647
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for ref_item_tanya_kode_item_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."ref_item_tanya_kode_item_seq";
CREATE SEQUENCE "public"."ref_item_tanya_kode_item_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 2147483647
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for ref_item_tanya_tpl_kode_tpl_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."ref_item_tanya_tpl_kode_tpl_seq";
CREATE SEQUENCE "public"."ref_item_tanya_tpl_kode_tpl_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 2147483647
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for ref_izin_usaha_bu_custom_kode_izin_usaha_custom_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."ref_izin_usaha_bu_custom_kode_izin_usaha_custom_seq";
CREATE SEQUENCE "public"."ref_izin_usaha_bu_custom_kode_izin_usaha_custom_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 2147483647
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for ref_izin_usaha_bu_kode_izin_usaha_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."ref_izin_usaha_bu_kode_izin_usaha_seq";
CREATE SEQUENCE "public"."ref_izin_usaha_bu_kode_izin_usaha_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 2147483647
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for ref_kantor_bu_custom_kode_kantor_custom_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."ref_kantor_bu_custom_kode_kantor_custom_seq";
CREATE SEQUENCE "public"."ref_kantor_bu_custom_kode_kantor_custom_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 2147483647
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for ref_kantor_bu_kode_kantor_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."ref_kantor_bu_kode_kantor_seq";
CREATE SEQUENCE "public"."ref_kantor_bu_kode_kantor_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 2147483647
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for ref_kat_item_tanya_kode_kat_item_tanya_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."ref_kat_item_tanya_kode_kat_item_tanya_seq";
CREATE SEQUENCE "public"."ref_kat_item_tanya_kode_kat_item_tanya_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 2147483647
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for ref_kat_persyaratan_kode_kat_persyaratan_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."ref_kat_persyaratan_kode_kat_persyaratan_seq";
CREATE SEQUENCE "public"."ref_kat_persyaratan_kode_kat_persyaratan_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 2147483647
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for ref_kategori_kode_kategori_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."ref_kategori_kode_kategori_seq";
CREATE SEQUENCE "public"."ref_kategori_kode_kategori_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 2147483647
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for ref_kbli_sbu_kode_kbli_sbu_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."ref_kbli_sbu_kode_kbli_sbu_seq";
CREATE SEQUENCE "public"."ref_kbli_sbu_kode_kbli_sbu_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 2147483647
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for ref_keuangan_bu_kode_keuangan_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."ref_keuangan_bu_kode_keuangan_seq";
CREATE SEQUENCE "public"."ref_keuangan_bu_kode_keuangan_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 2147483647
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for ref_keuangan_pero_kode_keuangan_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."ref_keuangan_pero_kode_keuangan_seq";
CREATE SEQUENCE "public"."ref_keuangan_pero_kode_keuangan_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 2147483647
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for ref_komisaris_bu_custom_kode_komisaris_custom_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."ref_komisaris_bu_custom_kode_komisaris_custom_seq";
CREATE SEQUENCE "public"."ref_komisaris_bu_custom_kode_komisaris_custom_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 2147483647
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for ref_komisaris_bu_kode_komisaris_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."ref_komisaris_bu_kode_komisaris_seq";
CREATE SEQUENCE "public"."ref_komisaris_bu_kode_komisaris_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 2147483647
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for ref_lan_hukum_bu_kode_lan_hukum_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."ref_lan_hukum_bu_kode_lan_hukum_seq";
CREATE SEQUENCE "public"."ref_lan_hukum_bu_kode_lan_hukum_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 2147483647
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for ref_pakta_integritas_kode_pakta_integritas_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."ref_pakta_integritas_kode_pakta_integritas_seq";
CREATE SEQUENCE "public"."ref_pakta_integritas_kode_pakta_integritas_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 2147483647
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for ref_penanggung_jwb_kode_penanggung_jwb_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."ref_penanggung_jwb_kode_penanggung_jwb_seq";
CREATE SEQUENCE "public"."ref_penanggung_jwb_kode_penanggung_jwb_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 2147483647
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for ref_pengalaman_bu_custom_kode_pengalaman_bu_custom_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."ref_pengalaman_bu_custom_kode_pengalaman_bu_custom_seq";
CREATE SEQUENCE "public"."ref_pengalaman_bu_custom_kode_pengalaman_bu_custom_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 2147483647
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for ref_pengalaman_bu_kode_pengalaman_bu_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."ref_pengalaman_bu_kode_pengalaman_bu_seq";
CREATE SEQUENCE "public"."ref_pengalaman_bu_kode_pengalaman_bu_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 2147483647
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for ref_pengalaman_pero_custom_kode_pengalaman_custom_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."ref_pengalaman_pero_custom_kode_pengalaman_custom_seq";
CREATE SEQUENCE "public"."ref_pengalaman_pero_custom_kode_pengalaman_custom_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 2147483647
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for ref_pengalaman_pero_kode_pengalaman_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."ref_pengalaman_pero_kode_pengalaman_seq";
CREATE SEQUENCE "public"."ref_pengalaman_pero_kode_pengalaman_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 2147483647
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for ref_pengalaman_ta_custom_kode_pengalaman_ta_custom_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."ref_pengalaman_ta_custom_kode_pengalaman_ta_custom_seq";
CREATE SEQUENCE "public"."ref_pengalaman_ta_custom_kode_pengalaman_ta_custom_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 2147483647
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for ref_pengalaman_ta_kode_pengalaman_ta_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."ref_pengalaman_ta_kode_pengalaman_ta_seq";
CREATE SEQUENCE "public"."ref_pengalaman_ta_kode_pengalaman_ta_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 2147483647
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for ref_pengalaman_tp_custom_kode_pengalaman_tp_custom_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."ref_pengalaman_tp_custom_kode_pengalaman_tp_custom_seq";
CREATE SEQUENCE "public"."ref_pengalaman_tp_custom_kode_pengalaman_tp_custom_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 2147483647
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for ref_pengalaman_tp_kode_pengalaman_tp_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."ref_pengalaman_tp_kode_pengalaman_tp_seq";
CREATE SEQUENCE "public"."ref_pengalaman_tp_kode_pengalaman_tp_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 2147483647
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for ref_pengurus_bu_kode_pengurus_bu_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."ref_pengurus_bu_kode_pengurus_bu_seq";
CREATE SEQUENCE "public"."ref_pengurus_bu_kode_pengurus_bu_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 2147483647
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for ref_pengurus_bu_verif_kode_verif_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."ref_pengurus_bu_verif_kode_verif_seq";
CREATE SEQUENCE "public"."ref_pengurus_bu_verif_kode_verif_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 2147483647
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for ref_persentase_penilaian_kode_persentase_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."ref_persentase_penilaian_kode_persentase_seq";
CREATE SEQUENCE "public"."ref_persentase_penilaian_kode_persentase_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 2147483647
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for ref_persentasi_evaluasi_kode_persentase_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."ref_persentasi_evaluasi_kode_persentase_seq";
CREATE SEQUENCE "public"."ref_persentasi_evaluasi_kode_persentase_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 2147483647
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for ref_personalia_pero_kode_personalia_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."ref_personalia_pero_kode_personalia_seq";
CREATE SEQUENCE "public"."ref_personalia_pero_kode_personalia_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 2147483647
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for ref_saham_bu_custom_kode_saham_custom_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."ref_saham_bu_custom_kode_saham_custom_seq";
CREATE SEQUENCE "public"."ref_saham_bu_custom_kode_saham_custom_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 2147483647
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for ref_saham_bu_kode_saham_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."ref_saham_bu_kode_saham_seq";
CREATE SEQUENCE "public"."ref_saham_bu_kode_saham_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 2147483647
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for ref_sertif_pero_custom_kode_sertif_pero_custom_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."ref_sertif_pero_custom_kode_sertif_pero_custom_seq";
CREATE SEQUENCE "public"."ref_sertif_pero_custom_kode_sertif_pero_custom_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 2147483647
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for ref_sertif_pero_kode_sertif_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."ref_sertif_pero_kode_sertif_seq";
CREATE SEQUENCE "public"."ref_sertif_pero_kode_sertif_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 2147483647
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for ref_sertif_ta_custom_kode_sertif_ta_custom_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."ref_sertif_ta_custom_kode_sertif_ta_custom_seq";
CREATE SEQUENCE "public"."ref_sertif_ta_custom_kode_sertif_ta_custom_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 2147483647
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for ref_sertif_ta_kode_sertif_ta_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."ref_sertif_ta_kode_sertif_ta_seq";
CREATE SEQUENCE "public"."ref_sertif_ta_kode_sertif_ta_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 2147483647
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for ref_sertif_tp_custom_kode_sertif_tp_custom_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."ref_sertif_tp_custom_kode_sertif_tp_custom_seq";
CREATE SEQUENCE "public"."ref_sertif_tp_custom_kode_sertif_tp_custom_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 2147483647
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for ref_sertif_tp_kode_sertif_tp_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."ref_sertif_tp_kode_sertif_tp_seq";
CREATE SEQUENCE "public"."ref_sertif_tp_kode_sertif_tp_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 2147483647
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for ref_sertifikat_usaha_bu_custom_kode_sertifikat_usaha_custom_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."ref_sertifikat_usaha_bu_custom_kode_sertifikat_usaha_custom_seq";
CREATE SEQUENCE "public"."ref_sertifikat_usaha_bu_custom_kode_sertifikat_usaha_custom_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 2147483647
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for ref_sertifikat_usaha_bu_kode_sertifikat_usaha_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."ref_sertifikat_usaha_bu_kode_sertifikat_usaha_seq";
CREATE SEQUENCE "public"."ref_sertifikat_usaha_bu_kode_sertifikat_usaha_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 2147483647
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for ref_status_keluar_dpt_kode_status_keluar_dpt_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."ref_status_keluar_dpt_kode_status_keluar_dpt_seq";
CREATE SEQUENCE "public"."ref_status_keluar_dpt_kode_status_keluar_dpt_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 2147483647
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for ref_subkat_persyaratan_kode_subkat_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."ref_subkat_persyaratan_kode_subkat_seq";
CREATE SEQUENCE "public"."ref_subkat_persyaratan_kode_subkat_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 2147483647
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for ref_tenaga_ahli_bu_custom_kode_tenaga_ahli_custom_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."ref_tenaga_ahli_bu_custom_kode_tenaga_ahli_custom_seq";
CREATE SEQUENCE "public"."ref_tenaga_ahli_bu_custom_kode_tenaga_ahli_custom_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 2147483647
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for ref_tenaga_ahli_bu_kode_tenaga_ahli_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."ref_tenaga_ahli_bu_kode_tenaga_ahli_seq";
CREATE SEQUENCE "public"."ref_tenaga_ahli_bu_kode_tenaga_ahli_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 2147483647
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for ref_tenaga_pendukung_bu_custom_kode_tenaga_pendukung_custom_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."ref_tenaga_pendukung_bu_custom_kode_tenaga_pendukung_custom_seq";
CREATE SEQUENCE "public"."ref_tenaga_pendukung_bu_custom_kode_tenaga_pendukung_custom_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 2147483647
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for ref_tenaga_pendukung_bu_kode_tenaga_pendukung_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."ref_tenaga_pendukung_bu_kode_tenaga_pendukung_seq";
CREATE SEQUENCE "public"."ref_tenaga_pendukung_bu_kode_tenaga_pendukung_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 2147483647
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for ref_umum_kode_umum_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."ref_umum_kode_umum_seq";
CREATE SEQUENCE "public"."ref_umum_kode_umum_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 2147483647
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for ref_v_keluar_dpt_kode_v_keluar_dpt_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."ref_v_keluar_dpt_kode_v_keluar_dpt_seq";
CREATE SEQUENCE "public"."ref_v_keluar_dpt_kode_v_keluar_dpt_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 2147483647
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for ref_vendor_kode_vendor_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."ref_vendor_kode_vendor_seq";
CREATE SEQUENCE "public"."ref_vendor_kode_vendor_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 2147483647
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for ref_vendor_penandatangan_kode_vp_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."ref_vendor_penandatangan_kode_vp_seq";
CREATE SEQUENCE "public"."ref_vendor_penandatangan_kode_vp_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 2147483647
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for ref_vendor_reg_history_kode_register_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."ref_vendor_reg_history_kode_register_seq";
CREATE SEQUENCE "public"."ref_vendor_reg_history_kode_register_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 2147483647
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for ref_vendor_register_kode_register_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."ref_vendor_register_kode_register_seq";
CREATE SEQUENCE "public"."ref_vendor_register_kode_register_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 2147483647
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for ref_verif_adm_bu_kode_verif_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."ref_verif_adm_bu_kode_verif_seq";
CREATE SEQUENCE "public"."ref_verif_adm_bu_kode_verif_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 2147483647
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for ref_verif_administrasi_pero_kode_verif_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."ref_verif_administrasi_pero_kode_verif_seq";
CREATE SEQUENCE "public"."ref_verif_administrasi_pero_kode_verif_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 2147483647
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for ref_verif_data_pajak_bu_kode_verif_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."ref_verif_data_pajak_bu_kode_verif_seq";
CREATE SEQUENCE "public"."ref_verif_data_pajak_bu_kode_verif_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 2147483647
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for ref_verif_datadiri_kode_verif_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."ref_verif_datadiri_kode_verif_seq";
CREATE SEQUENCE "public"."ref_verif_datadiri_kode_verif_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 2147483647
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for ref_verif_datadiri_umum_kode_verif_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."ref_verif_datadiri_umum_kode_verif_seq";
CREATE SEQUENCE "public"."ref_verif_datadiri_umum_kode_verif_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 2147483647
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for ref_verif_direksi_kode_verif_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."ref_verif_direksi_kode_verif_seq";
CREATE SEQUENCE "public"."ref_verif_direksi_kode_verif_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 2147483647
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for ref_verif_fasilitas_bu_kode_verif_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."ref_verif_fasilitas_bu_kode_verif_seq";
CREATE SEQUENCE "public"."ref_verif_fasilitas_bu_kode_verif_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 2147483647
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for ref_verif_izin_usaha_bu_kode_verif_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."ref_verif_izin_usaha_bu_kode_verif_seq";
CREATE SEQUENCE "public"."ref_verif_izin_usaha_bu_kode_verif_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 2147483647
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for ref_verif_kantor_bu_kode_verif_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."ref_verif_kantor_bu_kode_verif_seq";
CREATE SEQUENCE "public"."ref_verif_kantor_bu_kode_verif_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 2147483647
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for ref_verif_keuangan_bu_kode_verif_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."ref_verif_keuangan_bu_kode_verif_seq";
CREATE SEQUENCE "public"."ref_verif_keuangan_bu_kode_verif_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 2147483647
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for ref_verif_keuangan_pero_kode_verif_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."ref_verif_keuangan_pero_kode_verif_seq";
CREATE SEQUENCE "public"."ref_verif_keuangan_pero_kode_verif_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 2147483647
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for ref_verif_komisaris_kode_verif_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."ref_verif_komisaris_kode_verif_seq";
CREATE SEQUENCE "public"."ref_verif_komisaris_kode_verif_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 2147483647
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for ref_verif_lan_hukum_bu_kode_verif_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."ref_verif_lan_hukum_bu_kode_verif_seq";
CREATE SEQUENCE "public"."ref_verif_lan_hukum_bu_kode_verif_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 2147483647
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for ref_verif_pengalaman_bu_kode_verif_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."ref_verif_pengalaman_bu_kode_verif_seq";
CREATE SEQUENCE "public"."ref_verif_pengalaman_bu_kode_verif_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 2147483647
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for ref_verif_pengalaman_pero_kode_verif_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."ref_verif_pengalaman_pero_kode_verif_seq";
CREATE SEQUENCE "public"."ref_verif_pengalaman_pero_kode_verif_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 2147483647
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for ref_verif_personalia_pero_kode_verif_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."ref_verif_personalia_pero_kode_verif_seq";
CREATE SEQUENCE "public"."ref_verif_personalia_pero_kode_verif_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 2147483647
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for ref_verif_saham_bu_kode_verif_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."ref_verif_saham_bu_kode_verif_seq";
CREATE SEQUENCE "public"."ref_verif_saham_bu_kode_verif_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 2147483647
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for ref_verif_sertif_pero_kode_verif_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."ref_verif_sertif_pero_kode_verif_seq";
CREATE SEQUENCE "public"."ref_verif_sertif_pero_kode_verif_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 2147483647
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for ref_verif_sertifikat_usaha_bu_kode_verif_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."ref_verif_sertifikat_usaha_bu_kode_verif_seq";
CREATE SEQUENCE "public"."ref_verif_sertifikat_usaha_bu_kode_verif_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 2147483647
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for ref_verif_tenaga_ahli_bu_kode_verif_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."ref_verif_tenaga_ahli_bu_kode_verif_seq";
CREATE SEQUENCE "public"."ref_verif_tenaga_ahli_bu_kode_verif_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 2147483647
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for ref_verif_tenaga_pendukung_bu_kode_verif_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."ref_verif_tenaga_pendukung_bu_kode_verif_seq";
CREATE SEQUENCE "public"."ref_verif_tenaga_pendukung_bu_kode_verif_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 2147483647
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for ref_verif_umum_kode_verif_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."ref_verif_umum_kode_verif_seq";
CREATE SEQUENCE "public"."ref_verif_umum_kode_verif_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 2147483647
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for trx_custom_item_kode_ci_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."trx_custom_item_kode_ci_seq";
CREATE SEQUENCE "public"."trx_custom_item_kode_ci_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 2147483647
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for trx_custom_table_kode_custom_table_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."trx_custom_table_kode_custom_table_seq";
CREATE SEQUENCE "public"."trx_custom_table_kode_custom_table_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 2147483647
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for trx_izin_kbli_sbu_custom_kode_trx_iks_custom_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."trx_izin_kbli_sbu_custom_kode_trx_iks_custom_seq";
CREATE SEQUENCE "public"."trx_izin_kbli_sbu_custom_kode_trx_iks_custom_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 2147483647
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for trx_izin_kbli_sbu_kode_trx_kbli_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."trx_izin_kbli_sbu_kode_trx_kbli_seq";
CREATE SEQUENCE "public"."trx_izin_kbli_sbu_kode_trx_kbli_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 2147483647
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for trx_kat_j_vendor_kode_kat_j_vendor_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."trx_kat_j_vendor_kode_kat_j_vendor_seq";
CREATE SEQUENCE "public"."trx_kat_j_vendor_kode_kat_j_vendor_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 2147483647
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for trx_kategori_kode_trx_kategori_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."trx_kategori_kode_trx_kategori_seq";
CREATE SEQUENCE "public"."trx_kategori_kode_trx_kategori_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 2147483647
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for trx_kbli_custom_kode_trx_kbli_custom_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."trx_kbli_custom_kode_trx_kbli_custom_seq";
CREATE SEQUENCE "public"."trx_kbli_custom_kode_trx_kbli_custom_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 2147483647
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for trx_kehadiran_verif_kode_kehadiran_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."trx_kehadiran_verif_kode_kehadiran_seq";
CREATE SEQUENCE "public"."trx_kehadiran_verif_kode_kehadiran_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 2147483647
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for trx_ketentuan_umum_khusus_kode_kuk_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."trx_ketentuan_umum_khusus_kode_kuk_seq";
CREATE SEQUENCE "public"."trx_ketentuan_umum_khusus_kode_kuk_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 2147483647
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for trx_konfirmasi_data_sesuai_kode_complete_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."trx_konfirmasi_data_sesuai_kode_complete_seq";
CREATE SEQUENCE "public"."trx_konfirmasi_data_sesuai_kode_complete_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 2147483647
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for trx_kualifikasi_usaha_penjr_kode_trx_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."trx_kualifikasi_usaha_penjr_kode_trx_seq";
CREATE SEQUENCE "public"."trx_kualifikasi_usaha_penjr_kode_trx_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 2147483647
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for trx_nilai_akhir_kode_penilaian_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."trx_nilai_akhir_kode_penilaian_seq";
CREATE SEQUENCE "public"."trx_nilai_akhir_kode_penilaian_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 2147483647
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for trx_penjaringan_kode_penjaringan_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."trx_penjaringan_kode_penjaringan_seq";
CREATE SEQUENCE "public"."trx_penjaringan_kode_penjaringan_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 2147483647
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for trx_tim_teknis_pendukung_kode_tim_teknis_pendukung_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."trx_tim_teknis_pendukung_kode_tim_teknis_pendukung_seq";
CREATE SEQUENCE "public"."trx_tim_teknis_pendukung_kode_tim_teknis_pendukung_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 2147483647
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for trx_undangan_pemeriksaan_keluar_dpt_kode_undangan_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."trx_undangan_pemeriksaan_keluar_dpt_kode_undangan_seq";
CREATE SEQUENCE "public"."trx_undangan_pemeriksaan_keluar_dpt_kode_undangan_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 2147483647
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for trx_undangan_penjr_kode_und_penjr_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."trx_undangan_penjr_kode_und_penjr_seq";
CREATE SEQUENCE "public"."trx_undangan_penjr_kode_und_penjr_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 2147483647
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for trx_undangan_verif_kode_undangan_verif_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."trx_undangan_verif_kode_undangan_verif_seq";
CREATE SEQUENCE "public"."trx_undangan_verif_kode_undangan_verif_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 2147483647
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for trx_vendor_penjr_kode_vendor_penjr_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."trx_vendor_penjr_kode_vendor_penjr_seq";
CREATE SEQUENCE "public"."trx_vendor_penjr_kode_vendor_penjr_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 2147483647
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for trx_verif_luar_dpt_kode_verif_luar_dpt_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."trx_verif_luar_dpt_kode_verif_luar_dpt_seq";
CREATE SEQUENCE "public"."trx_verif_luar_dpt_kode_verif_luar_dpt_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 2147483647
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for trx_verifikator_penjr_kode_verifikator_penjr_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."trx_verifikator_penjr_kode_verifikator_penjr_seq";
CREATE SEQUENCE "public"."trx_verifikator_penjr_kode_verifikator_penjr_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 2147483647
START 1
CACHE 1;

-- ----------------------------
-- Table structure for bridging_id_direksi
-- ----------------------------
DROP TABLE IF EXISTS "public"."bridging_id_direksi";
CREATE TABLE "public"."bridging_id_direksi" (
  "kode_bridging" int4 NOT NULL DEFAULT nextval('bridging_id_direksi_kode_bridging_seq'::regclass),
  "id_direksi_perus" int4,
  "dpt_penyedia" varchar(50) COLLATE "pg_catalog"."default",
  "kode_direksi" int4,
  "jbtn_direksi" varchar(255) COLLATE "pg_catalog"."default"
)
;

-- ----------------------------
-- Table structure for helper_bank_kw
-- ----------------------------
DROP TABLE IF EXISTS "public"."helper_bank_kw";
CREATE TABLE "public"."helper_bank_kw" (
  "id" int4 NOT NULL DEFAULT nextval('helper_bank_kw_id_seq'::regclass),
  "keyword" varchar(255) COLLATE "pg_catalog"."default",
  "sandi_bank" varchar(4) COLLATE "pg_catalog"."default"
)
;

-- ----------------------------
-- Table structure for helper_dokumen
-- ----------------------------
DROP TABLE IF EXISTS "public"."helper_dokumen";
CREATE TABLE "public"."helper_dokumen" (
  "kode_helper" int4 NOT NULL DEFAULT nextval('helper_dokumen_kode_helper_seq'::regclass),
  "app_name" varchar(20) COLLATE "pg_catalog"."default",
  "original_path" varchar(255) COLLATE "pg_catalog"."default" NOT NULL,
  "newfilename" varchar(255) COLLATE "pg_catalog"."default",
  "encrypt_key" varchar(255) COLLATE "pg_catalog"."default"
)
;

-- ----------------------------
-- Table structure for helper_domisili
-- ----------------------------
DROP TABLE IF EXISTS "public"."helper_domisili";
CREATE TABLE "public"."helper_domisili" (
  "kode_domisili" int4 NOT NULL,
  "nama_domisili" varchar COLLATE "pg_catalog"."default",
  "kode_kab_kota" varchar(5) COLLATE "pg_catalog"."default"
)
;

-- ----------------------------
-- Table structure for helper_jenjang_pendidikan_kw
-- ----------------------------
DROP TABLE IF EXISTS "public"."helper_jenjang_pendidikan_kw";
CREATE TABLE "public"."helper_jenjang_pendidikan_kw" (
  "id" int4 NOT NULL DEFAULT nextval('helper_jenjang_pendidikan_kw_id_seq'::regclass),
  "keyword" varchar(255) COLLATE "pg_catalog"."default",
  "jenjang_pendidikan" varchar(20) COLLATE "pg_catalog"."default"
)
;

-- ----------------------------
-- Table structure for helper_kategori_kw
-- ----------------------------
DROP TABLE IF EXISTS "public"."helper_kategori_kw";
CREATE TABLE "public"."helper_kategori_kw" (
  "id" int4 NOT NULL DEFAULT nextval('helper_kategori_kw_id_seq'::regclass),
  "keyword" varchar COLLATE "pg_catalog"."default",
  "kode_kategori" int4,
  "kode_jenis_pengadaan" int4
)
;
COMMENT ON TABLE "public"."helper_kategori_kw" IS 'table sementara untuk bantu migrasi';

-- ----------------------------
-- Table structure for helper_pengusul_pjr
-- ----------------------------
DROP TABLE IF EXISTS "public"."helper_pengusul_pjr";
CREATE TABLE "public"."helper_pengusul_pjr" (
  "id" int4 NOT NULL DEFAULT nextval('helper_pengusul_pjr_id_seq'::regclass),
  "nama_penjaringan" varchar COLLATE "pg_catalog"."default",
  "kode_jabatan_ppk" int4
)
;
COMMENT ON TABLE "public"."helper_pengusul_pjr" IS 'table sementara untuk bantu migrasi';

-- ----------------------------
-- Table structure for helper_user
-- ----------------------------
DROP TABLE IF EXISTS "public"."helper_user";
CREATE TABLE "public"."helper_user" (
  "id" int4 NOT NULL DEFAULT nextval('helper_user_id_seq'::regclass),
  "vms_user_id" int4,
  "vms_user_name" varchar(255) COLLATE "pg_catalog"."default",
  "vms_user_level" int4,
  "vms_user_email" varchar(255) COLLATE "pg_catalog"."default",
  "vms_user_email_real" varchar(255) COLLATE "pg_catalog"."default",
  "vms_user_pass" varchar(255) COLLATE "pg_catalog"."default",
  "vms_user_created_at" timestamptz(6),
  "vms_user_updated_at" timestamptz(6),
  "nip" varchar(30) COLLATE "pg_catalog"."default",
  "kode_unit" varchar(30) COLLATE "pg_catalog"."default",
  "jabatan" varchar(255) COLLATE "pg_catalog"."default",
  "status_user" varchar(50) COLLATE "pg_catalog"."default",
  "kode_penandatangan" int4,
  "db_penyedia" varchar(255) COLLATE "pg_catalog"."default",
  "nama_penyedia" varchar(255) COLLATE "pg_catalog"."default",
  "jenis_penyedia" varchar(255) COLLATE "pg_catalog"."default",
  "usman_ref_user_id" int4,
  "kode_vendor" int4
)
;

-- ----------------------------
-- Table structure for helper_user_nip
-- ----------------------------
DROP TABLE IF EXISTS "public"."helper_user_nip";
CREATE TABLE "public"."helper_user_nip" (
  "id" int4 NOT NULL DEFAULT nextval('helper_user_nip_id_seq'::regclass),
  "id_user" int4,
  "nip" varchar(30) COLLATE "pg_catalog"."default"
)
;

-- ----------------------------
-- Table structure for ref_adm_bu
-- ----------------------------
DROP TABLE IF EXISTS "public"."ref_adm_bu";
CREATE TABLE "public"."ref_adm_bu" (
  "kode_adm_bu" int4 NOT NULL DEFAULT nextval('ref_adm_bu_kode_adm_bu_seq'::regclass),
  "kode_vendor" int4,
  "file_fis" text COLLATE "pg_catalog"."default",
  "encrypt_key_fis" varchar(255) COLLATE "pg_catalog"."default",
  "file_s_kuasa" text COLLATE "pg_catalog"."default",
  "encrypt_key_s_kuasa" varchar(255) COLLATE "pg_catalog"."default",
  "file_spkd" text COLLATE "pg_catalog"."default",
  "encrypt_key_spkd" varchar(255) COLLATE "pg_catalog"."default",
  "revisi_ke" int2 NOT NULL DEFAULT 0
)
;
COMMENT ON COLUMN "public"."ref_adm_bu"."file_fis" IS 'Form Ikut Serta';
COMMENT ON COLUMN "public"."ref_adm_bu"."file_s_kuasa" IS 'Surat Kuasa';
COMMENT ON COLUMN "public"."ref_adm_bu"."file_spkd" IS 'Surat Pernyataan Kebenaran Data';
COMMENT ON TABLE "public"."ref_adm_bu" IS 'Administrasi (Badan Usaha)';

-- ----------------------------
-- Table structure for ref_administrasi_pero
-- ----------------------------
DROP TABLE IF EXISTS "public"."ref_administrasi_pero";
CREATE TABLE "public"."ref_administrasi_pero" (
  "kode_adm" int4 NOT NULL DEFAULT nextval('ref_administrasi_pero_kode_adm_seq'::regclass),
  "kode_vendor" int4,
  "file_skd" varchar(255) COLLATE "pg_catalog"."default",
  "file_bukti_spt" varchar(255) COLLATE "pg_catalog"."default",
  "is_bukti_spt_selamanya" bool,
  "bukti_spt_berlaku_awal" date,
  "bukti_spt_berlaku_akhir" date,
  "encrypt_key_bukti_spt" varchar(255) COLLATE "pg_catalog"."default",
  "file_skb_pph23" varchar(255) COLLATE "pg_catalog"."default",
  "is_skb_pph23_selamanya" bool,
  "skb_pph23_berlaku_awal" date,
  "skb_pph23_berlaku_akhir" date,
  "encrypt_key_skb_pph23" varchar(255) COLLATE "pg_catalog"."default",
  "file_sk_pp23" varchar(255) COLLATE "pg_catalog"."default",
  "is_sk_pp23_selamanya" bool,
  "sk_pp23_berlaku_awal" date,
  "sk_pp23_berlaku_akhir" date,
  "encrypt_key_sk_pp23" varchar(255) COLLATE "pg_catalog"."default",
  "file_non_pkp" varchar(255) COLLATE "pg_catalog"."default",
  "revisi_ke" int2 NOT NULL DEFAULT 0,
  "encrypt_key_skd" varchar COLLATE "pg_catalog"."default",
  "encrypt_key_non_pkp" varchar COLLATE "pg_catalog"."default"
)
;
COMMENT ON COLUMN "public"."ref_administrasi_pero"."file_skd" IS 'Surat Kebenaran Data';
COMMENT ON COLUMN "public"."ref_administrasi_pero"."is_bukti_spt_selamanya" IS 'Apakah Bukti SPT berlaku selamanya?';
COMMENT ON COLUMN "public"."ref_administrasi_pero"."file_skb_pph23" IS 'Surat Keterangan Bebas PPh 23';
COMMENT ON COLUMN "public"."ref_administrasi_pero"."is_skb_pph23_selamanya" IS 'Apakah selamanya?';
COMMENT ON COLUMN "public"."ref_administrasi_pero"."file_sk_pp23" IS 'Surat Keterangan PP 23';
COMMENT ON COLUMN "public"."ref_administrasi_pero"."is_sk_pp23_selamanya" IS 'Apakah berlaku selamanya?';

-- ----------------------------
-- Table structure for ref_ambang_batas_penilaian
-- ----------------------------
DROP TABLE IF EXISTS "public"."ref_ambang_batas_penilaian";
CREATE TABLE "public"."ref_ambang_batas_penilaian" (
  "kode_ambang_batas" int4 NOT NULL DEFAULT nextval('ref_ambang_batas_penilaian_kode_ambang_batas_seq'::regclass),
  "kode_penjaringan" int4,
  "ambang_batas" int4
)
;

-- ----------------------------
-- Table structure for ref_bank
-- ----------------------------
DROP TABLE IF EXISTS "public"."ref_bank";
CREATE TABLE "public"."ref_bank" (
  "kode_bank" int4 NOT NULL DEFAULT nextval('ref_bank_kode_bank_seq'::regclass),
  "sandi_bank" varchar(4) COLLATE "pg_catalog"."default",
  "nama_bank" varchar(50) COLLATE "pg_catalog"."default"
)
;

-- ----------------------------
-- Table structure for ref_data_pajak_bu
-- ----------------------------
DROP TABLE IF EXISTS "public"."ref_data_pajak_bu";
CREATE TABLE "public"."ref_data_pajak_bu" (
  "kode_data_pajak" int4 NOT NULL DEFAULT nextval('ref_data_pajak_bu_kode_data_pajak_seq'::regclass),
  "kode_vendor" int4,
  "file_bukti_kswp" text COLLATE "pg_catalog"."default",
  "is_bukti_kswp_selamanya" bool,
  "bukti_kswp_berlaku_awal" date,
  "bukti_kswp_berlaku_akhir" date,
  "encrypt_key_bukti_kswp" varchar(255) COLLATE "pg_catalog"."default",
  "file_bukti_spt" text COLLATE "pg_catalog"."default",
  "is_bukti_spt_selamanya" bool,
  "bukti_spt_berlaku_awal" date,
  "bukti_spt_berlaku_akhir" date,
  "encrypt_key_bukti_spt" varchar(255) COLLATE "pg_catalog"."default",
  "file_skb_pph23" text COLLATE "pg_catalog"."default",
  "is_skb_pph23_selamanya" bool,
  "skb_pph23_berlaku_awal" date,
  "skb_pph23_berlaku_akhir" date,
  "encrypt_key_skb_pph23" varchar(255) COLLATE "pg_catalog"."default",
  "file_sk_pp23" text COLLATE "pg_catalog"."default",
  "is_sk_pp23_selamanya" bool,
  "sk_pp23_berlaku_awal" date,
  "sk_pp23_berlaku_akhir" date,
  "encrypt_key_sk_pp23" varchar(255) COLLATE "pg_catalog"."default",
  "file_non_pkp" text COLLATE "pg_catalog"."default",
  "encrypt_key_bukti_non_pkp" varchar(255) COLLATE "pg_catalog"."default",
  "revisi_ke" int2 NOT NULL DEFAULT 0
)
;
COMMENT ON COLUMN "public"."ref_data_pajak_bu"."file_bukti_kswp" IS 'Bukti KSWP';
COMMENT ON COLUMN "public"."ref_data_pajak_bu"."is_bukti_kswp_selamanya" IS 'Apakah berlaku selamanya?';
COMMENT ON COLUMN "public"."ref_data_pajak_bu"."file_bukti_spt" IS 'Bukti Penyampaian SPT';
COMMENT ON COLUMN "public"."ref_data_pajak_bu"."is_bukti_spt_selamanya" IS 'Apakah berlaku selamanya?';
COMMENT ON COLUMN "public"."ref_data_pajak_bu"."file_skb_pph23" IS 'Surat Keterangan Bebas PPh 23';
COMMENT ON COLUMN "public"."ref_data_pajak_bu"."is_skb_pph23_selamanya" IS 'Apakah berlaku selamanya?';
COMMENT ON COLUMN "public"."ref_data_pajak_bu"."file_sk_pp23" IS 'Surat Keterangan PP 23';
COMMENT ON COLUMN "public"."ref_data_pajak_bu"."is_sk_pp23_selamanya" IS 'Apakah berlaku selamanya?';
COMMENT ON COLUMN "public"."ref_data_pajak_bu"."file_non_pkp" IS 'Bukti Non PKP';
COMMENT ON TABLE "public"."ref_data_pajak_bu" IS 'Data Pajak (Badan Usaha)';

-- ----------------------------
-- Table structure for ref_datadiri
-- ----------------------------
DROP TABLE IF EXISTS "public"."ref_datadiri";
CREATE TABLE "public"."ref_datadiri" (
  "kode_datadiri" int4 NOT NULL DEFAULT nextval('ref_datadiri_kode_datadiri_seq'::regclass),
  "kode_vendor" int4,
  "tempat_lahir" varchar(100) COLLATE "pg_catalog"."default",
  "tgl_lahir" date,
  "file_ktp" varchar(255) COLLATE "pg_catalog"."default",
  "encrypt_key_ktp" varchar(255) COLLATE "pg_catalog"."default",
  "kode_kab_kota_ktp" varchar(5) COLLATE "pg_catalog"."default",
  "alamat_ktp" text COLLATE "pg_catalog"."default",
  "is_alamat_sama" bool,
  "kode_kab_kota_domisili" varchar(5) COLLATE "pg_catalog"."default",
  "alamat_domisili" text COLLATE "pg_catalog"."default",
  "file_skd" varchar(255) COLLATE "pg_catalog"."default",
  "is_skd_selamanya" bool,
  "skd_berlaku_awal" date,
  "skd_berlaku_akhir" date,
  "encrypt_key_skd" varchar(255) COLLATE "pg_catalog"."default",
  "revisi_ke" int2 NOT NULL DEFAULT 0,
  "nik" varchar COLLATE "pg_catalog"."default"
)
;
COMMENT ON COLUMN "public"."ref_datadiri"."is_alamat_sama" IS 'Apakah alamat KTP dg Domisili sama ?';
COMMENT ON COLUMN "public"."ref_datadiri"."file_skd" IS 'Surat Keterangan Domisili';
COMMENT ON COLUMN "public"."ref_datadiri"."is_skd_selamanya" IS 'Apakah Surat Keterangan Domisili berlaku selamanya?';

-- ----------------------------
-- Table structure for ref_datadiri_umum
-- ----------------------------
DROP TABLE IF EXISTS "public"."ref_datadiri_umum";
CREATE TABLE "public"."ref_datadiri_umum" (
  "kode_datadiri_umum" int4 NOT NULL DEFAULT nextval('ref_datadiri_umum_kode_datadiri_umum_seq'::regclass),
  "kode_vendor" int4,
  "nama" varchar(150) COLLATE "pg_catalog"."default",
  "nama_badan_usaha" varchar(150) COLLATE "pg_catalog"."default",
  "nama_narahubung" varchar(255) COLLATE "pg_catalog"."default",
  "kode_kualifikasi_usaha" int2,
  "nomor_telp" varchar(255) COLLATE "pg_catalog"."default",
  "no_handphone" varchar(20) COLLATE "pg_catalog"."default" DEFAULT NULL::character varying,
  "email" varchar(140) COLLATE "pg_catalog"."default",
  "kode_kab_kota_ktp" varchar(5) COLLATE "pg_catalog"."default",
  "alamat_ktp" text COLLATE "pg_catalog"."default",
  "kode_kab_kota_domisili" varchar(5) COLLATE "pg_catalog"."default",
  "alamat_domisili" text COLLATE "pg_catalog"."default",
  "is_alamat_sama" bool,
  "file_skt" text COLLATE "pg_catalog"."default",
  "is_skt_selamanya" bool,
  "skt_berlaku_awal" date,
  "skt_berlaku_akhir" date,
  "alamat_badan_usaha" text COLLATE "pg_catalog"."default",
  "custom" jsonb,
  "encrypt_key" varchar COLLATE "pg_catalog"."default",
  "revisi_ke" int2 NOT NULL DEFAULT 0
)
;
COMMENT ON COLUMN "public"."ref_datadiri_umum"."nama" IS 'Nama penyedia perorangan';
COMMENT ON COLUMN "public"."ref_datadiri_umum"."nama_narahubung" IS 'Contact Person';
COMMENT ON COLUMN "public"."ref_datadiri_umum"."nomor_telp" IS 'Nomor telepon kantor atau rumah';
COMMENT ON COLUMN "public"."ref_datadiri_umum"."no_handphone" IS 'Nomor HP Whatsapp';
COMMENT ON COLUMN "public"."ref_datadiri_umum"."is_alamat_sama" IS 'Apakah alamat KTP dg Domisili sama ?';
COMMENT ON COLUMN "public"."ref_datadiri_umum"."file_skt" IS 'Surat Keterangan Domisili';
COMMENT ON COLUMN "public"."ref_datadiri_umum"."is_skt_selamanya" IS 'Apakah Surat Keterangan Domisili berlaku selamanya?';
COMMENT ON TABLE "public"."ref_datadiri_umum" IS 'Untuk menyimpan ''Data Diri / Umum'' Perorangan dan Badan Usaha';

-- ----------------------------
-- Table structure for ref_default_master
-- ----------------------------
DROP TABLE IF EXISTS "public"."ref_default_master";
CREATE TABLE "public"."ref_default_master" (
  "kode_default_master" int4 NOT NULL DEFAULT nextval('ref_default_master_kode_default_master_seq'::regclass),
  "kode_item" int4,
  "nama_table_alias" varchar COLLATE "pg_catalog"."default",
  "nama_field" varchar COLLATE "pg_catalog"."default",
  "is_selamanya" varchar COLLATE "pg_catalog"."default",
  "kode_tgl_awal" varchar COLLATE "pg_catalog"."default",
  "kode_tgl_akhir" varchar COLLATE "pg_catalog"."default",
  "kode_field_referensi" varchar COLLATE "pg_catalog"."default",
  "tabel_referensi" varchar COLLATE "pg_catalog"."default",
  "field_referensi" varchar COLLATE "pg_catalog"."default",
  "is_select_option" bool DEFAULT false,
  "kode_table" varchar COLLATE "pg_catalog"."default"
)
;

-- ----------------------------
-- Table structure for ref_direksi_bu
-- ----------------------------
DROP TABLE IF EXISTS "public"."ref_direksi_bu";
CREATE TABLE "public"."ref_direksi_bu" (
  "kode_direksi" int4 NOT NULL DEFAULT nextval('ref_direksi_bu_kode_direksi_seq'::regclass),
  "kode_vendor" int4,
  "nm_direksi" varchar(100) COLLATE "pg_catalog"."default",
  "jbtn_direksi" varchar(100) COLLATE "pg_catalog"."default",
  "hp_direksi" varchar(35) COLLATE "pg_catalog"."default",
  "no_ktp_direksi" varchar(50) COLLATE "pg_catalog"."default",
  "path_ktp_direksi" varchar(200) COLLATE "pg_catalog"."default",
  "encrypt_key" varchar(255) COLLATE "pg_catalog"."default",
  "revisi_ke" int2 NOT NULL DEFAULT 0
)
;

-- ----------------------------
-- Table structure for ref_direksi_bu_custom
-- ----------------------------
DROP TABLE IF EXISTS "public"."ref_direksi_bu_custom";
CREATE TABLE "public"."ref_direksi_bu_custom" (
  "kode_direksi_custom" int4 NOT NULL DEFAULT nextval('ref_direksi_bu_custom_kode_direksi_custom_seq'::regclass),
  "kode_vendor" int4,
  "kode_penjaringan" int4,
  "nm_direksi" varchar(100) COLLATE "pg_catalog"."default",
  "jbtn_direksi" varchar(100) COLLATE "pg_catalog"."default",
  "hp_direksi" varchar(35) COLLATE "pg_catalog"."default",
  "no_ktp_direksi" varchar(50) COLLATE "pg_catalog"."default",
  "path_ktp_direksi" varchar(200) COLLATE "pg_catalog"."default",
  "is_ktp_selamanya" bool,
  "ktp_berlaku_awal" date,
  "ktp_berlaku_akhir" date,
  "encrypt_key" varchar(255) COLLATE "pg_catalog"."default",
  "revisi_ke" int2 NOT NULL DEFAULT 0,
  "kode_direksi" int4
)
;

-- ----------------------------
-- Table structure for ref_fasilitas_bu
-- ----------------------------
DROP TABLE IF EXISTS "public"."ref_fasilitas_bu";
CREATE TABLE "public"."ref_fasilitas_bu" (
  "kode_fasilitas" int4 NOT NULL DEFAULT nextval('ref_fasilitas_bu_kode_fasilitas_seq'::regclass),
  "kode_vendor" int4,
  "nama" varchar(255) COLLATE "pg_catalog"."default",
  "jumlah" varchar(130) COLLATE "pg_catalog"."default",
  "kode_kondisi" int4,
  "kode_kepemilikan" int4,
  "file_kepemilikan" varchar(255) COLLATE "pg_catalog"."default",
  "is_kepemilikan_selamanya" bool,
  "kepemilikan_berlaku_awal" date,
  "kepemilikan_berlaku_akhir" date,
  "encrypt_key_kepemilikan" varchar(255) COLLATE "pg_catalog"."default",
  "file_foto" varchar(255) COLLATE "pg_catalog"."default",
  "encrypt_key_foto" varchar(255) COLLATE "pg_catalog"."default",
  "revisi_ke" int2 NOT NULL DEFAULT 0
)
;
COMMENT ON COLUMN "public"."ref_fasilitas_bu"."is_kepemilikan_selamanya" IS 'Apakah kepemilikan berlaku selamanya?';

-- ----------------------------
-- Table structure for ref_fasilitas_bu_custom
-- ----------------------------
DROP TABLE IF EXISTS "public"."ref_fasilitas_bu_custom";
CREATE TABLE "public"."ref_fasilitas_bu_custom" (
  "kode_fasilitas_custom" int4 NOT NULL DEFAULT nextval('ref_fasilitas_bu_custom_kode_fasilitas_custom_seq'::regclass),
  "kode_vendor" int4,
  "kode_penjaringan" int4,
  "nama" varchar(255) COLLATE "pg_catalog"."default",
  "jumlah" varchar(130) COLLATE "pg_catalog"."default",
  "kode_kondisi" int4,
  "kode_kepemilikan" int4,
  "file_kepemilikan" varchar(255) COLLATE "pg_catalog"."default",
  "is_kepemilikan_selamanya" bool,
  "kepemilikan_berlaku_awal" date,
  "kepemilikan_berlaku_akhir" date,
  "encrypt_key_kepemilikan" varchar(255) COLLATE "pg_catalog"."default",
  "file_foto" varchar(255) COLLATE "pg_catalog"."default",
  "is_foto_selamanya" bool,
  "foto_berlaku_awal" date,
  "foto_berlaku_akhir" date,
  "encrypt_key_foto" varchar(255) COLLATE "pg_catalog"."default",
  "revisi_ke" int2 NOT NULL DEFAULT 0,
  "kode_fasilitas" int4
)
;

-- ----------------------------
-- Table structure for ref_file_saham
-- ----------------------------
DROP TABLE IF EXISTS "public"."ref_file_saham";
CREATE TABLE "public"."ref_file_saham" (
  "kode_file_saham" int4 NOT NULL DEFAULT nextval('ref_file_saham_kode_file_saham_seq'::regclass),
  "kode_vendor" int4,
  "path_saham" varchar COLLATE "pg_catalog"."default",
  "encrypt_key" varchar COLLATE "pg_catalog"."default"
)
;

-- ----------------------------
-- Table structure for ref_history_adm_bu
-- ----------------------------
DROP TABLE IF EXISTS "public"."ref_history_adm_bu";
CREATE TABLE "public"."ref_history_adm_bu" (
  "kode_adm_bu" int4 NOT NULL,
  "kode_vendor" int4,
  "file_fis_old" text COLLATE "pg_catalog"."default",
  "encrypt_key_fis_old" varchar(255) COLLATE "pg_catalog"."default",
  "file_s_kuasa_old" text COLLATE "pg_catalog"."default",
  "encrypt_key_s_kuasa_old" varchar(255) COLLATE "pg_catalog"."default",
  "file_spkd_old" text COLLATE "pg_catalog"."default",
  "encrypt_key_spkd_old" varchar(255) COLLATE "pg_catalog"."default",
  "revisi_ke" int2 NOT NULL DEFAULT 0,
  "file_fis_new" varchar COLLATE "pg_catalog"."default",
  "encrypt_key_fis_new" varchar COLLATE "pg_catalog"."default",
  "file_s_kuasa_new" varchar COLLATE "pg_catalog"."default",
  "encrypt_key_s_kuasa_new" varchar COLLATE "pg_catalog"."default",
  "file_spkd_new" varchar COLLATE "pg_catalog"."default",
  "encrypt_key_spkd_new" varchar(255) COLLATE "pg_catalog"."default",
  "kode_adm_bu_history" int4 NOT NULL DEFAULT nextval('ref_history_adm_bu_kode_adm_bu_history_seq'::regclass)
)
;

-- ----------------------------
-- Table structure for ref_history_administrasi_pero
-- ----------------------------
DROP TABLE IF EXISTS "public"."ref_history_administrasi_pero";
CREATE TABLE "public"."ref_history_administrasi_pero" (
  "kode_adm" int4 NOT NULL DEFAULT nextval('ref_history_administrasi_pero_kode_adm_seq'::regclass),
  "kode_vendor" int4,
  "file_skd" text COLLATE "pg_catalog"."default",
  "is_skd_selamanya" bool,
  "skd_berlaku_awal" date,
  "skd_berlaku_akhir" date,
  "encrypt_key_skd" varchar(255) COLLATE "pg_catalog"."default",
  "custom_adm" jsonb,
  "npwp" varchar(25) COLLATE "pg_catalog"."default",
  "file_npwp" text COLLATE "pg_catalog"."default",
  "is_npwp_selamanya" bool,
  "npwp_berlaku_awal" date,
  "npwp_berlaku_akhir" date,
  "encrypt_key_npwp" varchar(255) COLLATE "pg_catalog"."default",
  "file_bukti_spt" text COLLATE "pg_catalog"."default",
  "is_bukti_spt_selamanya" bool,
  "bukti_spt_berlaku_awal" date,
  "bukti_spt_berlaku_akhir" date,
  "encrypt_key_bukti_spt" varchar(255) COLLATE "pg_catalog"."default",
  "file_skb_pph23" text COLLATE "pg_catalog"."default",
  "is_skb_pph23_selamanya" bool,
  "skb_pph23_berlaku_awal" date,
  "skb_pph23_berlaku_akhir" date,
  "encrypt_key_skb_pph23" varchar(255) COLLATE "pg_catalog"."default",
  "file_sk_pp23" text COLLATE "pg_catalog"."default",
  "is_sk_pp23_selamanya" bool,
  "sk_pp23_berlaku_awal" date,
  "sk_pp23_berlaku_akhir" date,
  "encrypt_key_sk_pp23" varchar(255) COLLATE "pg_catalog"."default",
  "custom_npwp" jsonb,
  "revisi_ke" int2 NOT NULL DEFAULT 0
)
;

-- ----------------------------
-- Table structure for ref_history_data_pajak_bu
-- ----------------------------
DROP TABLE IF EXISTS "public"."ref_history_data_pajak_bu";
CREATE TABLE "public"."ref_history_data_pajak_bu" (
  "kode_data_pajak" int4 NOT NULL,
  "kode_vendor" int4,
  "file_bukti_kswp_old" text COLLATE "pg_catalog"."default",
  "is_bukti_kswp_selamanya_old" bool,
  "bukti_kswp_berlaku_awal_old" date,
  "bukti_kswp_berlaku_akhir_old" date,
  "encrypt_key_bukti_kswp_old" varchar(255) COLLATE "pg_catalog"."default",
  "file_bukti_spt_old" text COLLATE "pg_catalog"."default",
  "is_bukti_spt_selamanya_old" bool,
  "bukti_spt_berlaku_awal_old" date,
  "bukti_spt_berlaku_akhir_old" date,
  "encrypt_key_bukti_spt_old" varchar(255) COLLATE "pg_catalog"."default",
  "file_skb_pph23_old" text COLLATE "pg_catalog"."default",
  "is_skb_pph23_selamanya_old" bool,
  "skb_pph23_berlaku_awal_old" date,
  "skb_pph23_berlaku_akhir_old" date,
  "encrypt_key_skb_pph23_old" varchar(255) COLLATE "pg_catalog"."default",
  "file_sk_pp23_old" text COLLATE "pg_catalog"."default",
  "is_sk_pp23_selamanya_old" bool,
  "sk_pp23_berlaku_awal_old" date,
  "sk_pp23_berlaku_akhir_old" date,
  "encrypt_key_sk_pp23_old" varchar(255) COLLATE "pg_catalog"."default",
  "file_non_pkp_old" text COLLATE "pg_catalog"."default",
  "encrypt_key_bukti_non_pkp_old" varchar(255) COLLATE "pg_catalog"."default",
  "revisi_ke" int2 NOT NULL DEFAULT 0,
  "file_bukti_kswp_new" text COLLATE "pg_catalog"."default",
  "is_bukti_kswp_selamanya_new" bool,
  "bukti_kswp_berlaku_awal_new" date,
  "bukti_kswp_berlaku_akhir_new" date,
  "encrypt_key_bukti_kswp_new" varchar(255) COLLATE "pg_catalog"."default",
  "file_bukti_spt_new" text COLLATE "pg_catalog"."default",
  "is_bukti_spt_selamanya_new" bool,
  "bukti_spt_berlaku_awal_new" date,
  "bukti_spt_berlaku_akhir_new" date,
  "encrypt_key_bukti_spt_new" varchar(255) COLLATE "pg_catalog"."default",
  "file_skb_pph23_new" text COLLATE "pg_catalog"."default",
  "is_skb_pph23_selamanya_new" bool,
  "skb_pph23_berlaku_awal_new" date,
  "skb_pph23_berlaku_akhir_new" date,
  "encrypt_key_skb_pph23_new" varchar(255) COLLATE "pg_catalog"."default",
  "file_sk_pp23_new" text COLLATE "pg_catalog"."default",
  "is_sk_pp23_selamanya_new" bool,
  "sk_pp23_berlaku_awal_new" date,
  "sk_pp23_berlaku_akhir_new" date,
  "encrypt_key_sk_pp23_new" varchar(255) COLLATE "pg_catalog"."default",
  "file_non_pkp_new" text COLLATE "pg_catalog"."default",
  "encrypt_key_bukti_non_pkp_new" varchar(255) COLLATE "pg_catalog"."default",
  "kode_data_pajak_history" int4 NOT NULL DEFAULT nextval('ref_history_data_pajak_bu_kode_data_pajak_history_seq'::regclass)
)
;

-- ----------------------------
-- Table structure for ref_history_datadiri_umum
-- ----------------------------
DROP TABLE IF EXISTS "public"."ref_history_datadiri_umum";
CREATE TABLE "public"."ref_history_datadiri_umum" (
  "kode_datadiri_umum" int4 NOT NULL DEFAULT nextval('ref_history_datadiri_umum_kode_datadiri_umum_seq'::regclass),
  "kode_vendor" int4,
  "nama" varchar(150) COLLATE "pg_catalog"."default",
  "nama_badan_usaha" varchar(150) COLLATE "pg_catalog"."default",
  "nama_narahubung" varchar(255) COLLATE "pg_catalog"."default",
  "kode_kualifikasi_usaha" int2,
  "nomor_telp" varchar(255) COLLATE "pg_catalog"."default",
  "no_handphone" varchar(20) COLLATE "pg_catalog"."default",
  "email" varchar(80) COLLATE "pg_catalog"."default",
  "kode_kab_kota_ktp" varchar(5) COLLATE "pg_catalog"."default",
  "alamat_ktp" text COLLATE "pg_catalog"."default",
  "kode_kab_kota_domisili" varchar(5) COLLATE "pg_catalog"."default",
  "alamat_domisili" text COLLATE "pg_catalog"."default",
  "is_alamat_sama" bool,
  "file_skt" text COLLATE "pg_catalog"."default",
  "is_skt_selamanya" bool,
  "skt_berlaku_awal" date,
  "skt_berlaku_akhir" date,
  "alamat_badan_usaha" text COLLATE "pg_catalog"."default",
  "custom" jsonb,
  "revisi_ke" int2 NOT NULL DEFAULT 0,
  "encrypt_key" varchar COLLATE "pg_catalog"."default"
)
;

-- ----------------------------
-- Table structure for ref_history_direksi_bu
-- ----------------------------
DROP TABLE IF EXISTS "public"."ref_history_direksi_bu";
CREATE TABLE "public"."ref_history_direksi_bu" (
  "kode_direksi" int4,
  "kode_vendor" int4,
  "nm_direksi_old" varchar(100) COLLATE "pg_catalog"."default",
  "jbtn_direksi_old" varchar(100) COLLATE "pg_catalog"."default",
  "hp_direksi_old" varchar(35) COLLATE "pg_catalog"."default",
  "no_ktp_direksi_old" varchar(30) COLLATE "pg_catalog"."default",
  "path_ktp_direksi_old" varchar(200) COLLATE "pg_catalog"."default",
  "encrypt_key_old" varchar(255) COLLATE "pg_catalog"."default",
  "revisi_ke" int2 NOT NULL DEFAULT 0,
  "kode_direksi_history" int4 NOT NULL DEFAULT nextval('ref_history_direksi_bu_kode_direksi_history_seq'::regclass),
  "nm_direksi_new" varchar(100) COLLATE "pg_catalog"."default",
  "jbtn_direksi_new" varchar(100) COLLATE "pg_catalog"."default",
  "hp_direksi_new" varchar(35) COLLATE "pg_catalog"."default",
  "no_ktp_direksi_new" varchar(30) COLLATE "pg_catalog"."default",
  "path_ktp_direksi_new" varchar(200) COLLATE "pg_catalog"."default",
  "encrypt_key_new" varchar(255) COLLATE "pg_catalog"."default",
  "is_deleted" bool DEFAULT false,
  "is_changes" bool DEFAULT false
)
;

-- ----------------------------
-- Table structure for ref_history_fasilitas_bu
-- ----------------------------
DROP TABLE IF EXISTS "public"."ref_history_fasilitas_bu";
CREATE TABLE "public"."ref_history_fasilitas_bu" (
  "kode_fasilitas" int4,
  "kode_vendor" int4,
  "kode_fasilitas_history" int4 NOT NULL DEFAULT nextval('ref_history_fasilitas_bu_kode_fasilitas_history_seq'::regclass),
  "nama_old" varchar(255) COLLATE "pg_catalog"."default",
  "jumlah_old" varchar(130) COLLATE "pg_catalog"."default",
  "kode_kondisi_old" int4,
  "kode_kepemilikan_old" int4,
  "file_kepemilikan_old" varchar(255) COLLATE "pg_catalog"."default",
  "is_kepemilikan_selamanya_old" bool,
  "kepemilikan_berlaku_awal_old" date,
  "kepemilikan_berlaku_akhir_old" date,
  "encrypt_key_kepemilikan_old" varchar(255) COLLATE "pg_catalog"."default",
  "file_foto_old" varchar(255) COLLATE "pg_catalog"."default",
  "encrypt_key_foto_old" varchar(255) COLLATE "pg_catalog"."default",
  "revisi_ke" int2 NOT NULL DEFAULT 0,
  "nama_new" varchar(255) COLLATE "pg_catalog"."default",
  "jumlah_new" varchar(130) COLLATE "pg_catalog"."default",
  "kode_kondisi_new" int4,
  "kode_kepemilikan_new" int4,
  "file_kepemilikan_new" varchar(255) COLLATE "pg_catalog"."default",
  "is_kepemilikan_selamanya_new" bool,
  "kepemilikan_berlaku_awal_new" date,
  "kepemilikan_berlaku_akhir_new" date,
  "encrypt_key_kepemilikan_new" varchar(255) COLLATE "pg_catalog"."default",
  "file_foto_new" varchar(255) COLLATE "pg_catalog"."default",
  "encrypt_key_foto_new" varchar(255) COLLATE "pg_catalog"."default",
  "is_changes" bool DEFAULT false,
  "is_deleted" bool DEFAULT false,
  "is_created" bool
)
;
COMMENT ON COLUMN "public"."ref_history_fasilitas_bu"."is_kepemilikan_selamanya_old" IS 'Apakah kepemilikan berlaku selamanya?';
COMMENT ON COLUMN "public"."ref_history_fasilitas_bu"."is_kepemilikan_selamanya_new" IS 'Apakah kepemilikan berlaku selamanya?';

-- ----------------------------
-- Table structure for ref_history_izin_usaha_bu
-- ----------------------------
DROP TABLE IF EXISTS "public"."ref_history_izin_usaha_bu";
CREATE TABLE "public"."ref_history_izin_usaha_bu" (
  "kode_vendor" int4,
  "jenis_izin_usaha_old" "public"."jenis_izin_usaha",
  "nama_old" varchar(255) COLLATE "pg_catalog"."default",
  "nomor_izin_old" varchar(150) COLLATE "pg_catalog"."default",
  "file_izin_old" varchar(255) COLLATE "pg_catalog"."default",
  "is_izin_selamanya_old" bool,
  "izin_berlaku_awal_old" date,
  "izin_berlaku_akhir_old" date,
  "encrypt_key_old" varchar(255) COLLATE "pg_catalog"."default",
  "revisi_ke" int4,
  "jenis_izin_usaha_new" "public"."jenis_izin_usaha",
  "nama_new" varchar(255) COLLATE "pg_catalog"."default",
  "nomor_izin_new" varchar(150) COLLATE "pg_catalog"."default",
  "file_izin_new" varchar(255) COLLATE "pg_catalog"."default",
  "is_izin_selamanya_new" bool,
  "izin_berlaku_awal_new" date,
  "izin_berlaku_akhir_new" date,
  "encrypt_key_new" varchar(255) COLLATE "pg_catalog"."default",
  "kode_izin_usaha_history" int4 NOT NULL DEFAULT nextval('ref_history_izin_usaha_bu_kode_izin_usaha_history_seq'::regclass),
  "kode_izin_usaha" int4
)
;
COMMENT ON COLUMN "public"."ref_history_izin_usaha_bu"."jenis_izin_usaha_old" IS 'nib, sbu, lainya';
COMMENT ON COLUMN "public"."ref_history_izin_usaha_bu"."is_izin_selamanya_old" IS 'Apakah Izin berlaku selamanya?';
COMMENT ON COLUMN "public"."ref_history_izin_usaha_bu"."jenis_izin_usaha_new" IS 'nib, sbu, lainya';
COMMENT ON COLUMN "public"."ref_history_izin_usaha_bu"."is_izin_selamanya_new" IS 'Apakah Izin berlaku selamanya?';

-- ----------------------------
-- Table structure for ref_history_kantor_bu
-- ----------------------------
DROP TABLE IF EXISTS "public"."ref_history_kantor_bu";
CREATE TABLE "public"."ref_history_kantor_bu" (
  "kode_kantor" int4,
  "kode_vendor" int4,
  "kode_kantor_history" int4 NOT NULL DEFAULT nextval('ref_history_kantor_bu_kode_kantor_history_seq'::regclass),
  "nama_kantor_old" varchar(30) COLLATE "pg_catalog"."default" DEFAULT NULL::character varying,
  "alamat_old" text COLLATE "pg_catalog"."default",
  "kode_kondisi_old" int4,
  "kode_kepemilikan_old" int4,
  "file_bukti_old" varchar(255) COLLATE "pg_catalog"."default",
  "is_bukti_selamanya_old" bool,
  "bukti_berlaku_awal_old" date,
  "bukti_berlaku_akhir_old" date,
  "encrypt_key_bukti_old" varchar(255) COLLATE "pg_catalog"."default",
  "file_foto_old" varchar(255) COLLATE "pg_catalog"."default",
  "encrypt_key_foto_old" varchar(255) COLLATE "pg_catalog"."default",
  "revisi_ke" int2 NOT NULL DEFAULT 0,
  "nama_kantor_new" varchar(30) COLLATE "pg_catalog"."default" DEFAULT NULL::character varying,
  "alamat_new" text COLLATE "pg_catalog"."default",
  "kode_kondisi_new" int4,
  "kode_kepemilikan_new" int4,
  "file_bukti_new" varchar(255) COLLATE "pg_catalog"."default",
  "is_bukti_selamanya_new" bool,
  "bukti_berlaku_awal_new" date,
  "bukti_berlaku_akhir_new" date,
  "encrypt_key_bukti_new" varchar(255) COLLATE "pg_catalog"."default",
  "file_foto_new" varchar(255) COLLATE "pg_catalog"."default",
  "encrypt_key_foto_new" varchar(255) COLLATE "pg_catalog"."default",
  "is_changes" bool,
  "is_deleted" bool,
  "is_created" bool
)
;
COMMENT ON COLUMN "public"."ref_history_kantor_bu"."file_bukti_old" IS 'Bukti kepemilikan';
COMMENT ON COLUMN "public"."ref_history_kantor_bu"."is_bukti_selamanya_old" IS 'Apakah berlaku selamanya?';
COMMENT ON COLUMN "public"."ref_history_kantor_bu"."file_bukti_new" IS 'Bukti kepemilikan';
COMMENT ON COLUMN "public"."ref_history_kantor_bu"."is_bukti_selamanya_new" IS 'Apakah berlaku selamanya?';

-- ----------------------------
-- Table structure for ref_history_keuangan_bu
-- ----------------------------
DROP TABLE IF EXISTS "public"."ref_history_keuangan_bu";
CREATE TABLE "public"."ref_history_keuangan_bu" (
  "kode_keuangan" int4,
  "kode_vendor" int4,
  "nm_pemilik_rek_old" varchar(100) COLLATE "pg_catalog"."default",
  "no_rek_old" varchar(50) COLLATE "pg_catalog"."default",
  "sandi_bank_old" varchar(4) COLLATE "pg_catalog"."default",
  "file_buku_rek_old" text COLLATE "pg_catalog"."default",
  "is_buku_rek_selamanya_old" bool,
  "buku_rek_berlaku_awal_old" date,
  "buku_rek_berlaku_akhir_old" date,
  "encrypt_key_buku_rek_old" varchar(255) COLLATE "pg_catalog"."default",
  "file_lap_keu_old" text COLLATE "pg_catalog"."default",
  "is_lap_keu_selamanya_old" bool,
  "lap_keu_berlaku_awal_old" date,
  "lap_keu_berlaku_akhir_old" date,
  "encrypt_key_lap_keu_old" varchar(255) COLLATE "pg_catalog"."default",
  "file_lap_keu_audited_old" text COLLATE "pg_catalog"."default",
  "is_lap_keu_audited_selamanya_old" bool,
  "lap_keu_audited_berlaku_awal_old" date,
  "lap_keu_audited_berlaku_akhir_old" date,
  "encrypt_key_lap_keu_audited_old" varchar(255) COLLATE "pg_catalog"."default",
  "revisi_ke" int2 NOT NULL DEFAULT 0,
  "nm_pemilik_rek_new" varchar(100) COLLATE "pg_catalog"."default",
  "no_rek_new" varchar(50) COLLATE "pg_catalog"."default",
  "sandi_bank_new" varchar(4) COLLATE "pg_catalog"."default",
  "file_buku_rek_new" text COLLATE "pg_catalog"."default",
  "is_buku_rek_selamanya_new" bool,
  "buku_rek_berlaku_awal_new" date,
  "buku_rek_berlaku_akhir_new" date,
  "encrypt_key_buku_rek_new" varchar(255) COLLATE "pg_catalog"."default",
  "file_lap_keu_new" text COLLATE "pg_catalog"."default",
  "is_lap_keu_selamanya_new" bool,
  "lap_keu_berlaku_awal_new" date,
  "lap_keu_berlaku_akhir_new" date,
  "encrypt_key_lap_keu_new" varchar(255) COLLATE "pg_catalog"."default",
  "file_lap_keu_audited_new" text COLLATE "pg_catalog"."default",
  "is_lap_keu_audited_selamanya_new" bool,
  "lap_keu_audited_berlaku_awal_new" date,
  "lap_keu_audited_berlaku_akhir_new" date,
  "encrypt_key_lap_keu_audited_new" varchar(255) COLLATE "pg_catalog"."default",
  "kode_keuangan_history" int4 NOT NULL DEFAULT nextval('ref_history_keuangan_bu_kode_keuangan_history_seq'::regclass)
)
;

-- ----------------------------
-- Table structure for ref_history_keuangan_pero
-- ----------------------------
DROP TABLE IF EXISTS "public"."ref_history_keuangan_pero";
CREATE TABLE "public"."ref_history_keuangan_pero" (
  "kode_keuangan" int4,
  "kode_vendor" int4,
  "kode_keuangan_history" int4 NOT NULL DEFAULT nextval('ref_history_keuangan_pero_kode_keuangan_history_seq'::regclass),
  "nm_pemilik_rek_old" varchar(100) COLLATE "pg_catalog"."default",
  "no_rek_old" varchar(50) COLLATE "pg_catalog"."default",
  "sandi_bank_old" varchar(4) COLLATE "pg_catalog"."default",
  "file_buku_rek_old" text COLLATE "pg_catalog"."default",
  "encrypt_key_buku_rek_old" varchar(255) COLLATE "pg_catalog"."default",
  "file_lap_keu_old" text COLLATE "pg_catalog"."default",
  "lap_keu_berlaku_awal_old" date,
  "lap_keu_berlaku_akhir_old" date,
  "encrypt_key_lap_keu_old" varchar(255) COLLATE "pg_catalog"."default",
  "file_lap_keu_audited_old" text COLLATE "pg_catalog"."default",
  "lap_keu_audited_berlaku_awal_old" date,
  "lap_keu_audited_berlaku_akhir_old" date,
  "encrypt_key_lap_keu_audited_old" varchar(255) COLLATE "pg_catalog"."default",
  "revisi_ke" int2 NOT NULL DEFAULT 0,
  "is_lap_keu_selamanya_old" bool,
  "is_lap_keu_audited_selamanya_old" bool,
  "nm_pemilik_rek_new" varchar(100) COLLATE "pg_catalog"."default",
  "no_rek_new" varchar(50) COLLATE "pg_catalog"."default",
  "sandi_bank_new" varchar(4) COLLATE "pg_catalog"."default",
  "file_buku_rek_new" text COLLATE "pg_catalog"."default",
  "encrypt_key_buku_rek_new" varchar(255) COLLATE "pg_catalog"."default",
  "file_lap_keu_new" text COLLATE "pg_catalog"."default",
  "lap_keu_berlaku_awal_new" date,
  "lap_keu_berlaku_akhir_new" date,
  "encrypt_key_lap_keu_new" varchar(255) COLLATE "pg_catalog"."default",
  "file_lap_keu_audited_new" text COLLATE "pg_catalog"."default",
  "lap_keu_audited_berlaku_awal_new" date,
  "lap_keu_audited_berlaku_akhir_new" date,
  "encrypt_key_lap_keu_audited_new" varchar(255) COLLATE "pg_catalog"."default",
  "is_lap_keu_selamanya_new" bool,
  "is_lap_keu_audited_selamanya_new" bool
)
;

-- ----------------------------
-- Table structure for ref_history_komisaris_bu
-- ----------------------------
DROP TABLE IF EXISTS "public"."ref_history_komisaris_bu";
CREATE TABLE "public"."ref_history_komisaris_bu" (
  "kode_komisaris" int4 NOT NULL,
  "kode_vendor" int4,
  "nm_komisaris_old" varchar(100) COLLATE "pg_catalog"."default",
  "jbtn_komisaris_old" varchar(100) COLLATE "pg_catalog"."default",
  "hp_komisaris_old" varchar(35) COLLATE "pg_catalog"."default",
  "no_ktp_komisaris_old" varchar(50) COLLATE "pg_catalog"."default",
  "path_ktp_komisaris_old" varchar(200) COLLATE "pg_catalog"."default",
  "encrypt_key_old" varchar(255) COLLATE "pg_catalog"."default",
  "revisi_ke" int2 NOT NULL DEFAULT 0,
  "kode_komisaris_history" int4 NOT NULL DEFAULT nextval('ref_history_komisaris_bu_kode_komisaris_history_seq'::regclass),
  "nm_komisaris_new" varchar(100) COLLATE "pg_catalog"."default",
  "jbtn_komisaris_new" varchar(100) COLLATE "pg_catalog"."default",
  "hp_komisaris_new" varchar(35) COLLATE "pg_catalog"."default",
  "no_ktp_komisaris_new" varchar(50) COLLATE "pg_catalog"."default",
  "path_ktp_komisaris_new" varchar(200) COLLATE "pg_catalog"."default",
  "encrypt_key_new" varchar(255) COLLATE "pg_catalog"."default",
  "is_delete" bool NOT NULL DEFAULT false,
  "is_changes" bool NOT NULL DEFAULT false
)
;

-- ----------------------------
-- Table structure for ref_history_lan_hukum_bu
-- ----------------------------
DROP TABLE IF EXISTS "public"."ref_history_lan_hukum_bu";
CREATE TABLE "public"."ref_history_lan_hukum_bu" (
  "kode_lan_hukum" int4 NOT NULL,
  "kode_vendor" int4,
  "no_akta_awal_old" varchar(255) COLLATE "pg_catalog"."default",
  "tgl_akta_awal_old" date,
  "notaris_awal_old" varchar(100) COLLATE "pg_catalog"."default",
  "no_sah_awal_old" varchar(255) COLLATE "pg_catalog"."default",
  "tgl_sah_awal_old" date,
  "file_akta_awal_old" text COLLATE "pg_catalog"."default",
  "encrypt_key_akta_awal_old" varchar(255) COLLATE "pg_catalog"."default",
  "no_akta_rubah_old" varchar(255) COLLATE "pg_catalog"."default",
  "tgl_akta_rubah_old" date,
  "notaris_rubah_old" varchar(100) COLLATE "pg_catalog"."default",
  "no_sah_rubah_old" varchar(255) COLLATE "pg_catalog"."default",
  "tgl_sah_rubah_old" date,
  "file_akta_rubah_old" text COLLATE "pg_catalog"."default",
  "encrypt_key_akta_rubah_old" varchar(255) COLLATE "pg_catalog"."default",
  "revisi_ke" int2 NOT NULL DEFAULT 0,
  "no_akta_awal_new" varchar(255) COLLATE "pg_catalog"."default",
  "tgl_akta_awal_new" date,
  "notaris_awal_new" varchar(100) COLLATE "pg_catalog"."default",
  "no_sah_awal_new" varchar(255) COLLATE "pg_catalog"."default",
  "tgl_sah_awal_new" date,
  "file_akta_awal_new" text COLLATE "pg_catalog"."default",
  "encrypt_key_akta_awal_new" varchar(255) COLLATE "pg_catalog"."default",
  "no_akta_rubah_new" varchar(255) COLLATE "pg_catalog"."default",
  "tgl_akta_rubah_new" date,
  "notaris_rubah_new" varchar(100) COLLATE "pg_catalog"."default",
  "no_sah_rubah_new" varchar(255) COLLATE "pg_catalog"."default",
  "tgl_sah_rubah_new" date,
  "file_akta_rubah_new" text COLLATE "pg_catalog"."default",
  "encrypt_key_akta_rubah_new" varchar(255) COLLATE "pg_catalog"."default",
  "kode_lan_hukum_history" int4 NOT NULL DEFAULT nextval('ref_history_lan_hukum_bu_kode_lan_hukum_history_seq'::regclass)
)
;
COMMENT ON COLUMN "public"."ref_history_lan_hukum_bu"."no_sah_awal_old" IS 'Nomor Pengesahan / Pendaftaran';
COMMENT ON COLUMN "public"."ref_history_lan_hukum_bu"."file_akta_awal_old" IS 'Scan Akta Pendirian Awal';
COMMENT ON COLUMN "public"."ref_history_lan_hukum_bu"."no_akta_rubah_old" IS 'No. Akta setelah Perubahan Terakhir Akta Pendirian Badan Usaha /Anggaran Dasar Koperasi';
COMMENT ON COLUMN "public"."ref_history_lan_hukum_bu"."no_sah_rubah_old" IS 'Nomor Pengesahan / Pendaftaran';
COMMENT ON COLUMN "public"."ref_history_lan_hukum_bu"."file_akta_rubah_old" IS 'Scan Akta Pendirian Terakhir';
COMMENT ON COLUMN "public"."ref_history_lan_hukum_bu"."no_sah_awal_new" IS 'Nomor Pengesahan / Pendaftaran';
COMMENT ON COLUMN "public"."ref_history_lan_hukum_bu"."file_akta_awal_new" IS 'Scan Akta Pendirian Awal';
COMMENT ON COLUMN "public"."ref_history_lan_hukum_bu"."no_akta_rubah_new" IS 'No. Akta setelah Perubahan Terakhir Akta Pendirian Badan Usaha /Anggaran Dasar Koperasi';
COMMENT ON COLUMN "public"."ref_history_lan_hukum_bu"."no_sah_rubah_new" IS 'Nomor Pengesahan / Pendaftaran';
COMMENT ON COLUMN "public"."ref_history_lan_hukum_bu"."file_akta_rubah_new" IS 'Scan Akta Pendirian Terakhir';

-- ----------------------------
-- Table structure for ref_history_pengalaman_bu
-- ----------------------------
DROP TABLE IF EXISTS "public"."ref_history_pengalaman_bu";
CREATE TABLE "public"."ref_history_pengalaman_bu" (
  "kode_pengalaman_bu_history" int4 NOT NULL DEFAULT nextval('ref_history_pengalaman_bu_kode_pengalaman_bu_history_seq'::regclass),
  "kode_pengalaman_bu" int4,
  "kode_vendor" int4,
  "nama_pekerjaan_old" text COLLATE "pg_catalog"."default",
  "tgl_awal_pekerjaan_old" date,
  "tgl_akhir_pekerjaan_old" date,
  "pemberi_kerja_old" varchar(255) COLLATE "pg_catalog"."default",
  "nilai_pekerjaan_old" int8,
  "no_kontrak_old" varchar(255) COLLATE "pg_catalog"."default",
  "file_kontrak_old" varchar(255) COLLATE "pg_catalog"."default",
  "encrypt_key_kontrak_old" varchar(255) COLLATE "pg_catalog"."default",
  "revisi_ke" int2 NOT NULL DEFAULT 0,
  "nama_pekerjaan_new" text COLLATE "pg_catalog"."default",
  "tgl_awal_pekerjaan_new" date,
  "tgl_akhir_pekerjaan_new" date,
  "pemberi_kerja_new" varchar(255) COLLATE "pg_catalog"."default",
  "nilai_pekerjaan_new" int8,
  "no_kontrak_new" varchar(255) COLLATE "pg_catalog"."default",
  "file_kontrak_new" varchar(255) COLLATE "pg_catalog"."default",
  "encrypt_key_kontrak_new" varchar(255) COLLATE "pg_catalog"."default",
  "is_changes" bool,
  "is_deleted" bool
)
;
COMMENT ON COLUMN "public"."ref_history_pengalaman_bu"."tgl_awal_pekerjaan_old" IS 'Pecahan dari Tahun Pekerjaan';
COMMENT ON COLUMN "public"."ref_history_pengalaman_bu"."tgl_akhir_pekerjaan_old" IS 'Pecahan dari Tahun Pekerjaan';
COMMENT ON COLUMN "public"."ref_history_pengalaman_bu"."tgl_awal_pekerjaan_new" IS 'Pecahan dari Tahun Pekerjaan';
COMMENT ON COLUMN "public"."ref_history_pengalaman_bu"."tgl_akhir_pekerjaan_new" IS 'Pecahan dari Tahun Pekerjaan';

-- ----------------------------
-- Table structure for ref_history_pengalaman_pero
-- ----------------------------
DROP TABLE IF EXISTS "public"."ref_history_pengalaman_pero";
CREATE TABLE "public"."ref_history_pengalaman_pero" (
  "kode_pengalaman" int4 NOT NULL DEFAULT nextval('ref_history_pengalaman_pero_kode_pengalaman_seq'::regclass),
  "kode_vendor" int4,
  "nama_pekerjaan" varchar(100) COLLATE "pg_catalog"."default",
  "posisi" varchar(50) COLLATE "pg_catalog"."default",
  "tgl_awal_pekerjaan" date,
  "tgl_akhir_pekerjaan" date,
  "nilai_pekerjaan" int8,
  "file_bukti" varchar(255) COLLATE "pg_catalog"."default",
  "encrypt_key" varchar COLLATE "pg_catalog"."default",
  "custom" jsonb,
  "revisi_ke" int2 NOT NULL DEFAULT 0
)
;

-- ----------------------------
-- Table structure for ref_history_pengalaman_ta
-- ----------------------------
DROP TABLE IF EXISTS "public"."ref_history_pengalaman_ta";
CREATE TABLE "public"."ref_history_pengalaman_ta" (
  "kode_pengalaman_ta" int4,
  "kode_tenaga_ahli_history" int4,
  "pengalaman_old" varchar(255) COLLATE "pg_catalog"."default",
  "file_bukti_old" varchar(255) COLLATE "pg_catalog"."default",
  "encrypt_key_old" varchar COLLATE "pg_catalog"."default",
  "revisi_ke" int2 NOT NULL DEFAULT 0,
  "kode_pengalaman_ta_history" int4 NOT NULL DEFAULT nextval('ref_history_pengalaman_ta_kode_pengalaman_ta_history_seq'::regclass),
  "pengalaman_new" varchar(255) COLLATE "pg_catalog"."default",
  "file_bukti_new" varchar(255) COLLATE "pg_catalog"."default",
  "encrypt_key_new" varchar COLLATE "pg_catalog"."default",
  "is_changes" bool,
  "is_deleted" bool,
  "kode_tenaga_ahli" int4
)
;

-- ----------------------------
-- Table structure for ref_history_pengalaman_tp
-- ----------------------------
DROP TABLE IF EXISTS "public"."ref_history_pengalaman_tp";
CREATE TABLE "public"."ref_history_pengalaman_tp" (
  "encrypt_key_new" varchar COLLATE "pg_catalog"."default",
  "encrypt_key_old" varchar COLLATE "pg_catalog"."default",
  "file_bukti_new" varchar(255) COLLATE "pg_catalog"."default",
  "file_bukti_old" varchar(255) COLLATE "pg_catalog"."default",
  "is_changes" bool,
  "is_deleted" bool,
  "kode_pengalaman_tp" int4,
  "kode_pengalaman_tp_history" int4 NOT NULL DEFAULT nextval('ref_history_pengalaman_tp_kode_pengalaman_tp_history_seq'::regclass),
  "kode_tenaga_pendukung" int4,
  "kode_tenaga_pendukung_history" int4,
  "pengalaman_new" varchar(255) COLLATE "pg_catalog"."default",
  "pengalaman_old" varchar(255) COLLATE "pg_catalog"."default",
  "revisi_ke" int2 NOT NULL DEFAULT 0
)
;

-- ----------------------------
-- Table structure for ref_history_pengurus_bu
-- ----------------------------
DROP TABLE IF EXISTS "public"."ref_history_pengurus_bu";
CREATE TABLE "public"."ref_history_pengurus_bu" (
  "kode_pengurus_bu" int4 NOT NULL DEFAULT nextval('ref_history_pengurus_bu_kode_pengurus_bu_seq'::regclass),
  "kode_vendor" int4,
  "bentuk_bu" "public"."bentuk_bu",
  "custom" jsonb,
  "revisi_ke" int2 NOT NULL DEFAULT 0
)
;

-- ----------------------------
-- Table structure for ref_history_personalia_pero
-- ----------------------------
DROP TABLE IF EXISTS "public"."ref_history_personalia_pero";
CREATE TABLE "public"."ref_history_personalia_pero" (
  "kode_personalia" int4 NOT NULL DEFAULT nextval('ref_history_personalia_pero_kode_personalia_seq'::regclass),
  "kode_vendor" int4,
  "nama" varchar(100) COLLATE "pg_catalog"."default",
  "nik" varchar(20) COLLATE "pg_catalog"."default",
  "tempat_lahir" varchar(100) COLLATE "pg_catalog"."default",
  "tgl_lahir" date,
  "bidang_keahlian" varchar(100) COLLATE "pg_catalog"."default",
  "kode_jenjang_pendidikan" int4,
  "program_studi" varchar(100) COLLATE "pg_catalog"."default",
  "file_ktp" text COLLATE "pg_catalog"."default",
  "is_ktp_selamanya" bool,
  "ktp_berlaku_awal" date,
  "ktp_berlaku_akhir" date,
  "encrypt_key_ktp" varchar(255) COLLATE "pg_catalog"."default",
  "file_ijazah" text COLLATE "pg_catalog"."default",
  "is_ijazah_selamanya" bool,
  "ijazah_berlaku_awal" date,
  "ijazah_berlaku_akhir" date,
  "encrypt_key_ijazah" varchar(255) COLLATE "pg_catalog"."default",
  "file_cv" text COLLATE "pg_catalog"."default",
  "is_cv_selamanya" bool,
  "cv_berlaku_awal" date,
  "cv_berlaku_akhir" date,
  "encrypt_key_cv" varchar(255) COLLATE "pg_catalog"."default",
  "custom_teknis" jsonb,
  "revisi_ke" int2 NOT NULL DEFAULT 0
)
;

-- ----------------------------
-- Table structure for ref_history_saham_bu
-- ----------------------------
DROP TABLE IF EXISTS "public"."ref_history_saham_bu";
CREATE TABLE "public"."ref_history_saham_bu" (
  "kode_saham" int4,
  "kode_vendor" int4,
  "kode_saham_history" int4 NOT NULL DEFAULT nextval('ref_history_saham_bu_kode_saham_history_seq'::regclass),
  "nm_saham_old" varchar(100) COLLATE "pg_catalog"."default",
  "no_ktp_saham_old" varchar(200) COLLATE "pg_catalog"."default",
  "persentase_saham_old" varchar(60) COLLATE "pg_catalog"."default",
  "revisi_ke" int2 NOT NULL DEFAULT 0,
  "posisi_old" varchar COLLATE "pg_catalog"."default",
  "path_saham_old" varchar COLLATE "pg_catalog"."default",
  "encrypt_key_old" varchar COLLATE "pg_catalog"."default",
  "nm_saham_new" varchar(100) COLLATE "pg_catalog"."default",
  "no_ktp_saham_new" varchar(200) COLLATE "pg_catalog"."default",
  "persentase_saham_new" varchar(60) COLLATE "pg_catalog"."default",
  "posisi_new" varchar COLLATE "pg_catalog"."default",
  "path_saham_new" varchar COLLATE "pg_catalog"."default",
  "encrypt_key_new" varchar COLLATE "pg_catalog"."default"
)
;
COMMENT ON COLUMN "public"."ref_history_saham_bu"."nm_saham_old" IS 'Nama pemegang saham';
COMMENT ON COLUMN "public"."ref_history_saham_bu"."nm_saham_new" IS 'Nama pemegang saham';

-- ----------------------------
-- Table structure for ref_history_sertif_pero
-- ----------------------------
DROP TABLE IF EXISTS "public"."ref_history_sertif_pero";
CREATE TABLE "public"."ref_history_sertif_pero" (
  "kode_sertif" int4 NOT NULL DEFAULT nextval('ref_history_sertif_pero_kode_sertif_seq'::regclass),
  "kode_vendor" int4,
  "nm_sertifikat" varchar(100) COLLATE "pg_catalog"."default",
  "file_bukti" varchar(255) COLLATE "pg_catalog"."default",
  "encrypt_key" varchar COLLATE "pg_catalog"."default",
  "custom" jsonb,
  "revisi_ke" int2 NOT NULL DEFAULT 0
)
;

-- ----------------------------
-- Table structure for ref_history_sertif_ta
-- ----------------------------
DROP TABLE IF EXISTS "public"."ref_history_sertif_ta";
CREATE TABLE "public"."ref_history_sertif_ta" (
  "kode_sertif_ta" int4 NOT NULL,
  "kode_tenaga_ahli_history" int4,
  "sertifikat_old" varchar(255) COLLATE "pg_catalog"."default",
  "file_bukti_old" varchar(255) COLLATE "pg_catalog"."default",
  "encrypt_key_old" varchar COLLATE "pg_catalog"."default",
  "revisi_ke" int2 NOT NULL DEFAULT 0,
  "kode_sertif_ta_history" int4 NOT NULL DEFAULT nextval('ref_history_sertif_ta_kode_sertif_ta_history_seq'::regclass),
  "sertifikat_new" varchar(255) COLLATE "pg_catalog"."default",
  "file_bukti_new" varchar(255) COLLATE "pg_catalog"."default",
  "encrypt_key_new" varchar COLLATE "pg_catalog"."default",
  "is_changes" bool,
  "is_deleted" bool,
  "kode_tenaga_ahli" int4
)
;

-- ----------------------------
-- Table structure for ref_history_sertif_tp
-- ----------------------------
DROP TABLE IF EXISTS "public"."ref_history_sertif_tp";
CREATE TABLE "public"."ref_history_sertif_tp" (
  "kode_sertif_tp" int4,
  "kode_tenaga_pendukung" int4,
  "sertifikat_old" varchar(255) COLLATE "pg_catalog"."default",
  "file_bukti_old" varchar(255) COLLATE "pg_catalog"."default",
  "encrypt_key_old" varchar COLLATE "pg_catalog"."default",
  "revisi_ke" int2 NOT NULL DEFAULT 0,
  "kode_sertif_tp_history" int4 NOT NULL DEFAULT nextval('ref_history_sertif_tp_kode_sertif_tp_history_seq'::regclass),
  "sertifikat_new" varchar(255) COLLATE "pg_catalog"."default",
  "file_bukti_new" varchar(255) COLLATE "pg_catalog"."default",
  "encrypt_key_new" varchar COLLATE "pg_catalog"."default",
  "is_changes" bool,
  "is_deleted" bool,
  "kode_tenaga_pendukung_history" int4
)
;

-- ----------------------------
-- Table structure for ref_history_sertifikat_usaha_bu
-- ----------------------------
DROP TABLE IF EXISTS "public"."ref_history_sertifikat_usaha_bu";
CREATE TABLE "public"."ref_history_sertifikat_usaha_bu" (
  "kode_sertifikat_usaha" int4,
  "kode_vendor" int4,
  "kode_sertifikat_usaha_history" int4 NOT NULL DEFAULT nextval('ref_history_sertifikat_usaha__kode_sertifikat_usaha_history_seq'::regclass),
  "nama_judul_old" varchar(150) COLLATE "pg_catalog"."default",
  "nomor_old" varchar(50) COLLATE "pg_catalog"."default",
  "penerbit_old" varchar(50) COLLATE "pg_catalog"."default",
  "tanggal_old" date,
  "file_sertif_old" varchar(255) COLLATE "pg_catalog"."default",
  "is_sertif_selamanya_old" bool,
  "sertif_berlaku_awal_old" date,
  "sertif_berlaku_akhir_old" date,
  "encrypt_key_old" varchar(255) COLLATE "pg_catalog"."default",
  "revisi_ke" int2 NOT NULL DEFAULT '0'::smallint,
  "nama_judul_new" varchar(150) COLLATE "pg_catalog"."default",
  "nomor_new" varchar(50) COLLATE "pg_catalog"."default",
  "penerbit_new" varchar(50) COLLATE "pg_catalog"."default",
  "tanggal_new" date,
  "file_sertif_new" varchar(255) COLLATE "pg_catalog"."default",
  "is_sertif_selamanya_new" bool,
  "sertif_berlaku_awal_new" date,
  "sertif_berlaku_akhir_new" date,
  "encrypt_key_new" varchar(255) COLLATE "pg_catalog"."default",
  "is_changes" bool,
  "is_deleted" bool
)
;
COMMENT ON COLUMN "public"."ref_history_sertifikat_usaha_bu"."is_sertif_selamanya_old" IS 'Apakah sertifikat berlaku selamanya?';
COMMENT ON COLUMN "public"."ref_history_sertifikat_usaha_bu"."is_sertif_selamanya_new" IS 'Apakah sertifikat berlaku selamanya?';

-- ----------------------------
-- Table structure for ref_history_tenaga_ahli_bu
-- ----------------------------
DROP TABLE IF EXISTS "public"."ref_history_tenaga_ahli_bu";
CREATE TABLE "public"."ref_history_tenaga_ahli_bu" (
  "kode_tenaga_ahli" int4,
  "kode_vendor" int4,
  "kode_tenaga_ahli_history" int4 NOT NULL DEFAULT nextval('ref_history_tenaga_ahli_bu_kode_tenaga_ahli_history_seq'::regclass),
  "nama_old" varchar(100) COLLATE "pg_catalog"."default",
  "no_ktp_old" varchar(20) COLLATE "pg_catalog"."default",
  "file_ktp_old" varchar(255) COLLATE "pg_catalog"."default",
  "encrypt_key_ktp_old" varchar COLLATE "pg_catalog"."default",
  "tempat_lahir_old" varchar(50) COLLATE "pg_catalog"."default",
  "tgl_lahir_old" date,
  "posisi_old" varchar(100) COLLATE "pg_catalog"."default",
  "kode_jenjang_pendidikan_old" int4,
  "program_studi_old" varchar(50) COLLATE "pg_catalog"."default",
  "file_ijazah_old" varchar(255) COLLATE "pg_catalog"."default",
  "encrypt_key_ijazah_old" varchar COLLATE "pg_catalog"."default",
  "file_cv_old" varchar(255) COLLATE "pg_catalog"."default",
  "encrypt_key_cv_old" varchar COLLATE "pg_catalog"."default",
  "tgl_cv_old" date,
  "revisi_ke" int2 NOT NULL DEFAULT 0,
  "nama_new" varchar(100) COLLATE "pg_catalog"."default",
  "no_ktp_new" varchar(20) COLLATE "pg_catalog"."default",
  "file_ktp_new" varchar(255) COLLATE "pg_catalog"."default",
  "encrypt_key_ktp_new" varchar COLLATE "pg_catalog"."default",
  "tempat_lahir_new" varchar(50) COLLATE "pg_catalog"."default",
  "tgl_lahir_new" date,
  "posisi_new" varchar(100) COLLATE "pg_catalog"."default",
  "kode_jenjang_pendidikan_new" int4,
  "program_studi_new" varchar(50) COLLATE "pg_catalog"."default",
  "file_ijazah_new" varchar(255) COLLATE "pg_catalog"."default",
  "encrypt_key_ijazah_new" varchar COLLATE "pg_catalog"."default",
  "file_cv_new" varchar(255) COLLATE "pg_catalog"."default",
  "encrypt_key_cv_new" varchar COLLATE "pg_catalog"."default",
  "tgl_cv_new" date,
  "is_changes" bool,
  "is_deleted" bool
)
;
COMMENT ON COLUMN "public"."ref_history_tenaga_ahli_bu"."tgl_cv_old" IS 'Tgl Pembuatan CV';
COMMENT ON COLUMN "public"."ref_history_tenaga_ahli_bu"."tgl_cv_new" IS 'Tgl Pembuatan CV';

-- ----------------------------
-- Table structure for ref_history_tenaga_pendukung_bu
-- ----------------------------
DROP TABLE IF EXISTS "public"."ref_history_tenaga_pendukung_bu";
CREATE TABLE "public"."ref_history_tenaga_pendukung_bu" (
  "kode_tenaga_pendukung_history" int4 NOT NULL DEFAULT nextval('ref_history_tenaga_pendukung__kode_tenaga_pendukung_history_seq'::regclass),
  "kode_tenaga_pendukung" int4,
  "kode_vendor" int4,
  "nama_old" varchar(100) COLLATE "pg_catalog"."default",
  "no_ktp_old" varchar(20) COLLATE "pg_catalog"."default",
  "file_ktp_old" varchar(255) COLLATE "pg_catalog"."default",
  "encrypt_key_ktp_old" varchar COLLATE "pg_catalog"."default",
  "tempat_lahir_old" varchar(50) COLLATE "pg_catalog"."default",
  "tgl_lahir_old" date,
  "posisi_old" varchar(50) COLLATE "pg_catalog"."default",
  "kode_jenjang_pendidikan_old" int4,
  "program_studi_old" varchar(50) COLLATE "pg_catalog"."default",
  "file_ijazah_old" varchar(255) COLLATE "pg_catalog"."default",
  "encrypt_key_ijazah_old" varchar COLLATE "pg_catalog"."default",
  "file_cv_old" varchar(255) COLLATE "pg_catalog"."default",
  "encrypt_key_cv_old" varchar COLLATE "pg_catalog"."default",
  "tgl_cv_old" date,
  "revisi_ke" int2 NOT NULL DEFAULT 0,
  "nama_new" varchar(100) COLLATE "pg_catalog"."default",
  "no_ktp_new" varchar(20) COLLATE "pg_catalog"."default",
  "file_ktp_new" varchar(255) COLLATE "pg_catalog"."default",
  "encrypt_key_ktp_new" varchar COLLATE "pg_catalog"."default",
  "tempat_lahir_new" varchar(50) COLLATE "pg_catalog"."default",
  "tgl_lahir_new" date,
  "posisi_new" varchar(50) COLLATE "pg_catalog"."default",
  "kode_jenjang_pendidikan_new" int4,
  "program_studi_new" varchar(50) COLLATE "pg_catalog"."default",
  "file_ijazah_new" varchar(255) COLLATE "pg_catalog"."default",
  "encrypt_key_ijazah_new" varchar COLLATE "pg_catalog"."default",
  "file_cv_new" varchar(255) COLLATE "pg_catalog"."default",
  "encrypt_key_cv_new" varchar COLLATE "pg_catalog"."default",
  "tgl_cv_new" date,
  "is_changes" bool,
  "is_deleted" bool
)
;

-- ----------------------------
-- Table structure for ref_history_umum
-- ----------------------------
DROP TABLE IF EXISTS "public"."ref_history_umum";
CREATE TABLE "public"."ref_history_umum" (
  "kode_umum_history" int4 NOT NULL DEFAULT nextval('ref_history_umum_kode_umum_history_seq'::regclass),
  "kode_vendor" int4 NOT NULL,
  "nomor_telp_old" varchar(255) COLLATE "pg_catalog"."default",
  "kode_kualifikasi_usaha_old" int2,
  "alamat_badan_usaha_old" text COLLATE "pg_catalog"."default",
  "file_dok_domisili_old" varchar(255) COLLATE "pg_catalog"."default",
  "is_dok_domisili_selamanya_old" bool,
  "dok_domisili_berlaku_awal_old" date,
  "dok_domisili_berlaku_akhir_old" date,
  "encrypt_key_dok_domisili_old" varchar(255) COLLATE "pg_catalog"."default",
  "revisi_ke" int2 NOT NULL DEFAULT 0,
  "nomor_telp_new" varchar(255) COLLATE "pg_catalog"."default",
  "kode_kualifikasi_usaha_new" int2,
  "alamat_badan_usaha_new" text COLLATE "pg_catalog"."default",
  "file_dok_domisili_new" varchar(255) COLLATE "pg_catalog"."default",
  "is_dok_domisili_selamanya_new" bool,
  "dok_domisili_berlaku_awal_new" date,
  "dok_domisili_berlaku_akhir_new" date,
  "encrypt_key_dok_domisili_new" varchar(255) COLLATE "pg_catalog"."default",
  "kode_umum" int4 NOT NULL
)
;
COMMENT ON COLUMN "public"."ref_history_umum"."nomor_telp_old" IS 'Nomor Telepon Badan Usaha';
COMMENT ON COLUMN "public"."ref_history_umum"."file_dok_domisili_old" IS 'Dokumen Domisili Badan Usaha';
COMMENT ON COLUMN "public"."ref_history_umum"."is_dok_domisili_selamanya_old" IS 'Apakah Dokumen Domisili berlaku selamanya?';
COMMENT ON COLUMN "public"."ref_history_umum"."nomor_telp_new" IS 'Nomor Telepon Badan Usaha';
COMMENT ON COLUMN "public"."ref_history_umum"."file_dok_domisili_new" IS 'Dokumen Domisili Badan Usaha';
COMMENT ON COLUMN "public"."ref_history_umum"."is_dok_domisili_selamanya_new" IS 'Apakah Dokumen Domisili berlaku selamanya?';

-- ----------------------------
-- Table structure for ref_history_vendor
-- ----------------------------
DROP TABLE IF EXISTS "public"."ref_history_vendor";
CREATE TABLE "public"."ref_history_vendor" (
  "kode_vendor_history" int4 NOT NULL DEFAULT nextval('ref_history_vendor_kode_vendor_history_seq'::regclass),
  "kode_vendor" int4,
  "nama_perusahaan_old" varchar COLLATE "pg_catalog"."default",
  "no_telp_old" varchar COLLATE "pg_catalog"."default",
  "npwp_old" varchar COLLATE "pg_catalog"."default",
  "file_npwp_old" varchar COLLATE "pg_catalog"."default",
  "encrypt_key_npwp_old" varchar COLLATE "pg_catalog"."default",
  "nik_old" varchar COLLATE "pg_catalog"."default",
  "nama_narahubung_old" varchar(255) COLLATE "pg_catalog"."default",
  "no_wa_narahubung_old" varchar(20) COLLATE "pg_catalog"."default",
  "nama_perusahaan_new" varchar COLLATE "pg_catalog"."default",
  "no_telp_new" varchar COLLATE "pg_catalog"."default",
  "npwp_new" varchar COLLATE "pg_catalog"."default",
  "file_npwp_new" varchar COLLATE "pg_catalog"."default",
  "encrypt_key_npwp_new" varchar COLLATE "pg_catalog"."default",
  "nik_new" varchar COLLATE "pg_catalog"."default",
  "nama_narahubung_new" varchar(255) COLLATE "pg_catalog"."default",
  "no_wa_narahubung_new" varchar(20) COLLATE "pg_catalog"."default",
  "revisi_ke" int4 DEFAULT 1
)
;

-- ----------------------------
-- Table structure for ref_item_tanya
-- ----------------------------
DROP TABLE IF EXISTS "public"."ref_item_tanya";
CREATE TABLE "public"."ref_item_tanya" (
  "kode_item" int4 NOT NULL DEFAULT nextval('ref_item_tanya_kode_item_seq'::regclass),
  "kode_kat_item_tanya" int4,
  "urutan" int2,
  "nama_item" varchar(255) COLLATE "pg_catalog"."default" DEFAULT NULL::character varying,
  "nama_field" varchar(255) COLLATE "pg_catalog"."default" DEFAULT NULL::character varying,
  "tipe_input" varchar(20) COLLATE "pg_catalog"."default",
  "jenis_item" "public"."jenis_item_tanya",
  "nama_custom_field" varchar(255) COLLATE "pg_catalog"."default" DEFAULT NULL::character varying,
  "kode_penjaringan" int4,
  "is_aktif" bool
)
;
COMMENT ON COLUMN "public"."ref_item_tanya"."jenis_item" IS 'default, custom';

-- ----------------------------
-- Table structure for ref_item_tanya_tpl
-- ----------------------------
DROP TABLE IF EXISTS "public"."ref_item_tanya_tpl";
CREATE TABLE "public"."ref_item_tanya_tpl" (
  "kode_tpl" int4 NOT NULL DEFAULT nextval('ref_item_tanya_tpl_kode_tpl_seq'::regclass),
  "kode_kat_item_tanya" int4,
  "nama_item" varchar(255) COLLATE "pg_catalog"."default" DEFAULT NULL::character varying,
  "nama_field" varchar(255) COLLATE "pg_catalog"."default" DEFAULT NULL::character varying,
  "tipe_input" varchar(20) COLLATE "pg_catalog"."default",
  "nama_custom_field" varchar(255) COLLATE "pg_catalog"."default" DEFAULT NULL::character varying
)
;
COMMENT ON TABLE "public"."ref_item_tanya_tpl" IS 'Master Custom Item';

-- ----------------------------
-- Table structure for ref_izin_usaha_bu
-- ----------------------------
DROP TABLE IF EXISTS "public"."ref_izin_usaha_bu";
CREATE TABLE "public"."ref_izin_usaha_bu" (
  "kode_izin_usaha" int4 NOT NULL DEFAULT nextval('ref_izin_usaha_bu_kode_izin_usaha_seq'::regclass),
  "kode_vendor" int4,
  "jenis_izin_usaha" "public"."jenis_izin_usaha",
  "nama" varchar(255) COLLATE "pg_catalog"."default",
  "nomor_izin" varchar(150) COLLATE "pg_catalog"."default",
  "file_izin" varchar(255) COLLATE "pg_catalog"."default",
  "is_izin_selamanya" bool,
  "izin_berlaku_awal" date,
  "izin_berlaku_akhir" date,
  "encrypt_key" varchar(255) COLLATE "pg_catalog"."default",
  "revisi_ke" int2 NOT NULL DEFAULT 0
)
;
COMMENT ON COLUMN "public"."ref_izin_usaha_bu"."jenis_izin_usaha" IS 'nib, sbu, lainya';
COMMENT ON COLUMN "public"."ref_izin_usaha_bu"."is_izin_selamanya" IS 'Apakah Izin berlaku selamanya?';

-- ----------------------------
-- Table structure for ref_izin_usaha_bu_custom
-- ----------------------------
DROP TABLE IF EXISTS "public"."ref_izin_usaha_bu_custom";
CREATE TABLE "public"."ref_izin_usaha_bu_custom" (
  "kode_izin_usaha_custom" int4 NOT NULL DEFAULT nextval('ref_izin_usaha_bu_custom_kode_izin_usaha_custom_seq'::regclass),
  "kode_vendor" int4,
  "kode_penjaringan" int4,
  "jenis_izin_usaha" "public"."jenis_izin_usaha",
  "nama" varchar(150) COLLATE "pg_catalog"."default",
  "nomor_izin" varchar(150) COLLATE "pg_catalog"."default",
  "file_izin" varchar(255) COLLATE "pg_catalog"."default",
  "is_izin_selamanya" bool,
  "izin_berlaku_awal" date,
  "izin_berlaku_akhir" date,
  "encrypt_key" varchar(255) COLLATE "pg_catalog"."default",
  "revisi_ke" int2 NOT NULL DEFAULT 0,
  "kode_izin_usaha" int4
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
COMMENT ON TABLE "public"."ref_jenis_pengadaan" IS 'Barang, Jasa Konsultansi, Konstruksi, Jasa Lainnya';

-- ----------------------------
-- Table structure for ref_jenis_vendor
-- ----------------------------
DROP TABLE IF EXISTS "public"."ref_jenis_vendor";
CREATE TABLE "public"."ref_jenis_vendor" (
  "kode_jenis_vendor" int2 NOT NULL,
  "jenis_vendor" varchar COLLATE "pg_catalog"."default"
)
;
COMMENT ON TABLE "public"."ref_jenis_vendor" IS 'Badan Usaha, Perorangan';

-- ----------------------------
-- Table structure for ref_jenjang_pendidikan
-- ----------------------------
DROP TABLE IF EXISTS "public"."ref_jenjang_pendidikan";
CREATE TABLE "public"."ref_jenjang_pendidikan" (
  "kode_jenjang_pendidikan" int4 NOT NULL,
  "jenjang_pendidikan" varchar(20) COLLATE "pg_catalog"."default"
)
;

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
-- Table structure for ref_kantor_bu
-- ----------------------------
DROP TABLE IF EXISTS "public"."ref_kantor_bu";
CREATE TABLE "public"."ref_kantor_bu" (
  "kode_kantor" int4 NOT NULL DEFAULT nextval('ref_kantor_bu_kode_kantor_seq'::regclass),
  "kode_vendor" int4,
  "nama_kantor" varchar(30) COLLATE "pg_catalog"."default" DEFAULT NULL::character varying,
  "alamat" text COLLATE "pg_catalog"."default",
  "kode_kondisi" int4,
  "kode_kepemilikan" int4,
  "file_bukti" varchar(255) COLLATE "pg_catalog"."default",
  "is_bukti_selamanya" bool,
  "bukti_berlaku_awal" date,
  "bukti_berlaku_akhir" date,
  "encrypt_key_bukti" varchar(255) COLLATE "pg_catalog"."default",
  "file_foto" varchar(255) COLLATE "pg_catalog"."default",
  "encrypt_key_foto" varchar(255) COLLATE "pg_catalog"."default",
  "revisi_ke" int2 NOT NULL DEFAULT 0
)
;
COMMENT ON COLUMN "public"."ref_kantor_bu"."file_bukti" IS 'Bukti kepemilikan';
COMMENT ON COLUMN "public"."ref_kantor_bu"."is_bukti_selamanya" IS 'Apakah berlaku selamanya?';

-- ----------------------------
-- Table structure for ref_kantor_bu_custom
-- ----------------------------
DROP TABLE IF EXISTS "public"."ref_kantor_bu_custom";
CREATE TABLE "public"."ref_kantor_bu_custom" (
  "kode_kantor_custom" int4 NOT NULL DEFAULT nextval('ref_kantor_bu_custom_kode_kantor_custom_seq'::regclass),
  "kode_vendor" int4,
  "kode_penjaringan" int4,
  "nama_kantor" varchar(30) COLLATE "pg_catalog"."default" DEFAULT NULL::character varying,
  "alamat" text COLLATE "pg_catalog"."default",
  "kode_kondisi" int4,
  "kode_kepemilikan" int4,
  "file_bukti" varchar(255) COLLATE "pg_catalog"."default",
  "is_bukti_selamanya" bool,
  "bukti_berlaku_awal" date,
  "bukti_berlaku_akhir" date,
  "encrypt_key_bukti" varchar(255) COLLATE "pg_catalog"."default",
  "file_foto" varchar(255) COLLATE "pg_catalog"."default",
  "encrypt_key_foto" varchar(255) COLLATE "pg_catalog"."default",
  "revisi_ke" int2 NOT NULL DEFAULT 0,
  "kode_kantor" int4
)
;

-- ----------------------------
-- Table structure for ref_kat_item_tanya
-- ----------------------------
DROP TABLE IF EXISTS "public"."ref_kat_item_tanya";
CREATE TABLE "public"."ref_kat_item_tanya" (
  "kode_kat_item_tanya" int4 NOT NULL DEFAULT nextval('ref_kat_item_tanya_kode_kat_item_tanya_seq'::regclass),
  "kode_jenis_vendor" int2,
  "kode_subkat" int4,
  "kat_item_tanya" varchar(200) COLLATE "pg_catalog"."default",
  "nama_custom_field" varchar(255) COLLATE "pg_catalog"."default" DEFAULT NULL::character varying
)
;

-- ----------------------------
-- Table structure for ref_kat_persyaratan
-- ----------------------------
DROP TABLE IF EXISTS "public"."ref_kat_persyaratan";
CREATE TABLE "public"."ref_kat_persyaratan" (
  "kode_kat_persyaratan" int4 NOT NULL DEFAULT nextval('ref_kat_persyaratan_kode_kat_persyaratan_seq'::regclass),
  "kategori" varchar(50) COLLATE "pg_catalog"."default"
)
;

-- ----------------------------
-- Table structure for ref_kategori
-- ----------------------------
DROP TABLE IF EXISTS "public"."ref_kategori";
CREATE TABLE "public"."ref_kategori" (
  "kode_kategori" int4 NOT NULL DEFAULT nextval('ref_kategori_kode_kategori_seq'::regclass),
  "nama_kategori" varchar COLLATE "pg_catalog"."default"
)
;
COMMENT ON TABLE "public"."ref_kategori" IS 'Daftar kategori yang bisa digunakan PPK bila ada pengajuan';

-- ----------------------------
-- Table structure for ref_kbli_sbu
-- ----------------------------
DROP TABLE IF EXISTS "public"."ref_kbli_sbu";
CREATE TABLE "public"."ref_kbli_sbu" (
  "kode_kbli_sbu" int4 NOT NULL DEFAULT nextval('ref_kbli_sbu_kode_kbli_sbu_seq'::regclass),
  "jenis_izin" "public"."jenis_izin",
  "kode" varchar(10) COLLATE "pg_catalog"."default",
  "judul" text COLLATE "pg_catalog"."default",
  "tahun" int4
)
;

-- ----------------------------
-- Table structure for ref_kepemilikan
-- ----------------------------
DROP TABLE IF EXISTS "public"."ref_kepemilikan";
CREATE TABLE "public"."ref_kepemilikan" (
  "kode_kepemilikan" int4 NOT NULL,
  "kepemilikan" varchar(20) COLLATE "pg_catalog"."default"
)
;

-- ----------------------------
-- Table structure for ref_keuangan_bu
-- ----------------------------
DROP TABLE IF EXISTS "public"."ref_keuangan_bu";
CREATE TABLE "public"."ref_keuangan_bu" (
  "kode_keuangan" int4 NOT NULL DEFAULT nextval('ref_keuangan_bu_kode_keuangan_seq'::regclass),
  "kode_vendor" int4,
  "nm_pemilik_rek" varchar(100) COLLATE "pg_catalog"."default",
  "no_rek" varchar(50) COLLATE "pg_catalog"."default",
  "sandi_bank" varchar(4) COLLATE "pg_catalog"."default",
  "file_buku_rek" text COLLATE "pg_catalog"."default",
  "encrypt_key_buku_rek" varchar(255) COLLATE "pg_catalog"."default",
  "file_lap_keu" text COLLATE "pg_catalog"."default",
  "lap_keu_berlaku_awal" date,
  "lap_keu_berlaku_akhir" date,
  "encrypt_key_lap_keu" varchar(255) COLLATE "pg_catalog"."default",
  "file_lap_keu_audited" text COLLATE "pg_catalog"."default",
  "lap_keu_audited_berlaku_awal" date,
  "lap_keu_audited_berlaku_akhir" date,
  "encrypt_key_lap_keu_audited" varchar(255) COLLATE "pg_catalog"."default",
  "revisi_ke" int2 NOT NULL DEFAULT 0,
  "is_lap_keu_selamanya" bool,
  "is_lap_keu_audited_selamanya" bool
)
;
COMMENT ON TABLE "public"."ref_keuangan_bu" IS 'Data Keuangan Badan Usaha';

-- ----------------------------
-- Table structure for ref_keuangan_pero
-- ----------------------------
DROP TABLE IF EXISTS "public"."ref_keuangan_pero";
CREATE TABLE "public"."ref_keuangan_pero" (
  "kode_keuangan" int4 NOT NULL DEFAULT nextval('ref_keuangan_pero_kode_keuangan_seq'::regclass),
  "kode_vendor" int4,
  "nm_pemilik_rek" varchar(100) COLLATE "pg_catalog"."default",
  "no_rek" varchar(50) COLLATE "pg_catalog"."default",
  "sandi_bank" varchar(4) COLLATE "pg_catalog"."default",
  "file_buku_rek" text COLLATE "pg_catalog"."default",
  "encrypt_key_buku_rek" varchar(255) COLLATE "pg_catalog"."default",
  "revisi_ke" int2 NOT NULL DEFAULT 0
)
;
COMMENT ON TABLE "public"."ref_keuangan_pero" IS 'Data Keuangan Perorangan';

-- ----------------------------
-- Table structure for ref_komisaris_bu
-- ----------------------------
DROP TABLE IF EXISTS "public"."ref_komisaris_bu";
CREATE TABLE "public"."ref_komisaris_bu" (
  "kode_komisaris" int4 NOT NULL DEFAULT nextval('ref_komisaris_bu_kode_komisaris_seq'::regclass),
  "kode_vendor" int4,
  "nm_komisaris" varchar(100) COLLATE "pg_catalog"."default",
  "jbtn_komisaris" varchar(100) COLLATE "pg_catalog"."default",
  "hp_komisaris" varchar(35) COLLATE "pg_catalog"."default",
  "no_ktp_komisaris" varchar(50) COLLATE "pg_catalog"."default",
  "path_ktp_komisaris" varchar(200) COLLATE "pg_catalog"."default",
  "encrypt_key" varchar(255) COLLATE "pg_catalog"."default",
  "revisi_ke" int2 NOT NULL DEFAULT 0
)
;

-- ----------------------------
-- Table structure for ref_komisaris_bu_custom
-- ----------------------------
DROP TABLE IF EXISTS "public"."ref_komisaris_bu_custom";
CREATE TABLE "public"."ref_komisaris_bu_custom" (
  "kode_komisaris_custom" int4 NOT NULL DEFAULT nextval('ref_komisaris_bu_custom_kode_komisaris_custom_seq'::regclass),
  "kode_vendor" int4,
  "kode_penjaringan" int4,
  "nm_komisaris" varchar(100) COLLATE "pg_catalog"."default",
  "jbtn_komisaris" varchar(100) COLLATE "pg_catalog"."default",
  "hp_komisaris" varchar(35) COLLATE "pg_catalog"."default",
  "no_ktp_komisaris" varchar(50) COLLATE "pg_catalog"."default",
  "path_ktp_komisaris" varchar(200) COLLATE "pg_catalog"."default",
  "is_ktp_selamanya" bool,
  "ktp_berlaku_awal" date,
  "ktp_berlaku_akhir" date,
  "encrypt_key" varchar(255) COLLATE "pg_catalog"."default",
  "revisi_ke" int2 NOT NULL DEFAULT 0,
  "kode_komisaris" int4
)
;

-- ----------------------------
-- Table structure for ref_kondisi
-- ----------------------------
DROP TABLE IF EXISTS "public"."ref_kondisi";
CREATE TABLE "public"."ref_kondisi" (
  "kode_kondisi" int2 NOT NULL,
  "kondisi" varchar(20) COLLATE "pg_catalog"."default"
)
;

-- ----------------------------
-- Table structure for ref_kualifikasi_usaha
-- ----------------------------
DROP TABLE IF EXISTS "public"."ref_kualifikasi_usaha";
CREATE TABLE "public"."ref_kualifikasi_usaha" (
  "kode_kualifikasi_usaha" int2 NOT NULL,
  "kualifikasi_usaha" varchar(10) COLLATE "pg_catalog"."default"
)
;
COMMENT ON TABLE "public"."ref_kualifikasi_usaha" IS 'Kecil, Menengah, Besar';

-- ----------------------------
-- Table structure for ref_lan_hukum_bu
-- ----------------------------
DROP TABLE IF EXISTS "public"."ref_lan_hukum_bu";
CREATE TABLE "public"."ref_lan_hukum_bu" (
  "kode_lan_hukum" int4 NOT NULL DEFAULT nextval('ref_lan_hukum_bu_kode_lan_hukum_seq'::regclass),
  "kode_vendor" int4,
  "no_akta_awal" varchar(255) COLLATE "pg_catalog"."default",
  "tgl_akta_awal" date,
  "notaris_awal" varchar(100) COLLATE "pg_catalog"."default",
  "no_sah_awal" varchar(255) COLLATE "pg_catalog"."default",
  "tgl_sah_awal" date,
  "file_akta_awal" text COLLATE "pg_catalog"."default",
  "encrypt_key_akta_awal" varchar(255) COLLATE "pg_catalog"."default",
  "no_akta_rubah" varchar(255) COLLATE "pg_catalog"."default",
  "tgl_akta_rubah" date,
  "notaris_rubah" varchar(100) COLLATE "pg_catalog"."default",
  "no_sah_rubah" varchar(255) COLLATE "pg_catalog"."default",
  "tgl_sah_rubah" date,
  "file_akta_rubah" text COLLATE "pg_catalog"."default",
  "encrypt_key_akta_rubah" varchar(255) COLLATE "pg_catalog"."default",
  "revisi_ke" int2 NOT NULL DEFAULT 0
)
;
COMMENT ON COLUMN "public"."ref_lan_hukum_bu"."no_sah_awal" IS 'Nomor Pengesahan / Pendaftaran';
COMMENT ON COLUMN "public"."ref_lan_hukum_bu"."file_akta_awal" IS 'Scan Akta Pendirian Awal';
COMMENT ON COLUMN "public"."ref_lan_hukum_bu"."no_akta_rubah" IS 'No. Akta setelah Perubahan Terakhir Akta Pendirian Badan Usaha /Anggaran Dasar Koperasi';
COMMENT ON COLUMN "public"."ref_lan_hukum_bu"."no_sah_rubah" IS 'Nomor Pengesahan / Pendaftaran';
COMMENT ON COLUMN "public"."ref_lan_hukum_bu"."file_akta_rubah" IS 'Scan Akta Pendirian Terakhir';
COMMENT ON TABLE "public"."ref_lan_hukum_bu" IS 'Landasan Hukum Pendirian Badan Usaha';

-- ----------------------------
-- Table structure for ref_pakta_integritas
-- ----------------------------
DROP TABLE IF EXISTS "public"."ref_pakta_integritas";
CREATE TABLE "public"."ref_pakta_integritas" (
  "kode_pakta_integritas" int4 NOT NULL DEFAULT nextval('ref_pakta_integritas_kode_pakta_integritas_seq'::regclass),
  "kode_vendor" int4,
  "is_setuju" bool
)
;

-- ----------------------------
-- Table structure for ref_penanggung_jwb
-- ----------------------------
DROP TABLE IF EXISTS "public"."ref_penanggung_jwb";
CREATE TABLE "public"."ref_penanggung_jwb" (
  "kode_penanggung_jwb" int4 NOT NULL DEFAULT nextval('ref_penanggung_jwb_kode_penanggung_jwb_seq'::regclass),
  "kode_vendor" int4,
  "nik" varchar(20) COLLATE "pg_catalog"."default",
  "nama" varchar(100) COLLATE "pg_catalog"."default",
  "email" varchar(80) COLLATE "pg_catalog"."default",
  "jabatan" varchar(100) COLLATE "pg_catalog"."default",
  "file_s_kuasa" text COLLATE "pg_catalog"."default",
  "encrypt_key_s_kuasa" varchar(255) COLLATE "pg_catalog"."default",
  "is_aktif" bool,
  "no_hp" varchar COLLATE "pg_catalog"."default"
)
;
COMMENT ON COLUMN "public"."ref_penanggung_jwb"."file_s_kuasa" IS 'Surat Kuasa';
COMMENT ON TABLE "public"."ref_penanggung_jwb" IS 'Yang boleh TTE dari vendor';

-- ----------------------------
-- Table structure for ref_pengalaman_bu
-- ----------------------------
DROP TABLE IF EXISTS "public"."ref_pengalaman_bu";
CREATE TABLE "public"."ref_pengalaman_bu" (
  "kode_pengalaman_bu" int4 NOT NULL DEFAULT nextval('ref_pengalaman_bu_kode_pengalaman_bu_seq'::regclass),
  "kode_vendor" int4,
  "nama_pekerjaan" text COLLATE "pg_catalog"."default",
  "tgl_awal_pekerjaan" date,
  "tgl_akhir_pekerjaan" date,
  "pemberi_kerja" varchar(255) COLLATE "pg_catalog"."default",
  "nilai_pekerjaan" int8,
  "no_kontrak" varchar(50) COLLATE "pg_catalog"."default",
  "file_kontrak" varchar(255) COLLATE "pg_catalog"."default",
  "encrypt_key_kontrak" varchar(255) COLLATE "pg_catalog"."default",
  "revisi_ke" int2 NOT NULL DEFAULT 0
)
;
COMMENT ON COLUMN "public"."ref_pengalaman_bu"."tgl_awal_pekerjaan" IS 'Pecahan dari Tahun Pekerjaan';
COMMENT ON COLUMN "public"."ref_pengalaman_bu"."tgl_akhir_pekerjaan" IS 'Pecahan dari Tahun Pekerjaan';

-- ----------------------------
-- Table structure for ref_pengalaman_bu_custom
-- ----------------------------
DROP TABLE IF EXISTS "public"."ref_pengalaman_bu_custom";
CREATE TABLE "public"."ref_pengalaman_bu_custom" (
  "kode_pengalaman_bu_custom" int4 NOT NULL DEFAULT nextval('ref_pengalaman_bu_custom_kode_pengalaman_bu_custom_seq'::regclass),
  "kode_vendor" int4,
  "kode_penjaringan" int4,
  "nama_pekerjaan" text COLLATE "pg_catalog"."default",
  "pemberi_kerja" varchar(255) COLLATE "pg_catalog"."default",
  "nilai_pekerjaan" int8,
  "tgl_awal_pekerjaan" date,
  "tgl_akhir_pekerjaan" date,
  "no_kontrak" varchar(50) COLLATE "pg_catalog"."default",
  "file_kontrak" varchar(255) COLLATE "pg_catalog"."default",
  "encrypt_key_kontrak" varchar(255) COLLATE "pg_catalog"."default",
  "revisi_ke" int2 NOT NULL DEFAULT 0,
  "kode_pengalaman_bu" int4
)
;

-- ----------------------------
-- Table structure for ref_pengalaman_pero
-- ----------------------------
DROP TABLE IF EXISTS "public"."ref_pengalaman_pero";
CREATE TABLE "public"."ref_pengalaman_pero" (
  "kode_pengalaman" int4 NOT NULL DEFAULT nextval('ref_pengalaman_pero_kode_pengalaman_seq'::regclass),
  "kode_vendor" int4,
  "nama_pekerjaan" varchar(160) COLLATE "pg_catalog"."default",
  "posisi" varchar(50) COLLATE "pg_catalog"."default",
  "tgl_awal_pekerjaan" date,
  "tgl_akhir_pekerjaan" date,
  "nilai_pekerjaan" int8,
  "file_bukti" varchar(255) COLLATE "pg_catalog"."default",
  "encrypt_key" varchar COLLATE "pg_catalog"."default",
  "revisi_ke" int2 NOT NULL DEFAULT 0
)
;

-- ----------------------------
-- Table structure for ref_pengalaman_pero_custom
-- ----------------------------
DROP TABLE IF EXISTS "public"."ref_pengalaman_pero_custom";
CREATE TABLE "public"."ref_pengalaman_pero_custom" (
  "kode_pengalaman_custom" int4 NOT NULL DEFAULT nextval('ref_pengalaman_pero_custom_kode_pengalaman_custom_seq'::regclass),
  "kode_vendor" int4,
  "nama_pekerjaan" varchar(100) COLLATE "pg_catalog"."default",
  "posisi" varchar(50) COLLATE "pg_catalog"."default",
  "tgl_awal_pekerjaan" date,
  "tgl_akhir_pekerjaan" date,
  "nilai_pekerjaan" int8,
  "file_bukti" varchar(255) COLLATE "pg_catalog"."default",
  "encrypt_key" varchar COLLATE "pg_catalog"."default",
  "revisi_ke" int2 NOT NULL DEFAULT 0,
  "kode_penjaringan" int4,
  "kode_pengalaman" int4
)
;

-- ----------------------------
-- Table structure for ref_pengalaman_ta
-- ----------------------------
DROP TABLE IF EXISTS "public"."ref_pengalaman_ta";
CREATE TABLE "public"."ref_pengalaman_ta" (
  "kode_pengalaman_ta" int4 NOT NULL DEFAULT nextval('ref_pengalaman_ta_kode_pengalaman_ta_seq'::regclass),
  "kode_tenaga_ahli" int4,
  "pengalaman" varchar(255) COLLATE "pg_catalog"."default",
  "file_bukti" varchar(100) COLLATE "pg_catalog"."default",
  "encrypt_key" varchar COLLATE "pg_catalog"."default",
  "revisi_ke" int2 NOT NULL DEFAULT 0
)
;
COMMENT ON TABLE "public"."ref_pengalaman_ta" IS 'Daftar pengalaman tenaga ahli badan usaha';

-- ----------------------------
-- Table structure for ref_pengalaman_ta_custom
-- ----------------------------
DROP TABLE IF EXISTS "public"."ref_pengalaman_ta_custom";
CREATE TABLE "public"."ref_pengalaman_ta_custom" (
  "kode_pengalaman_ta_custom" int4 NOT NULL DEFAULT nextval('ref_pengalaman_ta_custom_kode_pengalaman_ta_custom_seq'::regclass),
  "kode_penjaringan" int4,
  "kode_tenaga_ahli_custom" int4,
  "pengalaman" varchar(255) COLLATE "pg_catalog"."default",
  "file_bukti" varchar(255) COLLATE "pg_catalog"."default",
  "encrypt_key" varchar COLLATE "pg_catalog"."default",
  "revisi_ke" int2 NOT NULL DEFAULT 0,
  "kode_pengalaman_ta" int4
)
;

-- ----------------------------
-- Table structure for ref_pengalaman_tp
-- ----------------------------
DROP TABLE IF EXISTS "public"."ref_pengalaman_tp";
CREATE TABLE "public"."ref_pengalaman_tp" (
  "kode_pengalaman_tp" int4 NOT NULL DEFAULT nextval('ref_pengalaman_tp_kode_pengalaman_tp_seq'::regclass),
  "kode_tenaga_pendukung" int4,
  "pengalaman" varchar(255) COLLATE "pg_catalog"."default",
  "file_bukti" varchar(100) COLLATE "pg_catalog"."default",
  "encrypt_key" varchar COLLATE "pg_catalog"."default",
  "revisi_ke" int2 NOT NULL DEFAULT 0
)
;
COMMENT ON TABLE "public"."ref_pengalaman_tp" IS 'Daftar pengalaman tenaga pendukung badan usaha';

-- ----------------------------
-- Table structure for ref_pengalaman_tp_custom
-- ----------------------------
DROP TABLE IF EXISTS "public"."ref_pengalaman_tp_custom";
CREATE TABLE "public"."ref_pengalaman_tp_custom" (
  "kode_pengalaman_tp_custom" int4 NOT NULL DEFAULT nextval('ref_pengalaman_tp_custom_kode_pengalaman_tp_custom_seq'::regclass),
  "kode_penjaringan" int4,
  "kode_tenaga_pendukung_custom" int4,
  "pengalaman" varchar(255) COLLATE "pg_catalog"."default",
  "file_bukti" varchar(255) COLLATE "pg_catalog"."default",
  "encrypt_key" varchar COLLATE "pg_catalog"."default",
  "revisi_ke" int2 NOT NULL DEFAULT 0,
  "kode_pengalaman_tp" int4
)
;

-- ----------------------------
-- Table structure for ref_pengurus_bu
-- ----------------------------
DROP TABLE IF EXISTS "public"."ref_pengurus_bu";
CREATE TABLE "public"."ref_pengurus_bu" (
  "kode_pengurus_bu" int4 NOT NULL DEFAULT nextval('ref_pengurus_bu_kode_pengurus_bu_seq'::regclass),
  "kode_vendor" int4,
  "bentuk_bu" "public"."bentuk_bu",
  "revisi_ke" int2 NOT NULL DEFAULT 0
)
;
COMMENT ON COLUMN "public"."ref_pengurus_bu"."bentuk_bu" IS 'Bentuk Badan Usaha';
COMMENT ON TABLE "public"."ref_pengurus_bu" IS 'Pengurus badan usaha';

-- ----------------------------
-- Table structure for ref_pengurus_bu_verif
-- ----------------------------
DROP TABLE IF EXISTS "public"."ref_pengurus_bu_verif";
CREATE TABLE "public"."ref_pengurus_bu_verif" (
  "kode_verif" int4 NOT NULL DEFAULT nextval('ref_pengurus_bu_verif_kode_verif_seq'::regclass),
  "kode_vendor_penjr" int4,
  "kode_pengurus_bu" int4,
  "is_bentuk_bu_sesuai" bool,
  "komentar_bentuk_bu" varchar(255) COLLATE "pg_catalog"."default",
  "custom" jsonb
)
;

-- ----------------------------
-- Table structure for ref_persentase_penilaian
-- ----------------------------
DROP TABLE IF EXISTS "public"."ref_persentase_penilaian";
CREATE TABLE "public"."ref_persentase_penilaian" (
  "kode_persentase" int4 NOT NULL DEFAULT nextval('ref_persentase_penilaian_kode_persentase_seq'::regclass),
  "kode_penjaringan" int4,
  "teknis" int4,
  "personalia" int4,
  "kantor" int4,
  "peralatan" int4,
  "pengalaman" int4,
  "keuangan" int4,
  "lap_keu" int4,
  "sertifikat" int4
)
;

-- ----------------------------
-- Table structure for ref_persentase_penilaian_tpl
-- ----------------------------
DROP TABLE IF EXISTS "public"."ref_persentase_penilaian_tpl";
CREATE TABLE "public"."ref_persentase_penilaian_tpl" (
  "kode_tpl" int4 NOT NULL,
  "kode_jenis_vendor" int4,
  "teknis" int4,
  "personalia" int4,
  "kantor" int4,
  "peralatan" int4,
  "pengalaman" int4,
  "keuangan" int4,
  "lap_keu" int4,
  "sertifikat" int4
)
;

-- ----------------------------
-- Table structure for ref_persentasi_evaluasi
-- ----------------------------
DROP TABLE IF EXISTS "public"."ref_persentasi_evaluasi";
CREATE TABLE "public"."ref_persentasi_evaluasi" (
  "kode_persentase" int4 NOT NULL DEFAULT nextval('ref_persentasi_evaluasi_kode_persentase_seq'::regclass),
  "persen_personalia_perorangan" int2,
  "persen_pengalaman_perorangan" int2,
  "persen_sertifikat_perorangan" int2,
  "persen_personalia_bu" int2,
  "persen_kantor_bu" int2,
  "persen_peralatan_bu" int2,
  "persen_pengalaman_bu" int2,
  "teknis_perorangan" int2,
  "teknis_bu" int2,
  "persen_keuangan_bu" int2,
  "kode_jenis_vendor" int4,
  "is_default" bool
)
;

-- ----------------------------
-- Table structure for ref_personalia_pero
-- ----------------------------
DROP TABLE IF EXISTS "public"."ref_personalia_pero";
CREATE TABLE "public"."ref_personalia_pero" (
  "kode_personalia" int4 NOT NULL DEFAULT nextval('ref_personalia_pero_kode_personalia_seq'::regclass),
  "kode_vendor" int4,
  "bidang_keahlian" varchar(100) COLLATE "pg_catalog"."default",
  "kode_jenjang_pendidikan" int4,
  "program_studi" varchar(100) COLLATE "pg_catalog"."default",
  "file_ijazah" text COLLATE "pg_catalog"."default",
  "encrypt_key_ijazah" varchar(255) COLLATE "pg_catalog"."default",
  "file_cv" text COLLATE "pg_catalog"."default",
  "encrypt_key_cv" varchar(255) COLLATE "pg_catalog"."default",
  "tgl_cv" date,
  "revisi_ke" int2 NOT NULL DEFAULT 0
)
;
COMMENT ON COLUMN "public"."ref_personalia_pero"."tgl_cv" IS 'Tgl Pembuatan CV';
COMMENT ON TABLE "public"."ref_personalia_pero" IS 'Teknis (Perorangan)';

-- ----------------------------
-- Table structure for ref_saham_bu
-- ----------------------------
DROP TABLE IF EXISTS "public"."ref_saham_bu";
CREATE TABLE "public"."ref_saham_bu" (
  "kode_saham" int4 NOT NULL DEFAULT nextval('ref_saham_bu_kode_saham_seq'::regclass),
  "kode_vendor" int4,
  "nm_saham" varchar(100) COLLATE "pg_catalog"."default",
  "no_ktp_saham" varchar(200) COLLATE "pg_catalog"."default",
  "persentase_saham" varchar(60) COLLATE "pg_catalog"."default",
  "revisi_ke" int2 NOT NULL DEFAULT 0,
  "posisi" varchar COLLATE "pg_catalog"."default",
  "path_saham" varchar COLLATE "pg_catalog"."default",
  "encrypt_key" varchar COLLATE "pg_catalog"."default"
)
;
COMMENT ON COLUMN "public"."ref_saham_bu"."nm_saham" IS 'Nama pemegang saham';

-- ----------------------------
-- Table structure for ref_saham_bu_custom
-- ----------------------------
DROP TABLE IF EXISTS "public"."ref_saham_bu_custom";
CREATE TABLE "public"."ref_saham_bu_custom" (
  "kode_saham_custom" int4 NOT NULL DEFAULT nextval('ref_saham_bu_custom_kode_saham_custom_seq'::regclass),
  "kode_vendor" int4,
  "kode_penjaringan" int4,
  "nm_saham" varchar(100) COLLATE "pg_catalog"."default",
  "no_ktp_saham" varchar(90) COLLATE "pg_catalog"."default",
  "posisi" text COLLATE "pg_catalog"."default",
  "persentase_saham" varchar(60) COLLATE "pg_catalog"."default",
  "revisi_ke" int2 NOT NULL DEFAULT 0,
  "kode_saham" int4
)
;

-- ----------------------------
-- Table structure for ref_sanksi_vendor
-- ----------------------------
DROP TABLE IF EXISTS "public"."ref_sanksi_vendor";
CREATE TABLE "public"."ref_sanksi_vendor" (
  "kode_sanksi_vendor" int2 NOT NULL,
  "nama_sanksi" varchar(100) COLLATE "pg_catalog"."default"
)
;

-- ----------------------------
-- Table structure for ref_sertif_pero
-- ----------------------------
DROP TABLE IF EXISTS "public"."ref_sertif_pero";
CREATE TABLE "public"."ref_sertif_pero" (
  "kode_sertif" int4 NOT NULL DEFAULT nextval('ref_sertif_pero_kode_sertif_seq'::regclass),
  "kode_vendor" int4,
  "nm_sertifikat" varchar(100) COLLATE "pg_catalog"."default",
  "file_bukti" varchar(255) COLLATE "pg_catalog"."default",
  "is_bukti_selamanya" bool,
  "bukti_berlaku_awal" date,
  "bukti_berlaku_akhir" date,
  "encrypt_key" varchar COLLATE "pg_catalog"."default",
  "revisi_ke" int2 NOT NULL DEFAULT 0
)
;
COMMENT ON COLUMN "public"."ref_sertif_pero"."is_bukti_selamanya" IS 'Apakah sertifikat berlaku selamanya?';

-- ----------------------------
-- Table structure for ref_sertif_pero_custom
-- ----------------------------
DROP TABLE IF EXISTS "public"."ref_sertif_pero_custom";
CREATE TABLE "public"."ref_sertif_pero_custom" (
  "kode_sertif_pero_custom" int4 NOT NULL DEFAULT nextval('ref_sertif_pero_custom_kode_sertif_pero_custom_seq'::regclass),
  "kode_vendor" int4,
  "kode_penjaringan" int4,
  "nm_sertifikat" varchar(100) COLLATE "pg_catalog"."default",
  "file_bukti" varchar(255) COLLATE "pg_catalog"."default",
  "is_bukti_selamanya" bool,
  "bukti_berlaku_awal" date,
  "bukti_berlaku_akhir" date,
  "encrypt_key" varchar COLLATE "pg_catalog"."default",
  "revisi_ke" int2 NOT NULL DEFAULT 0,
  "kode_sertif" int4
)
;

-- ----------------------------
-- Table structure for ref_sertif_ta
-- ----------------------------
DROP TABLE IF EXISTS "public"."ref_sertif_ta";
CREATE TABLE "public"."ref_sertif_ta" (
  "kode_sertif_ta" int4 NOT NULL DEFAULT nextval('ref_sertif_ta_kode_sertif_ta_seq'::regclass),
  "kode_tenaga_ahli" int4,
  "sertifikat" varchar(255) COLLATE "pg_catalog"."default",
  "file_bukti" varchar(100) COLLATE "pg_catalog"."default",
  "encrypt_key" varchar COLLATE "pg_catalog"."default",
  "revisi_ke" int2 NOT NULL DEFAULT 0
)
;
COMMENT ON TABLE "public"."ref_sertif_ta" IS 'Daftar sertifikat tenaga ahli badan usaha';

-- ----------------------------
-- Table structure for ref_sertif_ta_custom
-- ----------------------------
DROP TABLE IF EXISTS "public"."ref_sertif_ta_custom";
CREATE TABLE "public"."ref_sertif_ta_custom" (
  "kode_sertif_ta_custom" int4 NOT NULL DEFAULT nextval('ref_sertif_ta_custom_kode_sertif_ta_custom_seq'::regclass),
  "kode_penjaringan" int4,
  "kode_tenaga_ahli_custom" int4,
  "sertifikat" varchar(255) COLLATE "pg_catalog"."default",
  "file_bukti" varchar(255) COLLATE "pg_catalog"."default",
  "encrypt_key" varchar COLLATE "pg_catalog"."default",
  "revisi_ke" int2 NOT NULL DEFAULT 0,
  "kode_sertif_ta" int4
)
;

-- ----------------------------
-- Table structure for ref_sertif_tp
-- ----------------------------
DROP TABLE IF EXISTS "public"."ref_sertif_tp";
CREATE TABLE "public"."ref_sertif_tp" (
  "kode_sertif_tp" int4 NOT NULL DEFAULT nextval('ref_sertif_tp_kode_sertif_tp_seq'::regclass),
  "kode_tenaga_pendukung" int4,
  "sertifikat" varchar(255) COLLATE "pg_catalog"."default",
  "file_bukti" varchar(100) COLLATE "pg_catalog"."default",
  "encrypt_key" varchar COLLATE "pg_catalog"."default",
  "revisi_ke" int2 NOT NULL DEFAULT 0
)
;
COMMENT ON TABLE "public"."ref_sertif_tp" IS 'Daftar sertifikat tenaga pendukung badan usaha';

-- ----------------------------
-- Table structure for ref_sertif_tp_custom
-- ----------------------------
DROP TABLE IF EXISTS "public"."ref_sertif_tp_custom";
CREATE TABLE "public"."ref_sertif_tp_custom" (
  "kode_sertif_tp_custom" int4 NOT NULL DEFAULT nextval('ref_sertif_tp_custom_kode_sertif_tp_custom_seq'::regclass),
  "kode_penjaringan" int4,
  "kode_tenaga_pendukung_custom" int4,
  "sertifikat" varchar(255) COLLATE "pg_catalog"."default",
  "file_bukti" varchar(255) COLLATE "pg_catalog"."default",
  "encrypt_key" varchar COLLATE "pg_catalog"."default",
  "revisi_ke" int2 NOT NULL DEFAULT 0,
  "kode_sertif_tp" int4
)
;

-- ----------------------------
-- Table structure for ref_sertifikat_usaha_bu
-- ----------------------------
DROP TABLE IF EXISTS "public"."ref_sertifikat_usaha_bu";
CREATE TABLE "public"."ref_sertifikat_usaha_bu" (
  "kode_sertifikat_usaha" int4 NOT NULL DEFAULT nextval('ref_sertifikat_usaha_bu_kode_sertifikat_usaha_seq'::regclass),
  "kode_vendor" int4,
  "nama_judul" varchar(150) COLLATE "pg_catalog"."default",
  "nomor" varchar(50) COLLATE "pg_catalog"."default",
  "penerbit" varchar(50) COLLATE "pg_catalog"."default",
  "tanggal" date,
  "file_sertif" varchar(255) COLLATE "pg_catalog"."default",
  "is_sertif_selamanya" bool,
  "sertif_berlaku_awal" date,
  "sertif_berlaku_akhir" date,
  "encrypt_key" varchar(255) COLLATE "pg_catalog"."default",
  "revisi_ke" int2 NOT NULL DEFAULT 0
)
;
COMMENT ON COLUMN "public"."ref_sertifikat_usaha_bu"."is_sertif_selamanya" IS 'Apakah sertifikat berlaku selamanya?';

-- ----------------------------
-- Table structure for ref_sertifikat_usaha_bu_custom
-- ----------------------------
DROP TABLE IF EXISTS "public"."ref_sertifikat_usaha_bu_custom";
CREATE TABLE "public"."ref_sertifikat_usaha_bu_custom" (
  "kode_sertifikat_usaha_custom" int4 NOT NULL DEFAULT nextval('ref_sertifikat_usaha_bu_custom_kode_sertifikat_usaha_custom_seq'::regclass),
  "kode_vendor" int4,
  "kode_penjaringan" int4,
  "nama_judul" varchar(150) COLLATE "pg_catalog"."default",
  "nomor" varchar(50) COLLATE "pg_catalog"."default",
  "penerbit" varchar(50) COLLATE "pg_catalog"."default",
  "tanggal" date,
  "file_sertif" varchar(255) COLLATE "pg_catalog"."default",
  "is_sertif_selamanya" bool,
  "sertif_berlaku_awal" date,
  "sertif_berlaku_akhir" date,
  "encrypt_key" varchar(255) COLLATE "pg_catalog"."default",
  "revisi_ke" int2 NOT NULL DEFAULT 0,
  "kode_sertifikat_usaha" int4
)
;

-- ----------------------------
-- Table structure for ref_status_keluar_dpt
-- ----------------------------
DROP TABLE IF EXISTS "public"."ref_status_keluar_dpt";
CREATE TABLE "public"."ref_status_keluar_dpt" (
  "kode_status_keluar_dpt" int4 NOT NULL DEFAULT nextval('ref_status_keluar_dpt_kode_status_keluar_dpt_seq'::regclass),
  "status" varchar(100) COLLATE "pg_catalog"."default"
)
;

-- ----------------------------
-- Table structure for ref_status_pengajuan_penjr
-- ----------------------------
DROP TABLE IF EXISTS "public"."ref_status_pengajuan_penjr";
CREATE TABLE "public"."ref_status_pengajuan_penjr" (
  "kode_status_pengajuan" int4 NOT NULL,
  "status_umum" varchar(30) COLLATE "pg_catalog"."default",
  "status_di_ppk" varchar(30) COLLATE "pg_catalog"."default"
)
;

-- ----------------------------
-- Table structure for ref_status_penjaringan
-- ----------------------------
DROP TABLE IF EXISTS "public"."ref_status_penjaringan";
CREATE TABLE "public"."ref_status_penjaringan" (
  "kode_status_penjaringan" int4 NOT NULL,
  "status" varchar(100) COLLATE "pg_catalog"."default"
)
;

-- ----------------------------
-- Table structure for ref_step_verifikasi_evaluasi
-- ----------------------------
DROP TABLE IF EXISTS "public"."ref_step_verifikasi_evaluasi";
CREATE TABLE "public"."ref_step_verifikasi_evaluasi" (
  "kode_step_verifikasi" int4 NOT NULL,
  "step_verifikasi" varchar(50) COLLATE "pg_catalog"."default"
)
;

-- ----------------------------
-- Table structure for ref_subkat_persyaratan
-- ----------------------------
DROP TABLE IF EXISTS "public"."ref_subkat_persyaratan";
CREATE TABLE "public"."ref_subkat_persyaratan" (
  "kode_subkat" int4 NOT NULL DEFAULT nextval('ref_subkat_persyaratan_kode_subkat_seq'::regclass),
  "kode_kat_persyaratan" int4,
  "sub_kategori" varchar(100) COLLATE "pg_catalog"."default"
)
;

-- ----------------------------
-- Table structure for ref_tenaga_ahli_bu
-- ----------------------------
DROP TABLE IF EXISTS "public"."ref_tenaga_ahli_bu";
CREATE TABLE "public"."ref_tenaga_ahli_bu" (
  "kode_tenaga_ahli" int4 NOT NULL DEFAULT nextval('ref_tenaga_ahli_bu_kode_tenaga_ahli_seq'::regclass),
  "kode_vendor" int4,
  "nama" varchar(100) COLLATE "pg_catalog"."default",
  "no_ktp" varchar(20) COLLATE "pg_catalog"."default",
  "file_ktp" varchar(255) COLLATE "pg_catalog"."default",
  "encrypt_key_ktp" varchar COLLATE "pg_catalog"."default",
  "tempat_lahir" varchar(50) COLLATE "pg_catalog"."default",
  "tgl_lahir" date,
  "posisi" varchar(100) COLLATE "pg_catalog"."default",
  "kode_jenjang_pendidikan" int4,
  "program_studi" varchar(50) COLLATE "pg_catalog"."default",
  "file_ijazah" varchar(255) COLLATE "pg_catalog"."default",
  "encrypt_key_ijazah" varchar COLLATE "pg_catalog"."default",
  "file_cv" varchar(255) COLLATE "pg_catalog"."default",
  "encrypt_key_cv" varchar COLLATE "pg_catalog"."default",
  "tgl_cv" date,
  "revisi_ke" int2 NOT NULL DEFAULT 0
)
;
COMMENT ON COLUMN "public"."ref_tenaga_ahli_bu"."tgl_cv" IS 'Tgl Pembuatan CV';

-- ----------------------------
-- Table structure for ref_tenaga_ahli_bu_custom
-- ----------------------------
DROP TABLE IF EXISTS "public"."ref_tenaga_ahli_bu_custom";
CREATE TABLE "public"."ref_tenaga_ahli_bu_custom" (
  "kode_tenaga_ahli_custom" int4 NOT NULL DEFAULT nextval('ref_tenaga_ahli_bu_custom_kode_tenaga_ahli_custom_seq'::regclass),
  "kode_tenaga_ahli" int4,
  "kode_vendor" int4,
  "kode_penjaringan" int4,
  "nama" varchar(100) COLLATE "pg_catalog"."default",
  "no_ktp" varchar(20) COLLATE "pg_catalog"."default",
  "file_ktp" varchar(255) COLLATE "pg_catalog"."default",
  "encrypt_key_ktp" varchar COLLATE "pg_catalog"."default",
  "tempat_lahir" varchar(50) COLLATE "pg_catalog"."default",
  "tgl_lahir" date,
  "posisi" varchar(100) COLLATE "pg_catalog"."default",
  "kode_jenjang_pendidikan" int4,
  "program_studi" varchar(50) COLLATE "pg_catalog"."default",
  "file_ijazah" varchar(255) COLLATE "pg_catalog"."default",
  "encrypt_key_ijazah" varchar COLLATE "pg_catalog"."default",
  "file_cv" varchar(255) COLLATE "pg_catalog"."default",
  "encrypt_key_cv" varchar COLLATE "pg_catalog"."default",
  "tgl_cv" date,
  "revisi_ke" int2 NOT NULL DEFAULT 0
)
;

-- ----------------------------
-- Table structure for ref_tenaga_pendukung_bu
-- ----------------------------
DROP TABLE IF EXISTS "public"."ref_tenaga_pendukung_bu";
CREATE TABLE "public"."ref_tenaga_pendukung_bu" (
  "kode_tenaga_pendukung" int4 NOT NULL DEFAULT nextval('ref_tenaga_pendukung_bu_kode_tenaga_pendukung_seq'::regclass),
  "kode_vendor" int4,
  "nama" varchar(100) COLLATE "pg_catalog"."default",
  "no_ktp" varchar(20) COLLATE "pg_catalog"."default",
  "file_ktp" varchar(255) COLLATE "pg_catalog"."default",
  "encrypt_key_ktp" varchar COLLATE "pg_catalog"."default",
  "tempat_lahir" varchar(50) COLLATE "pg_catalog"."default",
  "tgl_lahir" date,
  "posisi" varchar(50) COLLATE "pg_catalog"."default",
  "kode_jenjang_pendidikan" int4,
  "program_studi" varchar(50) COLLATE "pg_catalog"."default",
  "file_ijazah" varchar(255) COLLATE "pg_catalog"."default",
  "encrypt_key_ijazah" varchar COLLATE "pg_catalog"."default",
  "file_cv" varchar(255) COLLATE "pg_catalog"."default",
  "encrypt_key_cv" varchar COLLATE "pg_catalog"."default",
  "tgl_cv" date,
  "revisi_ke" int2 NOT NULL DEFAULT 0
)
;

-- ----------------------------
-- Table structure for ref_tenaga_pendukung_bu_custom
-- ----------------------------
DROP TABLE IF EXISTS "public"."ref_tenaga_pendukung_bu_custom";
CREATE TABLE "public"."ref_tenaga_pendukung_bu_custom" (
  "kode_tenaga_pendukung_custom" int4 NOT NULL DEFAULT nextval('ref_tenaga_pendukung_bu_custom_kode_tenaga_pendukung_custom_seq'::regclass),
  "kode_tenaga_pendukung" int4,
  "kode_vendor" int4,
  "kode_penjaringan" int4,
  "nama" varchar(100) COLLATE "pg_catalog"."default",
  "no_ktp" varchar(20) COLLATE "pg_catalog"."default",
  "file_ktp" varchar(255) COLLATE "pg_catalog"."default",
  "encrypt_key_ktp" varchar COLLATE "pg_catalog"."default",
  "tempat_lahir" varchar(50) COLLATE "pg_catalog"."default",
  "tgl_lahir" date,
  "posisi" varchar(50) COLLATE "pg_catalog"."default",
  "kode_jenjang_pendidikan" int4,
  "program_studi" varchar(50) COLLATE "pg_catalog"."default",
  "file_ijazah" varchar(255) COLLATE "pg_catalog"."default",
  "encrypt_key_ijazah" varchar COLLATE "pg_catalog"."default",
  "file_cv" varchar(255) COLLATE "pg_catalog"."default",
  "encrypt_key_cv" varchar COLLATE "pg_catalog"."default",
  "tgl_cv" date,
  "revisi_ke" int2 NOT NULL DEFAULT 0
)
;

-- ----------------------------
-- Table structure for ref_tipe_input
-- ----------------------------
DROP TABLE IF EXISTS "public"."ref_tipe_input";
CREATE TABLE "public"."ref_tipe_input" (
  "tipe_input" varchar(80) COLLATE "pg_catalog"."default" NOT NULL,
  "regex_validation" varchar COLLATE "pg_catalog"."default"
)
;

-- ----------------------------
-- Table structure for ref_umum
-- ----------------------------
DROP TABLE IF EXISTS "public"."ref_umum";
CREATE TABLE "public"."ref_umum" (
  "kode_umum" int4 NOT NULL DEFAULT nextval('ref_umum_kode_umum_seq'::regclass),
  "kode_vendor" int4,
  "nomor_telp" varchar(255) COLLATE "pg_catalog"."default",
  "kode_kualifikasi_usaha" int2,
  "alamat_badan_usaha" text COLLATE "pg_catalog"."default",
  "file_dok_domisili" varchar(255) COLLATE "pg_catalog"."default",
  "is_dok_domisili_selamanya" bool,
  "dok_domisili_berlaku_awal" date,
  "dok_domisili_berlaku_akhir" date,
  "encrypt_key_dok_domisili" varchar(255) COLLATE "pg_catalog"."default",
  "revisi_ke" int2 NOT NULL DEFAULT 0
)
;
COMMENT ON COLUMN "public"."ref_umum"."nomor_telp" IS 'Nomor Telepon Badan Usaha';
COMMENT ON COLUMN "public"."ref_umum"."file_dok_domisili" IS 'Dokumen Domisili Badan Usaha';
COMMENT ON COLUMN "public"."ref_umum"."is_dok_domisili_selamanya" IS 'Apakah Dokumen Domisili berlaku selamanya?';

-- ----------------------------
-- Table structure for ref_v_keluar_dpt
-- ----------------------------
DROP TABLE IF EXISTS "public"."ref_v_keluar_dpt";
CREATE TABLE "public"."ref_v_keluar_dpt" (
  "kode_v_keluar_dpt" int4 NOT NULL DEFAULT nextval('ref_v_keluar_dpt_kode_v_keluar_dpt_seq'::regclass),
  "tgl_pengajuan" timestamptz(6),
  "kode_vendor" int4,
  "kode_vendor_penjr" int4,
  "kode_sanksi_vendor" int2,
  "teks_alasan" text COLLATE "pg_catalog"."default",
  "file_bukti_dukung" text COLLATE "pg_catalog"."default",
  "kode_status_keluar_dpt" int2,
  "alasan_tolak_usulan" text COLLATE "pg_catalog"."default",
  "file_bukti_dukung_sanggahan" text COLLATE "pg_catalog"."default",
  "alasan_sanggahan" text COLLATE "pg_catalog"."default",
  "file_dokumen" text COLLATE "pg_catalog"."default",
  "file_surat_keputusan" text COLLATE "pg_catalog"."default"
)
;

-- ----------------------------
-- Table structure for ref_vendor
-- ----------------------------
DROP TABLE IF EXISTS "public"."ref_vendor";
CREATE TABLE "public"."ref_vendor" (
  "kode_vendor" int4 NOT NULL DEFAULT nextval('ref_vendor_kode_vendor_seq'::regclass),
  "kode_jenis_vendor" int2,
  "nama_perusahaan" varchar(100) COLLATE "pg_catalog"."default",
  "is_tetap" bool DEFAULT false,
  "udcr" timestamptz(6),
  "udch" timestamptz(6),
  "verifikator" varchar COLLATE "pg_catalog"."default",
  "waktu_verifikasi" timestamptz(6),
  "status_form_luar_dpt" "public"."status_form_luar_dpt",
  "status_aktif_vendor" "public"."status_aktivasi"
)
;
COMMENT ON TABLE "public"."ref_vendor" IS 'Vendor adalah Penyedia - Vendor yang lolos verifikasi registrasi, disimpan disini';

-- ----------------------------
-- Table structure for ref_vendor_penandatangan
-- ----------------------------
DROP TABLE IF EXISTS "public"."ref_vendor_penandatangan";
CREATE TABLE "public"."ref_vendor_penandatangan" (
  "kode_vp" int4 NOT NULL DEFAULT nextval('ref_vendor_penandatangan_kode_vp_seq'::regclass),
  "kode_penandatangan" int4,
  "jabatan" "public"."jabatan_penandatangan",
  "file_s_tugas" varchar(255) COLLATE "pg_catalog"."default",
  "kode_vendor" int4,
  "is_aktif" bool,
  "encrypt_key" varchar COLLATE "pg_catalog"."default"
)
;
COMMENT ON COLUMN "public"."ref_vendor_penandatangan"."kode_penandatangan" IS 'bisa kode_direksi / kode_komisaris';

-- ----------------------------
-- Table structure for ref_vendor_reg_history
-- ----------------------------
DROP TABLE IF EXISTS "public"."ref_vendor_reg_history";
CREATE TABLE "public"."ref_vendor_reg_history" (
  "kode_register" int4 NOT NULL DEFAULT nextval('ref_vendor_reg_history_kode_register_seq'::regclass),
  "kode_jenis_vendor" int2,
  "nama_perusahaan" varchar(100) COLLATE "pg_catalog"."default",
  "email" varchar(150) COLLATE "pg_catalog"."default",
  "password" varchar(100) COLLATE "pg_catalog"."default",
  "no_telp" varchar(80) COLLATE "pg_catalog"."default",
  "nama_narahubung" varchar(255) COLLATE "pg_catalog"."default",
  "no_wa_narahubung" varchar(20) COLLATE "pg_catalog"."default",
  "swafoto" varchar(100) COLLATE "pg_catalog"."default",
  "status_register" "public"."status_persetujuan",
  "alasan_ditolak" text COLLATE "pg_catalog"."default",
  "user_verif" varchar(80) COLLATE "pg_catalog"."default",
  "udcr" timestamptz(6),
  "udch" timestamptz(6),
  "message" varchar(255) COLLATE "pg_catalog"."default",
  "similarity" varchar(255) COLLATE "pg_catalog"."default",
  "distance_percentage" numeric,
  "distance_point" numeric,
  "keypass" varchar(255) COLLATE "pg_catalog"."default",
  "kode_vendor" int4,
  "npwp" varchar COLLATE "pg_catalog"."default",
  "file_npwp" varchar COLLATE "pg_catalog"."default",
  "encrypt_key_npwp" varchar COLLATE "pg_catalog"."default",
  "nik" varchar COLLATE "pg_catalog"."default"
)
;
COMMENT ON COLUMN "public"."ref_vendor_reg_history"."no_telp" IS 'No Handphone whatsapp aktif kalau perorangan/ No. Telp kantor kalau badan usaha';
COMMENT ON COLUMN "public"."ref_vendor_reg_history"."status_register" IS 'status akun yang baru daftar (belum_diproses, proses, terima, tolak)';
COMMENT ON COLUMN "public"."ref_vendor_reg_history"."user_verif" IS 'Email user yang memverifikasi';
COMMENT ON TABLE "public"."ref_vendor_reg_history" IS 'Vendor yang sudah diverifikasi (diterima/ditolak) dicatat kesini';

-- ----------------------------
-- Table structure for ref_vendor_register
-- ----------------------------
DROP TABLE IF EXISTS "public"."ref_vendor_register";
CREATE TABLE "public"."ref_vendor_register" (
  "kode_register" int4 NOT NULL DEFAULT nextval('ref_vendor_register_kode_register_seq'::regclass),
  "kode_jenis_vendor" int2,
  "nama_perusahaan" varchar(100) COLLATE "pg_catalog"."default",
  "email" varchar(150) COLLATE "pg_catalog"."default",
  "password" varchar(100) COLLATE "pg_catalog"."default",
  "no_telp" varchar(80) COLLATE "pg_catalog"."default",
  "nama_narahubung" varchar(255) COLLATE "pg_catalog"."default",
  "no_wa_narahubung" varchar(20) COLLATE "pg_catalog"."default",
  "swafoto" varchar(100) COLLATE "pg_catalog"."default",
  "status_register" "public"."status_persetujuan",
  "alasan_ditolak" text COLLATE "pg_catalog"."default",
  "user_verif" varchar(80) COLLATE "pg_catalog"."default",
  "udcr" timestamptz(6),
  "udch" timestamptz(6),
  "message" varchar(255) COLLATE "pg_catalog"."default",
  "similarity" varchar(255) COLLATE "pg_catalog"."default",
  "distance_percentage" numeric,
  "distance_point" numeric,
  "keypass" varchar(255) COLLATE "pg_catalog"."default",
  "kode_vendor" int4,
  "npwp" varchar COLLATE "pg_catalog"."default",
  "file_npwp" varchar COLLATE "pg_catalog"."default",
  "encrypt_key_npwp" varchar COLLATE "pg_catalog"."default",
  "nik" varchar COLLATE "pg_catalog"."default"
)
;
COMMENT ON COLUMN "public"."ref_vendor_register"."no_telp" IS 'No Handphone whatsapp aktif kalau perorangan/ No. Telp kantor kalau badan usaha';
COMMENT ON COLUMN "public"."ref_vendor_register"."status_register" IS 'status akun yang baru daftar (belum_diproses, proses, terima, tolak)';
COMMENT ON COLUMN "public"."ref_vendor_register"."user_verif" IS 'Email user yang memverifikasi';
COMMENT ON TABLE "public"."ref_vendor_register" IS 'Vendor yang baru register ditampung disini dulu untuk diverifikasi';

-- ----------------------------
-- Table structure for ref_verif_adm_bu
-- ----------------------------
DROP TABLE IF EXISTS "public"."ref_verif_adm_bu";
CREATE TABLE "public"."ref_verif_adm_bu" (
  "kode_verif" int4 NOT NULL DEFAULT nextval('ref_verif_adm_bu_kode_verif_seq'::regclass),
  "kode_vendor_penjr" int4,
  "kode_adm_bu" int4,
  "is_file_fis_sesuai" bool,
  "komentar_file_fis" varchar(255) COLLATE "pg_catalog"."default",
  "is_file_s_kuasa_sesuai" bool,
  "komentar_file_s_kuasa" varchar(255) COLLATE "pg_catalog"."default",
  "is_file_spkd_sesuai" bool,
  "komentar_file_spkd" varchar(255) COLLATE "pg_catalog"."default"
)
;

-- ----------------------------
-- Table structure for ref_verif_administrasi_pero
-- ----------------------------
DROP TABLE IF EXISTS "public"."ref_verif_administrasi_pero";
CREATE TABLE "public"."ref_verif_administrasi_pero" (
  "kode_verif" int4 NOT NULL DEFAULT nextval('ref_verif_administrasi_pero_kode_verif_seq'::regclass),
  "kode_vendor_penjr" int4,
  "kode_adm" int4,
  "is_file_skd_sesuai" bool,
  "komentar_file_skd" varchar(255) COLLATE "pg_catalog"."default",
  "is_file_bukti_spt_sesuai" text COLLATE "pg_catalog"."default",
  "komentar_bukti_spt" varchar(255) COLLATE "pg_catalog"."default",
  "is_file_skb_pph23_sesuai" text COLLATE "pg_catalog"."default",
  "komentar_file_skb_pph23" varchar(255) COLLATE "pg_catalog"."default",
  "is_file_sk_pp23_sesuai" text COLLATE "pg_catalog"."default",
  "komentar_file_sk_pp23" varchar(255) COLLATE "pg_catalog"."default",
  "is_file_non_pkp_sesuai" text COLLATE "pg_catalog"."default",
  "komentar_file_non_pkp" varchar(255) COLLATE "pg_catalog"."default"
)
;

-- ----------------------------
-- Table structure for ref_verif_data_pajak_bu
-- ----------------------------
DROP TABLE IF EXISTS "public"."ref_verif_data_pajak_bu";
CREATE TABLE "public"."ref_verif_data_pajak_bu" (
  "kode_verif" int4 NOT NULL DEFAULT nextval('ref_verif_data_pajak_bu_kode_verif_seq'::regclass),
  "kode_data_pajak" int4,
  "kode_vendor_penjr" int4,
  "is_file_kswp_sesuai" bool,
  "komentar_file_kswp" varchar(255) COLLATE "pg_catalog"."default",
  "is_file_bukti_spt_sesuai" bool,
  "komentar_file_bukti_spt" varchar(255) COLLATE "pg_catalog"."default",
  "is_file_skb_pph23_sesuai" bool,
  "komentar_file_skb_pph23" varchar(255) COLLATE "pg_catalog"."default",
  "is_file_sk_pp23_sesuai" bool,
  "komentar_file_sk_pp23" varchar(255) COLLATE "pg_catalog"."default",
  "is_file_bukti_non_pkp_sesuai" bool,
  "komentar_file_bukti_non_pkp" varchar(255) COLLATE "pg_catalog"."default"
)
;

-- ----------------------------
-- Table structure for ref_verif_datadiri
-- ----------------------------
DROP TABLE IF EXISTS "public"."ref_verif_datadiri";
CREATE TABLE "public"."ref_verif_datadiri" (
  "kode_verif" int4 NOT NULL DEFAULT nextval('ref_verif_datadiri_kode_verif_seq'::regclass),
  "kode_vendor_penjr" int4,
  "kode_datadiri" int4,
  "is_tempat_lahir_sesuai" bool,
  "komentar_tempat_lahir" varchar(255) COLLATE "pg_catalog"."default",
  "is_tgl_lahir_sesuai" bool,
  "komentar_tgl_lahir" varchar(255) COLLATE "pg_catalog"."default",
  "is_file_ktp_sesuai" bool,
  "komentar_file_ktp" varchar(255) COLLATE "pg_catalog"."default",
  "is_kode_kab_kota_ktp_sesuai" bool,
  "komentar_kode_kab_kota_ktp" varchar(255) COLLATE "pg_catalog"."default",
  "is_alamat_ktp_sesuai" bool,
  "komentar_alamat_ktp" varchar(255) COLLATE "pg_catalog"."default",
  "is_kode_kab_kota_domisili_sesuai" bool,
  "komentar_kode_kab_kota_domisili" varchar(255) COLLATE "pg_catalog"."default",
  "is_alamat_domisili_sesuai" bool,
  "komentar_alamat_domisili" varchar(255) COLLATE "pg_catalog"."default",
  "is_file_skd_sesuai" bool,
  "komentar_file_skd" varchar(255) COLLATE "pg_catalog"."default"
)
;

-- ----------------------------
-- Table structure for ref_verif_datadiri_umum
-- ----------------------------
DROP TABLE IF EXISTS "public"."ref_verif_datadiri_umum";
CREATE TABLE "public"."ref_verif_datadiri_umum" (
  "kode_verif" int4 NOT NULL DEFAULT nextval('ref_verif_datadiri_umum_kode_verif_seq'::regclass),
  "kode_datadiri_umum" int4,
  "is_nama_sesuai" bool,
  "komentar_nama" varchar(255) COLLATE "pg_catalog"."default",
  "is_nama_badan_usaha_sesuai" bool,
  "komentar_nama_badan_usaha" varchar(255) COLLATE "pg_catalog"."default",
  "is_nama_narahubung_sesuai" bool,
  "komentar_nama_narahubung" varchar(255) COLLATE "pg_catalog"."default",
  "is_kode_kualifikasi_usaha_sesuai" bool,
  "komentar_kode_kualifikasi_usaha" varchar(255) COLLATE "pg_catalog"."default",
  "is_nomor_telp_sesuai" bool,
  "komentar_nomor_telp" varchar(255) COLLATE "pg_catalog"."default",
  "is_nomor_handphone_sesuai" bool,
  "komentar_nomor_handphone" varchar(255) COLLATE "pg_catalog"."default",
  "is_email_sesuai" bool,
  "komentar_email" varchar(255) COLLATE "pg_catalog"."default",
  "is_kode_kab_kota_ktp_sesuai" bool,
  "komentar_kode_kab_kota_ktp" varchar(255) COLLATE "pg_catalog"."default",
  "is_alamat_ktp_sesuai" bool,
  "komentar_alamat_ktp" varchar(255) COLLATE "pg_catalog"."default",
  "is_kode_kab_kota_domisili_sesuai" bool,
  "komentar_kode_kab_kota_domisili" varchar(255) COLLATE "pg_catalog"."default",
  "is_alamat_domisili_sesuai" bool,
  "komentar_alamat_domisili" varchar(255) COLLATE "pg_catalog"."default",
  "is_is_alamat_sama_sesuai" bool,
  "komentar_is_alamat_sama" varchar(255) COLLATE "pg_catalog"."default",
  "is_file_skt_sesuai" bool,
  "komentar_file_skt" varchar(255) COLLATE "pg_catalog"."default",
  "is_alamat_badan_usaha_sesuai" bool,
  "komentar_alamat_badan_usaha" varchar(255) COLLATE "pg_catalog"."default",
  "custom" jsonb
)
;

-- ----------------------------
-- Table structure for ref_verif_direksi
-- ----------------------------
DROP TABLE IF EXISTS "public"."ref_verif_direksi";
CREATE TABLE "public"."ref_verif_direksi" (
  "kode_verif" int4 NOT NULL DEFAULT nextval('ref_verif_direksi_kode_verif_seq'::regclass),
  "kode_vendor_penjr" int4,
  "kode_direksi_custom" int4,
  "is_sesuai" bool,
  "komentar" varchar(255) COLLATE "pg_catalog"."default"
)
;

-- ----------------------------
-- Table structure for ref_verif_fasilitas_bu
-- ----------------------------
DROP TABLE IF EXISTS "public"."ref_verif_fasilitas_bu";
CREATE TABLE "public"."ref_verif_fasilitas_bu" (
  "kode_verif" int4 NOT NULL DEFAULT nextval('ref_verif_fasilitas_bu_kode_verif_seq'::regclass),
  "kode_fasilitas_custom" int4,
  "kode_vendor_penjr" int4,
  "is_sesuai" bool,
  "komentar" varchar(255) COLLATE "pg_catalog"."default",
  "nilai" int4
)
;

-- ----------------------------
-- Table structure for ref_verif_izin_usaha_bu
-- ----------------------------
DROP TABLE IF EXISTS "public"."ref_verif_izin_usaha_bu";
CREATE TABLE "public"."ref_verif_izin_usaha_bu" (
  "kode_verif" int4 NOT NULL DEFAULT nextval('ref_verif_izin_usaha_bu_kode_verif_seq'::regclass),
  "kode_vendor_penjr" int4,
  "kode_izin_usaha_custom" int4,
  "is_sesuai" bool,
  "komentar" varchar(255) COLLATE "pg_catalog"."default"
)
;

-- ----------------------------
-- Table structure for ref_verif_kantor_bu
-- ----------------------------
DROP TABLE IF EXISTS "public"."ref_verif_kantor_bu";
CREATE TABLE "public"."ref_verif_kantor_bu" (
  "kode_verif" int4 NOT NULL DEFAULT nextval('ref_verif_kantor_bu_kode_verif_seq'::regclass),
  "kode_kantor_custom" int4,
  "kode_vendor_penjr" int4,
  "is_sesuai" bool,
  "komentar" varchar(255) COLLATE "pg_catalog"."default",
  "nilai" int4
)
;

-- ----------------------------
-- Table structure for ref_verif_keuangan_bu
-- ----------------------------
DROP TABLE IF EXISTS "public"."ref_verif_keuangan_bu";
CREATE TABLE "public"."ref_verif_keuangan_bu" (
  "kode_verif" int4 NOT NULL DEFAULT nextval('ref_verif_keuangan_bu_kode_verif_seq'::regclass),
  "kode_vendor_penjr" int4,
  "kode_keuangan" int4,
  "is_nm_pemilik_rek_sesuai" bool,
  "komentar_nm_pemilik_rek" varchar(255) COLLATE "pg_catalog"."default",
  "is_no_rek_sesuai" bool,
  "komentar_no_rek" varchar(255) COLLATE "pg_catalog"."default",
  "is_sandi_bank_sesuai" bool,
  "komentar_sandi_bank" varchar(255) COLLATE "pg_catalog"."default",
  "is_file_buku_rek_sesuai" bool,
  "komentar_file_buku_rek" varchar(255) COLLATE "pg_catalog"."default",
  "is_file_lap_keu_sesuai" bool,
  "komentar_file_lap_keu" varchar(255) COLLATE "pg_catalog"."default",
  "is_file_lap_keu_audited_sesuai" bool,
  "komentar_file_lap_keu_audited" varchar(255) COLLATE "pg_catalog"."default",
  "nilai_keuangan" int4
)
;

-- ----------------------------
-- Table structure for ref_verif_keuangan_pero
-- ----------------------------
DROP TABLE IF EXISTS "public"."ref_verif_keuangan_pero";
CREATE TABLE "public"."ref_verif_keuangan_pero" (
  "kode_verif" int4 NOT NULL DEFAULT nextval('ref_verif_keuangan_pero_kode_verif_seq'::regclass),
  "kode_vendor_penjr" int4,
  "kode_keuangan" int4,
  "is_nm_pemilik_rek_sesuai" bool,
  "komentar_nm_pemilik_rek" varchar(255) COLLATE "pg_catalog"."default",
  "is_no_rek_sesuai" bool,
  "komentar_no_rek" varchar(255) COLLATE "pg_catalog"."default",
  "is_sandi_bank_sesuai" bool,
  "komentar_sandi_bank" varchar(255) COLLATE "pg_catalog"."default",
  "is_file_buku_rek_sesuai" bool,
  "komentar_file_buku_rek" varchar(255) COLLATE "pg_catalog"."default"
)
;

-- ----------------------------
-- Table structure for ref_verif_komisaris
-- ----------------------------
DROP TABLE IF EXISTS "public"."ref_verif_komisaris";
CREATE TABLE "public"."ref_verif_komisaris" (
  "kode_verif" int4 NOT NULL DEFAULT nextval('ref_verif_komisaris_kode_verif_seq'::regclass),
  "kode_vendor_penjr" int4,
  "kode_komisaris_custom" int4,
  "is_sesuai" bool,
  "komentar" varchar(255) COLLATE "pg_catalog"."default"
)
;

-- ----------------------------
-- Table structure for ref_verif_lan_hukum_bu
-- ----------------------------
DROP TABLE IF EXISTS "public"."ref_verif_lan_hukum_bu";
CREATE TABLE "public"."ref_verif_lan_hukum_bu" (
  "kode_verif" int4 NOT NULL DEFAULT nextval('ref_verif_lan_hukum_bu_kode_verif_seq'::regclass),
  "kode_vendor_penjr" int4,
  "kode_lan_hukum" int4,
  "is_no_akta_awal_sesuai" bool,
  "komentar_no_akta_awal" varchar(255) COLLATE "pg_catalog"."default",
  "is_tgl_akta_awal_sesuai" bool,
  "komentar_tgl_akta_awal" varchar(255) COLLATE "pg_catalog"."default",
  "is_notaris_awal_sesuai" bool,
  "komentar_notaris_awal" varchar(255) COLLATE "pg_catalog"."default",
  "is_no_sah_awal_sesuai" bool,
  "komentar_no_sah_awal" varchar(255) COLLATE "pg_catalog"."default",
  "is_tgl_sah_awal_sesuai" bool,
  "komentar_tgl_sah_awal" varchar(255) COLLATE "pg_catalog"."default",
  "is_file_akta_awal_sesuai" bool,
  "komentar_file_akta_awal" varchar(255) COLLATE "pg_catalog"."default",
  "is_no_akta_rubah_sesuai" bool,
  "komentar_no_akta_rubah" varchar(255) COLLATE "pg_catalog"."default",
  "is_tgl_akta_rubah_sesuai" bool,
  "komentar_tgl_akta_rubah" varchar(255) COLLATE "pg_catalog"."default",
  "is_notaris_rubah_sesuai" bool,
  "komentar_notaris_rubah" varchar(255) COLLATE "pg_catalog"."default",
  "is_no_sah_rubah_sesuai" bool,
  "komentar_no_sah_rubah" varchar(255) COLLATE "pg_catalog"."default",
  "is_tgl_sah_rubah_sesuai" bool,
  "komentar_tgl_sah_rubah" varchar(255) COLLATE "pg_catalog"."default",
  "is_file_akta_rubah_sesuai" bool,
  "komentar_file_akta_rubah" varchar(255) COLLATE "pg_catalog"."default"
)
;

-- ----------------------------
-- Table structure for ref_verif_pengalaman_bu
-- ----------------------------
DROP TABLE IF EXISTS "public"."ref_verif_pengalaman_bu";
CREATE TABLE "public"."ref_verif_pengalaman_bu" (
  "kode_verif" int4 NOT NULL DEFAULT nextval('ref_verif_pengalaman_bu_kode_verif_seq'::regclass),
  "kode_pengalaman_bu_custom" int4,
  "kode_vendor_penjr" int4,
  "is_sesuai" bool,
  "komentar" varchar(255) COLLATE "pg_catalog"."default",
  "nilai" int4
)
;

-- ----------------------------
-- Table structure for ref_verif_pengalaman_pero
-- ----------------------------
DROP TABLE IF EXISTS "public"."ref_verif_pengalaman_pero";
CREATE TABLE "public"."ref_verif_pengalaman_pero" (
  "kode_verif" int4 NOT NULL DEFAULT nextval('ref_verif_pengalaman_pero_kode_verif_seq'::regclass),
  "kode_vendor_penjr" int4,
  "kode_pengalaman_custom" int4,
  "is_nama_pekerjaan_sesuai" bool,
  "komentar_nama_pekerjaan" varchar(255) COLLATE "pg_catalog"."default",
  "is_posisi_sesuai" bool,
  "komentar_posisi" varchar(255) COLLATE "pg_catalog"."default",
  "is_jangka_waktu_sesuai" bool,
  "komentar_jangka_waktu" varchar(255) COLLATE "pg_catalog"."default",
  "is_nilai_pekerjaan_sesuai" bool,
  "komentar_nilai_pekerjaan" varchar(255) COLLATE "pg_catalog"."default",
  "is_file_bukti_sesuai" bool,
  "komentar_file_bukti" varchar(255) COLLATE "pg_catalog"."default",
  "nilai" int4
)
;

-- ----------------------------
-- Table structure for ref_verif_personalia_pero
-- ----------------------------
DROP TABLE IF EXISTS "public"."ref_verif_personalia_pero";
CREATE TABLE "public"."ref_verif_personalia_pero" (
  "kode_verif" int4 NOT NULL DEFAULT nextval('ref_verif_personalia_pero_kode_verif_seq'::regclass),
  "kode_vendor_penjr" int4,
  "kode_personalia" int4,
  "is_bidang_keahlian_sesuai" bool,
  "komentar_bidang_keahlian" varchar(255) COLLATE "pg_catalog"."default",
  "is_kode_jenjang_pendidikan_sesuai" bool,
  "komentar_kode_jenjang_pendidikan" varchar(255) COLLATE "pg_catalog"."default",
  "is_program_studi_sesuai" bool,
  "komentar_program_studi" varchar(255) COLLATE "pg_catalog"."default",
  "is_file_ijazah_sesuai" bool,
  "komentar_file_ijazah" varchar(255) COLLATE "pg_catalog"."default",
  "is_file_cv_sesuai" bool,
  "komentar_file_cv" varchar(255) COLLATE "pg_catalog"."default",
  "is_tgl_cv_sesuai" bool,
  "komentar_tgl_cv" varchar(255) COLLATE "pg_catalog"."default",
  "nilai_personalia" int4
)
;

-- ----------------------------
-- Table structure for ref_verif_saham_bu
-- ----------------------------
DROP TABLE IF EXISTS "public"."ref_verif_saham_bu";
CREATE TABLE "public"."ref_verif_saham_bu" (
  "kode_verif" int4 NOT NULL DEFAULT nextval('ref_verif_saham_bu_kode_verif_seq'::regclass),
  "kode_vendor_penjr" int4,
  "kode_saham_custom" int4,
  "is_sesuai" bool,
  "komentar" varchar(255) COLLATE "pg_catalog"."default"
)
;

-- ----------------------------
-- Table structure for ref_verif_sertif_pero
-- ----------------------------
DROP TABLE IF EXISTS "public"."ref_verif_sertif_pero";
CREATE TABLE "public"."ref_verif_sertif_pero" (
  "kode_verif" int4 NOT NULL DEFAULT nextval('ref_verif_sertif_pero_kode_verif_seq'::regclass),
  "kode_vendor_penjr" int4,
  "kode_sertif_pero_custom" int4,
  "is_nm_sertifikat_sesuai" bool,
  "komentar_nm_sertifikat" varchar(255) COLLATE "pg_catalog"."default",
  "is_file_bukti_sesuai" bool,
  "komentar_file_bukti" varchar(255) COLLATE "pg_catalog"."default",
  "nilai" int4
)
;

-- ----------------------------
-- Table structure for ref_verif_sertifikat_usaha_bu
-- ----------------------------
DROP TABLE IF EXISTS "public"."ref_verif_sertifikat_usaha_bu";
CREATE TABLE "public"."ref_verif_sertifikat_usaha_bu" (
  "kode_verif" int4 NOT NULL DEFAULT nextval('ref_verif_sertifikat_usaha_bu_kode_verif_seq'::regclass),
  "kode_vendor_penjr" int4,
  "kode_sertifikat_usaha_custom" int4,
  "is_sesuai" bool,
  "komentar" varchar(255) COLLATE "pg_catalog"."default"
)
;

-- ----------------------------
-- Table structure for ref_verif_tenaga_ahli_bu
-- ----------------------------
DROP TABLE IF EXISTS "public"."ref_verif_tenaga_ahli_bu";
CREATE TABLE "public"."ref_verif_tenaga_ahli_bu" (
  "kode_verif" int4 NOT NULL DEFAULT nextval('ref_verif_tenaga_ahli_bu_kode_verif_seq'::regclass),
  "kode_tenaga_ahli_custom" int4,
  "kode_vendor_penjr" int4,
  "is_sesuai" bool,
  "komentar" varchar(255) COLLATE "pg_catalog"."default",
  "nilai" int4
)
;

-- ----------------------------
-- Table structure for ref_verif_tenaga_pendukung_bu
-- ----------------------------
DROP TABLE IF EXISTS "public"."ref_verif_tenaga_pendukung_bu";
CREATE TABLE "public"."ref_verif_tenaga_pendukung_bu" (
  "kode_verif" int4 NOT NULL DEFAULT nextval('ref_verif_tenaga_pendukung_bu_kode_verif_seq'::regclass),
  "kode_tenaga_pendukung_custom" int4,
  "kode_vendor_penjr" int4,
  "is_sesuai" bool,
  "komentar" varchar(255) COLLATE "pg_catalog"."default",
  "nilai" int4
)
;

-- ----------------------------
-- Table structure for ref_verif_umum
-- ----------------------------
DROP TABLE IF EXISTS "public"."ref_verif_umum";
CREATE TABLE "public"."ref_verif_umum" (
  "kode_verif" int4 NOT NULL DEFAULT nextval('ref_verif_umum_kode_verif_seq'::regclass),
  "kode_vendor_penjr" int4,
  "kode_umum" int4,
  "is_nomor_telp_sesuai" bool,
  "komentar_nomor_telp" varchar(255) COLLATE "pg_catalog"."default",
  "is_kode_kualifikasi_usaha_sesuai" bool,
  "komentar_kode_kualifikasi_usaha" varchar(255) COLLATE "pg_catalog"."default",
  "is_alamat_badan_usaha_sesuai" bool,
  "komentar_alamat_badan_usaha" varchar(255) COLLATE "pg_catalog"."default",
  "is_file_dok_domisili_sesuai" bool,
  "komentar_file_dok_domisili" varchar(255) COLLATE "pg_catalog"."default"
)
;

-- ----------------------------
-- Table structure for trx_custom_item
-- ----------------------------
DROP TABLE IF EXISTS "public"."trx_custom_item";
CREATE TABLE "public"."trx_custom_item" (
  "kode_ci" int4 NOT NULL DEFAULT nextval('trx_custom_item_kode_ci_seq'::regclass),
  "kode_vendor" int4,
  "kode_penjaringan" int4,
  "kode_kat_item_tanya" int4,
  "kode_item" int4,
  "isi" varchar(255) COLLATE "pg_catalog"."default",
  "encrypt_key" varchar(255) COLLATE "pg_catalog"."default",
  "is_sesuai" bool,
  "komentar" text COLLATE "pg_catalog"."default"
)
;

-- ----------------------------
-- Table structure for trx_custom_table
-- ----------------------------
DROP TABLE IF EXISTS "public"."trx_custom_table";
CREATE TABLE "public"."trx_custom_table" (
  "kode_custom_table" int4 NOT NULL DEFAULT nextval('trx_custom_table_kode_custom_table_seq'::regclass),
  "kode" int4,
  "kode_ci" int4,
  "nama_table" varchar COLLATE "pg_catalog"."default"
)
;

-- ----------------------------
-- Table structure for trx_izin_kbli_sbu
-- ----------------------------
DROP TABLE IF EXISTS "public"."trx_izin_kbli_sbu";
CREATE TABLE "public"."trx_izin_kbli_sbu" (
  "kode_trx_kbli" int4 NOT NULL DEFAULT nextval('trx_izin_kbli_sbu_kode_trx_kbli_seq'::regclass),
  "kode_izin_usaha" int4,
  "kode_kbli_sbu" int4
)
;

-- ----------------------------
-- Table structure for trx_izin_kbli_sbu_custom
-- ----------------------------
DROP TABLE IF EXISTS "public"."trx_izin_kbli_sbu_custom";
CREATE TABLE "public"."trx_izin_kbli_sbu_custom" (
  "kode_trx_iks_custom" int4 NOT NULL DEFAULT nextval('trx_izin_kbli_sbu_custom_kode_trx_iks_custom_seq'::regclass),
  "kode_izin_usaha_custom" int4,
  "kode_kbli_sbu" int4
)
;

-- ----------------------------
-- Table structure for trx_kat_j_vendor
-- ----------------------------
DROP TABLE IF EXISTS "public"."trx_kat_j_vendor";
CREATE TABLE "public"."trx_kat_j_vendor" (
  "kode_kat_j_vendor" int4 NOT NULL DEFAULT nextval('trx_kat_j_vendor_kode_kat_j_vendor_seq'::regclass),
  "kode_trx_kategori" int4,
  "kode_jenis_vendor" int2
)
;
COMMENT ON TABLE "public"."trx_kat_j_vendor" IS 'Untuk Input "Jenis Pelaku Usaha", Tiap trx_kategori bisa memilih jenis_vendor perorangan atau badan usaha atau dua2nya';

-- ----------------------------
-- Table structure for trx_kategori
-- ----------------------------
DROP TABLE IF EXISTS "public"."trx_kategori";
CREATE TABLE "public"."trx_kategori" (
  "kode_trx_kategori" int4 NOT NULL DEFAULT nextval('trx_kategori_kode_trx_kategori_seq'::regclass),
  "kode_kategori" int4,
  "status_persetujuan" "public"."status_persetujuan",
  "keterangan_diterima" text COLLATE "pg_catalog"."default",
  "alasan_ditolak" text COLLATE "pg_catalog"."default",
  "kode_unit_pbj" varchar(20) COLLATE "pg_catalog"."default",
  "ucr" varchar(80) COLLATE "pg_catalog"."default",
  "uch" varchar(80) COLLATE "pg_catalog"."default",
  "udch" timestamptz(6),
  "udcr" timestamptz(6)
)
;
COMMENT ON COLUMN "public"."trx_kategori"."status_persetujuan" IS 'Flag pengajuan paket diterima atau tidak (belum_diproses, proses, terima, tolak)';
COMMENT ON COLUMN "public"."trx_kategori"."kode_unit_pbj" IS 'Unit yang mengajukan kategori, ambil dari ???';
COMMENT ON COLUMN "public"."trx_kategori"."ucr" IS 'Email User yang membuat paket';
COMMENT ON TABLE "public"."trx_kategori" IS 'Paket pengadaan disebut dengan istilah "Kategori"';

-- ----------------------------
-- Table structure for trx_kbli_custom
-- ----------------------------
DROP TABLE IF EXISTS "public"."trx_kbli_custom";
CREATE TABLE "public"."trx_kbli_custom" (
  "kode_trx_kbli_custom" int4 NOT NULL DEFAULT nextval('trx_kbli_custom_kode_trx_kbli_custom_seq'::regclass),
  "kode_izin_usaha_custom" int4,
  "kode_kbli" int4
)
;

-- ----------------------------
-- Table structure for trx_kehadiran_verif
-- ----------------------------
DROP TABLE IF EXISTS "public"."trx_kehadiran_verif";
CREATE TABLE "public"."trx_kehadiran_verif" (
  "kode_kehadiran" int4 NOT NULL DEFAULT nextval('trx_kehadiran_verif_kode_kehadiran_seq'::regclass),
  "kode_undangan_verif" int4,
  "nama" varchar(150) COLLATE "pg_catalog"."default",
  "jabatan" varchar(150) COLLATE "pg_catalog"."default",
  "email" varchar COLLATE "pg_catalog"."default",
  "unit_kerja" varchar COLLATE "pg_catalog"."default"
)
;

-- ----------------------------
-- Table structure for trx_ketentuan_umum_khusus
-- ----------------------------
DROP TABLE IF EXISTS "public"."trx_ketentuan_umum_khusus";
CREATE TABLE "public"."trx_ketentuan_umum_khusus" (
  "kode_kuk" int4 NOT NULL DEFAULT nextval('trx_ketentuan_umum_khusus_kode_kuk_seq'::regclass),
  "kode_penjaringan" int4,
  "kode_subkat" int4,
  "ket_umum" varchar COLLATE "pg_catalog"."default",
  "ket_khusus" varchar COLLATE "pg_catalog"."default"
)
;

-- ----------------------------
-- Table structure for trx_konfirmasi_data_sesuai
-- ----------------------------
DROP TABLE IF EXISTS "public"."trx_konfirmasi_data_sesuai";
CREATE TABLE "public"."trx_konfirmasi_data_sesuai" (
  "kode_complete" int4 NOT NULL DEFAULT nextval('trx_konfirmasi_data_sesuai_kode_complete_seq'::regclass),
  "kode_vendor" int4,
  "datadiri" bool,
  "administrasi_dan_kualifikasi" bool,
  "teknis" bool,
  "keuangan" bool,
  "umum" bool
)
;
COMMENT ON TABLE "public"."trx_konfirmasi_data_sesuai" IS 'Konfirmasi bahwa data yg diisikkan vendor sudah sesuai';

-- ----------------------------
-- Table structure for trx_kualifikasi_usaha_penjr
-- ----------------------------
DROP TABLE IF EXISTS "public"."trx_kualifikasi_usaha_penjr";
CREATE TABLE "public"."trx_kualifikasi_usaha_penjr" (
  "kode_trx" int4 NOT NULL DEFAULT nextval('trx_kualifikasi_usaha_penjr_kode_trx_seq'::regclass),
  "kode_penjaringan" int4,
  "kode_kualifikasi_usaha" int2
)
;

-- ----------------------------
-- Table structure for trx_nilai_akhir
-- ----------------------------
DROP TABLE IF EXISTS "public"."trx_nilai_akhir";
CREATE TABLE "public"."trx_nilai_akhir" (
  "kode_penilaian" int4 NOT NULL DEFAULT nextval('trx_nilai_akhir_kode_penilaian_seq'::regclass),
  "kode_vendor_penjr" int4,
  "komen_datadiri" varchar(255) COLLATE "pg_catalog"."default",
  "is_datadiri_lolos" bool,
  "komen_umum" varchar(255) COLLATE "pg_catalog"."default",
  "is_umum_lolos" bool,
  "komen_administrasi" varchar(255) COLLATE "pg_catalog"."default",
  "is_administrasi_lolos" bool,
  "komen_lanhukum" varchar(255) COLLATE "pg_catalog"."default" DEFAULT NULL::character varying,
  "komen_pengurus" varchar(255) COLLATE "pg_catalog"."default",
  "komen_izin_usaha" varchar(255) COLLATE "pg_catalog"."default",
  "komen_susunan_kepemilikan" varchar(255) COLLATE "pg_catalog"."default",
  "komen_data_pajak" varchar(255) COLLATE "pg_catalog"."default",
  "komen_teknis" varchar(255) COLLATE "pg_catalog"."default",
  "nilai_teknis" numeric,
  "komen_personalia" varchar(255) COLLATE "pg_catalog"."default",
  "nilai_personalia" numeric,
  "komen_kantor" varchar(255) COLLATE "pg_catalog"."default",
  "nilai_kantor" numeric,
  "komen_peralatan" varchar(255) COLLATE "pg_catalog"."default",
  "nilai_peralatan" numeric,
  "komen_pengalaman" varchar(255) COLLATE "pg_catalog"."default",
  "nilai_pengalaman" numeric,
  "nilai_sertifikat" numeric,
  "komen_keuangan" varchar(255) COLLATE "pg_catalog"."default",
  "is_keuangan_lolos" bool,
  "nilai_lap_keu" numeric,
  "nilai_total" numeric
)
;

-- ----------------------------
-- Table structure for trx_penjaringan
-- ----------------------------
DROP TABLE IF EXISTS "public"."trx_penjaringan";
CREATE TABLE "public"."trx_penjaringan" (
  "kode_penjaringan" int4 NOT NULL DEFAULT nextval('trx_penjaringan_kode_penjaringan_seq'::regclass),
  "kode_trx_kategori" int4,
  "nama_penjaringan" varchar(150) COLLATE "pg_catalog"."default",
  "keperluan" varchar(150) COLLATE "pg_catalog"."default",
  "kode_jenis_pengadaan" int2,
  "kode_jenis_vendor" int2,
  "metode" "public"."metode_penjaringan",
  "file_persyaratan" text COLLATE "pg_catalog"."default",
  "kode_status_pengajuan" int4,
  "status_persetujuan" "public"."status_persetujuan",
  "user_persetujuan" varchar(80) COLLATE "pg_catalog"."default",
  "alasan_ditolak" text COLLATE "pg_catalog"."default",
  "status_pengajuan_pjr" "public"."status_pengajuan_pjr",
  "status_proses_pjr" "public"."status_proses_pjr",
  "status_pengumuman_dpt" "public"."status_proses_dpt",
  "tgl_daftar_awal" timestamptz(6),
  "tgl_daftar_akhir" timestamptz(6),
  "tgl_verifikasi_awal" timestamptz(6),
  "tgl_verifikasi_akhir" timestamptz(6),
  "tgl_evaluasi_awal" timestamptz(6),
  "tgl_evaluasi_akhir" timestamptz(6),
  "tgl_pengumuman" timestamptz(6),
  "status_s_tugas" "public"."status_pembuatan_s_tugas",
  "file_s_tugas" varchar(255) COLLATE "pg_catalog"."default",
  "keypass_s_tugas" varchar(255) COLLATE "pg_catalog"."default",
  "file_s_tugas_after_tte" varchar(255) COLLATE "pg_catalog"."default",
  "kode_trx_penandatangan" int4,
  "nomor_surat" varchar(100) COLLATE "pg_catalog"."default",
  "file_pengumuman" varchar(255) COLLATE "pg_catalog"."default",
  "nama_pembuat_penjaringan" varchar(100) COLLATE "pg_catalog"."default",
  "kode_unit_pbj" varchar(20) COLLATE "pg_catalog"."default",
  "ucr" varchar(80) COLLATE "pg_catalog"."default",
  "udcr" timestamptz(6),
  "udch" timestamptz(6),
  "keypass_file_persyaratan" varchar COLLATE "pg_catalog"."default",
  "file_persyaratan_draft" varchar COLLATE "pg_catalog"."default",
  "tanggal_tte_surat_tugas" date,
  "kode_status_penjaringan" int4,
  "kode_persentase" int4,
  "kode_trx_penandatangan_pengumuman" int4,
  "nomor_surat_pengumuman" varchar COLLATE "pg_catalog"."default"
)
;
COMMENT ON COLUMN "public"."trx_penjaringan"."metode" IS 'pengumuman, undangan';
COMMENT ON COLUMN "public"."trx_penjaringan"."file_persyaratan" IS 'File PDF Persyaratan';
COMMENT ON COLUMN "public"."trx_penjaringan"."status_persetujuan" IS 'Flag pengajuan paket diterima atau tidak (belum_diproses, proses, terima, tolak)';
COMMENT ON COLUMN "public"."trx_penjaringan"."user_persetujuan" IS 'Email user yang menerima atau menolak pengajuan penjaringan';
COMMENT ON COLUMN "public"."trx_penjaringan"."status_pengajuan_pjr" IS 'draft, proses_di_kasubdit, proses_di_verifikator, selesai';
COMMENT ON COLUMN "public"."trx_penjaringan"."status_proses_pjr" IS 'belum_waktu_verifikasi, proses, proses_verifikasi, proses_evaluasi, selesai';
COMMENT ON COLUMN "public"."trx_penjaringan"."status_pengumuman_dpt" IS 'belum_diumumkan, diproses_ke_kasubdit, selesai';
COMMENT ON COLUMN "public"."trx_penjaringan"."status_s_tugas" IS 'belum_diproses, proses_ke_direktur, selesai';
COMMENT ON COLUMN "public"."trx_penjaringan"."nama_pembuat_penjaringan" IS 'Nama user yang mengusulkan penjaringan';
COMMENT ON COLUMN "public"."trx_penjaringan"."ucr" IS 'Email User yang mengusulkan penjaringan';

-- ----------------------------
-- Table structure for trx_tim_teknis_pendukung
-- ----------------------------
DROP TABLE IF EXISTS "public"."trx_tim_teknis_pendukung";
CREATE TABLE "public"."trx_tim_teknis_pendukung" (
  "kode_tim_teknis_pendukung" int4 NOT NULL DEFAULT nextval('trx_tim_teknis_pendukung_kode_tim_teknis_pendukung_seq'::regclass),
  "kode_undangan_verif" int4,
  "email" varchar(80) COLLATE "pg_catalog"."default",
  "nama" varchar(150) COLLATE "pg_catalog"."default"
)
;

-- ----------------------------
-- Table structure for trx_undangan_pemeriksaan_keluar_dpt
-- ----------------------------
DROP TABLE IF EXISTS "public"."trx_undangan_pemeriksaan_keluar_dpt";
CREATE TABLE "public"."trx_undangan_pemeriksaan_keluar_dpt" (
  "kode_undangan" int4 NOT NULL DEFAULT nextval('trx_undangan_pemeriksaan_keluar_dpt_kode_undangan_seq'::regclass),
  "is_online" bool,
  "platform_konferensi_video" varchar(100) COLLATE "pg_catalog"."default",
  "link_konferensi_video" varchar(255) COLLATE "pg_catalog"."default",
  "lokasi" varchar(100) COLLATE "pg_catalog"."default",
  "file_surat_ke_ppk" varchar(100) COLLATE "pg_catalog"."default",
  "is_terlaksana" bool
)
;

-- ----------------------------
-- Table structure for trx_undangan_penjr
-- ----------------------------
DROP TABLE IF EXISTS "public"."trx_undangan_penjr";
CREATE TABLE "public"."trx_undangan_penjr" (
  "kode_und_penjr" int4 NOT NULL DEFAULT nextval('trx_undangan_penjr_kode_und_penjr_seq'::regclass),
  "kode_penjaringan" int4,
  "nama" varchar COLLATE "pg_catalog"."default",
  "email" varchar COLLATE "pg_catalog"."default",
  "alamat" varchar COLLATE "pg_catalog"."default",
  "nama_pic" varchar COLLATE "pg_catalog"."default",
  "no_hp_wa" varchar COLLATE "pg_catalog"."default",
  "tgl_awal" timestamptz(6),
  "tgl_akhir" timestamptz(6),
  "token" varchar COLLATE "pg_catalog"."default",
  "kode_vendor" int4,
  "status_undang" "public"."status_undang",
  "vendor_baru" bool DEFAULT false
)
;
COMMENT ON COLUMN "public"."trx_undangan_penjr"."kode_und_penjr" IS 'kode undangan penjaringan';
COMMENT ON TABLE "public"."trx_undangan_penjr" IS 'Data vendor yg diundang langsung oleh PPK (metode penjaringan: ''undangan'')';

-- ----------------------------
-- Table structure for trx_undangan_verif
-- ----------------------------
DROP TABLE IF EXISTS "public"."trx_undangan_verif";
CREATE TABLE "public"."trx_undangan_verif" (
  "kode_undangan_verif" int4 NOT NULL DEFAULT nextval('trx_undangan_verif_kode_undangan_verif_seq'::regclass),
  "kode_vendor_penjr" int4,
  "tgl_undangan" timestamptz(6),
  "is_online" bool,
  "platform_konferensi" varchar(100) COLLATE "pg_catalog"."default",
  "link_konferensi" text COLLATE "pg_catalog"."default",
  "is_lokasi_dialamat_penyedia" bool,
  "lokasi" varchar(255) COLLATE "pg_catalog"."default",
  "is_vendor_hadir" bool,
  "kode_trx_virtual_paraf" int4
)
;
COMMENT ON TABLE "public"."trx_undangan_verif" IS 'Untuk mencatat jadwal verifikasi penyedia dengan DMAU';

-- ----------------------------
-- Table structure for trx_vendor_penjr
-- ----------------------------
DROP TABLE IF EXISTS "public"."trx_vendor_penjr";
CREATE TABLE "public"."trx_vendor_penjr" (
  "kode_vendor_penjr" int4 NOT NULL DEFAULT nextval('trx_vendor_penjr_kode_vendor_penjr_seq'::regclass),
  "kode_penjaringan" int4,
  "kode_vendor" int4,
  "status_verifikasi" "public"."status_verifikasi",
  "alasan_ditolak" text COLLATE "pg_catalog"."default",
  "batas_waktu_perbaikan" timestamptz(6),
  "file_daftar_kehadiran" varchar(100) COLLATE "pg_catalog"."default",
  "file_lainnya" varchar(100) COLLATE "pg_catalog"."default" DEFAULT NULL::character varying,
  "file_ba_verif" varchar(100) COLLATE "pg_catalog"."default",
  "status_dpt" "public"."status_dpt" DEFAULT 'belum_ditetapkan'::status_dpt,
  "alasan_tidak_terpilih" text COLLATE "pg_catalog"."default",
  "status_undang" "public"."status_undang_vendor",
  "status_isian_vendor" "public"."status_isian_vendor",
  "kode_step_verifikasi" int4,
  "status_pengisian_data_dpt" "public"."status_pengisian_data_dpt" DEFAULT 'belum'::status_pengisian_data_dpt,
  "keypass_ba_verif" varchar COLLATE "pg_catalog"."default",
  "file_ba_verif_final" varchar COLLATE "pg_catalog"."default",
  "keypass_ba_verif_final" varchar COLLATE "pg_catalog"."default",
  "kode_trx_penandatangan" int4,
  "nomor_surat_tugas" varchar COLLATE "pg_catalog"."default",
  "file_ba_verif_tte" varchar COLLATE "pg_catalog"."default",
  "link_dokumentasi_conference" varchar COLLATE "pg_catalog"."default"
)
;
COMMENT ON COLUMN "public"."trx_vendor_penjr"."status_verifikasi" IS 'belum_diproses, proses_verifikasi, perbaikan_data, proses_evaluasi, diterima, ditolak';
COMMENT ON COLUMN "public"."trx_vendor_penjr"."alasan_ditolak" IS 'Alasan hasil evaluasi ditolak';
COMMENT ON COLUMN "public"."trx_vendor_penjr"."status_dpt" IS 'belum_ditetapkan, belum_penetapan, terpilih, tidak_terpilih';
COMMENT ON COLUMN "public"."trx_vendor_penjr"."alasan_tidak_terpilih" IS 'Alasan tidak terpilih sebagai DPT';
COMMENT ON TABLE "public"."trx_vendor_penjr" IS 'mencatat vendor yang memilih paket';

-- ----------------------------
-- Table structure for trx_verif_luar_dpt
-- ----------------------------
DROP TABLE IF EXISTS "public"."trx_verif_luar_dpt";
CREATE TABLE "public"."trx_verif_luar_dpt" (
  "kode_verif_luar_dpt" int4 NOT NULL DEFAULT nextval('trx_verif_luar_dpt_kode_verif_luar_dpt_seq'::regclass),
  "kode_vendor" int4,
  "is_sesuai" bool,
  "komentar" text COLLATE "pg_catalog"."default"
)
;

-- ----------------------------
-- Table structure for trx_verifikator_penjr
-- ----------------------------
DROP TABLE IF EXISTS "public"."trx_verifikator_penjr";
CREATE TABLE "public"."trx_verifikator_penjr" (
  "kode_verifikator_penjr" int4 NOT NULL DEFAULT nextval('trx_verifikator_penjr_kode_verifikator_penjr_seq'::regclass),
  "kode_penjaringan" int4,
  "email_verif" varchar(80) COLLATE "pg_catalog"."default" DEFAULT NULL::character varying,
  "nama_verif" varchar(100) COLLATE "pg_catalog"."default",
  "nip" varchar COLLATE "pg_catalog"."default",
  "status_aktif" "public"."status_aktif",
  "id_user" int4
)
;
COMMENT ON COLUMN "public"."trx_verifikator_penjr"."kode_verifikator_penjr" IS 'kode verifikator penjaringan';
COMMENT ON COLUMN "public"."trx_verifikator_penjr"."email_verif" IS 'email user verifikator';
COMMENT ON COLUMN "public"."trx_verifikator_penjr"."nama_verif" IS 'nama verifikator';
COMMENT ON COLUMN "public"."trx_verifikator_penjr"."id_user" IS 'Id User USMAN';
COMMENT ON TABLE "public"."trx_verifikator_penjr" IS 'verifikator yang dapat surat tugas untuk memverifikasi vendor di penjaringan';

-- ----------------------------
-- Procedure structure for copy_ref_to_custom
-- ----------------------------
DROP PROCEDURE IF EXISTS "public"."copy_ref_to_custom"("p_kode_vendor" int4, "p_kode_penjaringan" int4);
CREATE OR REPLACE PROCEDURE "public"."copy_ref_to_custom"("p_kode_vendor" int4, "p_kode_penjaringan" int4)
 AS $BODY$
DECLARE
    v_kode_tenaga_ahli INTEGER;
    v_kode_tenaga_ahli_custom INTEGER;

    v_kode_tenaga_pendukung INTEGER;
    v_kode_tenaga_pendukung_custom INTEGER;

    v_kode_pengalaman_ta INTEGER;
    v_kode_sertif_ta INTEGER;

    v_kode_pengalaman_tp INTEGER;
    v_kode_sertif_tp INTEGER;

    v_record RECORD;
    v_pengalaman_record RECORD;
    v_sertif_record RECORD;

BEGIN
    -- Loop through all tenaga ahli for the given vendor
    FOR v_record IN 
        SELECT * 
        FROM ref_tenaga_ahli_bu 
        WHERE kode_vendor = p_kode_vendor
    LOOP
        -- Insert into custom table
        INSERT INTO ref_tenaga_ahli_bu_custom (
            kode_tenaga_ahli,
            kode_vendor,
            kode_penjaringan,
            nama,
            no_ktp,
            file_ktp,
            encrypt_key_ktp,
            tempat_lahir,
            tgl_lahir,
            posisi,
            kode_jenjang_pendidikan,
            program_studi,
            file_ijazah,
            encrypt_key_ijazah,
            file_cv,
            encrypt_key_cv,
            tgl_cv,
            revisi_ke
        )
        VALUES (
            v_record.kode_tenaga_ahli,
            v_record.kode_vendor,
            p_kode_penjaringan,
            v_record.nama,
            v_record.no_ktp,
            v_record.file_ktp,
            v_record.encrypt_key_ktp,
            v_record.tempat_lahir,
            v_record.tgl_lahir,
            v_record.posisi,
            v_record.kode_jenjang_pendidikan,
            v_record.program_studi,
            v_record.file_ijazah,
            v_record.encrypt_key_ijazah,
            v_record.file_cv,
            v_record.encrypt_key_cv,
            v_record.tgl_cv,
            v_record.revisi_ke
        )
        RETURNING kode_tenaga_ahli_custom INTO v_kode_tenaga_ahli_custom;
        
        -- Insert pengalaman (experiences) for this tenaga ahli
        FOR v_pengalaman_record IN
            SELECT *
            FROM ref_pengalaman_ta
            WHERE kode_tenaga_ahli = v_record.kode_tenaga_ahli
        LOOP
            INSERT INTO ref_pengalaman_ta_custom (
                kode_penjaringan,
                kode_tenaga_ahli_custom,
                pengalaman,
                file_bukti,
                encrypt_key,
                revisi_ke,
                kode_pengalaman_ta
            )
            VALUES (
                p_kode_penjaringan,
                v_kode_tenaga_ahli_custom,
                v_pengalaman_record.pengalaman,
                v_pengalaman_record.file_bukti,
                v_pengalaman_record.encrypt_key,
                v_pengalaman_record.revisi_ke,
                v_pengalaman_record.kode_pengalaman_ta
            );
        END LOOP;
        
        -- Insert sertifikat (certificates) for this tenaga ahli
        FOR v_sertif_record IN
            SELECT *
            FROM ref_sertif_ta
            WHERE kode_tenaga_ahli = v_record.kode_tenaga_ahli
        LOOP
            INSERT INTO ref_sertif_ta_custom (
                kode_penjaringan,
                kode_tenaga_ahli_custom,
                sertifikat,
                file_bukti,
                encrypt_key,
                revisi_ke,
                kode_sertif_ta
            )
            VALUES (
                p_kode_penjaringan,
                v_kode_tenaga_ahli_custom,
                v_sertif_record.sertifikat,
                v_sertif_record.file_bukti,
                v_sertif_record.encrypt_key,
                v_sertif_record.revisi_ke,
                v_sertif_record.kode_sertif_ta
            );
        END LOOP;
        
    END LOOP;







    -- Loop through all tenaga pendukung for the given vendor
    FOR v_record IN 
        SELECT * 
        FROM ref_tenaga_pendukung_bu 
        WHERE kode_vendor = p_kode_vendor
    LOOP
        -- Insert into custom table
        INSERT INTO ref_tenaga_pendukung_bu_custom (
            kode_tenaga_pendukung,
            kode_vendor,
            kode_penjaringan,
            nama,
            no_ktp,
            file_ktp,
            encrypt_key_ktp,
            tempat_lahir,
            tgl_lahir,
            posisi,
            kode_jenjang_pendidikan,
            program_studi,
            file_ijazah,
            encrypt_key_ijazah,
            file_cv,
            encrypt_key_cv,
            tgl_cv,
            revisi_ke
        )
        VALUES (
            v_record.kode_tenaga_pendukung,
            v_record.kode_vendor,
            p_kode_penjaringan,
            v_record.nama,
            v_record.no_ktp,
            v_record.file_ktp,
            v_record.encrypt_key_ktp,
            v_record.tempat_lahir,
            v_record.tgl_lahir,
            v_record.posisi,
            v_record.kode_jenjang_pendidikan,
            v_record.program_studi,
            v_record.file_ijazah,
            v_record.encrypt_key_ijazah,
            v_record.file_cv,
            v_record.encrypt_key_cv,
            v_record.tgl_cv,
            v_record.revisi_ke
        )
        RETURNING kode_tenaga_pendukung_custom INTO v_kode_tenaga_pendukung_custom;
        
        -- Insert pengalaman (experiences) for this tenaga pendukung
        FOR v_pengalaman_record IN
            SELECT *
            FROM ref_pengalaman_tp
            WHERE kode_tenaga_pendukung = v_record.kode_tenaga_pendukung
        LOOP
            INSERT INTO ref_pengalaman_tp_custom (
                kode_penjaringan,
                kode_tenaga_pendukung_custom,
                pengalaman,
                file_bukti,
                encrypt_key,
                revisi_ke,
                kode_pengalaman_tp
            )
            VALUES (
                p_kode_penjaringan,
                v_kode_tenaga_pendukung_custom,
                v_pengalaman_record.pengalaman,
                v_pengalaman_record.file_bukti,
                v_pengalaman_record.encrypt_key,
                v_pengalaman_record.revisi_ke,
                v_pengalaman_record.kode_pengalaman_tp
            );
        END LOOP;
        
        -- Insert sertifikat (certificates) for this tenaga pendukung
        FOR v_sertif_record IN
            SELECT *
            FROM ref_sertif_tp
            WHERE kode_tenaga_pendukung = v_record.kode_tenaga_pendukung
        LOOP
            INSERT INTO ref_sertif_tp_custom (
                kode_penjaringan,
                kode_tenaga_pendukung_custom,
                sertifikat,
                file_bukti,
                encrypt_key,
                revisi_ke,
                kode_sertif_tp
            )
            VALUES (
                p_kode_penjaringan,
                v_kode_tenaga_pendukung_custom,
                v_sertif_record.sertifikat,
                v_sertif_record.file_bukti,
                v_sertif_record.encrypt_key,
                v_sertif_record.revisi_ke,
                v_sertif_record.kode_sertif_tp
            );
        END LOOP;
        
    END LOOP;
    
    
    
FOR v_record IN 
    SELECT * 
    FROM ref_pengalaman_pero 
    WHERE kode_vendor = p_kode_vendor
LOOP
    -- Insert into ref_pengalaman_pero_custom
    INSERT INTO ref_pengalaman_pero_custom (
        kode_vendor,
        nama_pekerjaan,
        posisi,
        tgl_awal_pekerjaan,
        tgl_akhir_pekerjaan,
        nilai_pekerjaan,
        file_bukti,
        encrypt_key,
        revisi_ke,
        kode_penjaringan
    )
    VALUES (
        v_record.kode_vendor,
        v_record.nama_pekerjaan,
        v_record.posisi,
        v_record.tgl_awal_pekerjaan,
        v_record.tgl_akhir_pekerjaan,
        v_record.nilai_pekerjaan,
        v_record.file_bukti,
        v_record.encrypt_key,
        v_record.revisi_ke,
        p_kode_penjaringan  -- Assuming you need to pass this as a parameter
    );
END LOOP;


-- Loop through all ref_sertif_pero for the given vendor
FOR v_record IN 
    SELECT * 
    FROM ref_sertif_pero 
    WHERE kode_vendor = p_kode_vendor
LOOP
    -- Insert into ref_sertif_pero_custom
    INSERT INTO ref_sertif_pero_custom (
        kode_vendor,
        nm_sertifikat,
        file_bukti,
        is_bukti_selamanya,
        bukti_berlaku_awal,
        bukti_berlaku_akhir,
        encrypt_key,
        revisi_ke,
        kode_penjaringan
    )
    VALUES (
        v_record.kode_vendor,
        v_record.nm_sertifikat,
        v_record.file_bukti,
        v_record.is_bukti_selamanya,
        v_record.bukti_berlaku_awal,
        v_record.bukti_berlaku_akhir,
        v_record.encrypt_key,
        v_record.revisi_ke,
        p_kode_penjaringan  -- Assuming you need to pass this as a parameter
    );
END LOOP;





    -- Optional: Return message or count
    RAISE NOTICE 'Data copied successfully for vendor % and penjaringan %', p_kode_vendor, p_kode_penjaringan;
    
END;
$BODY$
  LANGUAGE plpgsql;

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
-- Function structure for pg_stat_statements
-- ----------------------------
DROP FUNCTION IF EXISTS "public"."pg_stat_statements"("showtext" bool, OUT "userid" oid, OUT "dbid" oid, OUT "toplevel" bool, OUT "queryid" int8, OUT "query" text, OUT "plans" int8, OUT "total_plan_time" float8, OUT "min_plan_time" float8, OUT "max_plan_time" float8, OUT "mean_plan_time" float8, OUT "stddev_plan_time" float8, OUT "calls" int8, OUT "total_exec_time" float8, OUT "min_exec_time" float8, OUT "max_exec_time" float8, OUT "mean_exec_time" float8, OUT "stddev_exec_time" float8, OUT "rows" int8, OUT "shared_blks_hit" int8, OUT "shared_blks_read" int8, OUT "shared_blks_dirtied" int8, OUT "shared_blks_written" int8, OUT "local_blks_hit" int8, OUT "local_blks_read" int8, OUT "local_blks_dirtied" int8, OUT "local_blks_written" int8, OUT "temp_blks_read" int8, OUT "temp_blks_written" int8, OUT "blk_read_time" float8, OUT "blk_write_time" float8, OUT "temp_blk_read_time" float8, OUT "temp_blk_write_time" float8, OUT "wal_records" int8, OUT "wal_fpi" int8, OUT "wal_bytes" numeric, OUT "jit_functions" int8, OUT "jit_generation_time" float8, OUT "jit_inlining_count" int8, OUT "jit_inlining_time" float8, OUT "jit_optimization_count" int8, OUT "jit_optimization_time" float8, OUT "jit_emission_count" int8, OUT "jit_emission_time" float8);
CREATE OR REPLACE FUNCTION "public"."pg_stat_statements"(IN "showtext" bool, OUT "userid" oid, OUT "dbid" oid, OUT "toplevel" bool, OUT "queryid" int8, OUT "query" text, OUT "plans" int8, OUT "total_plan_time" float8, OUT "min_plan_time" float8, OUT "max_plan_time" float8, OUT "mean_plan_time" float8, OUT "stddev_plan_time" float8, OUT "calls" int8, OUT "total_exec_time" float8, OUT "min_exec_time" float8, OUT "max_exec_time" float8, OUT "mean_exec_time" float8, OUT "stddev_exec_time" float8, OUT "rows" int8, OUT "shared_blks_hit" int8, OUT "shared_blks_read" int8, OUT "shared_blks_dirtied" int8, OUT "shared_blks_written" int8, OUT "local_blks_hit" int8, OUT "local_blks_read" int8, OUT "local_blks_dirtied" int8, OUT "local_blks_written" int8, OUT "temp_blks_read" int8, OUT "temp_blks_written" int8, OUT "blk_read_time" float8, OUT "blk_write_time" float8, OUT "temp_blk_read_time" float8, OUT "temp_blk_write_time" float8, OUT "wal_records" int8, OUT "wal_fpi" int8, OUT "wal_bytes" numeric, OUT "jit_functions" int8, OUT "jit_generation_time" float8, OUT "jit_inlining_count" int8, OUT "jit_inlining_time" float8, OUT "jit_optimization_count" int8, OUT "jit_optimization_time" float8, OUT "jit_emission_count" int8, OUT "jit_emission_time" float8)
  RETURNS SETOF "pg_catalog"."record" AS '$libdir/pg_stat_statements', 'pg_stat_statements_1_10'
  LANGUAGE c VOLATILE STRICT
  COST 1
  ROWS 1000;

-- ----------------------------
-- Function structure for pg_stat_statements_info
-- ----------------------------
DROP FUNCTION IF EXISTS "public"."pg_stat_statements_info"(OUT "dealloc" int8, OUT "stats_reset" timestamptz);
CREATE OR REPLACE FUNCTION "public"."pg_stat_statements_info"(OUT "dealloc" int8, OUT "stats_reset" timestamptz)
  RETURNS "pg_catalog"."record" AS '$libdir/pg_stat_statements', 'pg_stat_statements_info'
  LANGUAGE c VOLATILE STRICT
  COST 1;

-- ----------------------------
-- Function structure for pg_stat_statements_reset
-- ----------------------------
DROP FUNCTION IF EXISTS "public"."pg_stat_statements_reset"("userid" oid, "dbid" oid, "queryid" int8);
CREATE OR REPLACE FUNCTION "public"."pg_stat_statements_reset"("userid" oid=0, "dbid" oid=0, "queryid" int8=0)
  RETURNS "pg_catalog"."void" AS '$libdir/pg_stat_statements', 'pg_stat_statements_reset_1_7'
  LANGUAGE c VOLATILE STRICT
  COST 1;

-- ----------------------------
-- View structure for pg_stat_statements_info
-- ----------------------------
DROP VIEW IF EXISTS "public"."pg_stat_statements_info";
CREATE VIEW "public"."pg_stat_statements_info" AS  SELECT dealloc,
    stats_reset
   FROM pg_stat_statements_info() pg_stat_statements_info(dealloc, stats_reset);

-- ----------------------------
-- View structure for pg_stat_statements
-- ----------------------------
DROP VIEW IF EXISTS "public"."pg_stat_statements";
CREATE VIEW "public"."pg_stat_statements" AS  SELECT userid,
    dbid,
    toplevel,
    queryid,
    query,
    plans,
    total_plan_time,
    min_plan_time,
    max_plan_time,
    mean_plan_time,
    stddev_plan_time,
    calls,
    total_exec_time,
    min_exec_time,
    max_exec_time,
    mean_exec_time,
    stddev_exec_time,
    rows,
    shared_blks_hit,
    shared_blks_read,
    shared_blks_dirtied,
    shared_blks_written,
    local_blks_hit,
    local_blks_read,
    local_blks_dirtied,
    local_blks_written,
    temp_blks_read,
    temp_blks_written,
    blk_read_time,
    blk_write_time,
    temp_blk_read_time,
    temp_blk_write_time,
    wal_records,
    wal_fpi,
    wal_bytes,
    jit_functions,
    jit_generation_time,
    jit_inlining_count,
    jit_inlining_time,
    jit_optimization_count,
    jit_optimization_time,
    jit_emission_count,
    jit_emission_time
   FROM pg_stat_statements(true) pg_stat_statements(userid, dbid, toplevel, queryid, query, plans, total_plan_time, min_plan_time, max_plan_time, mean_plan_time, stddev_plan_time, calls, total_exec_time, min_exec_time, max_exec_time, mean_exec_time, stddev_exec_time, rows, shared_blks_hit, shared_blks_read, shared_blks_dirtied, shared_blks_written, local_blks_hit, local_blks_read, local_blks_dirtied, local_blks_written, temp_blks_read, temp_blks_written, blk_read_time, blk_write_time, temp_blk_read_time, temp_blk_write_time, wal_records, wal_fpi, wal_bytes, jit_functions, jit_generation_time, jit_inlining_count, jit_inlining_time, jit_optimization_count, jit_optimization_time, jit_emission_count, jit_emission_time);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "public"."bridging_id_direksi_kode_bridging_seq"
OWNED BY "public"."bridging_id_direksi"."kode_bridging";
SELECT setval('"public"."bridging_id_direksi_kode_bridging_seq"', 4137, true);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "public"."helper_bank_kw_id_seq"
OWNED BY "public"."helper_bank_kw"."id";
SELECT setval('"public"."helper_bank_kw_id_seq"', 36, true);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "public"."helper_dokumen_kode_helper_seq"
OWNED BY "public"."helper_dokumen"."kode_helper";
SELECT setval('"public"."helper_dokumen_kode_helper_seq"', 139729, true);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "public"."helper_jenjang_pendidikan_kw_id_seq"
OWNED BY "public"."helper_jenjang_pendidikan_kw"."id";
SELECT setval('"public"."helper_jenjang_pendidikan_kw_id_seq"', 123, true);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "public"."helper_kategori_kw_id_seq"
OWNED BY "public"."helper_kategori_kw"."id";
SELECT setval('"public"."helper_kategori_kw_id_seq"', 68, true);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "public"."helper_pengusul_pjr_id_seq"
OWNED BY "public"."helper_pengusul_pjr"."id";
SELECT setval('"public"."helper_pengusul_pjr_id_seq"', 264, true);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "public"."helper_user_id_seq"
OWNED BY "public"."helper_user"."id";
SELECT setval('"public"."helper_user_id_seq"', 32517, true);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "public"."helper_user_nip_id_seq"
OWNED BY "public"."helper_user_nip"."id";
SELECT setval('"public"."helper_user_nip_id_seq"', 2975, true);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "public"."ref_adm_bu_kode_adm_bu_seq"
OWNED BY "public"."ref_adm_bu"."kode_adm_bu";
SELECT setval('"public"."ref_adm_bu_kode_adm_bu_seq"', 2466, true);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "public"."ref_administrasi_pero_kode_adm_seq"
OWNED BY "public"."ref_administrasi_pero"."kode_adm";
SELECT setval('"public"."ref_administrasi_pero_kode_adm_seq"', 221, true);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "public"."ref_ambang_batas_penilaian_kode_ambang_batas_seq"
OWNED BY "public"."ref_ambang_batas_penilaian"."kode_ambang_batas";
SELECT setval('"public"."ref_ambang_batas_penilaian_kode_ambang_batas_seq"', 1, true);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "public"."ref_bank_kode_bank_seq"
OWNED BY "public"."ref_bank"."kode_bank";
SELECT setval('"public"."ref_bank_kode_bank_seq"', 108, true);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "public"."ref_data_pajak_bu_kode_data_pajak_seq"
OWNED BY "public"."ref_data_pajak_bu"."kode_data_pajak";
SELECT setval('"public"."ref_data_pajak_bu_kode_data_pajak_seq"', 2465, true);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "public"."ref_datadiri_kode_datadiri_seq"
OWNED BY "public"."ref_datadiri"."kode_datadiri";
SELECT setval('"public"."ref_datadiri_kode_datadiri_seq"', 221, true);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "public"."ref_datadiri_umum_kode_datadiri_umum_seq"
OWNED BY "public"."ref_datadiri_umum"."kode_datadiri_umum";
SELECT setval('"public"."ref_datadiri_umum_kode_datadiri_umum_seq"', 1, true);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "public"."ref_default_master_kode_default_master_seq"
OWNED BY "public"."ref_default_master"."kode_default_master";
SELECT setval('"public"."ref_default_master_kode_default_master_seq"', 76, true);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "public"."ref_direksi_bu_custom_kode_direksi_custom_seq"
OWNED BY "public"."ref_direksi_bu_custom"."kode_direksi_custom";
SELECT setval('"public"."ref_direksi_bu_custom_kode_direksi_custom_seq"', 1782, true);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "public"."ref_direksi_bu_kode_direksi_seq"
OWNED BY "public"."ref_direksi_bu"."kode_direksi";
SELECT setval('"public"."ref_direksi_bu_kode_direksi_seq"', 4144, true);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "public"."ref_fasilitas_bu_custom_kode_fasilitas_custom_seq"
OWNED BY "public"."ref_fasilitas_bu_custom"."kode_fasilitas_custom";
SELECT setval('"public"."ref_fasilitas_bu_custom_kode_fasilitas_custom_seq"', 4664, true);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "public"."ref_fasilitas_bu_kode_fasilitas_seq"
OWNED BY "public"."ref_fasilitas_bu"."kode_fasilitas";
SELECT setval('"public"."ref_fasilitas_bu_kode_fasilitas_seq"', 7771, true);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "public"."ref_file_saham_kode_file_saham_seq"
OWNED BY "public"."ref_file_saham"."kode_file_saham";
SELECT setval('"public"."ref_file_saham_kode_file_saham_seq"', 1, false);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "public"."ref_history_adm_bu_kode_adm_bu_history_seq"
OWNED BY "public"."ref_history_adm_bu"."kode_adm_bu_history";
SELECT setval('"public"."ref_history_adm_bu_kode_adm_bu_history_seq"', 1, false);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "public"."ref_history_administrasi_pero_kode_adm_seq"
OWNED BY "public"."ref_history_administrasi_pero"."kode_adm";
SELECT setval('"public"."ref_history_administrasi_pero_kode_adm_seq"', 1, true);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "public"."ref_history_data_pajak_bu_kode_data_pajak_history_seq"
OWNED BY "public"."ref_history_data_pajak_bu"."kode_data_pajak_history";
SELECT setval('"public"."ref_history_data_pajak_bu_kode_data_pajak_history_seq"', 1, false);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "public"."ref_history_datadiri_umum_kode_datadiri_umum_seq"
OWNED BY "public"."ref_history_datadiri_umum"."kode_datadiri_umum";
SELECT setval('"public"."ref_history_datadiri_umum_kode_datadiri_umum_seq"', 1, true);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "public"."ref_history_direksi_bu_kode_direksi_history_seq"
OWNED BY "public"."ref_history_direksi_bu"."kode_direksi_history";
SELECT setval('"public"."ref_history_direksi_bu_kode_direksi_history_seq"', 1, false);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "public"."ref_history_fasilitas_bu_kode_fasilitas_history_seq"
OWNED BY "public"."ref_history_fasilitas_bu"."kode_fasilitas_history";
SELECT setval('"public"."ref_history_fasilitas_bu_kode_fasilitas_history_seq"', 1, false);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "public"."ref_history_izin_usaha_bu_kode_izin_usaha_history_seq"
OWNED BY "public"."ref_history_izin_usaha_bu"."kode_izin_usaha_history";
SELECT setval('"public"."ref_history_izin_usaha_bu_kode_izin_usaha_history_seq"', 1, false);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "public"."ref_history_kantor_bu_kode_kantor_history_seq"
OWNED BY "public"."ref_history_kantor_bu"."kode_kantor_history";
SELECT setval('"public"."ref_history_kantor_bu_kode_kantor_history_seq"', 1, false);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "public"."ref_history_keuangan_bu_kode_keuangan_history_seq"
OWNED BY "public"."ref_history_keuangan_bu"."kode_keuangan_history";
SELECT setval('"public"."ref_history_keuangan_bu_kode_keuangan_history_seq"', 1, false);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "public"."ref_history_keuangan_pero_kode_keuangan_history_seq"
OWNED BY "public"."ref_history_keuangan_pero"."kode_keuangan_history";
SELECT setval('"public"."ref_history_keuangan_pero_kode_keuangan_history_seq"', 1, false);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "public"."ref_history_komisaris_bu_kode_komisaris_history_seq"
OWNED BY "public"."ref_history_komisaris_bu"."kode_komisaris_history";
SELECT setval('"public"."ref_history_komisaris_bu_kode_komisaris_history_seq"', 1, false);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "public"."ref_history_lan_hukum_bu_kode_lan_hukum_history_seq"
OWNED BY "public"."ref_history_lan_hukum_bu"."kode_lan_hukum_history";
SELECT setval('"public"."ref_history_lan_hukum_bu_kode_lan_hukum_history_seq"', 1, false);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "public"."ref_history_pengalaman_bu_kode_pengalaman_bu_history_seq"
OWNED BY "public"."ref_history_pengalaman_bu"."kode_pengalaman_bu_history";
SELECT setval('"public"."ref_history_pengalaman_bu_kode_pengalaman_bu_history_seq"', 1, false);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "public"."ref_history_pengalaman_pero_kode_pengalaman_seq"
OWNED BY "public"."ref_history_pengalaman_pero"."kode_pengalaman";
SELECT setval('"public"."ref_history_pengalaman_pero_kode_pengalaman_seq"', 1, true);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "public"."ref_history_pengalaman_ta_kode_pengalaman_ta_history_seq"
OWNED BY "public"."ref_history_pengalaman_ta"."kode_pengalaman_ta_history";
SELECT setval('"public"."ref_history_pengalaman_ta_kode_pengalaman_ta_history_seq"', 1, false);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "public"."ref_history_pengalaman_tp_kode_pengalaman_tp_history_seq"
OWNED BY "public"."ref_history_pengalaman_tp"."kode_pengalaman_tp_history";
SELECT setval('"public"."ref_history_pengalaman_tp_kode_pengalaman_tp_history_seq"', 1, false);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "public"."ref_history_pengurus_bu_kode_pengurus_bu_seq"
OWNED BY "public"."ref_history_pengurus_bu"."kode_pengurus_bu";
SELECT setval('"public"."ref_history_pengurus_bu_kode_pengurus_bu_seq"', 1, true);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "public"."ref_history_personalia_pero_kode_personalia_seq"
OWNED BY "public"."ref_history_personalia_pero"."kode_personalia";
SELECT setval('"public"."ref_history_personalia_pero_kode_personalia_seq"', 1, true);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "public"."ref_history_saham_bu_kode_saham_history_seq"
OWNED BY "public"."ref_history_saham_bu"."kode_saham_history";
SELECT setval('"public"."ref_history_saham_bu_kode_saham_history_seq"', 1, false);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "public"."ref_history_sertif_pero_kode_sertif_seq"
OWNED BY "public"."ref_history_sertif_pero"."kode_sertif";
SELECT setval('"public"."ref_history_sertif_pero_kode_sertif_seq"', 1, true);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "public"."ref_history_sertif_ta_kode_sertif_ta_history_seq"
OWNED BY "public"."ref_history_sertif_ta"."kode_sertif_ta_history";
SELECT setval('"public"."ref_history_sertif_ta_kode_sertif_ta_history_seq"', 1, false);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "public"."ref_history_sertif_tp_kode_sertif_tp_history_seq"
OWNED BY "public"."ref_history_sertif_tp"."kode_sertif_tp_history";
SELECT setval('"public"."ref_history_sertif_tp_kode_sertif_tp_history_seq"', 1, false);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "public"."ref_history_sertifikat_usaha__kode_sertifikat_usaha_history_seq"
OWNED BY "public"."ref_history_sertifikat_usaha_bu"."kode_sertifikat_usaha_history";
SELECT setval('"public"."ref_history_sertifikat_usaha__kode_sertifikat_usaha_history_seq"', 1, false);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "public"."ref_history_tenaga_ahli_bu_kode_tenaga_ahli_history_seq"
OWNED BY "public"."ref_history_tenaga_ahli_bu"."kode_tenaga_ahli_history";
SELECT setval('"public"."ref_history_tenaga_ahli_bu_kode_tenaga_ahli_history_seq"', 1, false);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "public"."ref_history_tenaga_pendukung__kode_tenaga_pendukung_history_seq"
OWNED BY "public"."ref_history_tenaga_pendukung_bu"."kode_tenaga_pendukung_history";
SELECT setval('"public"."ref_history_tenaga_pendukung__kode_tenaga_pendukung_history_seq"', 1, false);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "public"."ref_history_umum_kode_umum_history_seq"
OWNED BY "public"."ref_history_umum"."kode_umum_history";
SELECT setval('"public"."ref_history_umum_kode_umum_history_seq"', 1, false);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "public"."ref_history_vendor_kode_vendor_history_seq"
OWNED BY "public"."ref_history_vendor"."kode_vendor_history";
SELECT setval('"public"."ref_history_vendor_kode_vendor_history_seq"', 1, false);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "public"."ref_item_tanya_kode_item_seq"
OWNED BY "public"."ref_item_tanya"."kode_item";
SELECT setval('"public"."ref_item_tanya_kode_item_seq"', 254, true);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "public"."ref_item_tanya_tpl_kode_tpl_seq"
OWNED BY "public"."ref_item_tanya_tpl"."kode_tpl";
SELECT setval('"public"."ref_item_tanya_tpl_kode_tpl_seq"', 87, true);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "public"."ref_izin_usaha_bu_custom_kode_izin_usaha_custom_seq"
OWNED BY "public"."ref_izin_usaha_bu_custom"."kode_izin_usaha_custom";
SELECT setval('"public"."ref_izin_usaha_bu_custom_kode_izin_usaha_custom_seq"', 3705, true);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "public"."ref_izin_usaha_bu_kode_izin_usaha_seq"
OWNED BY "public"."ref_izin_usaha_bu"."kode_izin_usaha";
SELECT setval('"public"."ref_izin_usaha_bu_kode_izin_usaha_seq"', 5698, true);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "public"."ref_kantor_bu_custom_kode_kantor_custom_seq"
OWNED BY "public"."ref_kantor_bu_custom"."kode_kantor_custom";
SELECT setval('"public"."ref_kantor_bu_custom_kode_kantor_custom_seq"', 3, true);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "public"."ref_kantor_bu_kode_kantor_seq"
OWNED BY "public"."ref_kantor_bu"."kode_kantor";
SELECT setval('"public"."ref_kantor_bu_kode_kantor_seq"', 4, true);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "public"."ref_kat_item_tanya_kode_kat_item_tanya_seq"
OWNED BY "public"."ref_kat_item_tanya"."kode_kat_item_tanya";
SELECT setval('"public"."ref_kat_item_tanya_kode_kat_item_tanya_seq"', 29, true);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "public"."ref_kat_persyaratan_kode_kat_persyaratan_seq"
OWNED BY "public"."ref_kat_persyaratan"."kode_kat_persyaratan";
SELECT setval('"public"."ref_kat_persyaratan_kode_kat_persyaratan_seq"', 5, true);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "public"."ref_kategori_kode_kategori_seq"
OWNED BY "public"."ref_kategori"."kode_kategori";
SELECT setval('"public"."ref_kategori_kode_kategori_seq"', 112, true);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "public"."ref_kbli_sbu_kode_kbli_sbu_seq"
OWNED BY "public"."ref_kbli_sbu"."kode_kbli_sbu";
SELECT setval('"public"."ref_kbli_sbu_kode_kbli_sbu_seq"', 2650, true);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "public"."ref_keuangan_bu_kode_keuangan_seq"
OWNED BY "public"."ref_keuangan_bu"."kode_keuangan";
SELECT setval('"public"."ref_keuangan_bu_kode_keuangan_seq"', 2465, true);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "public"."ref_keuangan_pero_kode_keuangan_seq"
OWNED BY "public"."ref_keuangan_pero"."kode_keuangan";
SELECT setval('"public"."ref_keuangan_pero_kode_keuangan_seq"', 221, true);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "public"."ref_komisaris_bu_custom_kode_komisaris_custom_seq"
OWNED BY "public"."ref_komisaris_bu_custom"."kode_komisaris_custom";
SELECT setval('"public"."ref_komisaris_bu_custom_kode_komisaris_custom_seq"', 1387, true);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "public"."ref_komisaris_bu_kode_komisaris_seq"
OWNED BY "public"."ref_komisaris_bu"."kode_komisaris";
SELECT setval('"public"."ref_komisaris_bu_kode_komisaris_seq"', 3363, true);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "public"."ref_lan_hukum_bu_kode_lan_hukum_seq"
OWNED BY "public"."ref_lan_hukum_bu"."kode_lan_hukum";
SELECT setval('"public"."ref_lan_hukum_bu_kode_lan_hukum_seq"', 2466, true);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "public"."ref_pakta_integritas_kode_pakta_integritas_seq"
OWNED BY "public"."ref_pakta_integritas"."kode_pakta_integritas";
SELECT setval('"public"."ref_pakta_integritas_kode_pakta_integritas_seq"', 7, true);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "public"."ref_penanggung_jwb_kode_penanggung_jwb_seq"
OWNED BY "public"."ref_penanggung_jwb"."kode_penanggung_jwb";
SELECT setval('"public"."ref_penanggung_jwb_kode_penanggung_jwb_seq"', 1, true);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "public"."ref_pengalaman_bu_custom_kode_pengalaman_bu_custom_seq"
OWNED BY "public"."ref_pengalaman_bu_custom"."kode_pengalaman_bu_custom";
SELECT setval('"public"."ref_pengalaman_bu_custom_kode_pengalaman_bu_custom_seq"', 6140, true);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "public"."ref_pengalaman_bu_kode_pengalaman_bu_seq"
OWNED BY "public"."ref_pengalaman_bu"."kode_pengalaman_bu";
SELECT setval('"public"."ref_pengalaman_bu_kode_pengalaman_bu_seq"', 11794, true);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "public"."ref_pengalaman_pero_custom_kode_pengalaman_custom_seq"
OWNED BY "public"."ref_pengalaman_pero_custom"."kode_pengalaman_custom";
SELECT setval('"public"."ref_pengalaman_pero_custom_kode_pengalaman_custom_seq"', 28, true);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "public"."ref_pengalaman_pero_kode_pengalaman_seq"
OWNED BY "public"."ref_pengalaman_pero"."kode_pengalaman";
SELECT setval('"public"."ref_pengalaman_pero_kode_pengalaman_seq"', 265, true);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "public"."ref_pengalaman_ta_custom_kode_pengalaman_ta_custom_seq"
OWNED BY "public"."ref_pengalaman_ta_custom"."kode_pengalaman_ta_custom";
SELECT setval('"public"."ref_pengalaman_ta_custom_kode_pengalaman_ta_custom_seq"', 5286, true);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "public"."ref_pengalaman_ta_kode_pengalaman_ta_seq"
OWNED BY "public"."ref_pengalaman_ta"."kode_pengalaman_ta";
SELECT setval('"public"."ref_pengalaman_ta_kode_pengalaman_ta_seq"', 7985, true);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "public"."ref_pengalaman_tp_custom_kode_pengalaman_tp_custom_seq"
OWNED BY "public"."ref_pengalaman_tp_custom"."kode_pengalaman_tp_custom";
SELECT setval('"public"."ref_pengalaman_tp_custom_kode_pengalaman_tp_custom_seq"', 14, true);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "public"."ref_pengalaman_tp_kode_pengalaman_tp_seq"
OWNED BY "public"."ref_pengalaman_tp"."kode_pengalaman_tp";
SELECT setval('"public"."ref_pengalaman_tp_kode_pengalaman_tp_seq"', 17, true);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "public"."ref_pengurus_bu_kode_pengurus_bu_seq"
OWNED BY "public"."ref_pengurus_bu"."kode_pengurus_bu";
SELECT setval('"public"."ref_pengurus_bu_kode_pengurus_bu_seq"', 2303, true);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "public"."ref_pengurus_bu_verif_kode_verif_seq"
OWNED BY "public"."ref_pengurus_bu_verif"."kode_verif";
SELECT setval('"public"."ref_pengurus_bu_verif_kode_verif_seq"', 2, true);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "public"."ref_persentase_penilaian_kode_persentase_seq"
OWNED BY "public"."ref_persentase_penilaian"."kode_persentase";
SELECT setval('"public"."ref_persentase_penilaian_kode_persentase_seq"', 1, true);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "public"."ref_persentasi_evaluasi_kode_persentase_seq"
OWNED BY "public"."ref_persentasi_evaluasi"."kode_persentase";
SELECT setval('"public"."ref_persentasi_evaluasi_kode_persentase_seq"', 7, true);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "public"."ref_personalia_pero_kode_personalia_seq"
OWNED BY "public"."ref_personalia_pero"."kode_personalia";
SELECT setval('"public"."ref_personalia_pero_kode_personalia_seq"', 221, true);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "public"."ref_saham_bu_custom_kode_saham_custom_seq"
OWNED BY "public"."ref_saham_bu_custom"."kode_saham_custom";
SELECT setval('"public"."ref_saham_bu_custom_kode_saham_custom_seq"', 2306, true);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "public"."ref_saham_bu_kode_saham_seq"
OWNED BY "public"."ref_saham_bu"."kode_saham";
SELECT setval('"public"."ref_saham_bu_kode_saham_seq"', 5208, true);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "public"."ref_sertif_pero_custom_kode_sertif_pero_custom_seq"
OWNED BY "public"."ref_sertif_pero_custom"."kode_sertif_pero_custom";
SELECT setval('"public"."ref_sertif_pero_custom_kode_sertif_pero_custom_seq"', 34, true);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "public"."ref_sertif_pero_kode_sertif_seq"
OWNED BY "public"."ref_sertif_pero"."kode_sertif";
SELECT setval('"public"."ref_sertif_pero_kode_sertif_seq"', 306, true);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "public"."ref_sertif_ta_custom_kode_sertif_ta_custom_seq"
OWNED BY "public"."ref_sertif_ta_custom"."kode_sertif_ta_custom";
SELECT setval('"public"."ref_sertif_ta_custom_kode_sertif_ta_custom_seq"', 5286, true);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "public"."ref_sertif_ta_kode_sertif_ta_seq"
OWNED BY "public"."ref_sertif_ta"."kode_sertif_ta";
SELECT setval('"public"."ref_sertif_ta_kode_sertif_ta_seq"', 7985, true);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "public"."ref_sertif_tp_custom_kode_sertif_tp_custom_seq"
OWNED BY "public"."ref_sertif_tp_custom"."kode_sertif_tp_custom";
SELECT setval('"public"."ref_sertif_tp_custom_kode_sertif_tp_custom_seq"', 14, true);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "public"."ref_sertif_tp_kode_sertif_tp_seq"
OWNED BY "public"."ref_sertif_tp"."kode_sertif_tp";
SELECT setval('"public"."ref_sertif_tp_kode_sertif_tp_seq"', 17, true);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "public"."ref_sertifikat_usaha_bu_custom_kode_sertifikat_usaha_custom_seq"
OWNED BY "public"."ref_sertifikat_usaha_bu_custom"."kode_sertifikat_usaha_custom";
SELECT setval('"public"."ref_sertifikat_usaha_bu_custom_kode_sertifikat_usaha_custom_seq"', 19, true);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "public"."ref_sertifikat_usaha_bu_kode_sertifikat_usaha_seq"
OWNED BY "public"."ref_sertifikat_usaha_bu"."kode_sertifikat_usaha";
SELECT setval('"public"."ref_sertifikat_usaha_bu_kode_sertifikat_usaha_seq"', 27, true);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "public"."ref_status_keluar_dpt_kode_status_keluar_dpt_seq"
OWNED BY "public"."ref_status_keluar_dpt"."kode_status_keluar_dpt";
SELECT setval('"public"."ref_status_keluar_dpt_kode_status_keluar_dpt_seq"', 1, true);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "public"."ref_subkat_persyaratan_kode_subkat_seq"
OWNED BY "public"."ref_subkat_persyaratan"."kode_subkat";
SELECT setval('"public"."ref_subkat_persyaratan_kode_subkat_seq"', 16, true);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "public"."ref_tenaga_ahli_bu_custom_kode_tenaga_ahli_custom_seq"
OWNED BY "public"."ref_tenaga_ahli_bu_custom"."kode_tenaga_ahli_custom";
SELECT setval('"public"."ref_tenaga_ahli_bu_custom_kode_tenaga_ahli_custom_seq"', 5286, true);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "public"."ref_tenaga_ahli_bu_kode_tenaga_ahli_seq"
OWNED BY "public"."ref_tenaga_ahli_bu"."kode_tenaga_ahli";
SELECT setval('"public"."ref_tenaga_ahli_bu_kode_tenaga_ahli_seq"', 7985, true);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "public"."ref_tenaga_pendukung_bu_custom_kode_tenaga_pendukung_custom_seq"
OWNED BY "public"."ref_tenaga_pendukung_bu_custom"."kode_tenaga_pendukung_custom";
SELECT setval('"public"."ref_tenaga_pendukung_bu_custom_kode_tenaga_pendukung_custom_seq"', 14, true);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "public"."ref_tenaga_pendukung_bu_kode_tenaga_pendukung_seq"
OWNED BY "public"."ref_tenaga_pendukung_bu"."kode_tenaga_pendukung";
SELECT setval('"public"."ref_tenaga_pendukung_bu_kode_tenaga_pendukung_seq"', 17, true);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "public"."ref_umum_kode_umum_seq"
OWNED BY "public"."ref_umum"."kode_umum";
SELECT setval('"public"."ref_umum_kode_umum_seq"', 2466, true);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "public"."ref_v_keluar_dpt_kode_v_keluar_dpt_seq"
OWNED BY "public"."ref_v_keluar_dpt"."kode_v_keluar_dpt";
SELECT setval('"public"."ref_v_keluar_dpt_kode_v_keluar_dpt_seq"', 1, true);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "public"."ref_vendor_kode_vendor_seq"
OWNED BY "public"."ref_vendor"."kode_vendor";
SELECT setval('"public"."ref_vendor_kode_vendor_seq"', 32530, true);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "public"."ref_vendor_penandatangan_kode_vp_seq"
OWNED BY "public"."ref_vendor_penandatangan"."kode_vp";
SELECT setval('"public"."ref_vendor_penandatangan_kode_vp_seq"', 13729, true);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "public"."ref_vendor_reg_history_kode_register_seq"
OWNED BY "public"."ref_vendor_reg_history"."kode_register";
SELECT setval('"public"."ref_vendor_reg_history_kode_register_seq"', 2682, true);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "public"."ref_vendor_register_kode_register_seq"
OWNED BY "public"."ref_vendor_register"."kode_register";
SELECT setval('"public"."ref_vendor_register_kode_register_seq"', 32580, true);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "public"."ref_verif_adm_bu_kode_verif_seq"
OWNED BY "public"."ref_verif_adm_bu"."kode_verif";
SELECT setval('"public"."ref_verif_adm_bu_kode_verif_seq"', 2, true);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "public"."ref_verif_administrasi_pero_kode_verif_seq"
OWNED BY "public"."ref_verif_administrasi_pero"."kode_verif";
SELECT setval('"public"."ref_verif_administrasi_pero_kode_verif_seq"', 1, true);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "public"."ref_verif_data_pajak_bu_kode_verif_seq"
OWNED BY "public"."ref_verif_data_pajak_bu"."kode_verif";
SELECT setval('"public"."ref_verif_data_pajak_bu_kode_verif_seq"', 2, true);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "public"."ref_verif_datadiri_kode_verif_seq"
OWNED BY "public"."ref_verif_datadiri"."kode_verif";
SELECT setval('"public"."ref_verif_datadiri_kode_verif_seq"', 10, true);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "public"."ref_verif_datadiri_umum_kode_verif_seq"
OWNED BY "public"."ref_verif_datadiri_umum"."kode_verif";
SELECT setval('"public"."ref_verif_datadiri_umum_kode_verif_seq"', 1, true);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "public"."ref_verif_direksi_kode_verif_seq"
OWNED BY "public"."ref_verif_direksi"."kode_verif";
SELECT setval('"public"."ref_verif_direksi_kode_verif_seq"', 3, true);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "public"."ref_verif_fasilitas_bu_kode_verif_seq"
OWNED BY "public"."ref_verif_fasilitas_bu"."kode_verif";
SELECT setval('"public"."ref_verif_fasilitas_bu_kode_verif_seq"', 2, true);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "public"."ref_verif_izin_usaha_bu_kode_verif_seq"
OWNED BY "public"."ref_verif_izin_usaha_bu"."kode_verif";
SELECT setval('"public"."ref_verif_izin_usaha_bu_kode_verif_seq"', 4, true);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "public"."ref_verif_kantor_bu_kode_verif_seq"
OWNED BY "public"."ref_verif_kantor_bu"."kode_verif";
SELECT setval('"public"."ref_verif_kantor_bu_kode_verif_seq"', 2, true);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "public"."ref_verif_keuangan_bu_kode_verif_seq"
OWNED BY "public"."ref_verif_keuangan_bu"."kode_verif";
SELECT setval('"public"."ref_verif_keuangan_bu_kode_verif_seq"', 2, true);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "public"."ref_verif_keuangan_pero_kode_verif_seq"
OWNED BY "public"."ref_verif_keuangan_pero"."kode_verif";
SELECT setval('"public"."ref_verif_keuangan_pero_kode_verif_seq"', 1, true);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "public"."ref_verif_komisaris_kode_verif_seq"
OWNED BY "public"."ref_verif_komisaris"."kode_verif";
SELECT setval('"public"."ref_verif_komisaris_kode_verif_seq"', 1, true);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "public"."ref_verif_lan_hukum_bu_kode_verif_seq"
OWNED BY "public"."ref_verif_lan_hukum_bu"."kode_verif";
SELECT setval('"public"."ref_verif_lan_hukum_bu_kode_verif_seq"', 2, true);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "public"."ref_verif_pengalaman_bu_kode_verif_seq"
OWNED BY "public"."ref_verif_pengalaman_bu"."kode_verif";
SELECT setval('"public"."ref_verif_pengalaman_bu_kode_verif_seq"', 2, true);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "public"."ref_verif_pengalaman_pero_kode_verif_seq"
OWNED BY "public"."ref_verif_pengalaman_pero"."kode_verif";
SELECT setval('"public"."ref_verif_pengalaman_pero_kode_verif_seq"', 1, true);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "public"."ref_verif_personalia_pero_kode_verif_seq"
OWNED BY "public"."ref_verif_personalia_pero"."kode_verif";
SELECT setval('"public"."ref_verif_personalia_pero_kode_verif_seq"', 14, true);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "public"."ref_verif_saham_bu_kode_verif_seq"
OWNED BY "public"."ref_verif_saham_bu"."kode_verif";
SELECT setval('"public"."ref_verif_saham_bu_kode_verif_seq"', 2, true);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "public"."ref_verif_sertif_pero_kode_verif_seq"
OWNED BY "public"."ref_verif_sertif_pero"."kode_verif";
SELECT setval('"public"."ref_verif_sertif_pero_kode_verif_seq"', 1, true);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "public"."ref_verif_sertifikat_usaha_bu_kode_verif_seq"
OWNED BY "public"."ref_verif_sertifikat_usaha_bu"."kode_verif";
SELECT setval('"public"."ref_verif_sertifikat_usaha_bu_kode_verif_seq"', 2, true);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "public"."ref_verif_tenaga_ahli_bu_kode_verif_seq"
OWNED BY "public"."ref_verif_tenaga_ahli_bu"."kode_verif";
SELECT setval('"public"."ref_verif_tenaga_ahli_bu_kode_verif_seq"', 2, true);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "public"."ref_verif_tenaga_pendukung_bu_kode_verif_seq"
OWNED BY "public"."ref_verif_tenaga_pendukung_bu"."kode_verif";
SELECT setval('"public"."ref_verif_tenaga_pendukung_bu_kode_verif_seq"', 2, true);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "public"."ref_verif_umum_kode_verif_seq"
OWNED BY "public"."ref_verif_umum"."kode_verif";
SELECT setval('"public"."ref_verif_umum_kode_verif_seq"', 6, true);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "public"."trx_custom_item_kode_ci_seq"
OWNED BY "public"."trx_custom_item"."kode_ci";
SELECT setval('"public"."trx_custom_item_kode_ci_seq"', 66, true);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "public"."trx_custom_table_kode_custom_table_seq"
OWNED BY "public"."trx_custom_table"."kode_custom_table";
SELECT setval('"public"."trx_custom_table_kode_custom_table_seq"', 529, true);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "public"."trx_izin_kbli_sbu_custom_kode_trx_iks_custom_seq"
OWNED BY "public"."trx_izin_kbli_sbu_custom"."kode_trx_iks_custom";
SELECT setval('"public"."trx_izin_kbli_sbu_custom_kode_trx_iks_custom_seq"', 151, true);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "public"."trx_izin_kbli_sbu_kode_trx_kbli_seq"
OWNED BY "public"."trx_izin_kbli_sbu"."kode_trx_kbli";
SELECT setval('"public"."trx_izin_kbli_sbu_kode_trx_kbli_seq"', 51, true);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "public"."trx_kat_j_vendor_kode_kat_j_vendor_seq"
OWNED BY "public"."trx_kat_j_vendor"."kode_kat_j_vendor";
SELECT setval('"public"."trx_kat_j_vendor_kode_kat_j_vendor_seq"', 1, true);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "public"."trx_kategori_kode_trx_kategori_seq"
OWNED BY "public"."trx_kategori"."kode_trx_kategori";
SELECT setval('"public"."trx_kategori_kode_trx_kategori_seq"', 114, true);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "public"."trx_kbli_custom_kode_trx_kbli_custom_seq"
OWNED BY "public"."trx_kbli_custom"."kode_trx_kbli_custom";
SELECT setval('"public"."trx_kbli_custom_kode_trx_kbli_custom_seq"', 1, true);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "public"."trx_kehadiran_verif_kode_kehadiran_seq"
OWNED BY "public"."trx_kehadiran_verif"."kode_kehadiran";
SELECT setval('"public"."trx_kehadiran_verif_kode_kehadiran_seq"', 1, true);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "public"."trx_ketentuan_umum_khusus_kode_kuk_seq"
OWNED BY "public"."trx_ketentuan_umum_khusus"."kode_kuk";
SELECT setval('"public"."trx_ketentuan_umum_khusus_kode_kuk_seq"', 103, true);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "public"."trx_konfirmasi_data_sesuai_kode_complete_seq"
OWNED BY "public"."trx_konfirmasi_data_sesuai"."kode_complete";
SELECT setval('"public"."trx_konfirmasi_data_sesuai_kode_complete_seq"', 22, true);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "public"."trx_kualifikasi_usaha_penjr_kode_trx_seq"
OWNED BY "public"."trx_kualifikasi_usaha_penjr"."kode_trx";
SELECT setval('"public"."trx_kualifikasi_usaha_penjr_kode_trx_seq"', 51, true);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "public"."trx_nilai_akhir_kode_penilaian_seq"
OWNED BY "public"."trx_nilai_akhir"."kode_penilaian";
SELECT setval('"public"."trx_nilai_akhir_kode_penilaian_seq"', 822, true);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "public"."trx_penjaringan_kode_penjaringan_seq"
OWNED BY "public"."trx_penjaringan"."kode_penjaringan";
SELECT setval('"public"."trx_penjaringan_kode_penjaringan_seq"', 359, true);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "public"."trx_tim_teknis_pendukung_kode_tim_teknis_pendukung_seq"
OWNED BY "public"."trx_tim_teknis_pendukung"."kode_tim_teknis_pendukung";
SELECT setval('"public"."trx_tim_teknis_pendukung_kode_tim_teknis_pendukung_seq"', 4, true);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "public"."trx_undangan_pemeriksaan_keluar_dpt_kode_undangan_seq"
OWNED BY "public"."trx_undangan_pemeriksaan_keluar_dpt"."kode_undangan";
SELECT setval('"public"."trx_undangan_pemeriksaan_keluar_dpt_kode_undangan_seq"', 1, true);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "public"."trx_undangan_penjr_kode_und_penjr_seq"
OWNED BY "public"."trx_undangan_penjr"."kode_und_penjr";
SELECT setval('"public"."trx_undangan_penjr_kode_und_penjr_seq"', 725, true);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "public"."trx_undangan_verif_kode_undangan_verif_seq"
OWNED BY "public"."trx_undangan_verif"."kode_undangan_verif";
SELECT setval('"public"."trx_undangan_verif_kode_undangan_verif_seq"', 3, true);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "public"."trx_vendor_penjr_kode_vendor_penjr_seq"
OWNED BY "public"."trx_vendor_penjr"."kode_vendor_penjr";
SELECT setval('"public"."trx_vendor_penjr_kode_vendor_penjr_seq"', 826, true);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "public"."trx_verif_luar_dpt_kode_verif_luar_dpt_seq"
OWNED BY "public"."trx_verif_luar_dpt"."kode_verif_luar_dpt";
SELECT setval('"public"."trx_verif_luar_dpt_kode_verif_luar_dpt_seq"', 21, true);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "public"."trx_verifikator_penjr_kode_verifikator_penjr_seq"
OWNED BY "public"."trx_verifikator_penjr"."kode_verifikator_penjr";
SELECT setval('"public"."trx_verifikator_penjr_kode_verifikator_penjr_seq"', 2143, true);

-- ----------------------------
-- Primary Key structure for table bridging_id_direksi
-- ----------------------------
ALTER TABLE "public"."bridging_id_direksi" ADD CONSTRAINT "bridging_id_direksi_pkey" PRIMARY KEY ("kode_bridging");

-- ----------------------------
-- Primary Key structure for table helper_bank_kw
-- ----------------------------
ALTER TABLE "public"."helper_bank_kw" ADD CONSTRAINT "helper_bank_kw_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Indexes structure for table helper_dokumen
-- ----------------------------
CREATE INDEX "idx_helper_dokumen_kode_helper" ON "public"."helper_dokumen" USING btree (
  "kode_helper" "pg_catalog"."int4_ops" ASC NULLS LAST
);
CREATE INDEX "idx_helper_dokumen_original_path" ON "public"."helper_dokumen" USING btree (
  "original_path" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
);

-- ----------------------------
-- Primary Key structure for table helper_dokumen
-- ----------------------------
ALTER TABLE "public"."helper_dokumen" ADD CONSTRAINT "helper_dokumen_pkey" PRIMARY KEY ("kode_helper");

-- ----------------------------
-- Primary Key structure for table helper_domisili
-- ----------------------------
ALTER TABLE "public"."helper_domisili" ADD CONSTRAINT "helper_domisili_pkey" PRIMARY KEY ("kode_domisili");

-- ----------------------------
-- Primary Key structure for table helper_jenjang_pendidikan_kw
-- ----------------------------
ALTER TABLE "public"."helper_jenjang_pendidikan_kw" ADD CONSTRAINT "helper_jenjang_pendidikan_kw_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table helper_kategori_kw
-- ----------------------------
ALTER TABLE "public"."helper_kategori_kw" ADD CONSTRAINT "helper_kategori_kw_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table helper_pengusul_pjr
-- ----------------------------
ALTER TABLE "public"."helper_pengusul_pjr" ADD CONSTRAINT "helper_pengusul_pjr_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table helper_user
-- ----------------------------
ALTER TABLE "public"."helper_user" ADD CONSTRAINT "helper_user_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table helper_user_nip
-- ----------------------------
ALTER TABLE "public"."helper_user_nip" ADD CONSTRAINT "helper_user_nip_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Indexes structure for table ref_adm_bu
-- ----------------------------
CREATE INDEX "idx_ref_adm_bu_kode_vendor" ON "public"."ref_adm_bu" USING btree (
  "kode_vendor" "pg_catalog"."int4_ops" ASC NULLS LAST
);

-- ----------------------------
-- Primary Key structure for table ref_adm_bu
-- ----------------------------
ALTER TABLE "public"."ref_adm_bu" ADD CONSTRAINT "ref_adm_bu_pkey" PRIMARY KEY ("kode_adm_bu");

-- ----------------------------
-- Primary Key structure for table ref_administrasi_pero
-- ----------------------------
ALTER TABLE "public"."ref_administrasi_pero" ADD CONSTRAINT "ref_administrasi_pero_pkey" PRIMARY KEY ("kode_adm");

-- ----------------------------
-- Primary Key structure for table ref_ambang_batas_penilaian
-- ----------------------------
ALTER TABLE "public"."ref_ambang_batas_penilaian" ADD CONSTRAINT "ref_ambang_batas_penilaian_pkey" PRIMARY KEY ("kode_ambang_batas");

-- ----------------------------
-- Primary Key structure for table ref_bank
-- ----------------------------
ALTER TABLE "public"."ref_bank" ADD CONSTRAINT "ref_bank_pkey" PRIMARY KEY ("kode_bank");

-- ----------------------------
-- Primary Key structure for table ref_data_pajak_bu
-- ----------------------------
ALTER TABLE "public"."ref_data_pajak_bu" ADD CONSTRAINT "ref_data_pajak_bu_pkey" PRIMARY KEY ("kode_data_pajak");

-- ----------------------------
-- Primary Key structure for table ref_datadiri
-- ----------------------------
ALTER TABLE "public"."ref_datadiri" ADD CONSTRAINT "ref_datadiri_pkey" PRIMARY KEY ("kode_datadiri");

-- ----------------------------
-- Primary Key structure for table ref_datadiri_umum
-- ----------------------------
ALTER TABLE "public"."ref_datadiri_umum" ADD CONSTRAINT "ref_datadiri_umum_pkey" PRIMARY KEY ("kode_datadiri_umum");

-- ----------------------------
-- Primary Key structure for table ref_default_master
-- ----------------------------
ALTER TABLE "public"."ref_default_master" ADD CONSTRAINT "ref_default_master_pk" PRIMARY KEY ("kode_default_master");

-- ----------------------------
-- Primary Key structure for table ref_direksi_bu
-- ----------------------------
ALTER TABLE "public"."ref_direksi_bu" ADD CONSTRAINT "ref_direksi_bu_pkey" PRIMARY KEY ("kode_direksi");

-- ----------------------------
-- Primary Key structure for table ref_direksi_bu_custom
-- ----------------------------
ALTER TABLE "public"."ref_direksi_bu_custom" ADD CONSTRAINT "ref_direksi_bu_custom_pkey" PRIMARY KEY ("kode_direksi_custom");

-- ----------------------------
-- Primary Key structure for table ref_fasilitas_bu
-- ----------------------------
ALTER TABLE "public"."ref_fasilitas_bu" ADD CONSTRAINT "ref_fasilitas_bu_pkey" PRIMARY KEY ("kode_fasilitas");

-- ----------------------------
-- Primary Key structure for table ref_fasilitas_bu_custom
-- ----------------------------
ALTER TABLE "public"."ref_fasilitas_bu_custom" ADD CONSTRAINT "ref_fasilitas_bu_custom_pkey" PRIMARY KEY ("kode_fasilitas_custom");

-- ----------------------------
-- Primary Key structure for table ref_file_saham
-- ----------------------------
ALTER TABLE "public"."ref_file_saham" ADD CONSTRAINT "ref_file_saham_pk" PRIMARY KEY ("kode_file_saham");

-- ----------------------------
-- Primary Key structure for table ref_history_adm_bu
-- ----------------------------
ALTER TABLE "public"."ref_history_adm_bu" ADD CONSTRAINT "ref_history_adm_bu_pkey" PRIMARY KEY ("kode_adm_bu_history");

-- ----------------------------
-- Primary Key structure for table ref_history_administrasi_pero
-- ----------------------------
ALTER TABLE "public"."ref_history_administrasi_pero" ADD CONSTRAINT "ref_history_administrasi_pero_pkey" PRIMARY KEY ("kode_adm");

-- ----------------------------
-- Primary Key structure for table ref_history_data_pajak_bu
-- ----------------------------
ALTER TABLE "public"."ref_history_data_pajak_bu" ADD CONSTRAINT "ref_history_data_pajak_bu_pkey" PRIMARY KEY ("kode_data_pajak_history");

-- ----------------------------
-- Primary Key structure for table ref_history_datadiri_umum
-- ----------------------------
ALTER TABLE "public"."ref_history_datadiri_umum" ADD CONSTRAINT "ref_history_datadiri_umum_pkey" PRIMARY KEY ("kode_datadiri_umum");

-- ----------------------------
-- Primary Key structure for table ref_history_direksi_bu
-- ----------------------------
ALTER TABLE "public"."ref_history_direksi_bu" ADD CONSTRAINT "ref_history_direksi_bu_pkey" PRIMARY KEY ("kode_direksi_history");

-- ----------------------------
-- Primary Key structure for table ref_history_fasilitas_bu
-- ----------------------------
ALTER TABLE "public"."ref_history_fasilitas_bu" ADD CONSTRAINT "ref_history_fasilitas_bu_pkey" PRIMARY KEY ("kode_fasilitas_history");

-- ----------------------------
-- Primary Key structure for table ref_history_izin_usaha_bu
-- ----------------------------
ALTER TABLE "public"."ref_history_izin_usaha_bu" ADD CONSTRAINT "ref_history_izin_usaha_bu_pkey" PRIMARY KEY ("kode_izin_usaha_history");

-- ----------------------------
-- Primary Key structure for table ref_history_kantor_bu
-- ----------------------------
ALTER TABLE "public"."ref_history_kantor_bu" ADD CONSTRAINT "ref_history_kantor_bu_pkey" PRIMARY KEY ("kode_kantor_history");

-- ----------------------------
-- Primary Key structure for table ref_history_keuangan_bu
-- ----------------------------
ALTER TABLE "public"."ref_history_keuangan_bu" ADD CONSTRAINT "ref_history_keuangan_bu_pkey" PRIMARY KEY ("kode_keuangan_history");

-- ----------------------------
-- Primary Key structure for table ref_history_keuangan_pero
-- ----------------------------
ALTER TABLE "public"."ref_history_keuangan_pero" ADD CONSTRAINT "ref_history_keuangan_pero_pkey" PRIMARY KEY ("kode_keuangan_history");

-- ----------------------------
-- Primary Key structure for table ref_history_komisaris_bu
-- ----------------------------
ALTER TABLE "public"."ref_history_komisaris_bu" ADD CONSTRAINT "ref_history_komisaris_bu_pkey" PRIMARY KEY ("kode_komisaris_history");

-- ----------------------------
-- Primary Key structure for table ref_history_lan_hukum_bu
-- ----------------------------
ALTER TABLE "public"."ref_history_lan_hukum_bu" ADD CONSTRAINT "ref_history_lan_hukum_bu_pkey" PRIMARY KEY ("kode_lan_hukum_history");

-- ----------------------------
-- Primary Key structure for table ref_history_pengalaman_bu
-- ----------------------------
ALTER TABLE "public"."ref_history_pengalaman_bu" ADD CONSTRAINT "ref_history_pengalaman_bu_pkey" PRIMARY KEY ("kode_pengalaman_bu_history");

-- ----------------------------
-- Primary Key structure for table ref_history_pengalaman_pero
-- ----------------------------
ALTER TABLE "public"."ref_history_pengalaman_pero" ADD CONSTRAINT "ref_history_pengalaman_pero_pkey" PRIMARY KEY ("kode_pengalaman");

-- ----------------------------
-- Primary Key structure for table ref_history_pengalaman_ta
-- ----------------------------
ALTER TABLE "public"."ref_history_pengalaman_ta" ADD CONSTRAINT "ref_history_pengalaman_ta_pkey" PRIMARY KEY ("kode_pengalaman_ta_history");

-- ----------------------------
-- Primary Key structure for table ref_history_pengalaman_tp
-- ----------------------------
ALTER TABLE "public"."ref_history_pengalaman_tp" ADD CONSTRAINT "ref_history_pengalaman_tp_pkey" PRIMARY KEY ("kode_pengalaman_tp_history");

-- ----------------------------
-- Primary Key structure for table ref_history_pengurus_bu
-- ----------------------------
ALTER TABLE "public"."ref_history_pengurus_bu" ADD CONSTRAINT "ref_history_pengurus_bu_pkey" PRIMARY KEY ("kode_pengurus_bu");

-- ----------------------------
-- Primary Key structure for table ref_history_personalia_pero
-- ----------------------------
ALTER TABLE "public"."ref_history_personalia_pero" ADD CONSTRAINT "ref_history_personalia_pero_pkey" PRIMARY KEY ("kode_personalia");

-- ----------------------------
-- Primary Key structure for table ref_history_saham_bu
-- ----------------------------
ALTER TABLE "public"."ref_history_saham_bu" ADD CONSTRAINT "ref_history_saham_bu_pkey" PRIMARY KEY ("kode_saham_history");

-- ----------------------------
-- Primary Key structure for table ref_history_sertif_pero
-- ----------------------------
ALTER TABLE "public"."ref_history_sertif_pero" ADD CONSTRAINT "ref_history_sertif_pero_pkey" PRIMARY KEY ("kode_sertif");

-- ----------------------------
-- Primary Key structure for table ref_history_sertif_ta
-- ----------------------------
ALTER TABLE "public"."ref_history_sertif_ta" ADD CONSTRAINT "ref_history_sertif_ta_pkey" PRIMARY KEY ("kode_sertif_ta_history");

-- ----------------------------
-- Primary Key structure for table ref_history_sertif_tp
-- ----------------------------
ALTER TABLE "public"."ref_history_sertif_tp" ADD CONSTRAINT "ref_history_sertif_tp_pkey" PRIMARY KEY ("kode_sertif_tp_history");

-- ----------------------------
-- Primary Key structure for table ref_history_sertifikat_usaha_bu
-- ----------------------------
ALTER TABLE "public"."ref_history_sertifikat_usaha_bu" ADD CONSTRAINT "ref_history_sertifikat_usaha_bu_pkey" PRIMARY KEY ("kode_sertifikat_usaha_history");

-- ----------------------------
-- Primary Key structure for table ref_history_tenaga_ahli_bu
-- ----------------------------
ALTER TABLE "public"."ref_history_tenaga_ahli_bu" ADD CONSTRAINT "ref_history_tenaga_ahli_bu_pkey" PRIMARY KEY ("kode_tenaga_ahli_history");

-- ----------------------------
-- Primary Key structure for table ref_history_tenaga_pendukung_bu
-- ----------------------------
ALTER TABLE "public"."ref_history_tenaga_pendukung_bu" ADD CONSTRAINT "ref_history_tenaga_pendukung_bu_pkey" PRIMARY KEY ("kode_tenaga_pendukung_history");

-- ----------------------------
-- Primary Key structure for table ref_history_umum
-- ----------------------------
ALTER TABLE "public"."ref_history_umum" ADD CONSTRAINT "ref_history_umum_pkey" PRIMARY KEY ("kode_umum_history");

-- ----------------------------
-- Primary Key structure for table ref_history_vendor
-- ----------------------------
ALTER TABLE "public"."ref_history_vendor" ADD CONSTRAINT "ref_history_vendor_pkey" PRIMARY KEY ("kode_vendor_history");

-- ----------------------------
-- Primary Key structure for table ref_item_tanya
-- ----------------------------
ALTER TABLE "public"."ref_item_tanya" ADD CONSTRAINT "ref_item_tanya_pkey" PRIMARY KEY ("kode_item");

-- ----------------------------
-- Primary Key structure for table ref_item_tanya_tpl
-- ----------------------------
ALTER TABLE "public"."ref_item_tanya_tpl" ADD CONSTRAINT "ref_item_tanya_tpl_pkey" PRIMARY KEY ("kode_tpl");

-- ----------------------------
-- Primary Key structure for table ref_izin_usaha_bu
-- ----------------------------
ALTER TABLE "public"."ref_izin_usaha_bu" ADD CONSTRAINT "ref_izin_usaha_bu_pkey" PRIMARY KEY ("kode_izin_usaha");

-- ----------------------------
-- Primary Key structure for table ref_izin_usaha_bu_custom
-- ----------------------------
ALTER TABLE "public"."ref_izin_usaha_bu_custom" ADD CONSTRAINT "ref_izin_usaha_bu_custom_pkey" PRIMARY KEY ("kode_izin_usaha_custom");

-- ----------------------------
-- Primary Key structure for table ref_jenis_pengadaan
-- ----------------------------
ALTER TABLE "public"."ref_jenis_pengadaan" ADD CONSTRAINT "ref_jenis_pengadaan_pkey" PRIMARY KEY ("kode_jenis_pengadaan");

-- ----------------------------
-- Primary Key structure for table ref_jenis_vendor
-- ----------------------------
ALTER TABLE "public"."ref_jenis_vendor" ADD CONSTRAINT "ref_jenis_vendor_pkey" PRIMARY KEY ("kode_jenis_vendor");

-- ----------------------------
-- Primary Key structure for table ref_jenjang_pendidikan
-- ----------------------------
ALTER TABLE "public"."ref_jenjang_pendidikan" ADD CONSTRAINT "ref_jenjang_pendidikan_pkey" PRIMARY KEY ("kode_jenjang_pendidikan");

-- ----------------------------
-- Primary Key structure for table ref_kab_kota
-- ----------------------------
ALTER TABLE "public"."ref_kab_kota" ADD CONSTRAINT "ref_kab_kota_pkey" PRIMARY KEY ("kode_kab_kota");

-- ----------------------------
-- Primary Key structure for table ref_kantor_bu
-- ----------------------------
ALTER TABLE "public"."ref_kantor_bu" ADD CONSTRAINT "ref_kantor_bu_pkey" PRIMARY KEY ("kode_kantor");

-- ----------------------------
-- Primary Key structure for table ref_kantor_bu_custom
-- ----------------------------
ALTER TABLE "public"."ref_kantor_bu_custom" ADD CONSTRAINT "ref_kantor_bu_custom_pkey" PRIMARY KEY ("kode_kantor_custom");

-- ----------------------------
-- Primary Key structure for table ref_kat_item_tanya
-- ----------------------------
ALTER TABLE "public"."ref_kat_item_tanya" ADD CONSTRAINT "ref_kat_item_tanya_pkey" PRIMARY KEY ("kode_kat_item_tanya");

-- ----------------------------
-- Primary Key structure for table ref_kat_persyaratan
-- ----------------------------
ALTER TABLE "public"."ref_kat_persyaratan" ADD CONSTRAINT "ref_kat_persyaratan_pkey" PRIMARY KEY ("kode_kat_persyaratan");

-- ----------------------------
-- Primary Key structure for table ref_kategori
-- ----------------------------
ALTER TABLE "public"."ref_kategori" ADD CONSTRAINT "ref_kategori_pkey" PRIMARY KEY ("kode_kategori");

-- ----------------------------
-- Primary Key structure for table ref_kbli_sbu
-- ----------------------------
ALTER TABLE "public"."ref_kbli_sbu" ADD CONSTRAINT "ref_kbli_sbu_pkey" PRIMARY KEY ("kode_kbli_sbu");

-- ----------------------------
-- Primary Key structure for table ref_kepemilikan
-- ----------------------------
ALTER TABLE "public"."ref_kepemilikan" ADD CONSTRAINT "ref_kepemilikan_pkey" PRIMARY KEY ("kode_kepemilikan");

-- ----------------------------
-- Primary Key structure for table ref_keuangan_bu
-- ----------------------------
ALTER TABLE "public"."ref_keuangan_bu" ADD CONSTRAINT "ref_keuangan_bu_pkey" PRIMARY KEY ("kode_keuangan");

-- ----------------------------
-- Primary Key structure for table ref_keuangan_pero
-- ----------------------------
ALTER TABLE "public"."ref_keuangan_pero" ADD CONSTRAINT "ref_keuangan_pero_pkey" PRIMARY KEY ("kode_keuangan");

-- ----------------------------
-- Primary Key structure for table ref_komisaris_bu
-- ----------------------------
ALTER TABLE "public"."ref_komisaris_bu" ADD CONSTRAINT "ref_komisaris_bu_pkey" PRIMARY KEY ("kode_komisaris");

-- ----------------------------
-- Primary Key structure for table ref_komisaris_bu_custom
-- ----------------------------
ALTER TABLE "public"."ref_komisaris_bu_custom" ADD CONSTRAINT "ref_komisaris_bu_custom_pkey" PRIMARY KEY ("kode_komisaris_custom");

-- ----------------------------
-- Primary Key structure for table ref_kondisi
-- ----------------------------
ALTER TABLE "public"."ref_kondisi" ADD CONSTRAINT "ref_kondisi_pkey" PRIMARY KEY ("kode_kondisi");

-- ----------------------------
-- Primary Key structure for table ref_kualifikasi_usaha
-- ----------------------------
ALTER TABLE "public"."ref_kualifikasi_usaha" ADD CONSTRAINT "ref_kualifikasi_usaha_pkey" PRIMARY KEY ("kode_kualifikasi_usaha");

-- ----------------------------
-- Primary Key structure for table ref_lan_hukum_bu
-- ----------------------------
ALTER TABLE "public"."ref_lan_hukum_bu" ADD CONSTRAINT "ref_lan_hukum_bu_pkey" PRIMARY KEY ("kode_lan_hukum");

-- ----------------------------
-- Primary Key structure for table ref_pakta_integritas
-- ----------------------------
ALTER TABLE "public"."ref_pakta_integritas" ADD CONSTRAINT "ref_pakta_integritas_pkey" PRIMARY KEY ("kode_pakta_integritas");

-- ----------------------------
-- Primary Key structure for table ref_penanggung_jwb
-- ----------------------------
ALTER TABLE "public"."ref_penanggung_jwb" ADD CONSTRAINT "ref_penanggung_jwb_pkey" PRIMARY KEY ("kode_penanggung_jwb");

-- ----------------------------
-- Primary Key structure for table ref_pengalaman_bu
-- ----------------------------
ALTER TABLE "public"."ref_pengalaman_bu" ADD CONSTRAINT "ref_pengalaman_bu_pkey" PRIMARY KEY ("kode_pengalaman_bu");

-- ----------------------------
-- Primary Key structure for table ref_pengalaman_bu_custom
-- ----------------------------
ALTER TABLE "public"."ref_pengalaman_bu_custom" ADD CONSTRAINT "ref_pengalaman_bu_custom_pkey" PRIMARY KEY ("kode_pengalaman_bu_custom");

-- ----------------------------
-- Primary Key structure for table ref_pengalaman_pero
-- ----------------------------
ALTER TABLE "public"."ref_pengalaman_pero" ADD CONSTRAINT "ref_pengalaman_pero_pkey" PRIMARY KEY ("kode_pengalaman");

-- ----------------------------
-- Primary Key structure for table ref_pengalaman_pero_custom
-- ----------------------------
ALTER TABLE "public"."ref_pengalaman_pero_custom" ADD CONSTRAINT "ref_pengalaman_pero_custom_pkey" PRIMARY KEY ("kode_pengalaman_custom");

-- ----------------------------
-- Primary Key structure for table ref_pengalaman_ta
-- ----------------------------
ALTER TABLE "public"."ref_pengalaman_ta" ADD CONSTRAINT "ref_pengalaman_ta_pkey" PRIMARY KEY ("kode_pengalaman_ta");

-- ----------------------------
-- Primary Key structure for table ref_pengalaman_ta_custom
-- ----------------------------
ALTER TABLE "public"."ref_pengalaman_ta_custom" ADD CONSTRAINT "ref_pengalaman_ta_custom_pkey" PRIMARY KEY ("kode_pengalaman_ta_custom");

-- ----------------------------
-- Primary Key structure for table ref_pengalaman_tp
-- ----------------------------
ALTER TABLE "public"."ref_pengalaman_tp" ADD CONSTRAINT "ref_pengalaman_tp_pkey" PRIMARY KEY ("kode_pengalaman_tp");

-- ----------------------------
-- Primary Key structure for table ref_pengalaman_tp_custom
-- ----------------------------
ALTER TABLE "public"."ref_pengalaman_tp_custom" ADD CONSTRAINT "ref_pengalaman_tp_custom_pkey" PRIMARY KEY ("kode_pengalaman_tp_custom");

-- ----------------------------
-- Primary Key structure for table ref_pengurus_bu
-- ----------------------------
ALTER TABLE "public"."ref_pengurus_bu" ADD CONSTRAINT "ref_pengurus_bu_pkey" PRIMARY KEY ("kode_pengurus_bu");

-- ----------------------------
-- Primary Key structure for table ref_pengurus_bu_verif
-- ----------------------------
ALTER TABLE "public"."ref_pengurus_bu_verif" ADD CONSTRAINT "ref_pengurus_bu_verif_pkey" PRIMARY KEY ("kode_verif");

-- ----------------------------
-- Primary Key structure for table ref_persentase_penilaian
-- ----------------------------
ALTER TABLE "public"."ref_persentase_penilaian" ADD CONSTRAINT "ref_persentase_penilaian_pkey" PRIMARY KEY ("kode_persentase");

-- ----------------------------
-- Primary Key structure for table ref_persentase_penilaian_tpl
-- ----------------------------
ALTER TABLE "public"."ref_persentase_penilaian_tpl" ADD CONSTRAINT "ref_persentase_penilaian_tpl_pkey" PRIMARY KEY ("kode_tpl");

-- ----------------------------
-- Primary Key structure for table ref_persentasi_evaluasi
-- ----------------------------
ALTER TABLE "public"."ref_persentasi_evaluasi" ADD CONSTRAINT "ref_persentasi_evaluasi_pkey" PRIMARY KEY ("kode_persentase");

-- ----------------------------
-- Primary Key structure for table ref_personalia_pero
-- ----------------------------
ALTER TABLE "public"."ref_personalia_pero" ADD CONSTRAINT "ref_personalia_pero_pkey" PRIMARY KEY ("kode_personalia");

-- ----------------------------
-- Primary Key structure for table ref_saham_bu
-- ----------------------------
ALTER TABLE "public"."ref_saham_bu" ADD CONSTRAINT "ref_saham_bu_pkey" PRIMARY KEY ("kode_saham");

-- ----------------------------
-- Primary Key structure for table ref_saham_bu_custom
-- ----------------------------
ALTER TABLE "public"."ref_saham_bu_custom" ADD CONSTRAINT "ref_saham_bu_custom_pkey" PRIMARY KEY ("kode_saham_custom");

-- ----------------------------
-- Primary Key structure for table ref_sanksi_vendor
-- ----------------------------
ALTER TABLE "public"."ref_sanksi_vendor" ADD CONSTRAINT "ref_sanksi_vendor_pkey" PRIMARY KEY ("kode_sanksi_vendor");

-- ----------------------------
-- Primary Key structure for table ref_sertif_pero
-- ----------------------------
ALTER TABLE "public"."ref_sertif_pero" ADD CONSTRAINT "ref_sertif_pero_pkey" PRIMARY KEY ("kode_sertif");

-- ----------------------------
-- Primary Key structure for table ref_sertif_pero_custom
-- ----------------------------
ALTER TABLE "public"."ref_sertif_pero_custom" ADD CONSTRAINT "ref_sertif_pero_custom_pkey" PRIMARY KEY ("kode_sertif_pero_custom");

-- ----------------------------
-- Primary Key structure for table ref_sertif_ta
-- ----------------------------
ALTER TABLE "public"."ref_sertif_ta" ADD CONSTRAINT "ref_sertif_ta_pkey" PRIMARY KEY ("kode_sertif_ta");

-- ----------------------------
-- Primary Key structure for table ref_sertif_ta_custom
-- ----------------------------
ALTER TABLE "public"."ref_sertif_ta_custom" ADD CONSTRAINT "ref_sertif_ta_custom_pkey" PRIMARY KEY ("kode_sertif_ta_custom");

-- ----------------------------
-- Primary Key structure for table ref_sertif_tp
-- ----------------------------
ALTER TABLE "public"."ref_sertif_tp" ADD CONSTRAINT "ref_sertif_tp_pkey" PRIMARY KEY ("kode_sertif_tp");

-- ----------------------------
-- Primary Key structure for table ref_sertif_tp_custom
-- ----------------------------
ALTER TABLE "public"."ref_sertif_tp_custom" ADD CONSTRAINT "ref_sertif_tp_custom_pkey" PRIMARY KEY ("kode_sertif_tp_custom");

-- ----------------------------
-- Primary Key structure for table ref_sertifikat_usaha_bu
-- ----------------------------
ALTER TABLE "public"."ref_sertifikat_usaha_bu" ADD CONSTRAINT "ref_sertifikat_usaha_bu_pkey" PRIMARY KEY ("kode_sertifikat_usaha");

-- ----------------------------
-- Primary Key structure for table ref_sertifikat_usaha_bu_custom
-- ----------------------------
ALTER TABLE "public"."ref_sertifikat_usaha_bu_custom" ADD CONSTRAINT "ref_sertifikat_usaha_bu_custom_pkey" PRIMARY KEY ("kode_sertifikat_usaha_custom");

-- ----------------------------
-- Primary Key structure for table ref_status_keluar_dpt
-- ----------------------------
ALTER TABLE "public"."ref_status_keluar_dpt" ADD CONSTRAINT "ref_status_keluar_dpt_pkey" PRIMARY KEY ("kode_status_keluar_dpt");

-- ----------------------------
-- Primary Key structure for table ref_status_pengajuan_penjr
-- ----------------------------
ALTER TABLE "public"."ref_status_pengajuan_penjr" ADD CONSTRAINT "ref_status_pengajuan_penjr_pkey" PRIMARY KEY ("kode_status_pengajuan");

-- ----------------------------
-- Primary Key structure for table ref_status_penjaringan
-- ----------------------------
ALTER TABLE "public"."ref_status_penjaringan" ADD CONSTRAINT "ref_status_penjaringan_pkey" PRIMARY KEY ("kode_status_penjaringan");

-- ----------------------------
-- Primary Key structure for table ref_step_verifikasi_evaluasi
-- ----------------------------
ALTER TABLE "public"."ref_step_verifikasi_evaluasi" ADD CONSTRAINT "ref_step_verifikasi_evaluasi_pkey" PRIMARY KEY ("kode_step_verifikasi");

-- ----------------------------
-- Primary Key structure for table ref_subkat_persyaratan
-- ----------------------------
ALTER TABLE "public"."ref_subkat_persyaratan" ADD CONSTRAINT "ref_subkat_persyaratan_pkey" PRIMARY KEY ("kode_subkat");

-- ----------------------------
-- Primary Key structure for table ref_tenaga_ahli_bu
-- ----------------------------
ALTER TABLE "public"."ref_tenaga_ahli_bu" ADD CONSTRAINT "ref_tenaga_ahli_bu_pkey" PRIMARY KEY ("kode_tenaga_ahli");

-- ----------------------------
-- Primary Key structure for table ref_tenaga_ahli_bu_custom
-- ----------------------------
ALTER TABLE "public"."ref_tenaga_ahli_bu_custom" ADD CONSTRAINT "ref_tenaga_ahli_bu_custom_pkey" PRIMARY KEY ("kode_tenaga_ahli_custom");

-- ----------------------------
-- Primary Key structure for table ref_tenaga_pendukung_bu
-- ----------------------------
ALTER TABLE "public"."ref_tenaga_pendukung_bu" ADD CONSTRAINT "ref_tenaga_pendukung_bu_pkey" PRIMARY KEY ("kode_tenaga_pendukung");

-- ----------------------------
-- Primary Key structure for table ref_tenaga_pendukung_bu_custom
-- ----------------------------
ALTER TABLE "public"."ref_tenaga_pendukung_bu_custom" ADD CONSTRAINT "ref_tenaga_pendukung_bu_custom_pkey" PRIMARY KEY ("kode_tenaga_pendukung_custom");

-- ----------------------------
-- Primary Key structure for table ref_tipe_input
-- ----------------------------
ALTER TABLE "public"."ref_tipe_input" ADD CONSTRAINT "ref_tipe_input_pkey" PRIMARY KEY ("tipe_input");

-- ----------------------------
-- Indexes structure for table ref_umum
-- ----------------------------
CREATE INDEX "idx_ref_umum_kode_vendor" ON "public"."ref_umum" USING btree (
  "kode_vendor" "pg_catalog"."int4_ops" ASC NULLS LAST
);

-- ----------------------------
-- Primary Key structure for table ref_umum
-- ----------------------------
ALTER TABLE "public"."ref_umum" ADD CONSTRAINT "ref_umum_pkey" PRIMARY KEY ("kode_umum");

-- ----------------------------
-- Primary Key structure for table ref_v_keluar_dpt
-- ----------------------------
ALTER TABLE "public"."ref_v_keluar_dpt" ADD CONSTRAINT "ref_v_keluar_dpt_pkey" PRIMARY KEY ("kode_v_keluar_dpt");

-- ----------------------------
-- Primary Key structure for table ref_vendor
-- ----------------------------
ALTER TABLE "public"."ref_vendor" ADD CONSTRAINT "ref_vendor_pkey" PRIMARY KEY ("kode_vendor");

-- ----------------------------
-- Uniques structure for table ref_vendor_penandatangan
-- ----------------------------
ALTER TABLE "public"."ref_vendor_penandatangan" ADD CONSTRAINT "kode_vendor_unique" UNIQUE ("kode_vendor");

-- ----------------------------
-- Primary Key structure for table ref_vendor_penandatangan
-- ----------------------------
ALTER TABLE "public"."ref_vendor_penandatangan" ADD CONSTRAINT "ref_vendor_penandatangan_pkey" PRIMARY KEY ("kode_vp");

-- ----------------------------
-- Primary Key structure for table ref_vendor_reg_history
-- ----------------------------
ALTER TABLE "public"."ref_vendor_reg_history" ADD CONSTRAINT "ref_vendor_reg_history_pkey" PRIMARY KEY ("kode_register");

-- ----------------------------
-- Primary Key structure for table ref_vendor_register
-- ----------------------------
ALTER TABLE "public"."ref_vendor_register" ADD CONSTRAINT "ref_vendor_register_pkey" PRIMARY KEY ("kode_register");

-- ----------------------------
-- Primary Key structure for table ref_verif_adm_bu
-- ----------------------------
ALTER TABLE "public"."ref_verif_adm_bu" ADD CONSTRAINT "ref_verif_adm_bu_pkey" PRIMARY KEY ("kode_verif");

-- ----------------------------
-- Primary Key structure for table ref_verif_administrasi_pero
-- ----------------------------
ALTER TABLE "public"."ref_verif_administrasi_pero" ADD CONSTRAINT "ref_verif_administrasi_pero_pkey" PRIMARY KEY ("kode_verif");

-- ----------------------------
-- Primary Key structure for table ref_verif_data_pajak_bu
-- ----------------------------
ALTER TABLE "public"."ref_verif_data_pajak_bu" ADD CONSTRAINT "ref_verif_data_pajak_bu_pkey" PRIMARY KEY ("kode_verif");

-- ----------------------------
-- Primary Key structure for table ref_verif_datadiri
-- ----------------------------
ALTER TABLE "public"."ref_verif_datadiri" ADD CONSTRAINT "ref_verif_datadiri_pkey" PRIMARY KEY ("kode_verif");

-- ----------------------------
-- Primary Key structure for table ref_verif_datadiri_umum
-- ----------------------------
ALTER TABLE "public"."ref_verif_datadiri_umum" ADD CONSTRAINT "ref_verif_datadiri_umum_pkey" PRIMARY KEY ("kode_verif");

-- ----------------------------
-- Primary Key structure for table ref_verif_direksi
-- ----------------------------
ALTER TABLE "public"."ref_verif_direksi" ADD CONSTRAINT "ref_verif_direksi_pkey" PRIMARY KEY ("kode_verif");

-- ----------------------------
-- Primary Key structure for table ref_verif_fasilitas_bu
-- ----------------------------
ALTER TABLE "public"."ref_verif_fasilitas_bu" ADD CONSTRAINT "ref_verif_fasilitas_bu_pkey" PRIMARY KEY ("kode_verif");

-- ----------------------------
-- Primary Key structure for table ref_verif_izin_usaha_bu
-- ----------------------------
ALTER TABLE "public"."ref_verif_izin_usaha_bu" ADD CONSTRAINT "ref_verif_izin_usaha_bu_pkey" PRIMARY KEY ("kode_verif");

-- ----------------------------
-- Primary Key structure for table ref_verif_kantor_bu
-- ----------------------------
ALTER TABLE "public"."ref_verif_kantor_bu" ADD CONSTRAINT "ref_verif_kantor_bu_pkey" PRIMARY KEY ("kode_verif");

-- ----------------------------
-- Primary Key structure for table ref_verif_keuangan_bu
-- ----------------------------
ALTER TABLE "public"."ref_verif_keuangan_bu" ADD CONSTRAINT "ref_verif_keuangan_bu_pkey" PRIMARY KEY ("kode_verif");

-- ----------------------------
-- Primary Key structure for table ref_verif_keuangan_pero
-- ----------------------------
ALTER TABLE "public"."ref_verif_keuangan_pero" ADD CONSTRAINT "ref_verif_keuangan_pero_pkey" PRIMARY KEY ("kode_verif");

-- ----------------------------
-- Primary Key structure for table ref_verif_komisaris
-- ----------------------------
ALTER TABLE "public"."ref_verif_komisaris" ADD CONSTRAINT "ref_verif_komisaris_pkey" PRIMARY KEY ("kode_verif");

-- ----------------------------
-- Primary Key structure for table ref_verif_lan_hukum_bu
-- ----------------------------
ALTER TABLE "public"."ref_verif_lan_hukum_bu" ADD CONSTRAINT "ref_verif_lan_hukum_bu_pkey" PRIMARY KEY ("kode_verif");

-- ----------------------------
-- Primary Key structure for table ref_verif_pengalaman_bu
-- ----------------------------
ALTER TABLE "public"."ref_verif_pengalaman_bu" ADD CONSTRAINT "ref_verif_pengalaman_bu_pkey" PRIMARY KEY ("kode_verif");

-- ----------------------------
-- Primary Key structure for table ref_verif_pengalaman_pero
-- ----------------------------
ALTER TABLE "public"."ref_verif_pengalaman_pero" ADD CONSTRAINT "ref_verif_pengalaman_pero_pkey" PRIMARY KEY ("kode_verif");

-- ----------------------------
-- Primary Key structure for table ref_verif_personalia_pero
-- ----------------------------
ALTER TABLE "public"."ref_verif_personalia_pero" ADD CONSTRAINT "ref_verif_personalia_pero_pkey" PRIMARY KEY ("kode_verif");

-- ----------------------------
-- Primary Key structure for table ref_verif_saham_bu
-- ----------------------------
ALTER TABLE "public"."ref_verif_saham_bu" ADD CONSTRAINT "ref_verif_saham_bu_pkey" PRIMARY KEY ("kode_verif");

-- ----------------------------
-- Primary Key structure for table ref_verif_sertif_pero
-- ----------------------------
ALTER TABLE "public"."ref_verif_sertif_pero" ADD CONSTRAINT "ref_verif_sertif_pero_pkey" PRIMARY KEY ("kode_verif");

-- ----------------------------
-- Primary Key structure for table ref_verif_sertifikat_usaha_bu
-- ----------------------------
ALTER TABLE "public"."ref_verif_sertifikat_usaha_bu" ADD CONSTRAINT "ref_verif_sertifikat_usaha_bu_pkey" PRIMARY KEY ("kode_verif");

-- ----------------------------
-- Primary Key structure for table ref_verif_tenaga_ahli_bu
-- ----------------------------
ALTER TABLE "public"."ref_verif_tenaga_ahli_bu" ADD CONSTRAINT "ref_verif_tenaga_ahli_bu_pkey" PRIMARY KEY ("kode_verif");

-- ----------------------------
-- Primary Key structure for table ref_verif_tenaga_pendukung_bu
-- ----------------------------
ALTER TABLE "public"."ref_verif_tenaga_pendukung_bu" ADD CONSTRAINT "ref_verif_tenaga_pendukung_bu_pkey" PRIMARY KEY ("kode_verif");

-- ----------------------------
-- Primary Key structure for table ref_verif_umum
-- ----------------------------
ALTER TABLE "public"."ref_verif_umum" ADD CONSTRAINT "ref_verif_umum_pkey" PRIMARY KEY ("kode_verif");

-- ----------------------------
-- Primary Key structure for table trx_custom_item
-- ----------------------------
ALTER TABLE "public"."trx_custom_item" ADD CONSTRAINT "trx_custom_item_pkey" PRIMARY KEY ("kode_ci");

-- ----------------------------
-- Primary Key structure for table trx_custom_table
-- ----------------------------
ALTER TABLE "public"."trx_custom_table" ADD CONSTRAINT "trx_custom_table_pk" PRIMARY KEY ("kode_custom_table");

-- ----------------------------
-- Primary Key structure for table trx_izin_kbli_sbu
-- ----------------------------
ALTER TABLE "public"."trx_izin_kbli_sbu" ADD CONSTRAINT "trx_izin_kbli_sbu_pkey" PRIMARY KEY ("kode_trx_kbli");

-- ----------------------------
-- Primary Key structure for table trx_izin_kbli_sbu_custom
-- ----------------------------
ALTER TABLE "public"."trx_izin_kbli_sbu_custom" ADD CONSTRAINT "trx_izin_kbli_sbu_custom_pkey" PRIMARY KEY ("kode_trx_iks_custom");

-- ----------------------------
-- Primary Key structure for table trx_kat_j_vendor
-- ----------------------------
ALTER TABLE "public"."trx_kat_j_vendor" ADD CONSTRAINT "trx_kat_j_vendor_pkey" PRIMARY KEY ("kode_kat_j_vendor");

-- ----------------------------
-- Primary Key structure for table trx_kategori
-- ----------------------------
ALTER TABLE "public"."trx_kategori" ADD CONSTRAINT "trx_kategori_pkey" PRIMARY KEY ("kode_trx_kategori");

-- ----------------------------
-- Primary Key structure for table trx_kbli_custom
-- ----------------------------
ALTER TABLE "public"."trx_kbli_custom" ADD CONSTRAINT "trx_kbli_custom_pkey" PRIMARY KEY ("kode_trx_kbli_custom");

-- ----------------------------
-- Primary Key structure for table trx_kehadiran_verif
-- ----------------------------
ALTER TABLE "public"."trx_kehadiran_verif" ADD CONSTRAINT "trx_kehadiran_verif_pkey" PRIMARY KEY ("kode_kehadiran");

-- ----------------------------
-- Primary Key structure for table trx_ketentuan_umum_khusus
-- ----------------------------
ALTER TABLE "public"."trx_ketentuan_umum_khusus" ADD CONSTRAINT "trx_ketentuan_umum_khusus_pkey" PRIMARY KEY ("kode_kuk");

-- ----------------------------
-- Primary Key structure for table trx_konfirmasi_data_sesuai
-- ----------------------------
ALTER TABLE "public"."trx_konfirmasi_data_sesuai" ADD CONSTRAINT "trx_konfirmasi_data_sesuai_pkey" PRIMARY KEY ("kode_complete");

-- ----------------------------
-- Primary Key structure for table trx_kualifikasi_usaha_penjr
-- ----------------------------
ALTER TABLE "public"."trx_kualifikasi_usaha_penjr" ADD CONSTRAINT "trx_kualifikasi_usaha_penjr_pkey" PRIMARY KEY ("kode_trx");

-- ----------------------------
-- Primary Key structure for table trx_nilai_akhir
-- ----------------------------
ALTER TABLE "public"."trx_nilai_akhir" ADD CONSTRAINT "trx_nilai_akhir_pkey" PRIMARY KEY ("kode_penilaian");

-- ----------------------------
-- Primary Key structure for table trx_penjaringan
-- ----------------------------
ALTER TABLE "public"."trx_penjaringan" ADD CONSTRAINT "trx_penjaringan_pkey" PRIMARY KEY ("kode_penjaringan");

-- ----------------------------
-- Primary Key structure for table trx_tim_teknis_pendukung
-- ----------------------------
ALTER TABLE "public"."trx_tim_teknis_pendukung" ADD CONSTRAINT "trx_tim_teknis_pendukung_pkey" PRIMARY KEY ("kode_tim_teknis_pendukung");

-- ----------------------------
-- Primary Key structure for table trx_undangan_pemeriksaan_keluar_dpt
-- ----------------------------
ALTER TABLE "public"."trx_undangan_pemeriksaan_keluar_dpt" ADD CONSTRAINT "trx_undangan_pemeriksaan_keluar_dpt_pkey" PRIMARY KEY ("kode_undangan");

-- ----------------------------
-- Primary Key structure for table trx_undangan_penjr
-- ----------------------------
ALTER TABLE "public"."trx_undangan_penjr" ADD CONSTRAINT "trx_undangan_penjr_pkey" PRIMARY KEY ("kode_und_penjr");

-- ----------------------------
-- Primary Key structure for table trx_undangan_verif
-- ----------------------------
ALTER TABLE "public"."trx_undangan_verif" ADD CONSTRAINT "trx_undangan_verif_pkey" PRIMARY KEY ("kode_undangan_verif");

-- ----------------------------
-- Primary Key structure for table trx_vendor_penjr
-- ----------------------------
ALTER TABLE "public"."trx_vendor_penjr" ADD CONSTRAINT "trx_vendor_penjr_pkey" PRIMARY KEY ("kode_vendor_penjr");

-- ----------------------------
-- Primary Key structure for table trx_verif_luar_dpt
-- ----------------------------
ALTER TABLE "public"."trx_verif_luar_dpt" ADD CONSTRAINT "trx_verif_luar_dpt_pkey" PRIMARY KEY ("kode_verif_luar_dpt");

-- ----------------------------
-- Primary Key structure for table trx_verifikator_penjr
-- ----------------------------
ALTER TABLE "public"."trx_verifikator_penjr" ADD CONSTRAINT "trx_verifikator_penjr_pkey" PRIMARY KEY ("kode_verifikator_penjr");

-- ----------------------------
-- Foreign Keys structure for table bridging_id_direksi
-- ----------------------------
ALTER TABLE "public"."bridging_id_direksi" ADD CONSTRAINT "bridging_id_direksi_kode_direksi_fkey" FOREIGN KEY ("kode_direksi") REFERENCES "public"."ref_direksi_bu" ("kode_direksi") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- ----------------------------
-- Foreign Keys structure for table ref_adm_bu
-- ----------------------------
ALTER TABLE "public"."ref_adm_bu" ADD CONSTRAINT "ref_adm_bu_kode_vendor_fkey" FOREIGN KEY ("kode_vendor") REFERENCES "public"."ref_vendor" ("kode_vendor") ON DELETE CASCADE ON UPDATE NO ACTION;

-- ----------------------------
-- Foreign Keys structure for table ref_administrasi_pero
-- ----------------------------
ALTER TABLE "public"."ref_administrasi_pero" ADD CONSTRAINT "ref_administrasi_pero_kode_vendor_fkey" FOREIGN KEY ("kode_vendor") REFERENCES "public"."ref_vendor" ("kode_vendor") ON DELETE CASCADE ON UPDATE NO ACTION;

-- ----------------------------
-- Foreign Keys structure for table ref_ambang_batas_penilaian
-- ----------------------------
ALTER TABLE "public"."ref_ambang_batas_penilaian" ADD CONSTRAINT "ref_ambang_batas_penilaian_kode_penjaringan_fkey" FOREIGN KEY ("kode_penjaringan") REFERENCES "public"."trx_penjaringan" ("kode_penjaringan") ON DELETE CASCADE ON UPDATE NO ACTION;

-- ----------------------------
-- Foreign Keys structure for table ref_data_pajak_bu
-- ----------------------------
ALTER TABLE "public"."ref_data_pajak_bu" ADD CONSTRAINT "ref_data_pajak_bu_kode_vendor_fkey" FOREIGN KEY ("kode_vendor") REFERENCES "public"."ref_vendor" ("kode_vendor") ON DELETE CASCADE ON UPDATE NO ACTION;

-- ----------------------------
-- Foreign Keys structure for table ref_datadiri
-- ----------------------------
ALTER TABLE "public"."ref_datadiri" ADD CONSTRAINT "ref_datadiri_kode_vendor_fkey" FOREIGN KEY ("kode_vendor") REFERENCES "public"."ref_vendor" ("kode_vendor") ON DELETE CASCADE ON UPDATE NO ACTION;

-- ----------------------------
-- Foreign Keys structure for table ref_datadiri_umum
-- ----------------------------
ALTER TABLE "public"."ref_datadiri_umum" ADD CONSTRAINT "ref_datadiri_umum_kode_kab_kota_domisili_fkey" FOREIGN KEY ("kode_kab_kota_domisili") REFERENCES "public"."ref_kab_kota" ("kode_kab_kota") ON DELETE CASCADE ON UPDATE NO ACTION;
ALTER TABLE "public"."ref_datadiri_umum" ADD CONSTRAINT "ref_datadiri_umum_kode_kab_kota_ktp_fkey" FOREIGN KEY ("kode_kab_kota_ktp") REFERENCES "public"."ref_kab_kota" ("kode_kab_kota") ON DELETE CASCADE ON UPDATE NO ACTION;
ALTER TABLE "public"."ref_datadiri_umum" ADD CONSTRAINT "ref_datadiri_umum_kode_kualifikasi_usaha_fkey" FOREIGN KEY ("kode_kualifikasi_usaha") REFERENCES "public"."ref_kualifikasi_usaha" ("kode_kualifikasi_usaha") ON DELETE CASCADE ON UPDATE NO ACTION;
ALTER TABLE "public"."ref_datadiri_umum" ADD CONSTRAINT "ref_datadiri_umum_kode_vendor_fkey" FOREIGN KEY ("kode_vendor") REFERENCES "public"."ref_vendor" ("kode_vendor") ON DELETE CASCADE ON UPDATE NO ACTION;

-- ----------------------------
-- Foreign Keys structure for table ref_direksi_bu
-- ----------------------------
ALTER TABLE "public"."ref_direksi_bu" ADD CONSTRAINT "ref_direksi_bu_kode_vendor_fkey" FOREIGN KEY ("kode_vendor") REFERENCES "public"."ref_vendor" ("kode_vendor") ON DELETE CASCADE ON UPDATE NO ACTION;

-- ----------------------------
-- Foreign Keys structure for table ref_direksi_bu_custom
-- ----------------------------
ALTER TABLE "public"."ref_direksi_bu_custom" ADD CONSTRAINT "ref_direksi_bu_custom_kode_direksi_fkey" FOREIGN KEY ("kode_direksi") REFERENCES "public"."ref_direksi_bu" ("kode_direksi") ON DELETE CASCADE ON UPDATE NO ACTION;

-- ----------------------------
-- Foreign Keys structure for table ref_fasilitas_bu
-- ----------------------------
ALTER TABLE "public"."ref_fasilitas_bu" ADD CONSTRAINT "ref_fasilitas_bu_kode_kepemilikan_fkey" FOREIGN KEY ("kode_kepemilikan") REFERENCES "public"."ref_kepemilikan" ("kode_kepemilikan") ON DELETE CASCADE ON UPDATE NO ACTION;
ALTER TABLE "public"."ref_fasilitas_bu" ADD CONSTRAINT "ref_fasilitas_bu_kode_vendor_fkey" FOREIGN KEY ("kode_vendor") REFERENCES "public"."ref_vendor" ("kode_vendor") ON DELETE CASCADE ON UPDATE NO ACTION;

-- ----------------------------
-- Foreign Keys structure for table ref_fasilitas_bu_custom
-- ----------------------------
ALTER TABLE "public"."ref_fasilitas_bu_custom" ADD CONSTRAINT "ref_fasilitas_bu_custom_kode_fasilitas_fkey" FOREIGN KEY ("kode_fasilitas") REFERENCES "public"."ref_fasilitas_bu" ("kode_fasilitas") ON DELETE CASCADE ON UPDATE NO ACTION;

-- ----------------------------
-- Foreign Keys structure for table ref_history_adm_bu
-- ----------------------------
ALTER TABLE "public"."ref_history_adm_bu" ADD CONSTRAINT "ref_history_adm_bu_kode_vendor_fkey" FOREIGN KEY ("kode_vendor") REFERENCES "public"."ref_vendor" ("kode_vendor") ON DELETE CASCADE ON UPDATE NO ACTION;

-- ----------------------------
-- Foreign Keys structure for table ref_history_administrasi_pero
-- ----------------------------
ALTER TABLE "public"."ref_history_administrasi_pero" ADD CONSTRAINT "ref_history_administrasi_pero_kode_vendor_fkey" FOREIGN KEY ("kode_vendor") REFERENCES "public"."ref_vendor" ("kode_vendor") ON DELETE CASCADE ON UPDATE NO ACTION;

-- ----------------------------
-- Foreign Keys structure for table ref_history_data_pajak_bu
-- ----------------------------
ALTER TABLE "public"."ref_history_data_pajak_bu" ADD CONSTRAINT "ref_history_data_pajak_bu_kode_vendor_fkey" FOREIGN KEY ("kode_vendor") REFERENCES "public"."ref_vendor" ("kode_vendor") ON DELETE CASCADE ON UPDATE NO ACTION;

-- ----------------------------
-- Foreign Keys structure for table ref_history_datadiri_umum
-- ----------------------------
ALTER TABLE "public"."ref_history_datadiri_umum" ADD CONSTRAINT "ref_history_datadiri_umum_kode_vendor_fkey" FOREIGN KEY ("kode_vendor") REFERENCES "public"."ref_vendor" ("kode_vendor") ON DELETE CASCADE ON UPDATE NO ACTION;

-- ----------------------------
-- Foreign Keys structure for table ref_history_direksi_bu
-- ----------------------------
ALTER TABLE "public"."ref_history_direksi_bu" ADD CONSTRAINT "ref_history_direksi_bu_kode_vendor_fkey" FOREIGN KEY ("kode_vendor") REFERENCES "public"."ref_vendor" ("kode_vendor") ON DELETE CASCADE ON UPDATE NO ACTION;

-- ----------------------------
-- Foreign Keys structure for table ref_history_fasilitas_bu
-- ----------------------------
ALTER TABLE "public"."ref_history_fasilitas_bu" ADD CONSTRAINT "ref_history_fasilitas_bu_kode_vendor_fkey" FOREIGN KEY ("kode_vendor") REFERENCES "public"."ref_vendor" ("kode_vendor") ON DELETE CASCADE ON UPDATE NO ACTION;

-- ----------------------------
-- Foreign Keys structure for table ref_history_izin_usaha_bu
-- ----------------------------
ALTER TABLE "public"."ref_history_izin_usaha_bu" ADD CONSTRAINT "ref_history_izin_usaha_bu_kode_vendor_fkey" FOREIGN KEY ("kode_vendor") REFERENCES "public"."ref_vendor" ("kode_vendor") ON DELETE CASCADE ON UPDATE NO ACTION;

-- ----------------------------
-- Foreign Keys structure for table ref_history_kantor_bu
-- ----------------------------
ALTER TABLE "public"."ref_history_kantor_bu" ADD CONSTRAINT "ref_history_kantor_bu_kode_vendor_fkey" FOREIGN KEY ("kode_vendor") REFERENCES "public"."ref_vendor" ("kode_vendor") ON DELETE CASCADE ON UPDATE NO ACTION;

-- ----------------------------
-- Foreign Keys structure for table ref_history_keuangan_bu
-- ----------------------------
ALTER TABLE "public"."ref_history_keuangan_bu" ADD CONSTRAINT "ref_history_keuangan_bu_kode_vendor_fkey" FOREIGN KEY ("kode_vendor") REFERENCES "public"."ref_vendor" ("kode_vendor") ON DELETE CASCADE ON UPDATE NO ACTION;

-- ----------------------------
-- Foreign Keys structure for table ref_history_keuangan_pero
-- ----------------------------
ALTER TABLE "public"."ref_history_keuangan_pero" ADD CONSTRAINT "ref_history_keuangan_pero_kode_vendor_fkey" FOREIGN KEY ("kode_vendor") REFERENCES "public"."ref_vendor" ("kode_vendor") ON DELETE CASCADE ON UPDATE NO ACTION;

-- ----------------------------
-- Foreign Keys structure for table ref_history_komisaris_bu
-- ----------------------------
ALTER TABLE "public"."ref_history_komisaris_bu" ADD CONSTRAINT "ref_history_komisaris_bu_kode_vendor_fkey" FOREIGN KEY ("kode_vendor") REFERENCES "public"."ref_vendor" ("kode_vendor") ON DELETE CASCADE ON UPDATE NO ACTION;

-- ----------------------------
-- Foreign Keys structure for table ref_history_lan_hukum_bu
-- ----------------------------
ALTER TABLE "public"."ref_history_lan_hukum_bu" ADD CONSTRAINT "ref_history_lan_hukum_bu_kode_vendor_fkey" FOREIGN KEY ("kode_vendor") REFERENCES "public"."ref_vendor" ("kode_vendor") ON DELETE CASCADE ON UPDATE NO ACTION;

-- ----------------------------
-- Foreign Keys structure for table ref_history_pengalaman_bu
-- ----------------------------
ALTER TABLE "public"."ref_history_pengalaman_bu" ADD CONSTRAINT "ref_history_pengalaman_bu_kode_vendor_fkey" FOREIGN KEY ("kode_vendor") REFERENCES "public"."ref_vendor" ("kode_vendor") ON DELETE CASCADE ON UPDATE NO ACTION;

-- ----------------------------
-- Foreign Keys structure for table ref_history_pengalaman_pero
-- ----------------------------
ALTER TABLE "public"."ref_history_pengalaman_pero" ADD CONSTRAINT "ref_history_pengalaman_pero_kode_vendor_fkey" FOREIGN KEY ("kode_vendor") REFERENCES "public"."ref_vendor" ("kode_vendor") ON DELETE CASCADE ON UPDATE NO ACTION;

-- ----------------------------
-- Foreign Keys structure for table ref_history_pengalaman_ta
-- ----------------------------
ALTER TABLE "public"."ref_history_pengalaman_ta" ADD CONSTRAINT "ref_history_pengalaman_ta_kode_tenaga_ahli_fkey" FOREIGN KEY ("kode_tenaga_ahli") REFERENCES "public"."ref_tenaga_ahli_bu" ("kode_tenaga_ahli") ON DELETE CASCADE ON UPDATE NO ACTION;

-- ----------------------------
-- Foreign Keys structure for table ref_history_pengalaman_tp
-- ----------------------------
ALTER TABLE "public"."ref_history_pengalaman_tp" ADD CONSTRAINT "ref_history_pengalaman_tp_kode_tenaga_pendukung_fkey" FOREIGN KEY ("kode_tenaga_pendukung") REFERENCES "public"."ref_tenaga_pendukung_bu" ("kode_tenaga_pendukung") ON DELETE CASCADE ON UPDATE NO ACTION;

-- ----------------------------
-- Foreign Keys structure for table ref_history_pengurus_bu
-- ----------------------------
ALTER TABLE "public"."ref_history_pengurus_bu" ADD CONSTRAINT "ref_history_pengurus_bu_kode_vendor_fkey" FOREIGN KEY ("kode_vendor") REFERENCES "public"."ref_vendor" ("kode_vendor") ON DELETE CASCADE ON UPDATE NO ACTION;

-- ----------------------------
-- Foreign Keys structure for table ref_history_personalia_pero
-- ----------------------------
ALTER TABLE "public"."ref_history_personalia_pero" ADD CONSTRAINT "ref_history_personalia_pero_kode_vendor_fkey" FOREIGN KEY ("kode_vendor") REFERENCES "public"."ref_vendor" ("kode_vendor") ON DELETE CASCADE ON UPDATE NO ACTION;

-- ----------------------------
-- Foreign Keys structure for table ref_history_saham_bu
-- ----------------------------
ALTER TABLE "public"."ref_history_saham_bu" ADD CONSTRAINT "ref_history_saham_bu_kode_vendor_fkey" FOREIGN KEY ("kode_vendor") REFERENCES "public"."ref_vendor" ("kode_vendor") ON DELETE CASCADE ON UPDATE NO ACTION;

-- ----------------------------
-- Foreign Keys structure for table ref_history_sertif_pero
-- ----------------------------
ALTER TABLE "public"."ref_history_sertif_pero" ADD CONSTRAINT "ref_history_sertif_pero_kode_vendor_fkey" FOREIGN KEY ("kode_vendor") REFERENCES "public"."ref_vendor" ("kode_vendor") ON DELETE CASCADE ON UPDATE NO ACTION;

-- ----------------------------
-- Foreign Keys structure for table ref_history_sertif_ta
-- ----------------------------
ALTER TABLE "public"."ref_history_sertif_ta" ADD CONSTRAINT "ref_history_sertif_ta_kode_tenaga_ahli_fkey" FOREIGN KEY ("kode_tenaga_ahli") REFERENCES "public"."ref_tenaga_ahli_bu" ("kode_tenaga_ahli") ON DELETE CASCADE ON UPDATE NO ACTION;

-- ----------------------------
-- Foreign Keys structure for table ref_history_sertif_tp
-- ----------------------------
ALTER TABLE "public"."ref_history_sertif_tp" ADD CONSTRAINT "ref_history_sertif_tp_kode_tenaga_pendukung_fkey" FOREIGN KEY ("kode_tenaga_pendukung") REFERENCES "public"."ref_tenaga_pendukung_bu" ("kode_tenaga_pendukung") ON DELETE CASCADE ON UPDATE NO ACTION;

-- ----------------------------
-- Foreign Keys structure for table ref_history_sertifikat_usaha_bu
-- ----------------------------
ALTER TABLE "public"."ref_history_sertifikat_usaha_bu" ADD CONSTRAINT "ref_history_sertifikat_usaha_bu_kode_vendor_fkey" FOREIGN KEY ("kode_vendor") REFERENCES "public"."ref_vendor" ("kode_vendor") ON DELETE CASCADE ON UPDATE NO ACTION;

-- ----------------------------
-- Foreign Keys structure for table ref_history_tenaga_ahli_bu
-- ----------------------------
ALTER TABLE "public"."ref_history_tenaga_ahli_bu" ADD CONSTRAINT "ref_history_tenaga_ahli_bu_kode_vendor_fkey" FOREIGN KEY ("kode_vendor") REFERENCES "public"."ref_vendor" ("kode_vendor") ON DELETE CASCADE ON UPDATE NO ACTION;

-- ----------------------------
-- Foreign Keys structure for table ref_history_tenaga_pendukung_bu
-- ----------------------------
ALTER TABLE "public"."ref_history_tenaga_pendukung_bu" ADD CONSTRAINT "ref_history_tenaga_pendukung_bu_kode_vendor_fkey" FOREIGN KEY ("kode_vendor") REFERENCES "public"."ref_vendor" ("kode_vendor") ON DELETE CASCADE ON UPDATE NO ACTION;

-- ----------------------------
-- Foreign Keys structure for table ref_history_umum
-- ----------------------------
ALTER TABLE "public"."ref_history_umum" ADD CONSTRAINT "ref_history_umum_kode_vendor_fkey" FOREIGN KEY ("kode_vendor") REFERENCES "public"."ref_vendor" ("kode_vendor") ON DELETE CASCADE ON UPDATE NO ACTION;

-- ----------------------------
-- Foreign Keys structure for table ref_history_vendor
-- ----------------------------
ALTER TABLE "public"."ref_history_vendor" ADD CONSTRAINT "ref_history_vendor_kode_vendor_fkey" FOREIGN KEY ("kode_vendor") REFERENCES "public"."ref_vendor" ("kode_vendor") ON DELETE CASCADE ON UPDATE NO ACTION;

-- ----------------------------
-- Foreign Keys structure for table ref_item_tanya
-- ----------------------------
ALTER TABLE "public"."ref_item_tanya" ADD CONSTRAINT "ref_item_tanya_kode_kat_item_tanya_fkey" FOREIGN KEY ("kode_kat_item_tanya") REFERENCES "public"."ref_kat_item_tanya" ("kode_kat_item_tanya") ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE "public"."ref_item_tanya" ADD CONSTRAINT "ref_item_tanya_kode_penjaringan_fkey" FOREIGN KEY ("kode_penjaringan") REFERENCES "public"."trx_penjaringan" ("kode_penjaringan") ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE "public"."ref_item_tanya" ADD CONSTRAINT "ref_item_tanya_tipe_input_fkey" FOREIGN KEY ("tipe_input") REFERENCES "public"."ref_tipe_input" ("tipe_input") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- ----------------------------
-- Foreign Keys structure for table ref_item_tanya_tpl
-- ----------------------------
ALTER TABLE "public"."ref_item_tanya_tpl" ADD CONSTRAINT "ref_item_tanya_tpl_kode_kat_item_tanya_fkey" FOREIGN KEY ("kode_kat_item_tanya") REFERENCES "public"."ref_kat_item_tanya" ("kode_kat_item_tanya") ON DELETE CASCADE ON UPDATE NO ACTION;
ALTER TABLE "public"."ref_item_tanya_tpl" ADD CONSTRAINT "ref_item_tanya_tpl_tipe_input_fkey" FOREIGN KEY ("tipe_input") REFERENCES "public"."ref_tipe_input" ("tipe_input") ON DELETE CASCADE ON UPDATE NO ACTION;

-- ----------------------------
-- Foreign Keys structure for table ref_izin_usaha_bu
-- ----------------------------
ALTER TABLE "public"."ref_izin_usaha_bu" ADD CONSTRAINT "ref_izin_usaha_bu_kode_vendor_fkey" FOREIGN KEY ("kode_vendor") REFERENCES "public"."ref_vendor" ("kode_vendor") ON DELETE CASCADE ON UPDATE NO ACTION;

-- ----------------------------
-- Foreign Keys structure for table ref_izin_usaha_bu_custom
-- ----------------------------
ALTER TABLE "public"."ref_izin_usaha_bu_custom" ADD CONSTRAINT "ref_izin_usaha_bu_custom_kode_izin_usaha_fkey" FOREIGN KEY ("kode_izin_usaha") REFERENCES "public"."ref_izin_usaha_bu" ("kode_izin_usaha") ON DELETE CASCADE ON UPDATE NO ACTION;

-- ----------------------------
-- Foreign Keys structure for table ref_kantor_bu
-- ----------------------------
ALTER TABLE "public"."ref_kantor_bu" ADD CONSTRAINT "ref_kantor_bu_kode_kepemilikan_fkey" FOREIGN KEY ("kode_kepemilikan") REFERENCES "public"."ref_kepemilikan" ("kode_kepemilikan") ON DELETE CASCADE ON UPDATE NO ACTION;
ALTER TABLE "public"."ref_kantor_bu" ADD CONSTRAINT "ref_kantor_bu_kode_kondisi_fkey" FOREIGN KEY ("kode_kondisi") REFERENCES "public"."ref_kondisi" ("kode_kondisi") ON DELETE CASCADE ON UPDATE NO ACTION;
ALTER TABLE "public"."ref_kantor_bu" ADD CONSTRAINT "ref_kantor_bu_kode_vendor_fkey" FOREIGN KEY ("kode_vendor") REFERENCES "public"."ref_vendor" ("kode_vendor") ON DELETE CASCADE ON UPDATE NO ACTION;

-- ----------------------------
-- Foreign Keys structure for table ref_kantor_bu_custom
-- ----------------------------
ALTER TABLE "public"."ref_kantor_bu_custom" ADD CONSTRAINT "ref_kantor_bu_custom_kode_kantor_fkey" FOREIGN KEY ("kode_kantor") REFERENCES "public"."ref_kantor_bu" ("kode_kantor") ON DELETE CASCADE ON UPDATE NO ACTION;

-- ----------------------------
-- Foreign Keys structure for table ref_kat_item_tanya
-- ----------------------------
ALTER TABLE "public"."ref_kat_item_tanya" ADD CONSTRAINT "ref_kat_item_tanya_kode_subkat_fkey" FOREIGN KEY ("kode_subkat") REFERENCES "public"."ref_subkat_persyaratan" ("kode_subkat") ON DELETE CASCADE ON UPDATE NO ACTION;

-- ----------------------------
-- Foreign Keys structure for table ref_keuangan_bu
-- ----------------------------
ALTER TABLE "public"."ref_keuangan_bu" ADD CONSTRAINT "ref_keuangan_bu_kode_vendor_fkey" FOREIGN KEY ("kode_vendor") REFERENCES "public"."ref_vendor" ("kode_vendor") ON DELETE CASCADE ON UPDATE NO ACTION;

-- ----------------------------
-- Foreign Keys structure for table ref_keuangan_pero
-- ----------------------------
ALTER TABLE "public"."ref_keuangan_pero" ADD CONSTRAINT "ref_keuangan_pero_kode_vendor_fkey" FOREIGN KEY ("kode_vendor") REFERENCES "public"."ref_vendor" ("kode_vendor") ON DELETE CASCADE ON UPDATE NO ACTION;

-- ----------------------------
-- Foreign Keys structure for table ref_komisaris_bu
-- ----------------------------
ALTER TABLE "public"."ref_komisaris_bu" ADD CONSTRAINT "ref_komisaris_bu_kode_vendor_fkey" FOREIGN KEY ("kode_vendor") REFERENCES "public"."ref_vendor" ("kode_vendor") ON DELETE CASCADE ON UPDATE NO ACTION;

-- ----------------------------
-- Foreign Keys structure for table ref_komisaris_bu_custom
-- ----------------------------
ALTER TABLE "public"."ref_komisaris_bu_custom" ADD CONSTRAINT "ref_komisaris_bu_custom_kode_komisaris_fkey" FOREIGN KEY ("kode_komisaris") REFERENCES "public"."ref_komisaris_bu" ("kode_komisaris") ON DELETE CASCADE ON UPDATE NO ACTION;

-- ----------------------------
-- Foreign Keys structure for table ref_lan_hukum_bu
-- ----------------------------
ALTER TABLE "public"."ref_lan_hukum_bu" ADD CONSTRAINT "ref_lan_hukum_bu_kode_vendor_fkey" FOREIGN KEY ("kode_vendor") REFERENCES "public"."ref_vendor" ("kode_vendor") ON DELETE CASCADE ON UPDATE NO ACTION;

-- ----------------------------
-- Foreign Keys structure for table ref_pakta_integritas
-- ----------------------------
ALTER TABLE "public"."ref_pakta_integritas" ADD CONSTRAINT "ref_pakta_integritas_kode_vendor_fkey" FOREIGN KEY ("kode_vendor") REFERENCES "public"."ref_vendor" ("kode_vendor") ON DELETE CASCADE ON UPDATE NO ACTION;

-- ----------------------------
-- Foreign Keys structure for table ref_penanggung_jwb
-- ----------------------------
ALTER TABLE "public"."ref_penanggung_jwb" ADD CONSTRAINT "ref_penanggung_jwb_kode_vendor_fkey" FOREIGN KEY ("kode_vendor") REFERENCES "public"."ref_vendor" ("kode_vendor") ON DELETE CASCADE ON UPDATE NO ACTION;

-- ----------------------------
-- Foreign Keys structure for table ref_pengalaman_bu
-- ----------------------------
ALTER TABLE "public"."ref_pengalaman_bu" ADD CONSTRAINT "ref_pengalaman_bu_kode_vendor_fkey" FOREIGN KEY ("kode_vendor") REFERENCES "public"."ref_vendor" ("kode_vendor") ON DELETE CASCADE ON UPDATE NO ACTION;

-- ----------------------------
-- Foreign Keys structure for table ref_pengalaman_bu_custom
-- ----------------------------
ALTER TABLE "public"."ref_pengalaman_bu_custom" ADD CONSTRAINT "ref_pengalaman_bu_custom_kode_pengalaman_bu_fkey" FOREIGN KEY ("kode_pengalaman_bu") REFERENCES "public"."ref_pengalaman_bu" ("kode_pengalaman_bu") ON DELETE CASCADE ON UPDATE NO ACTION;

-- ----------------------------
-- Foreign Keys structure for table ref_pengalaman_pero
-- ----------------------------
ALTER TABLE "public"."ref_pengalaman_pero" ADD CONSTRAINT "ref_pengalaman_pero_kode_vendor_fkey" FOREIGN KEY ("kode_vendor") REFERENCES "public"."ref_vendor" ("kode_vendor") ON DELETE CASCADE ON UPDATE NO ACTION;

-- ----------------------------
-- Foreign Keys structure for table ref_pengalaman_pero_custom
-- ----------------------------
ALTER TABLE "public"."ref_pengalaman_pero_custom" ADD CONSTRAINT "ref_pengalaman_pero_custom_kode_pengalaman_fkey" FOREIGN KEY ("kode_pengalaman") REFERENCES "public"."ref_pengalaman_pero" ("kode_pengalaman") ON DELETE CASCADE ON UPDATE NO ACTION;
ALTER TABLE "public"."ref_pengalaman_pero_custom" ADD CONSTRAINT "ref_pengalaman_pero_custom_kode_penjaringan_fkey" FOREIGN KEY ("kode_penjaringan") REFERENCES "public"."trx_penjaringan" ("kode_penjaringan") ON DELETE CASCADE ON UPDATE NO ACTION;
ALTER TABLE "public"."ref_pengalaman_pero_custom" ADD CONSTRAINT "ref_pengalaman_pero_custom_kode_vendor_fkey" FOREIGN KEY ("kode_vendor") REFERENCES "public"."ref_vendor" ("kode_vendor") ON DELETE CASCADE ON UPDATE NO ACTION;

-- ----------------------------
-- Foreign Keys structure for table ref_pengalaman_ta
-- ----------------------------
ALTER TABLE "public"."ref_pengalaman_ta" ADD CONSTRAINT "ref_pengalaman_ta_kode_tenaga_ahli_fkey" FOREIGN KEY ("kode_tenaga_ahli") REFERENCES "public"."ref_tenaga_ahli_bu" ("kode_tenaga_ahli") ON DELETE CASCADE ON UPDATE NO ACTION;

-- ----------------------------
-- Foreign Keys structure for table ref_pengalaman_ta_custom
-- ----------------------------
ALTER TABLE "public"."ref_pengalaman_ta_custom" ADD CONSTRAINT "ref_pengalaman_ta_custom_kode_pengalaman_ta_fkey" FOREIGN KEY ("kode_pengalaman_ta") REFERENCES "public"."ref_pengalaman_ta" ("kode_pengalaman_ta") ON DELETE CASCADE ON UPDATE NO ACTION;

-- ----------------------------
-- Foreign Keys structure for table ref_pengalaman_tp
-- ----------------------------
ALTER TABLE "public"."ref_pengalaman_tp" ADD CONSTRAINT "ref_pengalaman_tp_kode_tenaga_pendukung_fkey" FOREIGN KEY ("kode_tenaga_pendukung") REFERENCES "public"."ref_tenaga_pendukung_bu" ("kode_tenaga_pendukung") ON DELETE CASCADE ON UPDATE NO ACTION;

-- ----------------------------
-- Foreign Keys structure for table ref_pengalaman_tp_custom
-- ----------------------------
ALTER TABLE "public"."ref_pengalaman_tp_custom" ADD CONSTRAINT "ref_pengalaman_tp_custom_kode_pengalaman_tp_fkey" FOREIGN KEY ("kode_pengalaman_tp") REFERENCES "public"."ref_pengalaman_tp" ("kode_pengalaman_tp") ON DELETE CASCADE ON UPDATE NO ACTION;

-- ----------------------------
-- Foreign Keys structure for table ref_pengurus_bu
-- ----------------------------
ALTER TABLE "public"."ref_pengurus_bu" ADD CONSTRAINT "ref_pengurus_bu_kode_vendor_fkey" FOREIGN KEY ("kode_vendor") REFERENCES "public"."ref_vendor" ("kode_vendor") ON DELETE CASCADE ON UPDATE NO ACTION;

-- ----------------------------
-- Foreign Keys structure for table ref_pengurus_bu_verif
-- ----------------------------
ALTER TABLE "public"."ref_pengurus_bu_verif" ADD CONSTRAINT "ref_pengurus_bu_verif_kode_pengurus_bu_fkey" FOREIGN KEY ("kode_pengurus_bu") REFERENCES "public"."ref_pengurus_bu" ("kode_pengurus_bu") ON DELETE CASCADE ON UPDATE NO ACTION;
ALTER TABLE "public"."ref_pengurus_bu_verif" ADD CONSTRAINT "ref_pengurus_bu_verif_kode_vendor_penjr_fkey" FOREIGN KEY ("kode_vendor_penjr") REFERENCES "public"."trx_vendor_penjr" ("kode_vendor_penjr") ON DELETE CASCADE ON UPDATE NO ACTION;

-- ----------------------------
-- Foreign Keys structure for table ref_persentase_penilaian
-- ----------------------------
ALTER TABLE "public"."ref_persentase_penilaian" ADD CONSTRAINT "ref_persentase_penilaian_kode_penjaringan_fkey" FOREIGN KEY ("kode_penjaringan") REFERENCES "public"."trx_penjaringan" ("kode_penjaringan") ON DELETE CASCADE ON UPDATE NO ACTION;

-- ----------------------------
-- Foreign Keys structure for table ref_persentase_penilaian_tpl
-- ----------------------------
ALTER TABLE "public"."ref_persentase_penilaian_tpl" ADD CONSTRAINT "ref_persentase_penilaian_tpl_kode_jenis_vendor_fkey" FOREIGN KEY ("kode_jenis_vendor") REFERENCES "public"."ref_jenis_vendor" ("kode_jenis_vendor") ON DELETE CASCADE ON UPDATE NO ACTION;

-- ----------------------------
-- Foreign Keys structure for table ref_personalia_pero
-- ----------------------------
ALTER TABLE "public"."ref_personalia_pero" ADD CONSTRAINT "ref_personalia_pero_kode_jenjang_pendidikan_fkey" FOREIGN KEY ("kode_jenjang_pendidikan") REFERENCES "public"."ref_jenjang_pendidikan" ("kode_jenjang_pendidikan") ON DELETE CASCADE ON UPDATE NO ACTION;
ALTER TABLE "public"."ref_personalia_pero" ADD CONSTRAINT "ref_personalia_pero_kode_vendor_fkey" FOREIGN KEY ("kode_vendor") REFERENCES "public"."ref_vendor" ("kode_vendor") ON DELETE CASCADE ON UPDATE NO ACTION;

-- ----------------------------
-- Foreign Keys structure for table ref_saham_bu
-- ----------------------------
ALTER TABLE "public"."ref_saham_bu" ADD CONSTRAINT "ref_saham_bu_kode_vendor_fkey" FOREIGN KEY ("kode_vendor") REFERENCES "public"."ref_vendor" ("kode_vendor") ON DELETE CASCADE ON UPDATE NO ACTION;

-- ----------------------------
-- Foreign Keys structure for table ref_saham_bu_custom
-- ----------------------------
ALTER TABLE "public"."ref_saham_bu_custom" ADD CONSTRAINT "ref_saham_bu_custom_kode_saham_fkey" FOREIGN KEY ("kode_saham") REFERENCES "public"."ref_saham_bu" ("kode_saham") ON DELETE CASCADE ON UPDATE NO ACTION;

-- ----------------------------
-- Foreign Keys structure for table ref_sertif_pero
-- ----------------------------
ALTER TABLE "public"."ref_sertif_pero" ADD CONSTRAINT "ref_sertif_pero_kode_vendor_fkey" FOREIGN KEY ("kode_vendor") REFERENCES "public"."ref_vendor" ("kode_vendor") ON DELETE CASCADE ON UPDATE NO ACTION;

-- ----------------------------
-- Foreign Keys structure for table ref_sertif_pero_custom
-- ----------------------------
ALTER TABLE "public"."ref_sertif_pero_custom" ADD CONSTRAINT "ref_sertif_pero_custom_kode_penjaringan_fkey" FOREIGN KEY ("kode_penjaringan") REFERENCES "public"."trx_penjaringan" ("kode_penjaringan") ON DELETE CASCADE ON UPDATE NO ACTION;
ALTER TABLE "public"."ref_sertif_pero_custom" ADD CONSTRAINT "ref_sertif_pero_custom_kode_sertif_fkey" FOREIGN KEY ("kode_sertif") REFERENCES "public"."ref_sertif_pero" ("kode_sertif") ON DELETE CASCADE ON UPDATE NO ACTION;
ALTER TABLE "public"."ref_sertif_pero_custom" ADD CONSTRAINT "ref_sertif_pero_custom_kode_vendor_fkey" FOREIGN KEY ("kode_vendor") REFERENCES "public"."ref_vendor" ("kode_vendor") ON DELETE CASCADE ON UPDATE NO ACTION;

-- ----------------------------
-- Foreign Keys structure for table ref_sertif_ta
-- ----------------------------
ALTER TABLE "public"."ref_sertif_ta" ADD CONSTRAINT "ref_sertif_ta_kode_tenaga_ahli_fkey" FOREIGN KEY ("kode_tenaga_ahli") REFERENCES "public"."ref_tenaga_ahli_bu" ("kode_tenaga_ahli") ON DELETE CASCADE ON UPDATE NO ACTION;

-- ----------------------------
-- Foreign Keys structure for table ref_sertif_ta_custom
-- ----------------------------
ALTER TABLE "public"."ref_sertif_ta_custom" ADD CONSTRAINT "ref_sertif_ta_custom_kode_sertif_ta_fkey" FOREIGN KEY ("kode_sertif_ta") REFERENCES "public"."ref_sertif_ta" ("kode_sertif_ta") ON DELETE CASCADE ON UPDATE NO ACTION;

-- ----------------------------
-- Foreign Keys structure for table ref_sertif_tp
-- ----------------------------
ALTER TABLE "public"."ref_sertif_tp" ADD CONSTRAINT "ref_sertif_tp_kode_tenaga_pendukung_fkey" FOREIGN KEY ("kode_tenaga_pendukung") REFERENCES "public"."ref_tenaga_pendukung_bu" ("kode_tenaga_pendukung") ON DELETE CASCADE ON UPDATE NO ACTION;

-- ----------------------------
-- Foreign Keys structure for table ref_sertif_tp_custom
-- ----------------------------
ALTER TABLE "public"."ref_sertif_tp_custom" ADD CONSTRAINT "ref_sertif_tp_custom_kode_sertif_tp_fkey" FOREIGN KEY ("kode_sertif_tp") REFERENCES "public"."ref_sertif_tp" ("kode_sertif_tp") ON DELETE CASCADE ON UPDATE NO ACTION;

-- ----------------------------
-- Foreign Keys structure for table ref_sertifikat_usaha_bu_custom
-- ----------------------------
ALTER TABLE "public"."ref_sertifikat_usaha_bu_custom" ADD CONSTRAINT "ref_sertifikat_usaha_bu_custom_kode_sertifikat_usaha_fkey" FOREIGN KEY ("kode_sertifikat_usaha") REFERENCES "public"."ref_sertifikat_usaha_bu" ("kode_sertifikat_usaha") ON DELETE CASCADE ON UPDATE NO ACTION;

-- ----------------------------
-- Foreign Keys structure for table ref_subkat_persyaratan
-- ----------------------------
ALTER TABLE "public"."ref_subkat_persyaratan" ADD CONSTRAINT "ref_subkat_persyaratan_kode_kat_persyaratan_fkey" FOREIGN KEY ("kode_kat_persyaratan") REFERENCES "public"."ref_kat_persyaratan" ("kode_kat_persyaratan") ON DELETE CASCADE ON UPDATE NO ACTION;

-- ----------------------------
-- Foreign Keys structure for table ref_tenaga_ahli_bu
-- ----------------------------
ALTER TABLE "public"."ref_tenaga_ahli_bu" ADD CONSTRAINT "ref_tenaga_ahli_bu_kode_jenjang_pendidikan_fkey" FOREIGN KEY ("kode_jenjang_pendidikan") REFERENCES "public"."ref_jenjang_pendidikan" ("kode_jenjang_pendidikan") ON DELETE CASCADE ON UPDATE NO ACTION;
ALTER TABLE "public"."ref_tenaga_ahli_bu" ADD CONSTRAINT "ref_tenaga_ahli_bu_kode_vendor_fkey" FOREIGN KEY ("kode_vendor") REFERENCES "public"."ref_vendor" ("kode_vendor") ON DELETE CASCADE ON UPDATE NO ACTION;

-- ----------------------------
-- Foreign Keys structure for table ref_tenaga_ahli_bu_custom
-- ----------------------------
ALTER TABLE "public"."ref_tenaga_ahli_bu_custom" ADD CONSTRAINT "ref_tenaga_ahli_bu_custom_kode_tenaga_ahli_fkey" FOREIGN KEY ("kode_tenaga_ahli") REFERENCES "public"."ref_tenaga_ahli_bu" ("kode_tenaga_ahli") ON DELETE CASCADE ON UPDATE NO ACTION;

-- ----------------------------
-- Foreign Keys structure for table ref_tenaga_pendukung_bu
-- ----------------------------
ALTER TABLE "public"."ref_tenaga_pendukung_bu" ADD CONSTRAINT "ref_tenaga_pendukung_bu_kode_vendor_fkey" FOREIGN KEY ("kode_vendor") REFERENCES "public"."ref_vendor" ("kode_vendor") ON DELETE CASCADE ON UPDATE NO ACTION;

-- ----------------------------
-- Foreign Keys structure for table ref_tenaga_pendukung_bu_custom
-- ----------------------------
ALTER TABLE "public"."ref_tenaga_pendukung_bu_custom" ADD CONSTRAINT "ref_tenaga_pendukung_bu_custom_kode_tenaga_pendukung_fkey" FOREIGN KEY ("kode_tenaga_pendukung") REFERENCES "public"."ref_tenaga_pendukung_bu" ("kode_tenaga_pendukung") ON DELETE CASCADE ON UPDATE NO ACTION;

-- ----------------------------
-- Foreign Keys structure for table ref_umum
-- ----------------------------
ALTER TABLE "public"."ref_umum" ADD CONSTRAINT "ref_umum_kode_vendor_fkey" FOREIGN KEY ("kode_vendor") REFERENCES "public"."ref_vendor" ("kode_vendor") ON DELETE CASCADE ON UPDATE NO ACTION;

-- ----------------------------
-- Foreign Keys structure for table ref_v_keluar_dpt
-- ----------------------------
ALTER TABLE "public"."ref_v_keluar_dpt" ADD CONSTRAINT "ref_v_keluar_dpt_kode_sanksi_vendor_fkey" FOREIGN KEY ("kode_sanksi_vendor") REFERENCES "public"."ref_sanksi_vendor" ("kode_sanksi_vendor") ON DELETE CASCADE ON UPDATE NO ACTION;
ALTER TABLE "public"."ref_v_keluar_dpt" ADD CONSTRAINT "ref_v_keluar_dpt_kode_status_keluar_dpt_fkey" FOREIGN KEY ("kode_status_keluar_dpt") REFERENCES "public"."ref_status_keluar_dpt" ("kode_status_keluar_dpt") ON DELETE CASCADE ON UPDATE NO ACTION;
ALTER TABLE "public"."ref_v_keluar_dpt" ADD CONSTRAINT "ref_v_keluar_dpt_kode_vendor_fkey" FOREIGN KEY ("kode_vendor") REFERENCES "public"."ref_vendor" ("kode_vendor") ON DELETE CASCADE ON UPDATE NO ACTION;

-- ----------------------------
-- Foreign Keys structure for table ref_vendor
-- ----------------------------
ALTER TABLE "public"."ref_vendor" ADD CONSTRAINT "ref_vendor_kode_jenis_vendor_fkey" FOREIGN KEY ("kode_jenis_vendor") REFERENCES "public"."ref_jenis_vendor" ("kode_jenis_vendor") ON DELETE CASCADE ON UPDATE NO ACTION;

-- ----------------------------
-- Foreign Keys structure for table ref_vendor_reg_history
-- ----------------------------
ALTER TABLE "public"."ref_vendor_reg_history" ADD CONSTRAINT "ref_vendor_reg_history_kode_vendor_fkey" FOREIGN KEY ("kode_vendor") REFERENCES "public"."ref_vendor" ("kode_vendor") ON DELETE CASCADE ON UPDATE NO ACTION;

-- ----------------------------
-- Foreign Keys structure for table ref_vendor_register
-- ----------------------------
ALTER TABLE "public"."ref_vendor_register" ADD CONSTRAINT "ref_vendor_register_kode_vendor_fkey" FOREIGN KEY ("kode_vendor") REFERENCES "public"."ref_vendor" ("kode_vendor") ON DELETE CASCADE ON UPDATE NO ACTION;

-- ----------------------------
-- Foreign Keys structure for table ref_verif_adm_bu
-- ----------------------------
ALTER TABLE "public"."ref_verif_adm_bu" ADD CONSTRAINT "ref_verif_adm_bu_kode_adm_bu_fkey" FOREIGN KEY ("kode_adm_bu") REFERENCES "public"."ref_adm_bu" ("kode_adm_bu") ON DELETE CASCADE ON UPDATE NO ACTION;
ALTER TABLE "public"."ref_verif_adm_bu" ADD CONSTRAINT "ref_verif_adm_bu_kode_vendor_penjr_fkey" FOREIGN KEY ("kode_vendor_penjr") REFERENCES "public"."trx_vendor_penjr" ("kode_vendor_penjr") ON DELETE CASCADE ON UPDATE NO ACTION;

-- ----------------------------
-- Foreign Keys structure for table ref_verif_administrasi_pero
-- ----------------------------
ALTER TABLE "public"."ref_verif_administrasi_pero" ADD CONSTRAINT "ref_verif_administrasi_pero_kode_vendor_penjr_fkey" FOREIGN KEY ("kode_vendor_penjr") REFERENCES "public"."trx_vendor_penjr" ("kode_vendor_penjr") ON DELETE CASCADE ON UPDATE NO ACTION;

-- ----------------------------
-- Foreign Keys structure for table ref_verif_data_pajak_bu
-- ----------------------------
ALTER TABLE "public"."ref_verif_data_pajak_bu" ADD CONSTRAINT "ref_verif_data_pajak_bu_kode_data_pajak_fkey" FOREIGN KEY ("kode_data_pajak") REFERENCES "public"."ref_data_pajak_bu" ("kode_data_pajak") ON DELETE CASCADE ON UPDATE NO ACTION;
ALTER TABLE "public"."ref_verif_data_pajak_bu" ADD CONSTRAINT "ref_verif_data_pajak_bu_kode_vendor_penjr_fkey" FOREIGN KEY ("kode_vendor_penjr") REFERENCES "public"."trx_vendor_penjr" ("kode_vendor_penjr") ON DELETE CASCADE ON UPDATE NO ACTION;

-- ----------------------------
-- Foreign Keys structure for table ref_verif_datadiri_umum
-- ----------------------------
ALTER TABLE "public"."ref_verif_datadiri_umum" ADD CONSTRAINT "ref_verif_datadiri_umum_kode_datadiri_umum_fkey" FOREIGN KEY ("kode_datadiri_umum") REFERENCES "public"."ref_datadiri_umum" ("kode_datadiri_umum") ON DELETE CASCADE ON UPDATE NO ACTION;

-- ----------------------------
-- Foreign Keys structure for table ref_verif_direksi
-- ----------------------------
ALTER TABLE "public"."ref_verif_direksi" ADD CONSTRAINT "ref_verif_direksi_kode_direksi_custom_fkey" FOREIGN KEY ("kode_direksi_custom") REFERENCES "public"."ref_direksi_bu_custom" ("kode_direksi_custom") ON DELETE CASCADE ON UPDATE NO ACTION;
ALTER TABLE "public"."ref_verif_direksi" ADD CONSTRAINT "ref_verif_direksi_kode_vendor_penjr_fkey" FOREIGN KEY ("kode_vendor_penjr") REFERENCES "public"."trx_vendor_penjr" ("kode_vendor_penjr") ON DELETE CASCADE ON UPDATE NO ACTION;

-- ----------------------------
-- Foreign Keys structure for table ref_verif_fasilitas_bu
-- ----------------------------
ALTER TABLE "public"."ref_verif_fasilitas_bu" ADD CONSTRAINT "ref_verif_fasilitas_bu_kode_fasilitas_custom_fkey" FOREIGN KEY ("kode_fasilitas_custom") REFERENCES "public"."ref_fasilitas_bu_custom" ("kode_fasilitas_custom") ON DELETE CASCADE ON UPDATE NO ACTION;
ALTER TABLE "public"."ref_verif_fasilitas_bu" ADD CONSTRAINT "ref_verif_fasilitas_bu_kode_vendor_penjr_fkey" FOREIGN KEY ("kode_vendor_penjr") REFERENCES "public"."trx_vendor_penjr" ("kode_vendor_penjr") ON DELETE CASCADE ON UPDATE NO ACTION;

-- ----------------------------
-- Foreign Keys structure for table ref_verif_izin_usaha_bu
-- ----------------------------
ALTER TABLE "public"."ref_verif_izin_usaha_bu" ADD CONSTRAINT "ref_verif_izin_usaha_bu_kode_izin_usaha_custom_fkey" FOREIGN KEY ("kode_izin_usaha_custom") REFERENCES "public"."ref_izin_usaha_bu_custom" ("kode_izin_usaha_custom") ON DELETE CASCADE ON UPDATE NO ACTION;
ALTER TABLE "public"."ref_verif_izin_usaha_bu" ADD CONSTRAINT "ref_verif_izin_usaha_bu_kode_vendor_penjr_fkey" FOREIGN KEY ("kode_vendor_penjr") REFERENCES "public"."trx_vendor_penjr" ("kode_vendor_penjr") ON DELETE CASCADE ON UPDATE NO ACTION;

-- ----------------------------
-- Foreign Keys structure for table ref_verif_kantor_bu
-- ----------------------------
ALTER TABLE "public"."ref_verif_kantor_bu" ADD CONSTRAINT "ref_verif_kantor_bu_kode_kantor_custom_fkey" FOREIGN KEY ("kode_kantor_custom") REFERENCES "public"."ref_kantor_bu_custom" ("kode_kantor_custom") ON DELETE CASCADE ON UPDATE NO ACTION;
ALTER TABLE "public"."ref_verif_kantor_bu" ADD CONSTRAINT "ref_verif_kantor_bu_kode_vendor_penjr_fkey" FOREIGN KEY ("kode_vendor_penjr") REFERENCES "public"."trx_vendor_penjr" ("kode_vendor_penjr") ON DELETE CASCADE ON UPDATE NO ACTION;

-- ----------------------------
-- Foreign Keys structure for table ref_verif_keuangan_bu
-- ----------------------------
ALTER TABLE "public"."ref_verif_keuangan_bu" ADD CONSTRAINT "ref_verif_keuangan_bu_kode_keuangan_fkey" FOREIGN KEY ("kode_keuangan") REFERENCES "public"."ref_keuangan_bu" ("kode_keuangan") ON DELETE CASCADE ON UPDATE NO ACTION;
ALTER TABLE "public"."ref_verif_keuangan_bu" ADD CONSTRAINT "ref_verif_keuangan_bu_kode_vendor_penjr_fkey" FOREIGN KEY ("kode_vendor_penjr") REFERENCES "public"."trx_vendor_penjr" ("kode_vendor_penjr") ON DELETE CASCADE ON UPDATE NO ACTION;

-- ----------------------------
-- Foreign Keys structure for table ref_verif_keuangan_pero
-- ----------------------------
ALTER TABLE "public"."ref_verif_keuangan_pero" ADD CONSTRAINT "ref_verif_keuangan_pero_kode_keuangan_fkey" FOREIGN KEY ("kode_keuangan") REFERENCES "public"."ref_keuangan_pero" ("kode_keuangan") ON DELETE CASCADE ON UPDATE NO ACTION;
ALTER TABLE "public"."ref_verif_keuangan_pero" ADD CONSTRAINT "ref_verif_keuangan_pero_kode_vendor_penjr_fkey" FOREIGN KEY ("kode_vendor_penjr") REFERENCES "public"."trx_vendor_penjr" ("kode_vendor_penjr") ON DELETE CASCADE ON UPDATE NO ACTION;

-- ----------------------------
-- Foreign Keys structure for table ref_verif_komisaris
-- ----------------------------
ALTER TABLE "public"."ref_verif_komisaris" ADD CONSTRAINT "ref_verif_komisaris_kode_komisaris_custom_fkey" FOREIGN KEY ("kode_komisaris_custom") REFERENCES "public"."ref_komisaris_bu_custom" ("kode_komisaris_custom") ON DELETE CASCADE ON UPDATE NO ACTION;
ALTER TABLE "public"."ref_verif_komisaris" ADD CONSTRAINT "ref_verif_komisaris_kode_vendor_penjr_fkey" FOREIGN KEY ("kode_vendor_penjr") REFERENCES "public"."trx_vendor_penjr" ("kode_vendor_penjr") ON DELETE CASCADE ON UPDATE NO ACTION;

-- ----------------------------
-- Foreign Keys structure for table ref_verif_lan_hukum_bu
-- ----------------------------
ALTER TABLE "public"."ref_verif_lan_hukum_bu" ADD CONSTRAINT "ref_verif_lan_hukum_bu_kode_lan_hukum_fkey" FOREIGN KEY ("kode_lan_hukum") REFERENCES "public"."ref_lan_hukum_bu" ("kode_lan_hukum") ON DELETE CASCADE ON UPDATE NO ACTION;
ALTER TABLE "public"."ref_verif_lan_hukum_bu" ADD CONSTRAINT "ref_verif_lan_hukum_bu_kode_vendor_penjr_fkey" FOREIGN KEY ("kode_vendor_penjr") REFERENCES "public"."trx_vendor_penjr" ("kode_vendor_penjr") ON DELETE CASCADE ON UPDATE NO ACTION;

-- ----------------------------
-- Foreign Keys structure for table ref_verif_pengalaman_bu
-- ----------------------------
ALTER TABLE "public"."ref_verif_pengalaman_bu" ADD CONSTRAINT "ref_verif_pengalaman_bu_kode_pengalaman_bu_custom_fkey" FOREIGN KEY ("kode_pengalaman_bu_custom") REFERENCES "public"."ref_pengalaman_bu_custom" ("kode_pengalaman_bu_custom") ON DELETE CASCADE ON UPDATE NO ACTION;
ALTER TABLE "public"."ref_verif_pengalaman_bu" ADD CONSTRAINT "ref_verif_pengalaman_bu_kode_vendor_penjr_fkey" FOREIGN KEY ("kode_vendor_penjr") REFERENCES "public"."trx_vendor_penjr" ("kode_vendor_penjr") ON DELETE CASCADE ON UPDATE NO ACTION;

-- ----------------------------
-- Foreign Keys structure for table ref_verif_pengalaman_pero
-- ----------------------------
ALTER TABLE "public"."ref_verif_pengalaman_pero" ADD CONSTRAINT "ref_verif_pengalaman_pero_kode_pengalaman_custom_fkey" FOREIGN KEY ("kode_pengalaman_custom") REFERENCES "public"."ref_pengalaman_pero_custom" ("kode_pengalaman_custom") ON DELETE CASCADE ON UPDATE NO ACTION;
ALTER TABLE "public"."ref_verif_pengalaman_pero" ADD CONSTRAINT "ref_verif_pengalaman_pero_kode_vendor_penjr_fkey" FOREIGN KEY ("kode_vendor_penjr") REFERENCES "public"."trx_vendor_penjr" ("kode_vendor_penjr") ON DELETE CASCADE ON UPDATE NO ACTION;

-- ----------------------------
-- Foreign Keys structure for table ref_verif_saham_bu
-- ----------------------------
ALTER TABLE "public"."ref_verif_saham_bu" ADD CONSTRAINT "ref_verif_saham_bu_kode_saham_custom_fkey" FOREIGN KEY ("kode_saham_custom") REFERENCES "public"."ref_saham_bu_custom" ("kode_saham_custom") ON DELETE CASCADE ON UPDATE NO ACTION;
ALTER TABLE "public"."ref_verif_saham_bu" ADD CONSTRAINT "ref_verif_saham_bu_kode_vendor_penjr_fkey" FOREIGN KEY ("kode_vendor_penjr") REFERENCES "public"."trx_vendor_penjr" ("kode_vendor_penjr") ON DELETE CASCADE ON UPDATE NO ACTION;

-- ----------------------------
-- Foreign Keys structure for table ref_verif_sertif_pero
-- ----------------------------
ALTER TABLE "public"."ref_verif_sertif_pero" ADD CONSTRAINT "ref_verif_sertif_pero_kode_vendor_penjr_fkey" FOREIGN KEY ("kode_vendor_penjr") REFERENCES "public"."trx_vendor_penjr" ("kode_vendor_penjr") ON DELETE CASCADE ON UPDATE NO ACTION;

-- ----------------------------
-- Foreign Keys structure for table ref_verif_sertifikat_usaha_bu
-- ----------------------------
ALTER TABLE "public"."ref_verif_sertifikat_usaha_bu" ADD CONSTRAINT "ref_verif_sertifikat_usaha_bu_kode_sertifikat_usaha_custom_fkey" FOREIGN KEY ("kode_sertifikat_usaha_custom") REFERENCES "public"."ref_sertifikat_usaha_bu_custom" ("kode_sertifikat_usaha_custom") ON DELETE CASCADE ON UPDATE NO ACTION;
ALTER TABLE "public"."ref_verif_sertifikat_usaha_bu" ADD CONSTRAINT "ref_verif_sertifikat_usaha_bu_kode_vendor_penjr_fkey" FOREIGN KEY ("kode_vendor_penjr") REFERENCES "public"."trx_vendor_penjr" ("kode_vendor_penjr") ON DELETE CASCADE ON UPDATE NO ACTION;

-- ----------------------------
-- Foreign Keys structure for table ref_verif_tenaga_ahli_bu
-- ----------------------------
ALTER TABLE "public"."ref_verif_tenaga_ahli_bu" ADD CONSTRAINT "ref_verif_tenaga_ahli_bu_kode_tenaga_ahli_custom_fkey" FOREIGN KEY ("kode_tenaga_ahli_custom") REFERENCES "public"."ref_tenaga_ahli_bu_custom" ("kode_tenaga_ahli_custom") ON DELETE CASCADE ON UPDATE NO ACTION;
ALTER TABLE "public"."ref_verif_tenaga_ahli_bu" ADD CONSTRAINT "ref_verif_tenaga_ahli_bu_kode_vendor_penjr_fkey" FOREIGN KEY ("kode_vendor_penjr") REFERENCES "public"."trx_vendor_penjr" ("kode_vendor_penjr") ON DELETE CASCADE ON UPDATE NO ACTION;

-- ----------------------------
-- Foreign Keys structure for table ref_verif_tenaga_pendukung_bu
-- ----------------------------
ALTER TABLE "public"."ref_verif_tenaga_pendukung_bu" ADD CONSTRAINT "ref_verif_tenaga_pendukung_bu_kode_tenaga_pendukung_custom_fkey" FOREIGN KEY ("kode_tenaga_pendukung_custom") REFERENCES "public"."ref_tenaga_pendukung_bu_custom" ("kode_tenaga_pendukung_custom") ON DELETE CASCADE ON UPDATE NO ACTION;
ALTER TABLE "public"."ref_verif_tenaga_pendukung_bu" ADD CONSTRAINT "ref_verif_tenaga_pendukung_bu_kode_vendor_penjr_fkey" FOREIGN KEY ("kode_vendor_penjr") REFERENCES "public"."trx_vendor_penjr" ("kode_vendor_penjr") ON DELETE CASCADE ON UPDATE NO ACTION;

-- ----------------------------
-- Foreign Keys structure for table trx_custom_item
-- ----------------------------
ALTER TABLE "public"."trx_custom_item" ADD CONSTRAINT "trx_custom_item_kode_vendor_fkey" FOREIGN KEY ("kode_vendor") REFERENCES "public"."ref_vendor" ("kode_vendor") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- ----------------------------
-- Foreign Keys structure for table trx_kategori
-- ----------------------------
ALTER TABLE "public"."trx_kategori" ADD CONSTRAINT "trx_kategori_kode_kategori_fkey" FOREIGN KEY ("kode_kategori") REFERENCES "public"."ref_kategori" ("kode_kategori") ON DELETE CASCADE ON UPDATE NO ACTION;

-- ----------------------------
-- Foreign Keys structure for table trx_kehadiran_verif
-- ----------------------------
ALTER TABLE "public"."trx_kehadiran_verif" ADD CONSTRAINT "trx_kehadiran_verif_kode_undangan_verif_fkey" FOREIGN KEY ("kode_undangan_verif") REFERENCES "public"."trx_undangan_verif" ("kode_undangan_verif") ON DELETE CASCADE ON UPDATE NO ACTION;

-- ----------------------------
-- Foreign Keys structure for table trx_ketentuan_umum_khusus
-- ----------------------------
ALTER TABLE "public"."trx_ketentuan_umum_khusus" ADD CONSTRAINT "trx_ketentuan_umum_khusus_kode_penjaringan_fkey" FOREIGN KEY ("kode_penjaringan") REFERENCES "public"."trx_penjaringan" ("kode_penjaringan") ON DELETE CASCADE ON UPDATE NO ACTION;
ALTER TABLE "public"."trx_ketentuan_umum_khusus" ADD CONSTRAINT "trx_ketentuan_umum_khusus_kode_subkat_fkey" FOREIGN KEY ("kode_subkat") REFERENCES "public"."ref_subkat_persyaratan" ("kode_subkat") ON DELETE CASCADE ON UPDATE NO ACTION;

-- ----------------------------
-- Foreign Keys structure for table trx_kualifikasi_usaha_penjr
-- ----------------------------
ALTER TABLE "public"."trx_kualifikasi_usaha_penjr" ADD CONSTRAINT "trx_kualifikasi_usaha_penjr_kode_kualifikasi_usaha_fkey" FOREIGN KEY ("kode_kualifikasi_usaha") REFERENCES "public"."ref_kualifikasi_usaha" ("kode_kualifikasi_usaha") ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE "public"."trx_kualifikasi_usaha_penjr" ADD CONSTRAINT "trx_kualifikasi_usaha_penjr_kode_penjaringan_fkey" FOREIGN KEY ("kode_penjaringan") REFERENCES "public"."trx_penjaringan" ("kode_penjaringan") ON DELETE CASCADE ON UPDATE CASCADE;

-- ----------------------------
-- Foreign Keys structure for table trx_nilai_akhir
-- ----------------------------
ALTER TABLE "public"."trx_nilai_akhir" ADD CONSTRAINT "trx_nilai_akhir_kode_vendor_penjr_fkey" FOREIGN KEY ("kode_vendor_penjr") REFERENCES "public"."trx_vendor_penjr" ("kode_vendor_penjr") ON DELETE CASCADE ON UPDATE NO ACTION;

-- ----------------------------
-- Foreign Keys structure for table trx_penjaringan
-- ----------------------------
ALTER TABLE "public"."trx_penjaringan" ADD CONSTRAINT "trx_penjaringan_kode_jenis_pengadaan_fkey" FOREIGN KEY ("kode_jenis_pengadaan") REFERENCES "public"."ref_jenis_pengadaan" ("kode_jenis_pengadaan") ON DELETE CASCADE ON UPDATE NO ACTION;
ALTER TABLE "public"."trx_penjaringan" ADD CONSTRAINT "trx_penjaringan_kode_jenis_vendor_fkey" FOREIGN KEY ("kode_jenis_vendor") REFERENCES "public"."ref_jenis_vendor" ("kode_jenis_vendor") ON DELETE CASCADE ON UPDATE NO ACTION;
ALTER TABLE "public"."trx_penjaringan" ADD CONSTRAINT "trx_penjaringan_kode_status_pengajuan_fkey" FOREIGN KEY ("kode_status_pengajuan") REFERENCES "public"."ref_status_pengajuan_penjr" ("kode_status_pengajuan") ON DELETE CASCADE ON UPDATE NO ACTION;
ALTER TABLE "public"."trx_penjaringan" ADD CONSTRAINT "trx_penjaringan_kode_status_penjaringan_fkey" FOREIGN KEY ("kode_status_penjaringan") REFERENCES "public"."ref_status_penjaringan" ("kode_status_penjaringan") ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE "public"."trx_penjaringan" ADD CONSTRAINT "trx_penjaringan_kode_trx_kategori_fkey" FOREIGN KEY ("kode_trx_kategori") REFERENCES "public"."trx_kategori" ("kode_trx_kategori") ON DELETE CASCADE ON UPDATE NO ACTION;

-- ----------------------------
-- Foreign Keys structure for table trx_tim_teknis_pendukung
-- ----------------------------
ALTER TABLE "public"."trx_tim_teknis_pendukung" ADD CONSTRAINT "trx_tim_teknis_pendukung_kode_undangan_verif_fkey" FOREIGN KEY ("kode_undangan_verif") REFERENCES "public"."trx_undangan_verif" ("kode_undangan_verif") ON DELETE CASCADE ON UPDATE NO ACTION;

-- ----------------------------
-- Foreign Keys structure for table trx_undangan_penjr
-- ----------------------------
ALTER TABLE "public"."trx_undangan_penjr" ADD CONSTRAINT "trx_undangan_penjr_kode_penjaringan_fkey" FOREIGN KEY ("kode_penjaringan") REFERENCES "public"."trx_penjaringan" ("kode_penjaringan") ON DELETE CASCADE ON UPDATE NO ACTION;
ALTER TABLE "public"."trx_undangan_penjr" ADD CONSTRAINT "trx_undangan_penjr_kode_vendor_fkey" FOREIGN KEY ("kode_vendor") REFERENCES "public"."ref_vendor" ("kode_vendor") ON DELETE CASCADE ON UPDATE NO ACTION;

-- ----------------------------
-- Foreign Keys structure for table trx_undangan_verif
-- ----------------------------
ALTER TABLE "public"."trx_undangan_verif" ADD CONSTRAINT "trx_undangan_verif_kode_vendor_penjr_fkey" FOREIGN KEY ("kode_vendor_penjr") REFERENCES "public"."trx_vendor_penjr" ("kode_vendor_penjr") ON DELETE CASCADE ON UPDATE NO ACTION;

-- ----------------------------
-- Foreign Keys structure for table trx_vendor_penjr
-- ----------------------------
ALTER TABLE "public"."trx_vendor_penjr" ADD CONSTRAINT "trx_vendor_penjr_kode_penjaringan_fkey" FOREIGN KEY ("kode_penjaringan") REFERENCES "public"."trx_penjaringan" ("kode_penjaringan") ON DELETE CASCADE ON UPDATE NO ACTION;
ALTER TABLE "public"."trx_vendor_penjr" ADD CONSTRAINT "trx_vendor_penjr_kode_vendor_fkey" FOREIGN KEY ("kode_vendor") REFERENCES "public"."ref_vendor" ("kode_vendor") ON DELETE CASCADE ON UPDATE NO ACTION;

-- ----------------------------
-- Foreign Keys structure for table trx_verifikator_penjr
-- ----------------------------
ALTER TABLE "public"."trx_verifikator_penjr" ADD CONSTRAINT "trx_verifikator_penjr_kode_penjaringan_fkey" FOREIGN KEY ("kode_penjaringan") REFERENCES "public"."trx_penjaringan" ("kode_penjaringan") ON DELETE CASCADE ON UPDATE NO ACTION;
