COMMENT ON COLUMN "ref_permintaan"."kode_unit" IS 'Supaya nyambung ke Unit di aplikasi HRIS';

COMMENT ON COLUMN "ref_permintaan"."kode_vendor" IS 'Ambil dari sidapet';

COMMENT ON COLUMN "ref_permintaan"."nama_paket" IS 'Tulis manual';

COMMENT ON COLUMN "ref_permintaan"."kode_jenis_pengadaan" IS 'Ambil dari usman';

COMMENT ON COLUMN "ref_permintaan"."kode_jenis_aset" IS 'Ambil dari E-Asset';

COMMENT ON COLUMN "ref_permintaan"."kode_uraian_klmpk" IS 'Ambil dari E-Asset';

COMMENT ON COLUMN "ref_permintaan"."file_kerangka_ak" IS 'Kerangka Acuan Kerja';

COMMENT ON COLUMN "ref_permintaan"."nilai_hps" IS 'Harga Pokok Satuan';

COMMENT ON COLUMN "ref_permintaan"."kode_rup" IS 'ambil dari sippan';

COMMENT ON COLUMN "trx_detail_permintaan"."kode_bmut" IS 'terintegrasi dengan e-asset';

COMMENT ON COLUMN "trx_detail_permintaan"."kode_ruang" IS 'terintegrasi dengan e-asset';

COMMENT ON COLUMN "trx_detail_permintaan"."deskripsi" IS 'Diisi kalau jenis Non-Barang';

COMMENT ON COLUMN "trx_detail_permintaan"."satuan" IS 'Diisi kalau jenis Non-Barang';

COMMENT ON COLUMN "trx_detail_permintaan"."harga" IS 'Harga satuan, akan terakumulasi ke field nilai_hps';

COMMENT ON COLUMN "trx_nego_harga"."tahapan" IS 'tahapan negosiasi';

COMMENT ON COLUMN "trx_nego_teknis"."tahapan" IS 'tahapan negosiasi';

ALTER TABLE "ref_dok_detail_transaksi" ADD CONSTRAINT "fk_proses_pajak_dok" FOREIGN KEY ("kode_proses_pajak") REFERENCES "trx_proses_pajak" ("kode_proses_pajak");

ALTER TABLE "ref_keluaran_proses_kontrak" ADD CONSTRAINT "fk_proses_kontrak_keluaran" FOREIGN KEY ("kode_proses_kontrak") REFERENCES "ref_proses_kontrak" ("kode_proses_kontrak");

ALTER TABLE "ref_permintaan" ADD CONSTRAINT "ref_permintaan_kode_jenis_kontrak_fkey" FOREIGN KEY ("kode_jenis_kontrak") REFERENCES "ref_jenis_kontrak" ("kode_jenis_kontrak");

ALTER TABLE "ref_permintaan" ADD CONSTRAINT "ref_permintaan_kode_skema_pembayaran_fkey" FOREIGN KEY ("kode_skema_pembayaran") REFERENCES "ref_skema_pembayaran" ("kode_skema_pembayaran");

ALTER TABLE "ref_permintaan" ADD CONSTRAINT "ref_permintaan_kode_status_permintaan_fkey" FOREIGN KEY ("kode_status_permintaan") REFERENCES "ref_status_permintaan" ("kode_status_permintaan");

ALTER TABLE "ref_proses_kontrak" ADD CONSTRAINT "FK_ref_proses_kontrak_ref_permintaan" FOREIGN KEY ("kode_permintaan") REFERENCES "ref_permintaan" ("kode_permintaan");

ALTER TABLE "ref_proses_kontrak" ADD CONSTRAINT "fk_status_kontrak" FOREIGN KEY ("kode_status_kontrak") REFERENCES "ref_status_kontrak" ("kode_status_kontrak");

ALTER TABLE "ref_proses_kontrak" ADD CONSTRAINT "fk_step_persiapan_kontrak" FOREIGN KEY ("kode_step_persiapan_kontrak") REFERENCES "ref_step_persiapan_kontrak" ("kode_step_persiapan_kontrak");

ALTER TABLE "trx_detail_permintaan" ADD CONSTRAINT "trx_detail_permintaan_kode_permintaan_fkey" FOREIGN KEY ("kode_permintaan") REFERENCES "ref_permintaan" ("kode_permintaan");

ALTER TABLE "trx_jangka_waktu" ADD CONSTRAINT "fk_proses_kontrak_jangka_waktu" FOREIGN KEY ("kode_proses_kontrak") REFERENCES "ref_proses_kontrak" ("kode_proses_kontrak");

ALTER TABLE "trx_jenis_laporan" ADD CONSTRAINT "fk_proses_kontrak" FOREIGN KEY ("kode_proses_kontrak") REFERENCES "ref_proses_kontrak" ("kode_proses_kontrak");

ALTER TABLE "trx_jenis_sispembayaran" ADD CONSTRAINT "fk_sistem_pembayaran" FOREIGN KEY ("kode_sistem_pembayaran") REFERENCES "trx_sistem_pembayaran" ("kode_sistem_pembayaran");

ALTER TABLE "trx_nego_harga" ADD CONSTRAINT "trx_nego_harga_kode_detail_permintaan_fkey" FOREIGN KEY ("kode_detail_permintaan") REFERENCES "trx_detail_permintaan" ("kode_detail_permintaan");

ALTER TABLE "trx_nego_teknis" ADD CONSTRAINT "trx_nego_teknis_kode_permintaan_fkey" FOREIGN KEY ("kode_permintaan") REFERENCES "ref_permintaan" ("kode_permintaan");

ALTER TABLE "trx_proses_pajak" ADD CONSTRAINT "fk_proses_kontrak_pajak" FOREIGN KEY ("kode_proses_kontrak") REFERENCES "ref_proses_kontrak" ("kode_proses_kontrak");

ALTER TABLE "trx_serah_terima" ADD CONSTRAINT "fk_proses_kontrak_serah_terima" FOREIGN KEY ("kode_proses_kontrak") REFERENCES "ref_proses_kontrak" ("kode_proses_kontrak");

ALTER TABLE "trx_serah_terima" ADD CONSTRAINT "fk_trx_jenis_sispembayaran" FOREIGN KEY ("kode_trx_jenis_sispembayaran") REFERENCES "trx_jenis_sispembayaran" ("kode_trx_jenis_sispembayaran");

ALTER TABLE "trx_sistem_pembayaran" ADD CONSTRAINT "fk_proses_kontrak_sispembayaran" FOREIGN KEY ("kode_proses_kontrak") REFERENCES "ref_proses_kontrak" ("kode_proses_kontrak");

ALTER TABLE "trx_tte" ADD CONSTRAINT "fk_permintaan" FOREIGN KEY ("kode_permintaan") REFERENCES "ref_permintaan" ("kode_permintaan") ON DELETE CASCADE;
