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

create table ref_produk (
  kode_produk serial primary key,
  kode_vendor int4,
  dari_aplikasi dari_aplikasi,
  kode_kat_produk int4,           -- Nanti terserah mau diisi apa sama mas Afan
  kode_kat_kontrak_payung int4,
  nama_produk varchar(255),
  model_produk varchar(255),
  deskiripsi text,
  harga numeric,
  jml_terjual int4,
  status_produk status_produk,
  alasan_status_produk text,
  ucr varchar(80),
  uch varchar(80),
  udcr timestamptz,
  udch timestamptz
);
comment on column ref_produk.dari_aplikasi is 'sibela, siplang, siqut, sipung';

create table ref_produk_media (
  kode_media serial primary key,
  kode_produk int4,
  media varchar(255),
  view_order int4
);
comment on table ref_produk_media is '1 produk bisa punya banyak foto atau video'

create table trx_produk_rating (
  kode_trx_rating serial primary key,
  kode_produk int4,
  nilai_rating int2,
  ulasan text,
  ucr varchar(80),
  uch varchar(80),
  udcr timestamptz,
  udch timestamptz
}

create table trx_produk_whishlist (
  kode_whistlist serial primary key,
  kode_produk int4,
  ucr varchar(80)
);

create table ref_prod_detail_barang (
  kode_barang serial primary key,
  nama varchar(255),
}

create table trx_barang (
  kode_trx serial primary key,
  kode_barang int4
}

create table trx_pesanan (
  kode_kat_kontrak int4
}
