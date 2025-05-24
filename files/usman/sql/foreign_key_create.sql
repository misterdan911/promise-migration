COMMENT ON COLUMN "ref_menu1"."status" IS '0=sembunyi, 1=tampil';

COMMENT ON COLUMN "ref_menu2"."status" IS '0=sembunyi, 1=tampil';

COMMENT ON COLUMN "ref_menu3"."status" IS '0=sembunyi, 1=tampil';

COMMENT ON COLUMN "trx_group_menu"."akses" IS '0=tidak aktif, 1=aktif';

COMMENT ON COLUMN "trx_jabatan_struktural"."status_aktif" IS '0 = Tidak Aktif | 1 = Aktif';

ALTER TABLE "ref_aplikasi" ADD CONSTRAINT "ref_aplikasi_fk" FOREIGN KEY ("kode_metode_pengadaan") REFERENCES "ref_metode_pengadaan" ("kode_metode_pengadaan") ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE "ref_group" ADD CONSTRAINT "FK_ref_group_ref_level" FOREIGN KEY ("kode_level") REFERENCES "ref_level" ("kode_level");

ALTER TABLE "ref_menu1" ADD CONSTRAINT "FK_ref_menu1_ref_level" FOREIGN KEY ("kode_level") REFERENCES "ref_level" ("kode_level");

ALTER TABLE "ref_menu2" ADD CONSTRAINT "ref_menu2_ref_menu1_pkey" FOREIGN KEY ("kode_menu1") REFERENCES "ref_menu1" ("kode_menu1") ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE "ref_menu3" ADD CONSTRAINT "ref_menu3_ref_menu2_fkey" FOREIGN KEY ("kode_menu2") REFERENCES "ref_menu2" ("kode_menu2") ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE "ref_threeshold" ADD CONSTRAINT "ref_threeshold_jenis_pengadaan_fk" FOREIGN KEY ("kode_jenis_pengadaan") REFERENCES "ref_jenis_pengadaan" ("kode_jenis_pengadaan") ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE "ref_threeshold" ADD CONSTRAINT "ref_threeshold_metode_pengadaan_fk" FOREIGN KEY ("kode_metode_pengadaan") REFERENCES "ref_metode_pengadaan" ("kode_metode_pengadaan") ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE "ref_user_external" ADD CONSTRAINT "FK_ref_user_external_ref_user" FOREIGN KEY ("id_user") REFERENCES "ref_user" ("id") ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE "ref_user_internal" ADD CONSTRAINT "FK_ref_user_internal_ref_user" FOREIGN KEY ("id_user") REFERENCES "ref_user" ("id") ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE "trx_group_menu" ADD CONSTRAINT "FK_trx_group_menu_ref_group" FOREIGN KEY ("kode_group") REFERENCES "ref_group" ("kode_group");

ALTER TABLE "trx_group_user" ADD CONSTRAINT "FK_trx_group_user_ref_user" FOREIGN KEY ("id_user") REFERENCES "ref_user" ("id") ON DELETE CASCADE;

ALTER TABLE "trx_user_tampung" ADD CONSTRAINT "trx_user_tampung_ref_jabatan_fk" FOREIGN KEY ("kode_jabatan") REFERENCES "ref_jabatan" ("kode_jabatan") ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE "trx_user_tampung" ADD CONSTRAINT "trx_user_tampung_ref_unit_pbj_fk" FOREIGN KEY ("kode_unit_pbj") REFERENCES "ref_unit_pbj" ("kode_unit_pbj") ON DELETE CASCADE ON UPDATE CASCADE;
