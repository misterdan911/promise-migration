CREATE TABLE "ref_metode_pemasukan_dok" (
  "kode_metode_pemasukan_dok" int2 PRIMARY KEY,
  "metode" varchar(100)
);
COMMENT ON TABLE "ref_metode_pemasukan_dok" IS 'Satu File';


CREATE TABLE "ref_metode_evaluasi" (
  "kode_metode_evaluasi" int4 PRIMARY KEY,
  "metode_evaluasi" varchar(50)
);
COMMENT ON TABLE "ref_metode_evaluasi" IS 'Harga Terendah, Sistem Nilai';


CREATE TABLE "trx_persiapan_pemilihan" (
  "kode_persiapan_pemilihan" serial PRIMARY KEY,
  "kode_perencanaan" int4,
  "kode_metode_pemasukan_dok" int2,
  "kode_metode_evaluasi" int2,
  "tgl_pengumuman_awal" timestamptz,
  "tgl_pengumuman_akhir" timestamptz,
  "tgl_penjelasan_awal" timestamptz,
  "tgl_penjelasan_akhir" timestamptz,
  "tgl_pemasukan_penawaran_awal" timestamptz,
  "tgl_pemasukan_penawaran_akhir" timestamptz,
  "tgl_pembukaan_penawara_awal" timestamptz,
  "tgl_pembukaan_penawaran_akhir" timestamptz,
  "tgl_eval_klasif_nego_awal" timestamptz,
  "tgl_eval_klasif_nego_akhir" timestamptz,
  "tgl_penetapan_pengumuman_awal" timestamptz,
  "tgl_penetapan_pengumuman_akhir" timestamptz,
  "tgl_surat_mdp" date,
  "kode_dok_mdp" int4
);
COMMENT ON COLUMN "trx_persiapan_pemilihan"."kode_dok_mdp" IS 'Kode Dokumen Model Dokumen Pengadaan (MDP)';
ALTER TABLE "trx_persiapan_pemilihan" ADD FOREIGN KEY ("kode_perencanaan") REFERENCES "ref_perencanaan" ("kode_perencanaan") ON DELETE CASCADE;
ALTER TABLE "trx_persiapan_pemilihan" ADD FOREIGN KEY ("kode_metode_pemasukan_dok") REFERENCES "ref_metode_pemasukan_dok" ("kode_metode_pemasukan_dok");
ALTER TABLE "trx_persiapan_pemilihan" ADD FOREIGN KEY ("kode_metode_evaluasi") REFERENCES "ref_metode_evaluasi" ("kode_metode_evaluasi");
ALTER TABLE "trx_persiapan_pemilihan" ADD FOREIGN KEY ("kode_dok_mdp") REFERENCES "trx_dokumen" ("kode_dok");

CREATE TYPE "konfirmasi_kehadiran" AS ENUM (
  'belum_konfirmasi',
  'hadir',
  'tidak_hadir'
);

CREATE TABLE "trx_vendor_pemilihan" (
  "kode_vendor_pemilihan" serial PRIMARY KEY,
  "kode_persiapan_pemilihan" int4,
  "kode_vendor" int4,
  "konfirmasi_kehadiran" konfirmasi_kehadiran
);
ALTER TABLE "trx_vendor_pemilihan" ADD FOREIGN KEY ("kode_persiapan_pemilihan") REFERENCES "trx_persiapan_pemilihan" ("kode_persiapan_pemilihan") ON DELETE CASCADE;



CREATE TABLE "trx_undangan_pemilihan" (
  "kode_undangan" serial PRIMARY KEY,
  "kode_persiapan_pemilihan" int4,
  "tgl_surat" date,
  "tgl_penjelasan" date,
  "waktu_penjelasan_awal" time,
  "waktu_penjelasan_akhir" time,
  "is_penjelasan_online" bool,
  "tempat_tautan" text,
  "tgl_peninjauan" date,
  "waktu_peninjauan_awal" time,
  "waktu_peninjauan_akhir" time,
  "tempat_peninjauan" varchar(255),
  "tgl_penyampaian_penawaran" date,
  "waktu_penyampaian_penawaran_awal" time,
  "waktu_penyampaian_penawaran_akhir" time,
  "laman" text
);
COMMENT ON COLUMN "trx_undangan_pemilihan"."is_penjelasan_online" IS 'Apakah Pemberian Penjelasanya diadakan secara online';
COMMENT ON COLUMN "trx_undangan_pemilihan"."tempat_tautan" IS 'Kalau Pemberian Penjelasanya secara online, diisi dengan tautan link, kalau offline, diisi dengan lokasi tempat pertemuan';
COMMENT ON COLUMN "trx_undangan_pemilihan"."tgl_peninjauan" IS 'Tgl Peninjauan Lapangan';
COMMENT ON COLUMN "trx_undangan_pemilihan"."laman" IS 'autogenerate sesuai dengan tautan modul';
ALTER TABLE "trx_undangan_pemilihan" ADD FOREIGN KEY ("kode_persiapan_pemilihan") REFERENCES "trx_persiapan_pemilihan" ("kode_persiapan_pemilihan") ON DELETE CASCADE;




-- Persyaratan
-- ref_tpl_kat_persyaratan
DROP TABLE IF EXISTS ref_tpl_kat_persyaratan;
CREATE TABLE ref_tpl_kat_persyaratan (
  kode_tpl_kat int4 PRIMARY KEY,
  nama_kat varchar(100)
);
COMMENT ON TABLE "ref_tpl_kat_persyaratan" IS 'Template Kategori Persyaratan';

-- ref_tpl_sub_kat_persyaratan
DROP TABLE IF EXISTS ref_tpl_sub_kat_persyaratan;
CREATE TABLE ref_tpl_sub_kat_persyaratan (
  kode_tpl_sub_kat int4 PRIMARY KEY,
  kode_tpl_kat int4,
  nama_sub_kat varchar(255),
  deskripsi text
);
COMMENT ON TABLE "ref_tpl_sub_kat_persyaratan" IS 'Template Sub Kategori Persyaratan';
ALTER TABLE "ref_tpl_sub_kat_persyaratan" ADD FOREIGN KEY ("kode_tpl_kat") REFERENCES "ref_tpl_kat_persyaratan" ("kode_tpl_kat") ON DELETE CASCADE;


-- ref_tpl_item_tanya_persyaratan
DROP TABLE IF EXISTS ref_tpl_item_tanya_persyaratan;
CREATE TABLE ref_tpl_item_tanya_persyaratan (
  kode_tpl_item_tanya int4 PRIMARY KEY,
  kode_tpl_sub_kat int4,
  item_tanya varchar(255),
  tipe varchar(50)
);
ALTER TABLE "ref_tpl_item_tanya_persyaratan" ADD FOREIGN KEY ("kode_tpl_sub_kat") REFERENCES "ref_tpl_sub_kat_persyaratan" ("kode_tpl_sub_kat") ON DELETE CASCADE;
-- SELECT setval('ref_tpl_item_tanya_kode_tpl_item_tanya_seq', (SELECT MAX(kode_item_tanya) FROM ref_tpl_item_tanya_persyaratan));


-- ref_tpl_sub_item_tanya_persyaratan
DROP TABLE IF EXISTS ref_tpl_sub_item_tanya_persyaratan;
CREATE TABLE ref_tpl_sub_item_tanya_persyaratan (
  kode_tpl_sub_item_tanya int4 PRIMARY KEY,
  kode_tpl_item_tanya int4,
  item_tanya varchar(255),
  tipe varchar(50)
);
ALTER TABLE "ref_tpl_sub_item_tanya_persyaratan" ADD FOREIGN KEY ("kode_tpl_item_tanya") REFERENCES "ref_tpl_item_tanya_persyaratan" ("kode_tpl_item_tanya") ON DELETE CASCADE;


-- trx_sub_kat_persyaratan
DROP TABLE IF EXISTS trx_sub_kat_persyaratan;
CREATE TABLE trx_sub_kat_persyaratan (
  kode_trx_sub_kat int4 PRIMARY KEY,
  kode_ku int4,
  kode_tpl_kat int4,
  nama_persyaratan varchar(255),
  deskripsi text
);
ALTER TABLE "trx_sub_kat_persyaratan" ADD FOREIGN KEY ("kode_ku") REFERENCES "trx_kaji_ulang" ("kode_ku") ON DELETE CASCADE;
ALTER TABLE "trx_sub_kat_persyaratan" ADD FOREIGN KEY ("kode_tpl_kat") REFERENCES "ref_tpl_kat_persyaratan" ("kode_tpl_kat") ON DELETE CASCADE;


-- trx_item_tanya_persyaratan
DROP TABLE IF EXISTS trx_item_tanya_persyaratan;
CREATE TABLE trx_item_tanya_persyaratan (
  kode_trx_item_tanya serial PRIMARY KEY
  kode_trx_sub_kat int4,
  item_tanya varchar(255),
  tipe varchar(50)
);
ALTER TABLE "trx_item_tanya_persyaratan" ADD FOREIGN KEY ("kode_trx_sub_kat") REFERENCES "trx_sub_kat_persyaratan" ("kode_trx_sub_kat") ON DELETE CASCADE;


-- trx_sub_item_tanya_persyaratan
DROP TABLE IF EXISTS trx_sub_item_tanya_persyaratan;
CREATE TABLE trx_sub_item_tanya_persyaratan (
  kode_trx_sub_item_tanya serial PRIMARY KEY
  kode_trx_item_tanya int4,
  sub_item_tanya varchar(255),
  tipe varchar(50)
);
ALTER TABLE "trx_sub_item_tanya_persyaratan" ADD FOREIGN KEY ("kode_trx_item_tanya") REFERENCES "trx_item_tanya_persyaratan" ("kode_trx_item_tanya") ON DELETE CASCADE;




-- lorem_ipsum

