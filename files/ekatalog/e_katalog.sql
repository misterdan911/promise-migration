drop table if exists ref_vendor_info cascade;
create table ref_vendor_info (
  kode_vendor int4 primary key,
  kode_kualifikasi_usaha int2,    -- 1:Kecil 2:Memengah 3:Besar 4:Non Kecil
  kode_kab_kota varchar(5),
  is_dpt boolean
);
comment on table ref_vendor_info is 'info vendor untuk mempermudah filter vendor di katalog';

drop type if exists dari_aplikasi cascade;
create type dari_aplikasi as enum (
  'sibela',
  'siplang',
  'siqut',
  'sipung'
);

drop type if exists status_produk cascade;
create type status_produk as enum (
  'draft',
  'proses_verifikasi',
  'butuh_perbaikan',
  'aktif',
  'nonaktif'
);

drop type if exists moda cascade;
create type moda as enum
('darat', 'laut', 'udara');

drop table if exists ref_kat_produk cascade;
create table ref_kat_produk (
  kode_kat_produk serial primary key,
  parent int4,
  kategori varchar(255)
);

drop table if exists ref_kat_kontrak cascade;
CREATE TABLE ref_kat_kontrak (
	kode_kat_kontrak_payung int2 primary key,
	kategori varchar(30) NULL
);
comment on table ref_kat_kontrak is 'Bahan Ajar, Barang, Cetak Kirim, Pengiriman UT Daerah, Pengiriman Door to Door, Jasa Lainnya';

drop table if exists ref_produk_header cascade;
create table ref_produk_header (
  kode_produk_header serial primary key,
  kode_vendor int4,
  dari_aplikasi dari_aplikasi,
  kode_kat_produk int4,           -- Nanti terserah mau diisi apa sama mas Afan
  kode_kat_kontrak_payung int4,
  nama_produk varchar(255),
  model_produk varchar(255),
  deskiripsi text,
  total_terjual int4,
  status_produk status_produk,
  alasan_status_produk text,
  ucr varchar(80),
  uch varchar(80),
  udcr timestamptz,
  udch timestamptz
);
ALTER TABLE ref_produk_header ADD FOREIGN KEY (kode_vendor) REFERENCES ref_vendor_info (kode_vendor);
ALTER TABLE ref_produk_header ADD FOREIGN KEY (kode_kat_kontrak_payung) REFERENCES ref_kat_kontrak (kode_kat_kontrak_payung);
ALTER TABLE ref_produk_header ADD FOREIGN KEY (kode_kat_produk) REFERENCES ref_kat_produk (kode_kat_produk);
CREATE INDEX ON ref_produk_header(kode_vendor);
CREATE INDEX ON ref_produk_header (kode_kat_kontrak_payung);
CREATE INDEX ON ref_produk_header (kode_kat_produk);
comment on column ref_produk_header.dari_aplikasi is 'sibela, siplang, siqut, sipung';
comment on column ref_produk_header.status_produk is 'draft, proses_verifikasi, butuh_perbaikan, aktif, nonaktif';

DROP TABLE IF EXISTS ref_produk_header_media CASCADE;
create table ref_produk_header_media (
  kode_media serial primary key,
  kode_produk_header int4,
  media varchar(255),
  view_order int4
);
ALTER TABLE ref_produk_header_media ADD FOREIGN KEY (kode_produk_header) REFERENCES ref_produk_header(kode_produk_header);
comment on table ref_produk_header_media is '1 produk bisa punya banyak foto atau video';

DROP TABLE IF EXISTS trx_rating CASCADE;
create table trx_rating (
  kode_rating serial primary key,
  kode_produk_header int4,
  nilai_rating int2,
  ulasan text,
  ucr varchar(80),
  uch varchar(80),
  udcr timestamptz,
  udch timestamptz
);
ALTER TABLE trx_rating ADD FOREIGN KEY (kode_produk_header) REFERENCES ref_produk_header(kode_produk_header);

DROP TABLE IF EXISTS trx_rating_media CASCADE;
create table trx_rating_media (
  kode_rating_media serial primary key,
  kode_rating int4,
  media varchar(255),
  view_order int4
);
ALTER TABLE trx_rating_media ADD FOREIGN KEY (kode_rating) REFERENCES trx_rating (kode_rating);
comment on table trx_rating_media is '1 rating bisa punya banyak foto atau video';

DROP TABLE IF EXISTS trx_produk_whishlist CASCADE;
create table trx_produk_whishlist (
  kode_whishlist serial primary key,
  kode_produk_header int4,
  ucr varchar(80)
);
ALTER TABLE trx_produk_whishlist ADD FOREIGN KEY (kode_produk_header) REFERENCES ref_produk_header(kode_produk_header);

DROP TABLE IF EXISTS ref_produk_barang CASCADE;
create table ref_produk_barang(
  kode_produk_barang serial primary key,
	kode_produk_header int4,
  harga numeric,
  subtotal_terjual int4
);
ALTER TABLE ref_produk_barang ADD FOREIGN KEY (kode_produk_header) REFERENCES ref_produk_header(kode_produk_header);

DROP TABLE IF EXISTS ref_produk_jasa CASCADE;
create table ref_produk_jasa(
  kode_produk_jasa serial primary key,
	kode_produk_header int4 NULL,
  harga numeric,
  subtotal_terjual int4
);
ALTER TABLE ref_produk_jasa ADD FOREIGN KEY (kode_produk_header) REFERENCES ref_produk_header(kode_produk_header);

DROP TABLE IF EXISTS ref_produk_bahan_ajar_cetak CASCADE;
CREATE TABLE ref_produk_bahan_ajar_cetak (
	kode_produk_bahan_ajar_cetak serial primary key,
	kode_produk_header int4 NULL,

	ukuran varchar(5) NULL,
	warna varchar(50) NULL,
	oplah_min int4 NULL,
	oplah_max int4 NULL,
	hal_min int4 NULL,
	hal_max int4 NULL,
	satuan varchar(50) NULL,
  penawaran numeric,
	harga numeric NULL
);
ALTER TABLE ref_produk_bahan_ajar_cetak ADD FOREIGN KEY (kode_produk_header) REFERENCES ref_produk_header(kode_produk_header);

DROP TABLE IF EXISTS ref_produk_bahan_ajar_cetak_kirim CASCADE;
CREATE TABLE ref_produk_bahan_ajar_cetak_kirim (
	kode_produk_bahan_ajar_cetak_kirim serial primary key,
	kode_produk_header int4 NULL,
	hal_min int4 NULL,
	hal_max int4 NULL,
	harga numeric NULL
);
ALTER TABLE ref_produk_bahan_ajar_cetak_kirim ADD FOREIGN KEY (kode_produk_header) REFERENCES ref_produk_header(kode_produk_header);

DROP TABLE IF EXISTS ref_produk_pengiriman_door_to_door CASCADE;
CREATE TABLE ref_produk_pengiriman_door_to_door (
	kode_produk_pengiriman_door_to_door serial primary key,
	kode_produk_header int4 NULL,
	kode_kab_kota varchar NULL,
	kode_kecamatan varchar NULL,
	moda moda NULL,
	lead_time int4 NULL,
	harga numeric NULL
);
ALTER TABLE ref_produk_pengiriman_door_to_door ADD FOREIGN KEY (kode_produk_header) REFERENCES ref_produk_header(kode_produk_header);


DROP TABLE IF EXISTS ref_produk_pengiriman_ut_daerah CASCADE;
CREATE TABLE ref_produk_pengiriman_ut_daerah (
	kode_produk_pengiriman_ut_daerah serial primary key,
	kode_produk_header int4 NULL,
	kode_unit_asal varchar NULL,
	kode_unit_tujuan varchar NULL,
	moda moda NULL,
	lead_time int4 NULL,
	harga numeric NULL
);
ALTER TABLE ref_produk_pengiriman_ut_daerah ADD FOREIGN KEY (kode_produk_header) REFERENCES ref_produk_header(kode_produk_header);

-- Keranjang-keranjang
DROP TABLE IF EXISTS trx_keranjang CASCADE;
create table trx_keranjang (
  kode_keranjang serial primary key,
  kode_vendor int4,
  harga_total numeric
);

DROP TABLE IF EXISTS trx_keranjang_produk_header CASCADE;
create table trx_keranjang_produk_header(
  kode_keranjang_produk_header serial primary key,
  kode_keranjang int4,
  kode_produk_header int4,

  nama_produk varchar(255),
  model_produk varchar(255),
  deskiripsi text
);
ALTER TABLE trx_keranjang_produk_header ADD FOREIGN KEY (kode_keranjang) REFERENCES trx_keranjang(kode_keranjang);
ALTER TABLE trx_keranjang_produk_header ADD FOREIGN KEY (kode_produk_header) REFERENCES ref_produk_header(kode_produk_header);

DROP TABLE IF EXISTS trx_keranjang_barang CASCADE;
create table trx_keranjang_barang(
  kode_keranjang_barang serial primary key,
  kode_keranjang_produk_header int4,
  kuantitas int4,
  kode_ruang varchar,
  info varchar,
  tanggal date,
  harga numeric,
  harga_subtotal numeric
);
ALTER TABLE trx_keranjang_barang ADD FOREIGN KEY (kode_keranjang_produk_header) REFERENCES trx_keranjang_produk_header(kode_keranjang_produk_header);

DROP TABLE IF EXISTS trx_keranjang_jasa CASCADE;
create table trx_keranjang_jasa(
  kode_keranjang_jasa serial primary key,
  kode_keranjang_produk_header int4,
  kuantitas int4,
  info varchar,
  tanggal date,
  harga_subtotal numeric
);
ALTER TABLE trx_keranjang_jasa ADD FOREIGN KEY (kode_keranjang_produk_header) REFERENCES trx_keranjang_produk_header(kode_keranjang_produk_header);

DROP TABLE IF EXISTS trx_keranjang_bahan_ajar_cetak CASCADE;
create table trx_keranjang_bahan_ajar_cetak (
  kode_keranjang_bahan_ajar_cetak serial primary key,
  kode_keranjang_produk_header int4,

  kode_produk_bahan_ajar_cetak int4,
  kode_ba varchar,
  nama_ba varchar,
  jenis_ba varchar,
  edisi int4,

  ukuran varchar(5) NULL,
  warna varchar(50) NULL,
  oplah_min int4 NULL,
  oplah_max int4 NULL,
  hal_min int4 NULL,
  hal_max int4 NULL,
  satuan varchar,
  penawaran numeric,
  harga numeric NULL,

  jml_oplah int4,
  jml_halaman int,
  harga_subtotal numeric
);
ALTER TABLE trx_keranjang_bahan_ajar_cetak ADD FOREIGN KEY (kode_keranjang_produk_header) REFERENCES trx_keranjang_produk_header(kode_keranjang_produk_header);
ALTER TABLE trx_keranjang_bahan_ajar_cetak ADD FOREIGN KEY (kode_produk_bahan_ajar_cetak) REFERENCES ref_produk_bahan_ajar_cetak(kode_produk_bahan_ajar_cetak);

drop type if exists jenis_tgl_kirim cascade;
create type jenis_tgl_kirim as enum (
  'range',
  'semua'
);

DROP TABLE IF EXISTS trx_keranjang_bahan_ajar_cetak_kirim CASCADE;
create table trx_keranjang_bahan_ajar_cetak_kirim (
  kode_keranjang_bahan_ajar_cetak_kirim serial primary key,
  kode_keranjang_produk_header int4,

  kode_produk_bahan_ajar_cetak_kirim int4,
  ukuran varchar(5) NULL,
  warna varchar(50) NULL,
  oplah_min int4 NULL,
  oplah_max int4 NULL,
  hal_min int4 NULL,
  hal_max int4 NULL,
  satuan varchar,
  penawaran numeric,
  harga numeric NULL,

  jenis_tgl_kirim jenis_tgl_kirim,
  tgl_awal date,
  tgl_akhir date,
  harga_subtotal numeric
);
ALTER TABLE trx_keranjang_bahan_ajar_cetak_kirim ADD FOREIGN KEY (kode_keranjang_produk_header) REFERENCES trx_keranjang_produk_header(kode_keranjang_produk_header);
ALTER TABLE trx_keranjang_bahan_ajar_cetak_kirim ADD FOREIGN KEY (kode_produk_bahan_ajar_cetak_kirim) REFERENCES ref_produk_bahan_ajar_cetak_kirim(kode_produk_bahan_ajar_cetak_kirim);

DROP TABLE IF EXISTS trx_keranjang_pengiriman_door_to_door CASCADE;
create table trx_keranjang_pengiriman_door_to_door (
  kode_keranjang_pengiriman_door_to_door serial primary key,
  kode_keranjang_produk_header int4,
	kode_produk_pengiriman_door_to_door int4,
  nomor_do int4,
  nama_mahasiswa varchar(100),
  no_telp varchar(15),
  alamat text,
  kode_unit varchar,      -- UPBJJ
  kode_kab_kota varchar,
  kode_kecamatan varchar,
  kode_pos int4,
  moda moda,
  lead_time int4,
  harga numeric,
  berat_paket int4,
  harga_subtotal numeric
);
ALTER TABLE trx_keranjang_pengiriman_door_to_door ADD FOREIGN KEY (kode_keranjang_produk_header) REFERENCES trx_keranjang_produk_header(kode_keranjang_produk_header);
ALTER TABLE trx_keranjang_pengiriman_door_to_door ADD FOREIGN KEY (kode_produk_pengiriman_door_to_door) REFERENCES ref_produk_pengiriman_door_to_door(kode_produk_pengiriman_door_to_door);
comment on column trx_keranjang_pengiriman_door_to_door.kode_unit is 'UPBJJ';

DROP TABLE IF EXISTS trx_keranjang_pengiriman_ut_daerah CASCADE;
CREATE TABLE trx_keranjang_pengiriman_ut_daerah (
  kode_keranjang_pengiriman_ut_daerah serial primary key,
  kode_keranjang_produk_header int4,
  kode_produk_pengiriman_ut_daerah int4,
  kode_unit_asal varchar,
  kode_unit_tujuan varchar,
  moda moda,
  lead_time int4,
  harga numeric,
  berat int4,
  harga_subtotal numeric
);
ALTER TABLE trx_keranjang_pengiriman_ut_daerah ADD FOREIGN KEY (kode_keranjang_produk_header) REFERENCES trx_keranjang_produk_header(kode_keranjang_produk_header);
ALTER TABLE trx_keranjang_pengiriman_ut_daerah ADD FOREIGN KEY (kode_produk_pengiriman_ut_daerah) REFERENCES ref_produk_pengiriman_ut_daerah(kode_produk_pengiriman_ut_daerah);

drop table if exists ref_status_perencanaan;
CREATE TABLE ref_status_perencanaan (
	kode_status_perencanaan int4 primary key,
	status varchar(255)
);

/*
drop table if exists ref_perencanaan;
create table ref_perencanaan (
  kode_perencanaan
  kode_rup
  kode_unit
  kode_vendor
  nama_paket
  kode_keranjang
  kode_status_perencanaan
  kode_kat_kontrak_payung
  no_surat_pesanan
  ucr
  uch
  udcr
  udch
);
*/
