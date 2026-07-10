create table ref_vendor_info (
  kode_vendor int4 primary key,
  kode_kualifikasi_usaha int2,    -- 1:Kecil 2:Memengah 3:Besar 4:Non Kecil
  kode_kab_kota varchar(5),
  is_dpt boolean
);
comment on table ref_vendor is 'info vendor untuk mempermudah filter vendor di katalog';

create type dari_aplikasi as enum (
  'sibela',
  'siplang',
  'siqut',
  'sipung',
);

create type status_produk as enum (
  'draft',
  'proses_verifikasi',
  'butuh_perbaikan',
  'aktif',
  'nonaktif',
);

drop type if exists moda cascade;
create type moda as enum
('darat', 'laut', 'udara');

create table ref_kat_produk (
  kode_kat_produk serial primary key,
  parent int4,
  kategori varchar(255)
);

CREATE TABLE ref_kat_kontrak (
	kode_kat_kontrak_payung int2 NOT NULL,
	kategori varchar(30) NULL
);
comment on table ref_kat_kontrak is 'Bahan Ajar, Barang, Cetak Kirim, Pengiriman UT Daerah, Pengiriman Door to Door, Jasa Lainnya';

create table ref_produk_header (
  kode_produk_header serial primary key,
  kode_vendor int4,
  dari_aplikasi dari_aplikasi,
  kode_kat_produk int4,           -- Nanti terserah mau diisi apa sama mas Afan
  kode_kat_kontrak_payung int4,
  nama_produk varchar(255),
  model_produk varchar(255),
  deskiripsi text,
  harga_dari numeric,
  harga_sampai numeric,
  jml_terjual int4,
  status_produk status_produk,
  alasan_status_produk text,
  ucr varchar(80),
  uch varchar(80),
  udcr timestamptz,
  udch timestamptz
);
comment on column ref_produk_header.dari_aplikasi is 'sibela, siplang, siqut, sipung';
comment on column ref_produk_header.status_produk is 'draft, proses_verifikasi, butuh_perbaikan, aktif, nonaktif';

create table ref_produk_header_media (
  kode_media serial primary key,
  kode_produk_header int4,
  media varchar(255),
  view_order int4
);
comment on table ref_produk_header_media is '1 produk bisa punya banyak foto atau video'

create table trx_rating (
  kode_rating serial primary key,
  kode_produk_header int4,
  nilai_rating int2,
  ulasan text,
  ucr varchar(80),
  uch varchar(80),
  udcr timestamptz,
  udch timestamptz
}

create table trx_rating_media (
  kode_rating_media serial primary key,
  kode_rating int4,
  media varchar(255),
  view_order int4
);
comment on table trx_rating_media is '1 rating bisa punya banyak foto atau video'

create table trx_produk_whishlist (
  kode_whistlist serial primary key,
  kode_produk_header int4,
  ucr varchar(80)
);

CREATE TABLE ref_produk_bahanajar (
	kode_produk_bahanajar serial primary_key,
	kode_produk_header int4 NULL,
	ukuran varchar(5) NULL,
	warna varchar(50) NULL,
	oplah_min int4 NULL,
	oplah_max int4 NULL,
	hal_min int4 NULL,
	hal_max int4 NULL,
	satuan varchar(50) NULL,
	harga numeric NULL
);

CREATE TABLE ref_produk_cetak_kirim (
	kode_produk_cetak_kirim serial primary_key,
	kode_produk_header int4 NULL,
	hal_min int4 NULL,
	hal_max int4 NULL,
	harga numeric NULL
);

CREATE TABLE ref_produk_pengiriman_door_to_door (
	kode_produk_pengiriman_door_to_door serial primary key,
	kode_produk_header int4 NULL,
	kode_kab_kota varchar NULL,
	kode_kecamatan varchar NULL,
	moda moda NULL,
	lead_time int4 NULL,
	harga numeric NULL
);

CREATE TABLE ref_produk_pengiriman_ut_daerah (
	kode_produk_pengiriman_ut_daerah serial primary key,
	kode_produk_header int4 NULL,
	kode_unit_asal varchar NULL,
	kode_unit_tujuan varchar NULL,
	moda moda NULL,
	lead_time int4 NULL,
	harga numeric NULL
);

-- Keranjang-keranjang
create table trx_keranjang_pengiriman_door_to_door (
  kode_keranjang_pengiriman_door_to_door serial primary key,
  kode_keranjang_header int4,
	kode_produk_pengiriman_door_to_door int4,
  nomor_do int4,
  nama_mahasiswa varchar(100),
  no_telp varchar(15),
  alamat text,
  kode_unit varchar,
  kode_kab_kota varchar,
  kode_kecamatan varchar,
  kode_pos int4,
  berat int4
}

CREATE TABLE trx_keranjang_pengiriman_ut_daerah (
	kode_keranjang_pengiriman_ut_daerah serial primary key,
  kode_keranjang_header int4,
	kode_produk_pengiriman_ut_daerah int4 NULL,
  berat int4
	total_harga numeric NULL
);
