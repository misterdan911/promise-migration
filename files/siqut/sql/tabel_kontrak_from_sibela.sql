DROP TABLE IF EXISTS trx_serah_terima;
DROP TABLE IF EXISTS trx_proses_pajak;
DROP TABLE IF EXISTS trx_monitoring_new;
DROP TABLE IF EXISTS trx_jenis_laporan;
DROP TABLE IF EXISTS trx_jangka_waktu;
DROP TABLE IF EXISTS trx_keluaran_output_new;
DROP TABLE IF EXISTS trx_keluaran_output;
DROP TABLE IF EXISTS trx_dokumen_kontrak;
DROP TABLE IF EXISTS ref_bentuk_kontrak;
DROP TABLE IF EXISTS trx_bast_st;
DROP TABLE IF EXISTS trx_ba_pemeriksaan_st;
DROP TABLE IF EXISTS ref_ba_pemeriksaan_st;
DROP TABLE IF EXISTS ref_serah_terima;
DROP TABLE IF EXISTS ref_step_serah_terima;
DROP TABLE IF EXISTS trx_sptjm;
DROP TABLE IF EXISTS trx_penilaian_pembayaran;
DROP TABLE IF EXISTS ref_detail_aspek;
DROP TABLE IF EXISTS m_aspek;
DROP TABLE IF EXISTS trx_pembayaran;
DROP TABLE IF EXISTS trx_hasil_pajak;
DROP TABLE IF EXISTS trx_pajak;
DROP TABLE IF EXISTS trx_monitoring;
DROP TABLE IF EXISTS trx_kwitansi;
DROP TABLE IF EXISTS ref_keluaran_proses_kontrak;
DROP TABLE IF EXISTS trx_bast;
DROP TABLE IF EXISTS trx_ba_pemeriksaan;
DROP TABLE IF EXISTS ref_sptjm;
DROP TABLE IF EXISTS ref_ba_pemeriksaan;
DROP TABLE IF EXISTS trx_riwayat_pelaksanaan;
DROP TABLE IF EXISTS ref_step_riwayat_pelaksanaan;
DROP TABLE IF EXISTS ref_riwayat_pelaksanaan;
DROP TABLE IF EXISTS trx_jenis_sispembayaran;
DROP TABLE IF EXISTS trx_sistem_pembayaran;
DROP TABLE IF EXISTS trx_petugas_aktivitas;
DROP TABLE IF EXISTS trx_aktivitas;
DROP TYPE IF EXISTS sumber_dokumen;
DROP TABLE IF EXISTS ref_bentuk_dok_aktivitas;
DROP TABLE IF EXISTS ref_nama_aktivitas;
DROP TABLE IF EXISTS ref_proses_kontrak;
DROP TABLE IF EXISTS ref_step_persiapan_kontrak;
DROP TABLE IF EXISTS ref_status_kontrak;
DROP TABLE IF EXISTS trx_tte;
DROP TYPE IF EXISTS kategori_tte;


DROP TYPE IF EXISTS kategori_tte;
CREATE TYPE kategori_tte AS ENUM (
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

DROP TABLE IF EXISTS trx_tte;
CREATE TABLE trx_tte (
	kode_tte serial PRIMARY KEY,
	kode_trx_penandatangan int4 NULL,
	kode_perencanaan int4 NOT NULL,
	kategori_tte kategori_tte NOT NULL,
	path_dokumen varchar NULL,
	path_dokumen_selesai varchar NULL,
	tgl_selesai timestamp(6) NULL,
	nomor_surat varchar NULL
);
ALTER TABLE trx_tte ADD CONSTRAINT trx_tte_kode_perencanaan_fkey
FOREIGN KEY (kode_perencanaan) REFERENCES ref_perencanaan (kode_perencanaan) ON DELETE CASCADE;


DROP TABLE IF EXISTS ref_status_kontrak;
CREATE TABLE ref_status_kontrak (
	kode_status_kontrak serial PRIMARY KEY,
	nama_status_kontrak varchar NOT NULL,
	kategori_status_kontrak varchar NOT NULL,
	urutan_status_kontrak int2 NULL
);

INSERT INTO ref_status_kontrak (kode_status_kontrak, nama_status_kontrak, kategori_status_kontrak, urutan_status_kontrak) VALUES
(1, 'Aktivitas & SPPBJ', 'proses', 1),
(2, 'Persiapan Kontrak', 'proses', 2),
(3, 'Dokumen kontrak', 'proses', 3),
(4, 'Riwayat Pelaksanaan', 'proses', 4),
(5, 'Serah Terima', 'proses', 5),
(6, 'Penilaian Kinerja Penyedia', 'selesai', 6);



DROP TABLE IF EXISTS ref_step_persiapan_kontrak;
CREATE TABLE ref_step_persiapan_kontrak (
	kode_step_persiapan_kontrak serial PRIMARY KEY,
	nama_step_persiapan_kontrak varchar NOT NULL,
	status_aktif int2 DEFAULT 1 NOT NULL,
	urutan int2 NULL
);

INSERT INTO ref_step_persiapan_kontrak (kode_step_persiapan_kontrak, nama_step_persiapan_kontrak, status_aktif, urutan) VALUES
(1, 'Pelaporan', 1, 1),
(2, 'Pembayaran', 1, 2),
(3, 'Jangka Waktu', 1, 3),
(4, 'Keluaran', 1, 4),
(5, 'Serah Terima', 1, 5),
(6, 'selesai', 1, 6);

DROP TABLE IF EXISTS ref_proses_kontrak;
CREATE TABLE ref_proses_kontrak (
	kode_proses_kontrak serial PRIMARY KEY,
	kode_perencanaan int4 NOT NULL,
	kode_status_kontrak int4 NOT NULL,
	kode_step_persiapan_kontrak int4 NULL,
	ucr varchar NOT NULL,
	uch varchar NULL,
	udcr timestamp(6) DEFAULT CURRENT_TIMESTAMP NULL,
	udch timestamp(6) DEFAULT CURRENT_TIMESTAMP NULL,
	status_pengisian varchar NULL
);
ALTER TABLE ref_proses_kontrak ADD CONSTRAINT ref_proses_kontrak_kode_perencanaan_fkey
FOREIGN KEY (kode_perencanaan) REFERENCES ref_perencanaan (kode_perencanaan) ON DELETE CASCADE;

ALTER TABLE ref_proses_kontrak ADD CONSTRAINT ref_proses_kontrak_kode_status_kontrak_fkey
FOREIGN KEY (kode_status_kontrak) REFERENCES ref_status_kontrak (kode_status_kontrak) ON DELETE CASCADE;

ALTER TABLE ref_proses_kontrak ADD CONSTRAINT ref_proses_kontrak_kode_step_persiapan_kontrak_fkey
FOREIGN KEY (kode_step_persiapan_kontrak) REFERENCES ref_step_persiapan_kontrak (kode_step_persiapan_kontrak) ON DELETE CASCADE;



DROP TABLE IF EXISTS ref_nama_aktivitas;
CREATE TABLE ref_nama_aktivitas (
	kode_nama_aktivitas int4 PRIMARY KEY,
	nama_aktivitas varchar(100)
);

INSERT INTO ref_nama_aktivitas (kode_nama_aktivitas, nama_aktivitas) VALUES
(1, 'Rapat Persiapan Penerbitan SPPBJ'),
(2, 'Rapat Persiapan Penandatanganan Kontrak '),
(3, 'Rapat Persiapan Pelaksanaan Kontrak'),
(4, 'Rapat Serah Terima Lokasi Pekerjaan ');


DROP TABLE IF EXISTS ref_bentuk_dok_aktivitas; 
CREATE TABLE ref_bentuk_dok_aktivitas (
	kode_bentuk_dok int4 PRIMARY KEY,
	bentuk_dok varchar(50)
);

INSERT INTO ref_bentuk_dok_aktivitas (kode_bentuk_dok, bentuk_dok) VALUES
(1, 'Risalah rapat'),
(2, 'Berita Acara');


DROP TYPE IF EXISTS sumber_dokumen;
CREATE TYPE sumber_dokumen AS ENUM (
	'unggah',
	'dari_sistem'
);

DROP TABLE IF EXISTS trx_aktivitas; 
CREATE TABLE trx_aktivitas (
	kode_aktivitas serial PRIMARY KEY,
	kode_proses_kontrak int4 NOT NULL,
	kode_nama_aktivitas int4,
	tgl_aktivitas date,
	kode_bentuk_dok int4,
	sumber_dokumen sumber_dokumen,
	kode_tte_aktivitas int4,
	pembuka text,
	isi text,
	penutup text,
	tgl_sppbj date,
	isi_sppbj text,
	kode_tte_sppbj int4,
	file_s_jaminan_pelaksanaan varchar(255)
);
COMMENT ON COLUMN trx_aktivitas.sumber_dokumen IS 'unggah, dari_sistem';


DROP TABLE IF EXISTS trx_petugas_aktivitas; 
CREATE TABLE trx_petugas_aktivitas(
	kode_petugas serial PRIMARY KEY,
	is_internal bool,
	id int4,
	nip varchar(40),
	nama varchar(255),
	jabatan varchar(255),
	email varchar(100)
);




DROP TYPE IF EXISTS kategori_sispembayaran;
CREATE TYPE kategori_sispembayaran AS ENUM (
	'sekaligus',
	'termin'
);

DROP TABLE IF EXISTS trx_sistem_pembayaran; 
CREATE TABLE trx_sistem_pembayaran (
	kode_sistem_pembayaran serial PRIMARY KEY,
	kode_proses_kontrak int4 NOT NULL,
	jenis_pembayaran varchar NOT NULL,
	kategori_sispembayaran kategori_sispembayaran NULL,
	ucr varchar NOT NULL,
	uch varchar NULL,
	udcr timestamp(6) DEFAULT CURRENT_TIMESTAMP NULL,
	udch timestamp(6) DEFAULT CURRENT_TIMESTAMP NULL,
	CONSTRAINT trx_sistem_pembayaran_kode_proses_kontrak_fkey FOREIGN KEY (kode_proses_kontrak) REFERENCES ref_proses_kontrak(kode_proses_kontrak)
);

DROP TABLE IF EXISTS trx_jenis_sispembayaran;
CREATE TABLE trx_jenis_sispembayaran (
	kode_trx_jenis_sispembayaran serial PRIMARY KEY,
	kode_sistem_pembayaran int4 NOT NULL,
	nama_sispembayaran varchar NOT NULL,
	persentase numeric NOT NULL,
	nilai_rupiah numeric NOT NULL,
	status_sispembayaran int2 DEFAULT 1 NULL,
	CONSTRAINT trx_jenis_sispembayaran_kode_sistem_pembayaran_fkey FOREIGN KEY (kode_sistem_pembayaran) REFERENCES trx_sistem_pembayaran(kode_sistem_pembayaran) ON DELETE CASCADE ON UPDATE CASCADE
);

DROP TABLE IF EXISTS ref_riwayat_pelaksanaan;
CREATE TABLE ref_riwayat_pelaksanaan (
	kode_riwayat_pelaksanaan serial PRIMARY KEY,
	kode_proses_kontrak int4 NOT NULL,
	kode_trx_jenis_sispembayaran int4 NOT NULL,
	status_riwayat_pelaksanaan varchar DEFAULT 'proses'::character varying NULL,
	ucr varchar NOT NULL,
	uch varchar NULL,
	udcr timestamp(6) DEFAULT CURRENT_TIMESTAMP NULL,
	udch timestamp(6) DEFAULT CURRENT_TIMESTAMP NULL,
	CONSTRAINT ref_riwayat_pelaksanaan_kode_proses_kontrak_fkey FOREIGN KEY (kode_proses_kontrak) REFERENCES ref_proses_kontrak(kode_proses_kontrak),
	CONSTRAINT ref_riwayat_pelaksanaan_kode_trx_jenis_sispembayaran_fkey FOREIGN KEY (kode_trx_jenis_sispembayaran) REFERENCES trx_jenis_sispembayaran(kode_trx_jenis_sispembayaran)
);

DROP TABLE IF EXISTS ref_step_riwayat_pelaksanaan;
CREATE TABLE ref_step_riwayat_pelaksanaan (
	kode_step_riwayat_pelaksanaan int4 PRIMARY KEY,
	step_riwayat_pelaksanaan varchar NOT NULL,
	kategori_step varchar NOT NULL,
	urutan int2 NOT NULL,
	keterangan_step varchar NOT NULL
);

DROP TABLE IF EXISTS trx_riwayat_pelaksanaan;
CREATE TABLE trx_riwayat_pelaksanaan (
	kode_trx_riwayat_pelaksanaan serial PRIMARY KEY,
	kode_riwayat_pelaksanaan int4 NOT NULL,
	kode_step_riwayat_pelaksanaan int4 NOT NULL,
	status_step varchar DEFAULT 'belum diisi'::character varying NULL,
	ucr varchar NOT NULL,
	uch varchar NULL,
	udcr timestamp(6) DEFAULT CURRENT_TIMESTAMP NULL,
	udch timestamp(6) DEFAULT CURRENT_TIMESTAMP NULL,
	CONSTRAINT trx_riwayat_pelaksanaan_kode_riwayat_pelaksanaan_fkey FOREIGN KEY (kode_riwayat_pelaksanaan) REFERENCES ref_riwayat_pelaksanaan(kode_riwayat_pelaksanaan),
	CONSTRAINT trx_riwayat_pelaksanaan_kode_step_riwayat_pelaksanaan_fkey FOREIGN KEY (kode_step_riwayat_pelaksanaan) REFERENCES ref_step_riwayat_pelaksanaan(kode_step_riwayat_pelaksanaan)
);


DROP TABLE IF EXISTS ref_ba_pemeriksaan;
CREATE TABLE ref_ba_pemeriksaan (
	kode_ba_pemerikasaan serial PRIMARY KEY,
	kode_trx_riwayat_pelaksanaan int4 NOT NULL,
	kode_tte int4 NOT NULL,
	tanggal_bap timestamp(6) NULL,
	denda numeric NULL,
	dok_hasil_pekerjaan varchar NULL,
	catatan text NULL,
	nama_pemeriksa varchar NULL,
	ucr varchar NULL,
	uch varchar NULL,
	udcr timestamp(6) DEFAULT CURRENT_TIMESTAMP NULL,
	udch timestamp(6) DEFAULT CURRENT_TIMESTAMP NULL,
	CONSTRAINT "ref_ba_pemeriksaan_kode_tte_fkey" FOREIGN KEY (kode_tte) REFERENCES trx_tte(kode_tte),
	CONSTRAINT ref_ba_pemeriksaan_kode_trx_riwayat_pelaksanaan_fkey FOREIGN KEY (kode_trx_riwayat_pelaksanaan) REFERENCES trx_riwayat_pelaksanaan(kode_trx_riwayat_pelaksanaan)
);

DROP TABLE IF EXISTS ref_sptjm;
CREATE TABLE ref_sptjm (
	kode_sptjm serial PRIMARY KEY,
	kode_trx_riwayat_pelaksanaan int4 NOT NULL,
	nama_bank varchar NULL,
	nominal_jaminan numeric NULL,
	ucr varchar NOT NULL,
	uch varchar NULL,
	udcr timestamp(6) DEFAULT CURRENT_TIMESTAMP NULL,
	udch timestamp(6) DEFAULT CURRENT_TIMESTAMP NULL,
	dokumen_jaminan varchar NULL,
	status_button_tte bool DEFAULT true NULL,
	CONSTRAINT ref_sptjm_kode_trx_riwayat_pelaksanaan_fkey FOREIGN KEY (kode_trx_riwayat_pelaksanaan) REFERENCES trx_riwayat_pelaksanaan(kode_trx_riwayat_pelaksanaan)
);


DROP TABLE IF EXISTS trx_ba_pemeriksaan;
CREATE TABLE trx_ba_pemeriksaan (
	kode_trx_ba_pemeriksaan serial PRIMARY KEY,
	kode_trx_riwayat_pelaksanaan int4 NOT NULL,
	ketentuan text NOT NULL,
	konfirmasi bool NOT NULL,
	nip_pemeriksa varchar NOT NULL,
	nama_pemeriksa varchar NOT NULL,
	ucr varchar NOT NULL,
	uch varchar NULL,
	udcr timestamp(6) DEFAULT CURRENT_TIMESTAMP NULL,
	udch timestamp(6) DEFAULT CURRENT_TIMESTAMP NULL,
	CONSTRAINT trx_ba_pemeriksaan_kode_trx_riwayat_pelaksanaan_fkey FOREIGN KEY (kode_trx_riwayat_pelaksanaan) REFERENCES trx_riwayat_pelaksanaan(kode_trx_riwayat_pelaksanaan)
);


DROP TABLE IF EXISTS trx_bast;
CREATE TABLE trx_bast (
	kode_bast serial PRIMARY KEY,
	kode_trx_riwayat_pelaksanaan int4 NOT NULL,
	kode_tte int4 NOT NULL,
	ucr varchar NOT NULL,
	uch varchar NULL,
	udcr timestamp(6) DEFAULT CURRENT_TIMESTAMP NULL,
	udch timestamp(6) DEFAULT CURRENT_TIMESTAMP NULL,
	tgl_surat timestamp(6) NULL,
	CONSTRAINT "trx_bast_kode_trx_riwayat_pelaksanaan_fkey" FOREIGN KEY (kode_trx_riwayat_pelaksanaan) REFERENCES trx_riwayat_pelaksanaan(kode_trx_riwayat_pelaksanaan)
);


DROP TABLE IF EXISTS ref_keluaran_proses_kontrak;
CREATE TABLE ref_keluaran_proses_kontrak (
	kode_keluaran serial PRIMARY KEY,
	kode_proses_kontrak int4 NOT NULL,
	keluaran varchar NOT NULL,
	ucr varchar NOT NULL,
	uch varchar NULL,
	udcr timestamp(6) DEFAULT CURRENT_TIMESTAMP NULL,
	udch timestamp(6) DEFAULT CURRENT_TIMESTAMP NULL,
	status_aktif int2 DEFAULT '1'::smallint NOT NULL,
	CONSTRAINT ref_keluaran_proses_kontrak_kode_proses_kontrak_fkey FOREIGN KEY (kode_proses_kontrak) REFERENCES ref_proses_kontrak(kode_proses_kontrak)
);
CREATE INDEX idx_ref_keluaran_proses_kontrak_kode_proses_kontrak ON ref_keluaran_proses_kontrak USING btree (kode_proses_kontrak);

DROP TABLE IF EXISTS trx_keluaran_output;
CREATE TABLE trx_keluaran_output (
	kode_keluaran_output serial PRIMARY KEY,
	kode_trx_riwayat_pelaksanaan int4 NOT NULL,
	kode_keluaran int4 NOT NULL,
	path_dokumen varchar NULL,
	key_pass varchar NULL,
	verifikasi_keluaran_output bool NULL,
	ucr varchar NOT NULL,
	uch varchar NULL,
	udcr timestamp(6) DEFAULT CURRENT_TIMESTAMP NULL,
	udch timestamp(6) DEFAULT CURRENT_TIMESTAMP NULL,
	CONSTRAINT trx_keluaran_output_kode_keluaran_fkey FOREIGN KEY (kode_keluaran) REFERENCES ref_keluaran_proses_kontrak(kode_keluaran),
	CONSTRAINT trx_keluaran_output_kode_trx_riwayat_pelaksanaan_fkey FOREIGN KEY (kode_trx_riwayat_pelaksanaan) REFERENCES trx_riwayat_pelaksanaan(kode_trx_riwayat_pelaksanaan)
);
CREATE INDEX idx_trx_keluaran_output_kode_keluaran ON trx_keluaran_output USING btree (kode_keluaran);
CREATE INDEX idx_trx_keluaran_output_kode_trx_riwayat_pelaksanaan ON trx_keluaran_output USING btree (kode_trx_riwayat_pelaksanaan);


DROP TABLE IF EXISTS trx_kwitansi;
CREATE TABLE trx_kwitansi (
	kode_kwitansi serial PRIMARY KEY,
	kode_trx_riwayat_pelaksanaan int4 NOT NULL,
	nomor_kwitansi varchar NULL,
	nama_dok_kwitansi varchar NULL,
	nama_dok_kwitansi_selesai varchar NULL,
	kategori_input varchar NULL,
	ucr varchar NOT NULL,
	uch varchar NULL,
	udcr timestamp(6) DEFAULT CURRENT_TIMESTAMP NULL,
	udch timestamp(6) DEFAULT CURRENT_TIMESTAMP NULL,
	nama_uploader varchar NULL,
	tanggal_kwitansi timestamp(6) NULL,
	CONSTRAINT trx_kwitansi_kode_trx_riwayat_pelaksanaan_fkey FOREIGN KEY (kode_trx_riwayat_pelaksanaan) REFERENCES trx_riwayat_pelaksanaan(kode_trx_riwayat_pelaksanaan)
);
CREATE INDEX idx_trx_kwitansi_kode_trx_riwayat_pelaksanaan ON trx_kwitansi USING btree (kode_trx_riwayat_pelaksanaan);


DROP TABLE IF EXISTS trx_monitoring;
CREATE TABLE trx_monitoring (
	kode_monitoring serial PRIMARY KEY,
	kode_trx_riwayat_pelaksanaan int4 NOT NULL,
	nama_progres varchar NOT NULL,
	output_progres varchar NOT NULL,
	dokumen_output_progres varchar NULL,
	catatan text NULL,
	evaluasi text NULL,
	pengendalian text NULL,
	dokumen_lainnya varchar NULL,
	ucr varchar NOT NULL,
	uch varchar NULL,
	udcr timestamp(6) DEFAULT CURRENT_TIMESTAMP NULL,
	udch timestamp(6) DEFAULT CURRENT_TIMESTAMP NULL,
	CONSTRAINT trx_monitoring_kode_trx_riwayat_pelaksanaan_fkey FOREIGN KEY (kode_trx_riwayat_pelaksanaan) REFERENCES trx_riwayat_pelaksanaan(kode_trx_riwayat_pelaksanaan)
);
CREATE INDEX idx_trx_monitoring_kode_trx_riwayat_pelaksanaan ON trx_monitoring USING btree (kode_trx_riwayat_pelaksanaan);


DROP TYPE IF EXISTS kategori_nilai_transaksi;
CREATE TYPE kategori_nilai_transaksi AS ENUM (
	'nilai_kontrak',
	'management_fee'
);

DROP TABLE IF EXISTS trx_pajak;
CREATE TABLE trx_pajak (
	kode_pajak serial PRIMARY KEY,
	kode_trx_riwayat_pelaksanaan int4 NULL,
	kategori_nilai_transaksi kategori_nilai_transaksi NULL,
	manajemen_fee numeric NULL,
	nilai_transaksi numeric NULL,
	jenis_mata_uang varchar NULL,
	kurs_asing numeric NULL,
	kurs_bank numeric NULL,
	kurs_kmk numeric NULL,
	tax_treaty numeric NULL,
	kode_jenis_transaksi int4 NULL,
	jenis_transaksi varchar NULL,
	kode_objek_pajak varchar NULL,
	objek_pajak varchar NULL,
	kode_detail_transaksi int4 NULL,
	detail_transaksi varchar NULL,
	ucr varchar NULL,
	uch varchar NULL,
	udcr timestamp(6) DEFAULT CURRENT_TIMESTAMP NULL,
	udch timestamp(6) DEFAULT CURRENT_TIMESTAMP NULL,
	nama_dok_efaktur varchar NULL,
	nomor_efaktur varchar NULL,
	tanggal_efaktur timestamp(6) NULL,
	nama_tabel_lama varchar(20) NULL,
	id_sptb int4 NULL,
	biaya_tak_kena_pajak numeric NULL,
	kode_jenis_layanan int4 NULL,
	CONSTRAINT trx_pajak_kode_trx_riwayat_pelaksanaan_fkey FOREIGN KEY (kode_trx_riwayat_pelaksanaan) REFERENCES trx_riwayat_pelaksanaan(kode_trx_riwayat_pelaksanaan)
);
CREATE INDEX idx_trx_pajak_kode_trx_riwayat_pelaksanaan ON trx_pajak USING btree (kode_trx_riwayat_pelaksanaan);


DROP TABLE IF EXISTS trx_hasil_pajak;
CREATE TABLE trx_hasil_pajak (
	id_hasil_pajak serial PRIMARY KEY,
	kode_pajak int4 NOT NULL,
	kategori_pajak varchar NULL,
	nama_formula varchar NULL,
	formula varchar NULL,
	nilai_persentase_formula int4 NULL,
	perhitungan_formula varchar NULL,
	hasil numeric NULL,
	id_sptb_pl int4 NULL,
	kategori varchar(50) NULL,
	nilai float4 NULL,
	CONSTRAINT trx_hasil_pajak_kode_pajak_fkey FOREIGN KEY (kode_pajak) REFERENCES trx_pajak(kode_pajak) ON DELETE CASCADE ON UPDATE CASCADE
);
CREATE INDEX idx_trx_hasil_pajak_kode_pajak ON trx_hasil_pajak USING btree (kode_pajak);


-- sampai sini

DROP TABLE IF EXISTS trx_pembayaran;
CREATE TABLE trx_pembayaran (
	kode_trx_pencarian serial PRIMARY KEY,
	kode_trx_riwayat_pelaksanaan int4 NOT NULL,
	kode_tte int4 NULL,
	tgl_surat_spp timestamp(6) NULL,
	tgl_surat_sptjb timestamp(6) NULL,
	tgl_surat_srk timestamp(6) NULL,
	no_surat_spp varchar NOT NULL,
	no_surat_sptjb varchar NOT NULL,
	no_surat_srk varchar NOT NULL,
	ucr varchar NOT NULL,
	uch varchar NULL,
	udcr timestamp(6) DEFAULT CURRENT_TIMESTAMP NULL,
	udch timestamp(6) DEFAULT CURRENT_TIMESTAMP NULL,
	kode_permintaan_pencairan int4 NULL,
	status_pengusulan varchar NULL,
	CONSTRAINT trx_pembayaran_kode_trx_riwayat_pelaksanaan_fkey FOREIGN KEY (kode_trx_riwayat_pelaksanaan) REFERENCES trx_riwayat_pelaksanaan(kode_trx_riwayat_pelaksanaan)
);
CREATE INDEX idx_trx_pembayaran_kode_trx_riwayat_pelaksanaan ON trx_pembayaran USING btree (kode_trx_riwayat_pelaksanaan);


DROP TABLE IF EXISTS m_aspek;
CREATE TABLE m_aspek (
	kode_aspek bpchar(1) NOT NULL,
	nama_aspek varchar NOT NULL,
	ucr varchar NOT NULL,
	uch varchar NULL,
	udcr timestamp(6) DEFAULT CURRENT_TIMESTAMP NULL,
	udch timestamp(6) DEFAULT CURRENT_TIMESTAMP NULL,
	CONSTRAINT m_aspek_pkey PRIMARY KEY (kode_aspek)
);

INSERT INTO m_aspek (kode_aspek, nama_aspek, ucr, uch, udcr, udch) VALUES
('A', 'Aspek Kualitas dan Kuantitas', '-', NULL, '2025-08-11 03:40:02.664', '2025-08-11 03:40:02.664'),
('B', 'Aspek Biaya', '-', NULL, '2025-08-11 03:40:13.904', '2025-08-11 03:40:13.904'),
('C', 'Aspek Waktu', '-', NULL, '2025-08-11 03:40:26.347', '2025-08-11 03:40:26.347'),
('D', 'Aspek Layanan', '-', NULL, '2025-08-11 03:40:40.334', '2025-08-11 03:40:40.334'),
('E', 'SMKK', '-', NULL, '2025-08-11 03:40:52.750', '2025-08-11 03:40:52.750');



DROP TABLE IF EXISTS ref_detail_aspek;
CREATE TABLE ref_detail_aspek (
	kode_detail_aspek serial PRIMARY KEY,
	kode_aspek bpchar(1) NOT NULL,
	nama_detail_aspek varchar NOT NULL,
	kategori_detail_aspek varchar NOT NULL,
	ucr varchar NOT NULL,
	uch varchar NULL,
	udcr timestamp(6) DEFAULT CURRENT_TIMESTAMP NULL,
	udch timestamp(6) DEFAULT CURRENT_TIMESTAMP NULL,
	CONSTRAINT ref_detail_aspek_kode_aspek_fkey FOREIGN KEY (kode_aspek) REFERENCES m_aspek(kode_aspek)
);
CREATE INDEX idx_ref_detail_aspek_kode_aspek ON ref_detail_aspek USING btree (kode_aspek);

INSERT INTO ref_detail_aspek (kode_detail_aspek, kode_aspek, nama_detail_aspek, kategori_detail_aspek, ucr, uch, udcr, udch) VALUES
(2, 'A', 'Kemampuan project manager (PM) dan kecakapan', 'konstruksi', '-', NULL, '2025-08-11 03:43:01.328', '2025-08-11 03:43:01.328'),
(3, 'A', 'Kualitas hasil pekerjaan', 'konstruksi', '-', NULL, '2025-08-11 03:43:08.602', '2025-08-11 03:43:08.602'),
(4, 'A', 'Volume/jumlah item pekerjaan sesuai antara di kontrak dan pelaksanaan', 'konstruksi', '-', NULL, '2025-08-11 03:43:16.588', '2025-08-11 03:43:16.588'),
(5, 'A', 'Kemampuan Manajemen Material', 'konstruksi', '-', NULL, '2025-08-11 03:43:22.684', '2025-08-11 03:43:22.684'),
(7, 'A', 'Kemampuan manajemen Peralatan', 'konstruksi', '-', NULL, '2025-08-11 03:43:38.392', '2025-08-11 03:43:38.392'),
(8, 'A', 'Kesesuaian standar atau spesifikasi kontrak dengan lapangan', 'konstruksi', '-', NULL, '2025-08-11 03:43:45.392', '2025-08-11 03:43:45.392'),
(9, 'A', 'Penerapan Sistem Manajemen Mutu pada pelaksanaan pekerjaan', 'konstruksi', '-', NULL, '2025-08-11 03:43:53.175', '2025-08-11 03:43:53.175'),
(10, 'A', 'Kecocokan metode pelaksanaan pekerjaan', 'konstruksi', '-', NULL, '2025-08-11 03:44:01.089', '2025-08-11 03:44:01.089'),
(11, 'A', 'Ketepatan dalam memilih subkontraktor dan supplier', 'konstruksi', '-', NULL, '2025-08-11 03:44:08.160', '2025-08-11 03:44:08.160'),
(12, 'B', 'Kesesuaian nilai awal dengan realisasi akhir', 'konstruksi', '-', NULL, '2025-08-11 03:44:21.635', '2025-08-11 03:44:21.635'),
(13, 'B', 'Kemudahan/kecepatan proses penyelesaian penagihan', 'konstruksi', '-', NULL, '2025-08-11 03:44:28.068', '2025-08-11 03:44:28.068'),
(14, 'C', 'Ketepatan waktu selama masa pelaksanaan', 'konstruksi', '-', NULL, '2025-08-11 03:44:38.177', '2025-08-11 03:44:38.177'),
(15, 'D', 'Kecepatan dan penanganan Respon penyedia terhadap pengguna jasa (PPK, PP, Tim Teknis dst)', 'konstruksi', '-', NULL, '2025-08-11 03:44:49.439', '2025-08-11 03:44:49.439'),
(16, 'D', 'Kualitas pengerjaan dokumen administrasi', 'konstruksi', '-', NULL, '2025-08-11 03:44:58.920', '2025-08-11 03:44:58.920'),
(17, 'D', 'Kolaboratif/ semangat kerja sama dalam tim', 'konstruksi', '-', NULL, '2025-08-11 03:45:05.435', '2025-08-11 03:45:05.435'),
(18, 'D', 'Proaktif dalam penyelesaian masalah', 'konstruksi', '-', NULL, '2025-08-11 03:45:12.985', '2025-08-11 03:45:12.985'),
(19, 'E', 'Kepedulian/kesadaran terhadap permasalahan lingkungan hidup', 'konstruksi', '-', NULL, '2025-08-11 03:46:04.124', '2025-08-11 03:46:04.124'),
(20, 'E', 'Kebersihan dan kerapihan dilapangan selama masa konstruksi', 'konstruksi', '-', NULL, '2025-08-11 03:46:14.600', '2025-08-11 03:46:14.600'),
(21, 'E', 'Penyusunan dan Pelaksanaan Rencana Keselamatan Konstruksi (RKK)', 'konstruksi', '-', NULL, '2025-08-11 03:46:22.683', '2025-08-11 03:46:22.683'),
(22, 'E', 'Penyusunan dan Pelaksanaan Rencana Mutu Pekerjaan Konstruksi (RMPK)', 'konstruksi', '-', NULL, '2025-08-11 03:46:29.109', '2025-08-11 03:46:29.109'),
(23, 'E', 'Penyusunan dan Pelaksanaan Program Mutu', 'konstruksi', '-', NULL, '2025-08-11 03:46:36.029', '2025-08-11 03:46:36.029'),
(24, 'E', 'Penyusunan dan Pelaksanaan Rencana Manajemen Lalu Lintas Pekerjaan (RMLLP)', 'konstruksi', '-', NULL, '2025-08-11 03:46:45.354', '2025-08-11 03:46:45.354'),
(6, 'A', 'Kemampuan manajemen personil Manajerial dan lapangan', 'konstruksi', '-', NULL, '2025-08-11 03:43:29.706', '2025-08-11 03:43:29.706'),
(1, 'A', 'Pemahaman penyedia terhadap kontrak, lingkup pekerjaan, dan spesifikasi teknis', 'konstruksi', '-', NULL, '2025-08-11 03:42:51.728', '2025-08-11 03:42:51.728'),
(25, 'A', 'Pemahaman penyedia terhadap kontrak dan spesifikasi', 'lainnya', '-', NULL, '2025-08-11 03:52:40.009', '2025-08-11 03:52:40.009'),
(26, 'A', 'Kemampuan project manager/team leader dan kecakapan', 'lainnya', '-', NULL, '2025-08-11 03:52:49.396', '2025-08-11 03:52:49.396'),
(27, 'A', 'Kualitas hasil pekerjaan', 'lainnya', '-', NULL, '2025-08-11 03:52:54.928', '2025-08-11 03:52:54.928'),
(28, 'A', 'Volume/jumlah item pekerjaan sesuai antara di kontrak dan pelaksanaan', 'lainnya', '-', NULL, '2025-08-11 03:53:01.418', '2025-08-11 03:53:01.418'),
(29, 'A', 'Kemampuan manajemen dan metodologi pelaksanaan', 'lainnya', '-', NULL, '2025-08-11 03:53:07.430', '2025-08-11 03:53:07.430'),
(30, 'A', 'Kemampuan manajemen personil', 'lainnya', '-', NULL, '2025-08-11 03:53:14.003', '2025-08-11 03:53:14.003'),
(31, 'A', 'Kesesuaian standar atau spesifikasi kontrak dengan lapangan', 'lainnya', '-', NULL, '2025-08-11 03:53:24.359', '2025-08-11 03:53:24.359'),
(32, 'A', 'Penerapan Sistem Manajemen Mutu pada pelaksanaan pekerjaan', 'lainnya', '-', NULL, '2025-08-11 03:53:35.780', '2025-08-11 03:53:35.780'),
(33, 'B', 'Kesesuaian nilai awal dengan realisasi akhir', 'lainnya', '-', NULL, '2025-08-11 03:53:48.435', '2025-08-11 03:53:48.435'),
(34, 'B', 'Kemudahan/kecepatan proses penyelesaian penagihan', 'lainnya', '-', NULL, '2025-08-11 03:53:55.115', '2025-08-11 03:53:55.115'),
(35, 'C', 'Ketepatan waktu selama masa pelaksanaan', 'lainnya', '-', NULL, '2025-08-11 03:54:06.874', '2025-08-11 03:54:06.874'),
(36, 'D', 'Kecepatan dan penanganan Respon penyedia terhadap pengguna jasa (PPK, PP, Tim Teknis dst)', 'lainnya', '-', NULL, '2025-08-11 03:54:19.775', '2025-08-11 03:54:19.775'),
(37, 'D', 'Kualitas pengerjaan dokumen administrasi', 'lainnya', '-', NULL, '2025-08-11 03:54:26.174', '2025-08-11 03:54:26.174'),
(38, 'D', 'Kolaboratif/ semangat kerja sama dalam tim', 'lainnya', '-', NULL, '2025-08-11 03:54:32.856', '2025-08-11 03:54:32.856'),
(39, 'D', 'Proaktif	dalam penyelesaian masalah', 'lainnya', '-', NULL, '2025-08-11 03:54:39.715', '2025-08-11 03:54:39.715');




DROP TABLE IF EXISTS trx_penilaian_pembayaran;
CREATE TABLE trx_penilaian_pembayaran (
	kode_penilaian_pembayaran serial PRIMARY KEY,
	kode_trx_riwayat_pelaksanaan int4 NOT NULL,
	kode_detail_aspek int4 NOT NULL,
	nilai int2 NULL,
	tgl_penilaian timestamp(6) NOT NULL,
	ucr varchar NOT NULL,
	uch varchar NULL,
	udcr timestamp(6) DEFAULT CURRENT_TIMESTAMP NULL,
	udch timestamp(6) DEFAULT CURRENT_TIMESTAMP NULL,
	CONSTRAINT trx_penilaian_pembayaran_kode_detail_aspek_fkey FOREIGN KEY (kode_detail_aspek) REFERENCES ref_detail_aspek(kode_detail_aspek),
	CONSTRAINT trx_penilaian_pembayaran_kode_trx_riwayat_pelaksanaan_fkey FOREIGN KEY (kode_trx_riwayat_pelaksanaan) REFERENCES trx_riwayat_pelaksanaan(kode_trx_riwayat_pelaksanaan)
);
CREATE INDEX idx_trx_penilaian_pembayaran_kode_detail_aspek ON trx_penilaian_pembayaran USING btree (kode_detail_aspek);
CREATE INDEX idx_trx_penilaian_pembayaran_kode_trx_riwayat_pelaksanaan ON trx_penilaian_pembayaran USING btree (kode_trx_riwayat_pelaksanaan);



DROP TABLE IF EXISTS trx_sptjm;
CREATE TABLE trx_sptjm (
	kode_trx_sptjm serial PRIMARY KEY,
	kode_trx_riwayat_pelaksanaan int4 NOT NULL,
	kode_tte int4 NULL,
	tgl_surat timestamp(6) NULL,
	kategori_surat varchar NULL,
	ucr varchar NOT NULL,
	uch varchar NULL,
	udcr timestamp(6) DEFAULT CURRENT_TIMESTAMP NULL,
	udch timestamp(6) DEFAULT CURRENT_TIMESTAMP NULL,
	CONSTRAINT trx_sptjm_kode_trx_riwayat_pelaksanaan_fkey FOREIGN KEY (kode_trx_riwayat_pelaksanaan) REFERENCES trx_riwayat_pelaksanaan(kode_trx_riwayat_pelaksanaan)
);
CREATE INDEX idx_trx_sptjm_kode_trx_riwayat_pelaksanaan ON trx_sptjm USING btree (kode_trx_riwayat_pelaksanaan);


DROP TABLE IF EXISTS ref_step_serah_terima;
CREATE TABLE ref_step_serah_terima (
	kode_step_serah_terima int4 NOT NULL,
	step_serah_terima varchar NOT NULL,
	keterangan_step varchar NOT NULL,
	kategori_step varchar NOT NULL,
	urutan int2 NOT NULL,
	CONSTRAINT ref_step_serah_terima_pkey PRIMARY KEY (kode_step_serah_terima)
);

INSERT INTO ref_step_serah_terima
(kode_step_serah_terima, step_serah_terima, keterangan_step, kategori_step, urutan)
VALUES
(1, 'BAP', 'Berita Acara Pemeriksaan', 'pk|pp|ppk', 1),
(2, 'BAST', 'BA Serah Terima', 'penyedia|pp|ppk', 2);


-- sampai sini 2


DROP TABLE IF EXISTS ref_serah_terima;
CREATE TABLE ref_serah_terima (
	kode_serah_terima serial PRIMARY KEY,
	kode_proses_kontrak int4 NOT NULL,
	kode_step_serah_terima int4 NOT NULL,
	status_step varchar DEFAULT 'belum diisi'::character varying NULL,
	ucr varchar NOT NULL,
	uch varchar NULL,
	udcr timestamp(6) DEFAULT CURRENT_TIMESTAMP NULL,
	udch timestamp(6) DEFAULT CURRENT_TIMESTAMP NULL,
	CONSTRAINT ref_serah_terima_kode_proses_kontrak_fkey FOREIGN KEY (kode_proses_kontrak) REFERENCES ref_proses_kontrak(kode_proses_kontrak),
	CONSTRAINT ref_serah_terima_kode_step_serah_terima_fkey FOREIGN KEY (kode_step_serah_terima) REFERENCES ref_step_serah_terima(kode_step_serah_terima)
);
CREATE INDEX idx_ref_serah_terima_kode_proses_kontrak ON ref_serah_terima USING btree (kode_proses_kontrak);
CREATE INDEX idx_ref_serah_terima_kode_step_serah_terima ON ref_serah_terima USING btree (kode_step_serah_terima);



DROP TABLE IF EXISTS ref_ba_pemeriksaan_st;
CREATE TABLE ref_ba_pemeriksaan_st (
	kode_bap_st serial PRIMARY KEY,
	kode_serah_terima int4 NOT NULL,
	kode_tte int4 NOT NULL,
	tanggal_bap timestamp(6) NULL,
	denda numeric NULL,
	dok_hasil_pekerjaan varchar NULL,
	catatan text NULL,
	nama_pemeriksa varchar NULL,
	ucr varchar NULL,
	uch varchar NULL,
	udcr timestamp(6) DEFAULT CURRENT_TIMESTAMP NULL,
	udch timestamp(6) DEFAULT CURRENT_TIMESTAMP NULL,
	CONSTRAINT ref_ba_pemeriksaan_st_kode_serah_terima_fkey FOREIGN KEY (kode_serah_terima) REFERENCES ref_serah_terima(kode_serah_terima),
	CONSTRAINT ref_ba_pemeriksaan_st_kode_tte_fkey FOREIGN KEY (kode_tte) REFERENCES trx_tte(kode_tte)
);
CREATE INDEX idx_ref_ba_pemeriksaan_st_kode_serah_terima ON ref_ba_pemeriksaan_st USING btree (kode_serah_terima);
CREATE INDEX idx_ref_ba_pemeriksaan_st_kode_tte ON ref_ba_pemeriksaan_st USING btree (kode_tte);



DROP TABLE IF EXISTS trx_ba_pemeriksaan_st;
CREATE TABLE trx_ba_pemeriksaan_st (
	kode_trx_bap_st serial PRIMARY KEY,
	kode_serah_terima int4 NOT NULL,
	ketentuan text NOT NULL,
	konfirmasi bool NOT NULL,
	nip_pemeriksa varchar NOT NULL,
	nama_pemeriksa varchar NOT NULL,
	ucr varchar NOT NULL,
	uch varchar NULL,
	udcr timestamp(6) DEFAULT CURRENT_TIMESTAMP NULL,
	udch timestamp(6) DEFAULT CURRENT_TIMESTAMP NULL,
	catatan_trx_bap text NOT NULL,
	CONSTRAINT trx_ba_pemeriksaan_st_kode_serah_terima_fkey FOREIGN KEY (kode_serah_terima) REFERENCES ref_serah_terima(kode_serah_terima)
);
CREATE INDEX idx_trx_ba_pemeriksaan_st_kode_serah_terima ON trx_ba_pemeriksaan_st USING btree (kode_serah_terima);


DROP TABLE IF EXISTS trx_bast_st;
CREATE TABLE trx_bast_st (
	kode_bast_st serial PRIMARY KEY,
	kode_serah_terima int4 NOT NULL,
	kode_tte int4 NOT NULL,
	ucr varchar NOT NULL,
	uch varchar NULL,
	udcr timestamp(6) DEFAULT CURRENT_TIMESTAMP NULL,
	udch timestamp(6) DEFAULT CURRENT_TIMESTAMP NULL,
	tgl_surat timestamp(6) NULL,
	CONSTRAINT trx_bast_st_kode_serah_terima_fkey FOREIGN KEY (kode_serah_terima) REFERENCES ref_serah_terima(kode_serah_terima),
	CONSTRAINT trx_bast_st_kode_tte FOREIGN KEY (kode_tte) REFERENCES trx_tte(kode_tte)
);
CREATE INDEX idx_trx_bast_st_kode_serah_terima ON trx_bast_st USING btree (kode_serah_terima);
CREATE INDEX idx_trx_bast_st_kode_tte ON trx_bast_st USING btree (kode_tte);


DROP TYPE IF EXISTS kategori_bentuk_kontrak;
CREATE TYPE kategori_bentuk_kontrak AS ENUM (
	'upload',
	'tamplate',
	'template'
);

DROP TABLE IF EXISTS ref_bentuk_kontrak;
CREATE TABLE ref_bentuk_kontrak (
	kode_bentuk_kontrak serial PRIMARY KEY,
	nama_bentuk_kontrak varchar NOT NULL,
	kategori_bentuk_kontrak kategori_bentuk_kontrak NOT NULL,
	nama_template_dok varchar NULL
);

INSERT INTO ref_bentuk_kontrak
(kode_bentuk_kontrak, nama_bentuk_kontrak, kategori_bentuk_kontrak, nama_template_dok)
VALUES(5, 'Surat Pesanan', 'template'::kategori_bentuk_kontrak, 'surat_pesanan');



DROP TABLE IF EXISTS trx_dokumen_kontrak;
CREATE TABLE trx_dokumen_kontrak (
	kode_dokumen_kontrak serial PRIMARY KEY,
	kode_proses_kontrak int4 NOT NULL,
	tgl_surat timestamp(6) NULL,
	kode_tte int4 NULL,
	ucr varchar NOT NULL,
	uch varchar NULL,
	udcr timestamp(6) DEFAULT CURRENT_TIMESTAMP NULL,
	udch timestamp(6) DEFAULT CURRENT_TIMESTAMP NULL,
	kode_bentuk_kontrak int4 NOT NULL,
	nomor_surat_pesanan varchar NULL,
	CONSTRAINT "trx_dokumen_kontrak_kode_bentuk_kontrak_fkey" FOREIGN KEY (kode_bentuk_kontrak) REFERENCES ref_bentuk_kontrak(kode_bentuk_kontrak),
	CONSTRAINT "trx_dokumen_kontrak_kode_tte_fkey" FOREIGN KEY (kode_tte) REFERENCES trx_tte(kode_tte),
	CONSTRAINT trx_dokumen_kontrak_kode_proses_kontrak_fkey FOREIGN KEY (kode_proses_kontrak) REFERENCES ref_proses_kontrak(kode_proses_kontrak) ON DELETE CASCADE
);
CREATE INDEX idx_trx_dokumen_kontrak_kode_bentuk_kontrak ON trx_dokumen_kontrak USING btree (kode_bentuk_kontrak);
CREATE INDEX idx_trx_dokumen_kontrak_kode_proses_kontrak ON trx_dokumen_kontrak USING btree (kode_proses_kontrak);
CREATE INDEX idx_trx_dokumen_kontrak_kode_tte ON trx_dokumen_kontrak USING btree (kode_tte);



DROP TABLE IF EXISTS trx_keluaran_output;
CREATE TABLE trx_keluaran_output (
	kode_keluaran_output serial PRIMARY KEY,
	kode_trx_riwayat_pelaksanaan int4 NOT NULL,
	kode_keluaran int4 NOT NULL,
	path_dokumen varchar NULL,
	key_pass varchar NULL,
	verifikasi_keluaran_output bool NULL,
	ucr varchar NOT NULL,
	uch varchar NULL,
	udcr timestamp(6) DEFAULT CURRENT_TIMESTAMP NULL,
	udch timestamp(6) DEFAULT CURRENT_TIMESTAMP NULL,
	CONSTRAINT trx_keluaran_output_kode_keluaran_fkey FOREIGN KEY (kode_keluaran) REFERENCES ref_keluaran_proses_kontrak(kode_keluaran),
	CONSTRAINT trx_keluaran_output_kode_trx_riwayat_pelaksanaan_fkey FOREIGN KEY (kode_trx_riwayat_pelaksanaan) REFERENCES trx_riwayat_pelaksanaan(kode_trx_riwayat_pelaksanaan)
);
CREATE INDEX idx_trx_keluaran_output_kode_keluaran ON trx_keluaran_output USING btree (kode_keluaran);
CREATE INDEX idx_trx_keluaran_output_kode_trx_riwayat_pelaksanaan ON trx_keluaran_output USING btree (kode_trx_riwayat_pelaksanaan);


DROP TABLE IF EXISTS trx_keluaran_output_new;
CREATE TABLE trx_keluaran_output_new (
	kode_keluaran_output_new serial PRIMARY KEY,
	kode_proses_kontrak int4 NOT NULL,
	kode_keluaran int4 NOT NULL,
	path_dokumen varchar NULL,
	key_pass varchar NULL,
	verifikasi_keluaran_output bool NULL,
	status_proses varchar DEFAULT 'belum diisi'::character varying NULL,
	ucr varchar NOT NULL,
	uch varchar NULL,
	udcr timestamp(6) DEFAULT CURRENT_TIMESTAMP NULL,
	udch timestamp(6) DEFAULT CURRENT_TIMESTAMP NULL,
	CONSTRAINT trx_keluaran_output_new_kode_keluaran_fkey FOREIGN KEY (kode_keluaran) REFERENCES ref_keluaran_proses_kontrak(kode_keluaran),
	CONSTRAINT trx_keluaran_output_new_kode_proses_kontrak_fkey FOREIGN KEY (kode_proses_kontrak) REFERENCES ref_proses_kontrak(kode_proses_kontrak)
);
CREATE INDEX idx_trx_keluaran_output_new_kode_keluaran ON trx_keluaran_output_new USING btree (kode_keluaran);
CREATE INDEX idx_trx_keluaran_output_new_kode_proses_kontrak ON trx_keluaran_output_new USING btree (kode_proses_kontrak);


-- sampai sini 3


DROP TABLE IF EXISTS trx_jangka_waktu;
CREATE TABLE trx_jangka_waktu (
	kode_jangka_waktu serial PRIMARY KEY,
	kode_proses_kontrak int4 NOT NULL,
	jangka_waktu numeric NOT NULL,
	dari timestamp(6) NOT NULL,
	sampai_dengan timestamp(6) NOT NULL,
	ucr varchar NOT NULL,
	uch varchar NULL,
	udcr timestamp(6) DEFAULT CURRENT_TIMESTAMP NULL,
	udch timestamp(6) DEFAULT CURRENT_TIMESTAMP NULL,
	satuan_jangka_waktu varchar NULL,
	CONSTRAINT trx_jangka_waktu_kode_proses_kontrak_fkey FOREIGN KEY (kode_proses_kontrak) REFERENCES ref_proses_kontrak(kode_proses_kontrak)
);
CREATE INDEX idx_trx_jangka_waktu_kode_proses_kontrak ON trx_jangka_waktu USING btree (kode_proses_kontrak);



DROP TABLE IF EXISTS trx_jenis_laporan;
CREATE TABLE trx_jenis_laporan (
	kode_trx_jenis_laporan serial PRIMARY KEY,
	kode_proses_kontrak int4 NOT NULL,
	path_dokumen varchar NULL,
	ucr varchar NOT NULL,
	uch varchar NULL,
	udcr timestamp(6) DEFAULT CURRENT_TIMESTAMP NULL,
	udch timestamp(6) DEFAULT CURRENT_TIMESTAMP NULL,
	nama_laporan varchar NOT NULL,
	CONSTRAINT trx_jenis_laporan_kode_proses_kontrak_fkey FOREIGN KEY (kode_proses_kontrak) REFERENCES ref_proses_kontrak(kode_proses_kontrak)
);



DROP TABLE IF EXISTS trx_monitoring_new;
CREATE TABLE trx_monitoring_new (
	kode_trx_monitoring serial PRIMARY KEY,
	kode_proses_kontrak int4 NOT NULL,
	nama_progres varchar NOT NULL,
	output_progres varchar NOT NULL,
	dokumen_output_progres varchar NULL,
	catatan text NULL,
	evaluasi text NULL,
	pengendalian text NULL,
	dokumen_lainnya varchar NULL,
	status_proses varchar DEFAULT 'belum diisi'::character varying NULL,
	ucr varchar NOT NULL,
	uch varchar NULL,
	udcr timestamp(6) DEFAULT CURRENT_TIMESTAMP NULL,
	udch timestamp(6) DEFAULT CURRENT_TIMESTAMP NULL,
	CONSTRAINT trx_monitoring_new_kode_proses_kontrak_fkey FOREIGN KEY (kode_proses_kontrak) REFERENCES ref_proses_kontrak(kode_proses_kontrak)
);
CREATE INDEX idx_trx_monitoring_new_kode_proses_kontrak ON trx_monitoring_new USING btree (kode_proses_kontrak);



DROP TABLE IF EXISTS trx_proses_pajak;

CREATE TABLE trx_proses_pajak (
	kode_proses_pajak serial PRIMARY KEY,
	kode_proses_kontrak int4 NOT NULL,
	kategori_nilai_transaksi kategori_nilai_transaksi NULL,
	nilai_transaksi numeric NOT NULL,
	kode_jenis_transaksi int4 NOT NULL,
	jenis_transaksi varchar NOT NULL,
	kode_objek_pajak varchar NOT NULL,
	objek_pajak varchar NOT NULL,
	kode_detail_transaksi int4 NOT NULL,
	detail_transaksi varchar NOT NULL,
	ucr varchar NOT NULL,
	uch varchar NULL,
	udcr timestamp(6) DEFAULT CURRENT_TIMESTAMP NULL,
	udch timestamp(6) DEFAULT CURRENT_TIMESTAMP NULL,
	CONSTRAINT trx_proses_pajak_kode_proses_kontrak_fkey FOREIGN KEY (kode_proses_kontrak) REFERENCES ref_proses_kontrak(kode_proses_kontrak)
);
CREATE INDEX idx_trx_proses_pajak_kode_proses_kontrak ON trx_proses_pajak USING btree (kode_proses_kontrak);



DROP TYPE IF EXISTS public.kategori_serah_terima;
CREATE TYPE public.kategori_serah_terima AS ENUM (
	'sekaligus',
	'sebagian'
);

DROP TABLE IF EXISTS trx_serah_terima;
CREATE TABLE trx_serah_terima (
	kode_serah_terima serial PRIMARY KEY,
	kode_proses_kontrak int4 NOT NULL,
	kategori_serah_terima kategori_serah_terima NOT NULL,
	rincian varchar NOT NULL,
	persentase numeric NOT NULL,
	nilai_rupiah numeric NULL,
	status_serah_terima int2 DEFAULT 1 NULL,
	ucr varchar NOT NULL,
	uch varchar NULL,
	udcr timestamp(6) DEFAULT CURRENT_TIMESTAMP NULL,
	udch timestamp(6) DEFAULT CURRENT_TIMESTAMP NULL,
	CONSTRAINT trx_serah_terima_kode_proses_kontrak_fkey FOREIGN KEY (kode_proses_kontrak) REFERENCES ref_proses_kontrak(kode_proses_kontrak)
);
CREATE INDEX idx_trx_serah_terima_kode_proses_kontrak ON trx_serah_terima USING btree (kode_proses_kontrak);

