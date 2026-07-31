create type skema_pembayaran as enum (
  'langsung',
  'kredit',
  'debit',
);

drop table if exists ref_status_perencanaan;
CREATE TABLE ref_status_perencanaan (
	kode_status_perencanaan int4 primary key,
	status varchar(255)
);

create table ref_perencanaan (
  kode_perencanaan serial primary key,
  kode_unit varchar,
  kode_metode_pengadaan int4, -- ref to db_usman.ref_metode_pengadaan
  id_user_ppk int4,
  -- id_user_pp int4,
  kode_rup int4,

  skema_pembayaran skema_pembayaran,

  -- kode_kat_kontrak_payung int4,
  -- jenis_aset jenis_aset,
  -- kode_uraian_kelompok int4,
  -- metode_pemesanan metode_pemesanan,

  -- kode_vendor int4,
  nama_paket varchar,
  -- kode_keranjang int4,
  kode_status_perencanaan int4,

  -- tgl_surat_pesanan timestamptz,
  -- nomor_surat_pesanan varchar,
  file_surat_keputusan varchar,
  encrypt_key_surat_keputusan varchar,

  -- kode_alamat_kirim int4,
  -- jenis_pembayaran jenis_pembayaran,
  --
  -- konfirmasi_terima_pesanan konfirmasi_terima_pesanan,
  -- alasan_tolak_pesanan text,

  ucr varchar,
  uch varchar,
  udcr timestamptz,
  udch timestamptz
);
