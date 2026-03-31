ALTER TABLE public.trx_pembayaran ADD CONSTRAINT "trx_pembayaran_kode_tte_fkey" FOREIGN KEY (kode_tte) REFERENCES trx_tte(kode_tte);


-- Pengadaan Bahan Pendukung Kegiatan Pemasaran UT BATAM Tahap 1 Tahun 2026
-- UN31.UT4
--
-- fixing query
DELETE FROM promise_esign.trx_penandatangan WHERE kode_trx_penandatangan=44264;

DELETE FROM trx_pembayaran WHERE kode_trx_pencarian=8941;
DELETE FROM trx_tte WHERE kode_tte=44265;
DELETE FROM trx_riwayat_pelaksanaan WHERE kode_trx_riwayat_pelaksanaan=45074;

DELETE FROM trx_hasil_pajak WHERE id_hasil_pajak=37776;
DELETE FROM trx_hasil_pajak WHERE id_hasil_pajak=37777;
DELETE FROM trx_hasil_pajak WHERE id_hasil_pajak=37778;
DELETE FROM trx_hasil_pajak WHERE id_hasil_pajak=37779;
DELETE FROM trx_hasil_pajak WHERE id_hasil_pajak=37780;
DELETE FROM trx_pajak WHERE kode_pajak=8941;
DELETE FROM trx_riwayat_pelaksanaan WHERE kode_trx_riwayat_pelaksanaan=45073;

DELETE FROM trx_kwitansi WHERE kode_kwitansi=17880;
DELETE FROM trx_kwitansi WHERE kode_kwitansi=17881;
DELETE FROM trx_riwayat_pelaksanaan WHERE kode_trx_riwayat_pelaksanaan=45072;


DELETE FROM trx_tte WHERE kode_tte=44264;
DELETE FROM trx_bast WHERE kode_bast=8941;
UPDATE trx_riwayat_pelaksanaan SET status_step='proses pp'WHERE kode_trx_riwayat_pelaksanaan=45071;

-- reverse query
INSERT INTO `promise_esign`.`trx_penandatangan` (`kode_trx_penandatangan`, `nama_aplikasi`, `nomor_surat`, `jenis_surat`, `keterangan_surat`, `path_dokumen`, `path_dokumen_selesai`, `tgl_selesai`) VALUES (44264, 'Si-BeLa', '-', 'Surat Permintaan Pembayaran', '-', '', '', '2026-02-27 00:00:00');


UPDATE trx_riwayat_pelaksanaan SET status_step='selesai'WHERE kode_trx_riwayat_pelaksanaan=45071;
INSERT INTO trx_bast (kode_bast, kode_trx_riwayat_pelaksanaan, kode_tte, ucr, uch, udcr, udch, tgl_surat) VALUES(8941, 45071, 44264, '-', NULL, NULL, NULL, '2026-02-27 00:00:00.000');
INSERT INTO trx_tte (kode_tte, kode_trx_penandatangan, kode_permintaan, kategori_tte, path_dokumen, path_dokumen_selesai, tgl_selesai, nomor_surat) VALUES(44264, 44263, 7977, 'ba_serah_terima'::public.kategori_tte, '', NULL, '2026-02-27 00:00:00.000', 'B/38/UN31.UT4/PL.01.00/2026');

INSERT INTO trx_riwayat_pelaksanaan (kode_trx_riwayat_pelaksanaan, kode_riwayat_pelaksanaan, kode_step_riwayat_pelaksanaan, status_step, ucr, uch, udcr, udch) VALUES(45072, 8941, 3, 'selesai', 'silfi@ecampus.ut.ac.id|Silfi Amelia, S.Akun.', NULL, NULL, NULL);
INSERT INTO trx_kwitansi (kode_kwitansi, kode_trx_riwayat_pelaksanaan, nomor_kwitansi, nama_dok_kwitansi, nama_dok_kwitansi_selesai, kategori_input, ucr, uch, udcr, udch, nama_uploader, tanggal_kwitansi) VALUES(17880, 45072, NULL, '', '', 'ppk', 'silfi@ecampus.ut.ac.id|Silfi Amelia, S.Akun.', NULL, '2026-03-24 01:20:27.045', '2026-03-24 01:20:27.045', '-', '2026-02-27 00:00:00.000');
INSERT INTO trx_kwitansi (kode_kwitansi, kode_trx_riwayat_pelaksanaan, nomor_kwitansi, nama_dok_kwitansi, nama_dok_kwitansi_selesai, kategori_input, ucr, uch, udcr, udch, nama_uploader, tanggal_kwitansi) VALUES(17881, 45072, NULL, '', '', 'penyedia', 'silfi@ecampus.ut.ac.id|Silfi Amelia, S.Akun.', NULL, '2026-03-24 01:20:27.046', '2026-03-24 01:20:27.046', 'CV. KAVETA MEDIA KREATIF', NULL);


INSERT INTO trx_riwayat_pelaksanaan (kode_trx_riwayat_pelaksanaan, kode_riwayat_pelaksanaan, kode_step_riwayat_pelaksanaan, status_step, ucr, uch, udcr, udch) VALUES(45074, 8941, 6, 'selesai', 'silfi@ecampus.ut.ac.id|Silfi Amelia, S.Akun.', NULL, NULL, NULL);
INSERT INTO trx_tte (kode_tte, kode_trx_penandatangan, kode_permintaan, kategori_tte, path_dokumen, path_dokumen_selesai, tgl_selesai, nomor_surat) VALUES(44265, 44264, 7977, 's_pembayaran'::public.kategori_tte, '', NULL, NULL, '-');
INSERT INTO trx_pembayaran (kode_trx_pencarian, kode_trx_riwayat_pelaksanaan, kode_tte, tgl_surat_spp, tgl_surat_sptjb, tgl_surat_srk, no_surat_spp, no_surat_sptjb, no_surat_srk, ucr, uch, udcr, udch, kode_permintaan_pencairan, status_pengusulan, kode_permintaan_pencairan_old, kode_kontrak) VALUES(8941, 45074, 44265, NULL, NULL, NULL, '-', '-', '-', 'silfi@ecampus.ut.ac.id|Silfi Amelia, S.Akun.', NULL, NULL, NULL, 18052, NULL, '9777-8081-sibela-luardpt', '8081-sibela-luardpt');

INSERT INTO trx_riwayat_pelaksanaan (kode_trx_riwayat_pelaksanaan, kode_riwayat_pelaksanaan, kode_step_riwayat_pelaksanaan, status_step, ucr, uch, udcr, udch) VALUES(45073, 8941, 4, 'selesai', 'silfi@ecampus.ut.ac.id|Silfi Amelia, S.Akun.', NULL, '2026-03-12 12:34:50.000', NULL);
INSERT INTO trx_pajak (kode_pajak, kode_trx_riwayat_pelaksanaan, kategori_nilai_transaksi, manajemen_fee, nilai_transaksi, jenis_mata_uang, kurs_asing, kurs_bank, kurs_kmk, tax_treaty, kode_jenis_transaksi, jenis_transaksi, kode_objek_pajak, objek_pajak, kode_detail_transaksi, detail_transaksi, ucr, uch, udcr, udch, nama_dok_efaktur, nomor_efaktur, tanggal_efaktur, nama_tabel_lama, id_sptb, biaya_tak_kena_pajak, kode_jenis_layanan) VALUES(8941, 45073, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, '2024-01-15 14:30:00.000', 'tbl_sptb_p', 6776, NULL, NULL);
INSERT INTO trx_hasil_pajak (id_hasil_pajak, kode_pajak, kategori_pajak, nama_formula, formula, nilai_persentase_formula, perhitungan_formula, hasil, id_sptb_pl, kategori, nilai) VALUES(37776, 8941, 'nilai_perhitungan', NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL);
INSERT INTO trx_hasil_pajak (id_hasil_pajak, kode_pajak, kategori_pajak, nama_formula, formula, nilai_persentase_formula, perhitungan_formula, hasil, id_sptb_pl, kategori, nilai) VALUES(37777, 8941, 'dpp_ppn', NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL);
INSERT INTO trx_hasil_pajak (id_hasil_pajak, kode_pajak, kategori_pajak, nama_formula, formula, nilai_persentase_formula, perhitungan_formula, hasil, id_sptb_pl, kategori, nilai) VALUES(37778, 8941, 'dpp_pph', NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL);
INSERT INTO trx_hasil_pajak (id_hasil_pajak, kode_pajak, kategori_pajak, nama_formula, formula, nilai_persentase_formula, perhitungan_formula, hasil, id_sptb_pl, kategori, nilai) VALUES(37779, 8941, 'ppn', NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL);
INSERT INTO trx_hasil_pajak (id_hasil_pajak, kode_pajak, kategori_pajak, nama_formula, formula, nilai_persentase_formula, perhitungan_formula, hasil, id_sptb_pl, kategori, nilai) VALUES(37780, 8941, 'pph', NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL);



-- Paket Kegiatan Pelatihan Keterampilan Belajar Jarak Jauh (PKBJJ) UT Batam di Tanjung Pinang dan Bintan Semester 1 Tahun 2026
-- UN31.UT4
--
-- fixing query
DELETE FROM trx_penandatangan WHERE kode_trx_penandatangan=44848;

DELETE FROM trx_pembayaran WHERE kode_trx_pencarian=9051;
DELETE FROM trx_tte WHERE kode_tte=44849;
DELETE FROM trx_riwayat_pelaksanaan WHERE kode_trx_riwayat_pelaksanaan=45624;

DELETE FROM trx_hasil_pajak WHERE id_hasil_pajak=37686;
DELETE FROM trx_hasil_pajak WHERE id_hasil_pajak=37687;
DELETE FROM trx_hasil_pajak WHERE id_hasil_pajak=37688;
DELETE FROM trx_hasil_pajak WHERE id_hasil_pajak=37689;
DELETE FROM trx_hasil_pajak WHERE id_hasil_pajak=37690;
DELETE FROM trx_pajak WHERE kode_pajak=9051;
DELETE FROM trx_riwayat_pelaksanaan WHERE kode_trx_riwayat_pelaksanaan=45623;

DELETE FROM trx_kwitansi WHERE kode_kwitansi=18100;
DELETE FROM trx_kwitansi WHERE kode_kwitansi=18101;
DELETE FROM trx_riwayat_pelaksanaan WHERE kode_trx_riwayat_pelaksanaan=45622;

DELETE FROM trx_tte WHERE kode_tte=44848;
DELETE FROM trx_bast WHERE kode_bast=9051;
UPDATE trx_riwayat_pelaksanaan SET status_step='proses pp'WHERE kode_trx_riwayat_pelaksanaan=45621;

DELETE FROM trx_detail_penandatangan WHERE kode_detail_penandatangan=63723;
DELETE FROM trx_penandatangan WHERE kode_trx_penandatangan=44847;


-- reverse-fixing

UPDATE trx_riwayat_pelaksanaan SET status_step='selesai'WHERE kode_trx_riwayat_pelaksanaan=45621;
INSERT INTO trx_bast (kode_bast, kode_trx_riwayat_pelaksanaan, kode_tte, ucr, uch, udcr, udch, tgl_surat) VALUES(9051, 45621, 44848, '-', NULL, NULL, NULL, '2026-02-21 00:00:00.000');
INSERT INTO trx_tte (kode_tte, kode_trx_penandatangan, kode_permintaan, kategori_tte, path_dokumen, path_dokumen_selesai, tgl_selesai, nomor_surat) VALUES(44848, 44847, 8104, 'ba_serah_terima'::public.kategori_tte, '', NULL, '2026-02-21 00:00:00.000', 'B/34/UN31.UT4/PL.02.00/2026');
INSERT INTO `promise_esign`.`trx_penandatangan` (`kode_trx_penandatangan`, `nama_aplikasi`, `nomor_surat`, `jenis_surat`, `keterangan_surat`, `path_dokumen`, `path_dokumen_selesai`, `tgl_selesai`) VALUES (44847, 'Si-BeLa', 'B/34/UN31.UT4/PL.02.00/2026', 'Surat Berita Serah Terima (BAST)', '-', '', '', '2026-02-21 00:00:00');
INSERT INTO `promise_esign`.`trx_detail_penandatangan` (`kode_detail_penandatangan`, `kode_trx_penandatangan`, `status_jabatan_penandatangan`, `jabatan`, `status_penandatangan`, `tgl_tte`, `kode_penandatangan`, `otp`, `expired_otp`) VALUES (63723, 44847, 'internal', 'Pejabat Pengadaan Kegiatan UT Batam', 'sudah', '2026-03-11 11:48:10', 14146, NULL, NULL);


INSERT INTO trx_riwayat_pelaksanaan (kode_trx_riwayat_pelaksanaan, kode_riwayat_pelaksanaan, kode_step_riwayat_pelaksanaan, status_step, ucr, uch, udcr, udch) VALUES(45622, 9051, 3, 'selesai', 'silfi@ecampus.ut.ac.id|Silfi Amelia, S.Akun.', NULL, NULL, NULL);
INSERT INTO trx_kwitansi (kode_kwitansi, kode_trx_riwayat_pelaksanaan, nomor_kwitansi, nama_dok_kwitansi, nama_dok_kwitansi_selesai, kategori_input, ucr, uch, udcr, udch, nama_uploader, tanggal_kwitansi) VALUES(18100, 45622, NULL, '', '', 'ppk', 'silfi@ecampus.ut.ac.id|Silfi Amelia, S.Akun.', NULL, '2026-03-24 01:20:40.096', '2026-03-24 01:20:40.096', '-', '2026-02-21 00:00:00.000');
INSERT INTO trx_kwitansi (kode_kwitansi, kode_trx_riwayat_pelaksanaan, nomor_kwitansi, nama_dok_kwitansi, nama_dok_kwitansi_selesai, kategori_input, ucr, uch, udcr, udch, nama_uploader, tanggal_kwitansi) VALUES(18101, 45622, NULL, '', '', 'penyedia', 'silfi@ecampus.ut.ac.id|Silfi Amelia, S.Akun.', NULL, '2026-03-24 01:20:40.098', '2026-03-24 01:20:40.098', 'ASTON TANJUNGPINANG HOTEL AND CONFERENCE CENTER', NULL);

INSERT INTO trx_riwayat_pelaksanaan (kode_trx_riwayat_pelaksanaan, kode_riwayat_pelaksanaan, kode_step_riwayat_pelaksanaan, status_step, ucr, uch, udcr, udch) VALUES(45623, 9051, 4, 'selesai', 'silfi@ecampus.ut.ac.id|Silfi Amelia, S.Akun.', NULL, '2026-03-11 09:07:20.000', NULL);
INSERT INTO trx_pajak (kode_pajak, kode_trx_riwayat_pelaksanaan, kategori_nilai_transaksi, manajemen_fee, nilai_transaksi, jenis_mata_uang, kurs_asing, kurs_bank, kurs_kmk, tax_treaty, kode_jenis_transaksi, jenis_transaksi, kode_objek_pajak, objek_pajak, kode_detail_transaksi, detail_transaksi, ucr, uch, udcr, udch, nama_dok_efaktur, nomor_efaktur, tanggal_efaktur, nama_tabel_lama, id_sptb, biaya_tak_kena_pajak, kode_jenis_layanan) VALUES(9051, 45623, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, '2024-01-15 14:30:00.000', 'tbl_sptb_p', 6758, NULL, NULL);
INSERT INTO trx_hasil_pajak (id_hasil_pajak, kode_pajak, kategori_pajak, nama_formula, formula, nilai_persentase_formula, perhitungan_formula, hasil, id_sptb_pl, kategori, nilai) VALUES(37686, 9051, 'nilai_perhitungan', NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL);
INSERT INTO trx_hasil_pajak (id_hasil_pajak, kode_pajak, kategori_pajak, nama_formula, formula, nilai_persentase_formula, perhitungan_formula, hasil, id_sptb_pl, kategori, nilai) VALUES(37687, 9051, 'dpp_ppn', NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL);
INSERT INTO trx_hasil_pajak (id_hasil_pajak, kode_pajak, kategori_pajak, nama_formula, formula, nilai_persentase_formula, perhitungan_formula, hasil, id_sptb_pl, kategori, nilai) VALUES(37688, 9051, 'dpp_pph', NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL);
INSERT INTO trx_hasil_pajak (id_hasil_pajak, kode_pajak, kategori_pajak, nama_formula, formula, nilai_persentase_formula, perhitungan_formula, hasil, id_sptb_pl, kategori, nilai) VALUES(37689, 9051, 'ppn', NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL);
INSERT INTO trx_hasil_pajak (id_hasil_pajak, kode_pajak, kategori_pajak, nama_formula, formula, nilai_persentase_formula, perhitungan_formula, hasil, id_sptb_pl, kategori, nilai) VALUES(37690, 9051, 'pph', NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL);

INSERT INTO trx_riwayat_pelaksanaan (kode_trx_riwayat_pelaksanaan, kode_riwayat_pelaksanaan, kode_step_riwayat_pelaksanaan, status_step, ucr, uch, udcr, udch) VALUES(45624, 9051, 6, 'selesai', 'silfi@ecampus.ut.ac.id|Silfi Amelia, S.Akun.', NULL, NULL, NULL);
INSERT INTO trx_tte (kode_tte, kode_trx_penandatangan, kode_permintaan, kategori_tte, path_dokumen, path_dokumen_selesai, tgl_selesai, nomor_surat) VALUES(44849, 44848, 8104, 's_pembayaran'::public.kategori_tte, '', NULL, NULL, '-');
INSERT INTO trx_pembayaran (kode_trx_pencarian, kode_trx_riwayat_pelaksanaan, kode_tte, tgl_surat_spp, tgl_surat_sptjb, tgl_surat_srk, no_surat_spp, no_surat_sptjb, no_surat_srk, ucr, uch, udcr, udch, kode_permintaan_pencairan, status_pengusulan, kode_permintaan_pencairan_old, kode_kontrak) VALUES(9051, 45624, 44849, NULL, NULL, NULL, '-', '-', '-', 'silfi@ecampus.ut.ac.id|Silfi Amelia, S.Akun.', NULL, NULL, NULL, 18162, NULL, '9950-8063-sibela-luardpt', '8063-sibela-luardpt');

INSERT INTO `promise_esign`.`trx_penandatangan` (`kode_trx_penandatangan`, `nama_aplikasi`, `nomor_surat`, `jenis_surat`, `keterangan_surat`, `path_dokumen`, `path_dokumen_selesai`, `tgl_selesai`) VALUES (44848, 'Si-BeLa', '-', 'Surat Permintaan Pembayaran', '-', '', '', '2026-02-21 00:00:00');


-- Paket Kegiatan Pelatihan Keterampilan Belajar Jarak Jauh (PKBJJ) UT Batam Semester 1 Tahap I Tahun 2026
-- UN31.UT4
--
-- fixing query


DELETE FROM trx_penandatangan WHERE kode_trx_penandatangan=44933;

DELETE FROM trx_pembayaran WHERE kode_trx_pencarian=9068;
DELETE FROM trx_tte WHERE kode_tte=44934;
DELETE FROM trx_riwayat_pelaksanaan WHERE kode_trx_riwayat_pelaksanaan=45709;

DELETE FROM trx_hasil_pajak WHERE id_hasil_pajak=37791;
DELETE FROM trx_hasil_pajak WHERE id_hasil_pajak=37792;
DELETE FROM trx_hasil_pajak WHERE id_hasil_pajak=37793;
DELETE FROM trx_hasil_pajak WHERE id_hasil_pajak=37794;
DELETE FROM trx_hasil_pajak WHERE id_hasil_pajak=37795;
DELETE FROM trx_pajak WHERE kode_pajak=9068;
DELETE FROM trx_riwayat_pelaksanaan WHERE kode_trx_riwayat_pelaksanaan=45708;

DELETE FROM trx_kwitansi WHERE kode_kwitansi=18134;
DELETE FROM trx_kwitansi WHERE kode_kwitansi=18135;
UPDATE trx_riwayat_pelaksanaan SET status_step='proses penyedia'WHERE kode_trx_riwayat_pelaksanaan=45707;


-- reverse-fixing
UPDATE trx_riwayat_pelaksanaan SET status_step='selesai'WHERE kode_trx_riwayat_pelaksanaan=45707;
INSERT INTO trx_kwitansi (kode_kwitansi, kode_trx_riwayat_pelaksanaan, nomor_kwitansi, nama_dok_kwitansi, nama_dok_kwitansi_selesai, kategori_input, ucr, uch, udcr, udch, nama_uploader, tanggal_kwitansi) VALUES(18134, 45707, '00719', '', '', 'ppk', 'silfi@ecampus.ut.ac.id|Silfi Amelia, S.Akun.', NULL, '2026-03-24 01:20:41.954', '2026-03-24 01:20:41.954', '-', '2026-03-12 00:00:00.000');
INSERT INTO trx_kwitansi (kode_kwitansi, kode_trx_riwayat_pelaksanaan, nomor_kwitansi, nama_dok_kwitansi, nama_dok_kwitansi_selesai, kategori_input, ucr, uch, udcr, udch, nama_uploader, tanggal_kwitansi) VALUES(18135, 45707, '00719', '', '', 'penyedia', 'silfi@ecampus.ut.ac.id|Silfi Amelia, S.Akun.', NULL, '2026-03-24 01:20:41.955', '2026-03-24 01:20:41.955', 'PT Graha Seraya Pratama', '2026-03-12 00:00:00.000');

INSERT INTO trx_riwayat_pelaksanaan (kode_trx_riwayat_pelaksanaan, kode_riwayat_pelaksanaan, kode_step_riwayat_pelaksanaan, status_step, ucr, uch, udcr, udch) VALUES(45708, 9068, 4, 'selesai', 'silfi@ecampus.ut.ac.id|Silfi Amelia, S.Akun.', NULL, '2026-03-13 14:35:52.000', NULL);
INSERT INTO trx_pajak (kode_pajak, kode_trx_riwayat_pelaksanaan, kategori_nilai_transaksi, manajemen_fee, nilai_transaksi, jenis_mata_uang, kurs_asing, kurs_bank, kurs_kmk, tax_treaty, kode_jenis_transaksi, jenis_transaksi, kode_objek_pajak, objek_pajak, kode_detail_transaksi, detail_transaksi, ucr, uch, udcr, udch, nama_dok_efaktur, nomor_efaktur, tanggal_efaktur, nama_tabel_lama, id_sptb, biaya_tak_kena_pajak, kode_jenis_layanan) VALUES(9068, 45708, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, '2024-01-15 14:30:00.000', 'tbl_sptb_p', 6785, NULL, NULL);
INSERT INTO trx_hasil_pajak (id_hasil_pajak, kode_pajak, kategori_pajak, nama_formula, formula, nilai_persentase_formula, perhitungan_formula, hasil, id_sptb_pl, kategori, nilai) VALUES(37791, 9068, 'nilai_perhitungan', NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL);
INSERT INTO trx_hasil_pajak (id_hasil_pajak, kode_pajak, kategori_pajak, nama_formula, formula, nilai_persentase_formula, perhitungan_formula, hasil, id_sptb_pl, kategori, nilai) VALUES(37792, 9068, 'dpp_ppn', NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL);
INSERT INTO trx_hasil_pajak (id_hasil_pajak, kode_pajak, kategori_pajak, nama_formula, formula, nilai_persentase_formula, perhitungan_formula, hasil, id_sptb_pl, kategori, nilai) VALUES(37793, 9068, 'dpp_pph', NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL);
INSERT INTO trx_hasil_pajak (id_hasil_pajak, kode_pajak, kategori_pajak, nama_formula, formula, nilai_persentase_formula, perhitungan_formula, hasil, id_sptb_pl, kategori, nilai) VALUES(37794, 9068, 'ppn', NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL);
INSERT INTO trx_hasil_pajak (id_hasil_pajak, kode_pajak, kategori_pajak, nama_formula, formula, nilai_persentase_formula, perhitungan_formula, hasil, id_sptb_pl, kategori, nilai) VALUES(37795, 9068, 'pph', NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL);

INSERT INTO trx_riwayat_pelaksanaan (kode_trx_riwayat_pelaksanaan, kode_riwayat_pelaksanaan, kode_step_riwayat_pelaksanaan, status_step, ucr, uch, udcr, udch) VALUES(45709, 9068, 6, 'selesai', 'silfi@ecampus.ut.ac.id|Silfi Amelia, S.Akun.', NULL, NULL, NULL);
INSERT INTO trx_tte (kode_tte, kode_trx_penandatangan, kode_permintaan, kategori_tte, path_dokumen, path_dokumen_selesai, tgl_selesai, nomor_surat) VALUES(44934, 44933, 8121, 's_pembayaran'::public.kategori_tte, '', NULL, NULL, '-');
INSERT INTO trx_pembayaran (kode_trx_pencarian, kode_trx_riwayat_pelaksanaan, kode_tte, tgl_surat_spp, tgl_surat_sptjb, tgl_surat_srk, no_surat_spp, no_surat_sptjb, no_surat_srk, ucr, uch, udcr, udch, kode_permintaan_pencairan, status_pengusulan, kode_permintaan_pencairan_old, kode_kontrak) VALUES(9068, 45709, 44934, NULL, NULL, NULL, '-', '-', '-', 'silfi@ecampus.ut.ac.id|Silfi Amelia, S.Akun.', NULL, NULL, NULL, 18179, NULL, '9971-8090-sibela-luardpt', '8090-sibela-luardpt');

INSERT INTO trx_penandatangan (kode_trx_penandatangan, nama_aplikasi, nomor_surat, jenis_surat, keterangan_surat, path_dokumen, path_dokumen_selesai, tgl_selesai) VALUES(44933, 'Si-BeLa', '-', 'Surat Permintaan Pembayaran', '-', '', '', '2026-02-28 00:00:00.000');


-- Pengadaan Pelaksanaan LPKBJJ Batch 2 Wilayah Pasuruan
-- UN31.UT26
--
-- fixing query
DELETE FROM trx_pembayaran WHERE kode_trx_pencarian=8965;
DELETE FROM trx_tte WHERE kode_tte=44387;
DELETE FROM trx_riwayat_pelaksanaan WHERE kode_trx_riwayat_pelaksanaan=45194;

DELETE FROM trx_hasil_pajak WHERE id_hasil_pajak=37131;
DELETE FROM trx_hasil_pajak WHERE id_hasil_pajak=37132;
DELETE FROM trx_hasil_pajak WHERE id_hasil_pajak=37133;
DELETE FROM trx_hasil_pajak WHERE id_hasil_pajak=37134;
DELETE FROM trx_hasil_pajak WHERE id_hasil_pajak=37135;
DELETE FROM trx_pajak WHERE kode_pajak=8965;
DELETE FROM trx_riwayat_pelaksanaan WHERE kode_trx_riwayat_pelaksanaan=45193;

DELETE FROM trx_kwitansi WHERE kode_kwitansi=17928;
DELETE FROM trx_kwitansi WHERE kode_kwitansi=17929;
DELETE FROM trx_riwayat_pelaksanaan WHERE kode_trx_riwayat_pelaksanaan=45192;

DELETE FROM trx_bast WHERE kode_bast=8965;
UPDATE trx_riwayat_pelaksanaan SET status_step='proses pp'WHERE kode_trx_riwayat_pelaksanaan=45191;


-- reverse-fixing
UPDATE trx_riwayat_pelaksanaan SET status_step='selesai'WHERE kode_trx_riwayat_pelaksanaan=45191;
INSERT INTO trx_bast (kode_bast, kode_trx_riwayat_pelaksanaan, kode_tte, ucr, uch, udcr, udch, tgl_surat) VALUES(8965, 45191, 44386, '-', NULL, NULL, NULL, '2026-02-23 00:00:00.000');

INSERT INTO trx_riwayat_pelaksanaan (kode_trx_riwayat_pelaksanaan, kode_riwayat_pelaksanaan, kode_step_riwayat_pelaksanaan, status_step, ucr, uch, udcr, udch) VALUES(45192, 8965, 3, 'selesai', 'indraw@ecampus.ut.ac.id|Indra Wahyuni  S.E.', NULL, NULL, NULL);
INSERT INTO trx_kwitansi (kode_kwitansi, kode_trx_riwayat_pelaksanaan, nomor_kwitansi, nama_dok_kwitansi, nama_dok_kwitansi_selesai, kategori_input, ucr, uch, udcr, udch, nama_uploader, tanggal_kwitansi) VALUES(17928, 45192, NULL, '', '', 'ppk', 'indraw@ecampus.ut.ac.id|Indra Wahyuni  S.E.', NULL, '2026-03-24 01:20:29.429', '2026-03-24 01:20:29.429', '-', '2026-02-23 00:00:00.000');
INSERT INTO trx_kwitansi (kode_kwitansi, kode_trx_riwayat_pelaksanaan, nomor_kwitansi, nama_dok_kwitansi, nama_dok_kwitansi_selesai, kategori_input, ucr, uch, udcr, udch, nama_uploader, tanggal_kwitansi) VALUES(17929, 45192, NULL, '', '', 'penyedia', 'indraw@ecampus.ut.ac.id|Indra Wahyuni  S.E.', NULL, '2026-03-24 01:20:29.430', '2026-03-24 01:20:29.430', 'PT Grand Suropati Pasuruan', NULL);

INSERT INTO trx_riwayat_pelaksanaan (kode_trx_riwayat_pelaksanaan, kode_riwayat_pelaksanaan, kode_step_riwayat_pelaksanaan, status_step, ucr, uch, udcr, udch) VALUES(45193, 8965, 4, 'selesai', 'indraw@ecampus.ut.ac.id|Indra Wahyuni  S.E.', NULL, '2026-02-21 12:21:30.000', NULL);
INSERT INTO trx_pajak (kode_pajak, kode_trx_riwayat_pelaksanaan, kategori_nilai_transaksi, manajemen_fee, nilai_transaksi, jenis_mata_uang, kurs_asing, kurs_bank, kurs_kmk, tax_treaty, kode_jenis_transaksi, jenis_transaksi, kode_objek_pajak, objek_pajak, kode_detail_transaksi, detail_transaksi, ucr, uch, udcr, udch, nama_dok_efaktur, nomor_efaktur, tanggal_efaktur, nama_tabel_lama, id_sptb, biaya_tak_kena_pajak, kode_jenis_layanan) VALUES(8965, 45193, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, '2024-01-15 14:30:00.000', 'tbl_sptb_p', 6628, NULL, NULL);
INSERT INTO trx_hasil_pajak (id_hasil_pajak, kode_pajak, kategori_pajak, nama_formula, formula, nilai_persentase_formula, perhitungan_formula, hasil, id_sptb_pl, kategori, nilai) VALUES(37131, 8965, 'nilai_perhitungan', NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL);
INSERT INTO trx_hasil_pajak (id_hasil_pajak, kode_pajak, kategori_pajak, nama_formula, formula, nilai_persentase_formula, perhitungan_formula, hasil, id_sptb_pl, kategori, nilai) VALUES(37132, 8965, 'dpp_ppn', NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL);
INSERT INTO trx_hasil_pajak (id_hasil_pajak, kode_pajak, kategori_pajak, nama_formula, formula, nilai_persentase_formula, perhitungan_formula, hasil, id_sptb_pl, kategori, nilai) VALUES(37133, 8965, 'dpp_pph', NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL);
INSERT INTO trx_hasil_pajak (id_hasil_pajak, kode_pajak, kategori_pajak, nama_formula, formula, nilai_persentase_formula, perhitungan_formula, hasil, id_sptb_pl, kategori, nilai) VALUES(37134, 8965, 'ppn', NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL);
INSERT INTO trx_hasil_pajak (id_hasil_pajak, kode_pajak, kategori_pajak, nama_formula, formula, nilai_persentase_formula, perhitungan_formula, hasil, id_sptb_pl, kategori, nilai) VALUES(37135, 8965, 'pph', NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL);

INSERT INTO trx_riwayat_pelaksanaan (kode_trx_riwayat_pelaksanaan, kode_riwayat_pelaksanaan, kode_step_riwayat_pelaksanaan, status_step, ucr, uch, udcr, udch) VALUES(45194, 8965, 6, 'selesai', 'indraw@ecampus.ut.ac.id|Indra Wahyuni  S.E.', NULL, NULL, NULL);
INSERT INTO trx_tte (kode_tte, kode_trx_penandatangan, kode_permintaan, kategori_tte, path_dokumen, path_dokumen_selesai, tgl_selesai, nomor_surat) VALUES(44387, 44386, 8002, 's_pembayaran'::public.kategori_tte, '', NULL, NULL, '-');
INSERT INTO trx_pembayaran (kode_trx_pencarian, kode_trx_riwayat_pelaksanaan, kode_tte, tgl_surat_spp, tgl_surat_sptjb, tgl_surat_srk, no_surat_spp, no_surat_sptjb, no_surat_srk, ucr, uch, udcr, udch, kode_permintaan_pencairan, status_pengusulan, kode_permintaan_pencairan_old, kode_kontrak) VALUES(8965, 45194, 44387, NULL, NULL, NULL, '-', '-', '-', 'indraw@ecampus.ut.ac.id|Indra Wahyuni  S.E.', NULL, NULL, NULL, 18076, NULL, '9812-7933-sibela-luardpt', '7933-sibela-luardpt');





-- Pengadaan iklan Greeting Ramadhan dan Idul Fitri serta Live Talkshow bulan Februari 2026 di Banyumas TV UT Purwokerto
-- UN31.UT16
--
-- fixing query
DELETE FROM trx_pembayaran WHERE kode_trx_pencarian=9013;
DELETE FROM trx_tte WHERE kode_tte=44637;
DELETE FROM trx_riwayat_pelaksanaan WHERE kode_trx_riwayat_pelaksanaan=45434;

DELETE FROM trx_hasil_pajak WHERE id_hasil_pajak=37421;
DELETE FROM trx_hasil_pajak WHERE id_hasil_pajak=37422;
DELETE FROM trx_hasil_pajak WHERE id_hasil_pajak=37423;
DELETE FROM trx_hasil_pajak WHERE id_hasil_pajak=37424;
DELETE FROM trx_hasil_pajak WHERE id_hasil_pajak=37425;
DELETE FROM trx_pajak WHERE kode_pajak=9013;
DELETE FROM trx_riwayat_pelaksanaan WHERE kode_trx_riwayat_pelaksanaan=45433;

UPDATE trx_riwayat_pelaksanaan SET status_step='proses ppk'WHERE kode_trx_riwayat_pelaksanaan=45432;


-- reverse-fixing
UPDATE trx_riwayat_pelaksanaan SET status_step='selesai'WHERE kode_trx_riwayat_pelaksanaan=45432;

INSERT INTO trx_riwayat_pelaksanaan (kode_trx_riwayat_pelaksanaan, kode_riwayat_pelaksanaan, kode_step_riwayat_pelaksanaan, status_step, ucr, uch, udcr, udch) VALUES(45433, 9013, 4, 'selesai', 'asetyawan@ecampus.ut.ac.id|Adi Setyawan  S.E.', NULL, '2026-02-27 14:57:03.000', NULL);
INSERT INTO trx_pajak (kode_pajak, kode_trx_riwayat_pelaksanaan, kategori_nilai_transaksi, manajemen_fee, nilai_transaksi, jenis_mata_uang, kurs_asing, kurs_bank, kurs_kmk, tax_treaty, kode_jenis_transaksi, jenis_transaksi, kode_objek_pajak, objek_pajak, kode_detail_transaksi, detail_transaksi, ucr, uch, udcr, udch, nama_dok_efaktur, nomor_efaktur, tanggal_efaktur, nama_tabel_lama, id_sptb, biaya_tak_kena_pajak, kode_jenis_layanan) VALUES(9013, 45433, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, '2024-01-15 14:30:00.000', 'tbl_sptb_p', 6699, NULL, NULL);
INSERT INTO trx_hasil_pajak (id_hasil_pajak, kode_pajak, kategori_pajak, nama_formula, formula, nilai_persentase_formula, perhitungan_formula, hasil, id_sptb_pl, kategori, nilai) VALUES(37421, 9013, 'nilai_perhitungan', NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL);
INSERT INTO trx_hasil_pajak (id_hasil_pajak, kode_pajak, kategori_pajak, nama_formula, formula, nilai_persentase_formula, perhitungan_formula, hasil, id_sptb_pl, kategori, nilai) VALUES(37422, 9013, 'dpp_ppn', NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL);
INSERT INTO trx_hasil_pajak (id_hasil_pajak, kode_pajak, kategori_pajak, nama_formula, formula, nilai_persentase_formula, perhitungan_formula, hasil, id_sptb_pl, kategori, nilai) VALUES(37423, 9013, 'dpp_pph', NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL);
INSERT INTO trx_hasil_pajak (id_hasil_pajak, kode_pajak, kategori_pajak, nama_formula, formula, nilai_persentase_formula, perhitungan_formula, hasil, id_sptb_pl, kategori, nilai) VALUES(37424, 9013, 'ppn', NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL);
INSERT INTO trx_hasil_pajak (id_hasil_pajak, kode_pajak, kategori_pajak, nama_formula, formula, nilai_persentase_formula, perhitungan_formula, hasil, id_sptb_pl, kategori, nilai) VALUES(37425, 9013, 'pph', NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL);

INSERT INTO trx_riwayat_pelaksanaan (kode_trx_riwayat_pelaksanaan, kode_riwayat_pelaksanaan, kode_step_riwayat_pelaksanaan, status_step, ucr, uch, udcr, udch) VALUES(45434, 9013, 6, 'selesai', 'asetyawan@ecampus.ut.ac.id|Adi Setyawan  S.E.', NULL, NULL, NULL);
INSERT INTO trx_tte (kode_tte, kode_trx_penandatangan, kode_permintaan, kategori_tte, path_dokumen, path_dokumen_selesai, tgl_selesai, nomor_surat) VALUES(44637, 44636, 8055, 's_pembayaran'::public.kategori_tte, '', NULL, NULL, '-');
INSERT INTO trx_pembayaran (kode_trx_pencarian, kode_trx_riwayat_pelaksanaan, kode_tte, tgl_surat_spp, tgl_surat_sptjb, tgl_surat_srk, no_surat_spp, no_surat_sptjb, no_surat_srk, ucr, uch, udcr, udch, kode_permintaan_pencairan, status_pengusulan, kode_permintaan_pencairan_old, kode_kontrak) VALUES(9013, 45434, 44637, NULL, NULL, NULL, '-', '-', '-', 'asetyawan@ecampus.ut.ac.id|Adi Setyawan  S.E.', NULL, NULL, NULL, 18124, NULL, '9881-8004-sibela-luardpt', '8004-sibela-luardpt');




-- Pengadaan iklan Ucapan Ramadhan dan Idul Fitri serta Live Streaming bulan Februari 2026 di Satelit TV UT Purwokerto
-- UN31.UT16
--
-- fixing query
DELETE FROM trx_pembayaran WHERE kode_trx_pencarian=9014;
DELETE FROM trx_tte WHERE kode_tte=44642;
DELETE FROM trx_riwayat_pelaksanaan WHERE kode_trx_riwayat_pelaksanaan=45439;

DELETE FROM trx_hasil_pajak WHERE id_hasil_pajak=37416;
DELETE FROM trx_hasil_pajak WHERE id_hasil_pajak=37417;
DELETE FROM trx_hasil_pajak WHERE id_hasil_pajak=37418;
DELETE FROM trx_hasil_pajak WHERE id_hasil_pajak=37419;
DELETE FROM trx_hasil_pajak WHERE id_hasil_pajak=37420;
DELETE FROM trx_pajak WHERE kode_pajak=9014;
DELETE FROM trx_riwayat_pelaksanaan WHERE kode_trx_riwayat_pelaksanaan=45438;

UPDATE trx_riwayat_pelaksanaan SET status_step='proses penyedia' WHERE kode_trx_riwayat_pelaksanaan=45437;


-- reverse-fixing
UPDATE trx_riwayat_pelaksanaan SET status_step='selesai' WHERE kode_trx_riwayat_pelaksanaan=45437;

INSERT INTO trx_riwayat_pelaksanaan (kode_trx_riwayat_pelaksanaan, kode_riwayat_pelaksanaan, kode_step_riwayat_pelaksanaan, status_step, ucr, uch, udcr, udch) VALUES(45438, 9014, 4, 'selesai', 'asetyawan@ecampus.ut.ac.id|Adi Setyawan  S.E.', NULL, '2026-02-27 14:17:34.000', NULL);
INSERT INTO trx_pajak (kode_pajak, kode_trx_riwayat_pelaksanaan, kategori_nilai_transaksi, manajemen_fee, nilai_transaksi, jenis_mata_uang, kurs_asing, kurs_bank, kurs_kmk, tax_treaty, kode_jenis_transaksi, jenis_transaksi, kode_objek_pajak, objek_pajak, kode_detail_transaksi, detail_transaksi, ucr, uch, udcr, udch, nama_dok_efaktur, nomor_efaktur, tanggal_efaktur, nama_tabel_lama, id_sptb, biaya_tak_kena_pajak, kode_jenis_layanan) VALUES(9014, 45438, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, '2024-01-15 14:30:00.000', 'tbl_sptb_p', 6698, NULL, NULL);
INSERT INTO trx_hasil_pajak (id_hasil_pajak, kode_pajak, kategori_pajak, nama_formula, formula, nilai_persentase_formula, perhitungan_formula, hasil, id_sptb_pl, kategori, nilai) VALUES(37416, 9014, 'nilai_perhitungan', NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL);
INSERT INTO trx_hasil_pajak (id_hasil_pajak, kode_pajak, kategori_pajak, nama_formula, formula, nilai_persentase_formula, perhitungan_formula, hasil, id_sptb_pl, kategori, nilai) VALUES(37417, 9014, 'dpp_ppn', NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL);
INSERT INTO trx_hasil_pajak (id_hasil_pajak, kode_pajak, kategori_pajak, nama_formula, formula, nilai_persentase_formula, perhitungan_formula, hasil, id_sptb_pl, kategori, nilai) VALUES(37418, 9014, 'dpp_pph', NULL, NULL, NULL, NULL, 7200000, NULL, NULL, NULL);
INSERT INTO trx_hasil_pajak (id_hasil_pajak, kode_pajak, kategori_pajak, nama_formula, formula, nilai_persentase_formula, perhitungan_formula, hasil, id_sptb_pl, kategori, nilai) VALUES(37419, 9014, 'ppn', NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL);
INSERT INTO trx_hasil_pajak (id_hasil_pajak, kode_pajak, kategori_pajak, nama_formula, formula, nilai_persentase_formula, perhitungan_formula, hasil, id_sptb_pl, kategori, nilai) VALUES(37420, 9014, 'pph', NULL, NULL, NULL, NULL, 144000, NULL, NULL, NULL);

INSERT INTO trx_riwayat_pelaksanaan (kode_trx_riwayat_pelaksanaan, kode_riwayat_pelaksanaan, kode_step_riwayat_pelaksanaan, status_step, ucr, uch, udcr, udch) VALUES(45439, 9014, 6, 'selesai', 'asetyawan@ecampus.ut.ac.id|Adi Setyawan  S.E.', NULL, '2026-03-02 00:00:00.000', NULL);
INSERT INTO trx_tte (kode_tte, kode_trx_penandatangan, kode_permintaan, kategori_tte, path_dokumen, path_dokumen_selesai, tgl_selesai, nomor_surat) VALUES(44642, 44641, 8056, 's_pembayaran'::public.kategori_tte, '', NULL, '2026-03-02 00:00:00.000', 'B/66/UN31.UT16/PL.02.00/2026');
INSERT INTO trx_pembayaran (kode_trx_pencarian, kode_trx_riwayat_pelaksanaan, kode_tte, tgl_surat_spp, tgl_surat_sptjb, tgl_surat_srk, no_surat_spp, no_surat_sptjb, no_surat_srk, ucr, uch, udcr, udch, kode_permintaan_pencairan, status_pengusulan, kode_permintaan_pencairan_old, kode_kontrak) VALUES(9014, 45439, 44642, '2026-03-02 00:00:00.000', NULL, NULL, 'B/66/UN31.UT16/PL.02.00/2026', '-', '-', 'asetyawan@ecampus.ut.ac.id|Adi Setyawan  S.E.', NULL, NULL, NULL, 18125, NULL, '9882-8003-sibela-luardpt', '8003-sibela-luardpt');




-- Pelaksanaan PKBJJ di Hotel Grand Dian Slawi Tanggal 1 Maret 2026 UT Purwokerto
-- UN31.UT16
--
-- fixing query
DELETE FROM trx_pembayaran WHERE kode_trx_pencarian=9059;
DELETE FROM trx_tte WHERE kode_tte=44889;
DELETE FROM trx_riwayat_pelaksanaan WHERE kode_trx_riwayat_pelaksanaan=45664;

DELETE FROM trx_hasil_pajak WHERE id_hasil_pajak=37741;
DELETE FROM trx_hasil_pajak WHERE id_hasil_pajak=37742;
DELETE FROM trx_hasil_pajak WHERE id_hasil_pajak=37743;
DELETE FROM trx_hasil_pajak WHERE id_hasil_pajak=37744;
DELETE FROM trx_hasil_pajak WHERE id_hasil_pajak=37745;
DELETE FROM trx_pajak WHERE kode_pajak=9059;
DELETE FROM trx_riwayat_pelaksanaan WHERE kode_trx_riwayat_pelaksanaan=45663;

-- reverse-fixing
INSERT INTO trx_riwayat_pelaksanaan (kode_trx_riwayat_pelaksanaan, kode_riwayat_pelaksanaan, kode_step_riwayat_pelaksanaan, status_step, ucr, uch, udcr, udch) VALUES(45663, 9059, 4, 'selesai', 'asetyawan@ecampus.ut.ac.id|Adi Setyawan  S.E.', NULL, '2026-03-11 12:46:02.000', NULL);
INSERT INTO trx_pajak (kode_pajak, kode_trx_riwayat_pelaksanaan, kategori_nilai_transaksi, manajemen_fee, nilai_transaksi, jenis_mata_uang, kurs_asing, kurs_bank, kurs_kmk, tax_treaty, kode_jenis_transaksi, jenis_transaksi, kode_objek_pajak, objek_pajak, kode_detail_transaksi, detail_transaksi, ucr, uch, udcr, udch, nama_dok_efaktur, nomor_efaktur, tanggal_efaktur, nama_tabel_lama, id_sptb, biaya_tak_kena_pajak, kode_jenis_layanan) VALUES(9059, 45663, NULL, NULL, 31800000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Si-BeLa_1773904869348-75164650.pdf|jiEJHnOTqBdKtOtlyfd6espfdbdkMgZKZxmI2244y0k=', '0', '2024-01-15 14:30:00.000', 'tbl_sptb_p', 6769, NULL, NULL);
INSERT INTO trx_hasil_pajak (id_hasil_pajak, kode_pajak, kategori_pajak, nama_formula, formula, nilai_persentase_formula, perhitungan_formula, hasil, id_sptb_pl, kategori, nilai) VALUES(37741, 9059, 'nilai_perhitungan', NULL, NULL, NULL, NULL, 31800000, NULL, NULL, NULL);
INSERT INTO trx_hasil_pajak (id_hasil_pajak, kode_pajak, kategori_pajak, nama_formula, formula, nilai_persentase_formula, perhitungan_formula, hasil, id_sptb_pl, kategori, nilai) VALUES(37742, 9059, 'dpp_ppn', NULL, NULL, NULL, NULL, 31800000, NULL, NULL, NULL);
INSERT INTO trx_hasil_pajak (id_hasil_pajak, kode_pajak, kategori_pajak, nama_formula, formula, nilai_persentase_formula, perhitungan_formula, hasil, id_sptb_pl, kategori, nilai) VALUES(37743, 9059, 'dpp_pph', NULL, NULL, NULL, NULL, 31800000, NULL, NULL, NULL);
INSERT INTO trx_hasil_pajak (id_hasil_pajak, kode_pajak, kategori_pajak, nama_formula, formula, nilai_persentase_formula, perhitungan_formula, hasil, id_sptb_pl, kategori, nilai) VALUES(37744, 9059, 'ppn', NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL);
INSERT INTO trx_hasil_pajak (id_hasil_pajak, kode_pajak, kategori_pajak, nama_formula, formula, nilai_persentase_formula, perhitungan_formula, hasil, id_sptb_pl, kategori, nilai) VALUES(37745, 9059, 'pph', NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL);

INSERT INTO trx_riwayat_pelaksanaan (kode_trx_riwayat_pelaksanaan, kode_riwayat_pelaksanaan, kode_step_riwayat_pelaksanaan, status_step, ucr, uch, udcr, udch) VALUES(45664, 9059, 6, 'selesai', 'asetyawan@ecampus.ut.ac.id|Adi Setyawan  S.E.', NULL, '2026-03-12 00:00:00.000', NULL);
INSERT INTO trx_tte (kode_tte, kode_trx_penandatangan, kode_permintaan, kategori_tte, path_dokumen, path_dokumen_selesai, tgl_selesai, nomor_surat) VALUES(44889, 44888, 8112, 's_pembayaran'::public.kategori_tte, '', NULL, '2026-03-12 00:00:00.000', 'B/122/UN31.UT16/PL.02.00/2026');
INSERT INTO trx_pembayaran (kode_trx_pencarian, kode_trx_riwayat_pelaksanaan, kode_tte, tgl_surat_spp, tgl_surat_sptjb, tgl_surat_srk, no_surat_spp, no_surat_sptjb, no_surat_srk, ucr, uch, udcr, udch, kode_permintaan_pencairan, status_pengusulan, kode_permintaan_pencairan_old, kode_kontrak) VALUES(9059, 45664, 44889, '2026-03-12 00:00:00.000', NULL, NULL, 'B/122/UN31.UT16/PL.02.00/2026', '-', '-', 'asetyawan@ecampus.ut.ac.id|Adi Setyawan  S.E.', NULL, NULL, NULL, 18170, NULL, '9959-8074-sibela-luardpt', '8074-sibela-luardpt');



-- Pelaksanaan PKBJJ di Hotel Dedi Jaya Brebes Tanggal 7 Maret 2026 UT Purwokerto
-- UN31.UT16
--
-- fixing query
DELETE FROM trx_pembayaran WHERE kode_trx_pencarian=9060;
DELETE FROM trx_tte WHERE kode_tte=44894;
DELETE FROM trx_riwayat_pelaksanaan WHERE kode_trx_riwayat_pelaksanaan=45669;

DELETE FROM trx_hasil_pajak WHERE id_hasil_pajak=37751;
DELETE FROM trx_hasil_pajak WHERE id_hasil_pajak=37752;
DELETE FROM trx_hasil_pajak WHERE id_hasil_pajak=37753;
DELETE FROM trx_hasil_pajak WHERE id_hasil_pajak=37754;
DELETE FROM trx_hasil_pajak WHERE id_hasil_pajak=37755;
DELETE FROM trx_pajak WHERE kode_pajak=9060;
DELETE FROM trx_riwayat_pelaksanaan WHERE kode_trx_riwayat_pelaksanaan=45668;


-- reverse-fixing
INSERT INTO trx_riwayat_pelaksanaan (kode_trx_riwayat_pelaksanaan, kode_riwayat_pelaksanaan, kode_step_riwayat_pelaksanaan, status_step, ucr, uch, udcr, udch) VALUES(45668, 9060, 4, 'selesai', 'asetyawan@ecampus.ut.ac.id|Adi Setyawan  S.E.', NULL, '2026-03-11 14:57:57.000', NULL);
INSERT INTO trx_pajak (kode_pajak, kode_trx_riwayat_pelaksanaan, kategori_nilai_transaksi, manajemen_fee, nilai_transaksi, jenis_mata_uang, kurs_asing, kurs_bank, kurs_kmk, tax_treaty, kode_jenis_transaksi, jenis_transaksi, kode_objek_pajak, objek_pajak, kode_detail_transaksi, detail_transaksi, ucr, uch, udcr, udch, nama_dok_efaktur, nomor_efaktur, tanggal_efaktur, nama_tabel_lama, id_sptb, biaya_tak_kena_pajak, kode_jenis_layanan) VALUES(9060, 45668, NULL, NULL, 25200000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Si-BeLa_1773904873436-238899690.pdf|Q8wn5ARC1UIQLOnYEat-YQrgXzjuWPCGlABQ0ebuOEU=', '-', '2024-01-15 14:30:00.000', 'tbl_sptb_p', 6771, NULL, NULL);
INSERT INTO trx_hasil_pajak (id_hasil_pajak, kode_pajak, kategori_pajak, nama_formula, formula, nilai_persentase_formula, perhitungan_formula, hasil, id_sptb_pl, kategori, nilai) VALUES(37751, 9060, 'nilai_perhitungan', NULL, NULL, NULL, NULL, 25200000, NULL, NULL, NULL);
INSERT INTO trx_hasil_pajak (id_hasil_pajak, kode_pajak, kategori_pajak, nama_formula, formula, nilai_persentase_formula, perhitungan_formula, hasil, id_sptb_pl, kategori, nilai) VALUES(37752, 9060, 'dpp_ppn', NULL, NULL, NULL, NULL, 25200000, NULL, NULL, NULL);
INSERT INTO trx_hasil_pajak (id_hasil_pajak, kode_pajak, kategori_pajak, nama_formula, formula, nilai_persentase_formula, perhitungan_formula, hasil, id_sptb_pl, kategori, nilai) VALUES(37753, 9060, 'dpp_pph', NULL, NULL, NULL, NULL, 25200000, NULL, NULL, NULL);
INSERT INTO trx_hasil_pajak (id_hasil_pajak, kode_pajak, kategori_pajak, nama_formula, formula, nilai_persentase_formula, perhitungan_formula, hasil, id_sptb_pl, kategori, nilai) VALUES(37754, 9060, 'ppn', NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL);
INSERT INTO trx_hasil_pajak (id_hasil_pajak, kode_pajak, kategori_pajak, nama_formula, formula, nilai_persentase_formula, perhitungan_formula, hasil, id_sptb_pl, kategori, nilai) VALUES(37755, 9060, 'pph', NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL);

INSERT INTO trx_riwayat_pelaksanaan (kode_trx_riwayat_pelaksanaan, kode_riwayat_pelaksanaan, kode_step_riwayat_pelaksanaan, status_step, ucr, uch, udcr, udch) VALUES(45669, 9060, 6, 'selesai', 'asetyawan@ecampus.ut.ac.id|Adi Setyawan  S.E.', NULL, '2026-03-12 00:00:00.000', NULL);
INSERT INTO trx_tte (kode_tte, kode_trx_penandatangan, kode_permintaan, kategori_tte, path_dokumen, path_dokumen_selesai, tgl_selesai, nomor_surat) VALUES(44894, 44893, 8113, 's_pembayaran'::public.kategori_tte, '', NULL, '2026-03-12 00:00:00.000', 'B/125/UN31.UT16/PL.02.00/2026');
INSERT INTO trx_pembayaran (kode_trx_pencarian, kode_trx_riwayat_pelaksanaan, kode_tte, tgl_surat_spp, tgl_surat_sptjb, tgl_surat_srk, no_surat_spp, no_surat_sptjb, no_surat_srk, ucr, uch, udcr, udch, kode_permintaan_pencairan, status_pengusulan, kode_permintaan_pencairan_old, kode_kontrak) VALUES(9060, 45669, 44894, '2026-03-12 00:00:00.000', NULL, NULL, 'B/125/UN31.UT16/PL.02.00/2026', '-', '-', 'asetyawan@ecampus.ut.ac.id|Adi Setyawan  S.E.', NULL, NULL, NULL, 18171, NULL, '9960-8076-sibela-luardpt', '8076-sibela-luardpt');



-- UN31.UT13	luar_dpt	32025	Sewa Ballroom Dalam Rangka Kegiatan OSMB, PKBJJ, WT Dan KU Universitas Terbuka Serang Masa 2026.1
-- fixing
DELETE FROM trx_pembayaran WHERE kode_trx_pencarian=9015;
DELETE FROM trx_tte WHERE kode_tte=44647;
DELETE FROM trx_riwayat_pelaksanaan WHERE kode_trx_riwayat_pelaksanaan=45444;

DELETE FROM trx_hasil_pajak WHERE id_hasil_pajak=37426;
DELETE FROM trx_hasil_pajak WHERE id_hasil_pajak=37427;
DELETE FROM trx_hasil_pajak WHERE id_hasil_pajak=37428;
DELETE FROM trx_hasil_pajak WHERE id_hasil_pajak=37429;
DELETE FROM trx_hasil_pajak WHERE id_hasil_pajak=37430;
DELETE FROM trx_pajak WHERE kode_pajak=9015;
DELETE FROM trx_riwayat_pelaksanaan WHERE kode_trx_riwayat_pelaksanaan=45443;

UPDATE trx_riwayat_pelaksanaan SET kode_riwayat_pelaksanaan=9015, kode_step_riwayat_pelaksanaan=3, status_step='proses penyedia', ucr='arpan@ecampus.ut.ac.id|Arpan Dadi  S.E.', uch=NULL, udcr='2026-03-04 00:00:00.000', udch=NULL WHERE kode_trx_riwayat_pelaksanaan=45442;

-- reverse
UPDATE trx_riwayat_pelaksanaan SET kode_riwayat_pelaksanaan=9015, kode_step_riwayat_pelaksanaan=3, status_step='selesai', ucr='arpan@ecampus.ut.ac.id|Arpan Dadi  S.E.', uch=NULL, udcr='2026-03-04 00:00:00.000', udch=NULL WHERE kode_trx_riwayat_pelaksanaan=45442;

INSERT INTO trx_riwayat_pelaksanaan (kode_trx_riwayat_pelaksanaan, kode_riwayat_pelaksanaan, kode_step_riwayat_pelaksanaan, status_step, ucr, uch, udcr, udch) VALUES(45443, 9015, 4, 'selesai', 'arpan@ecampus.ut.ac.id|Arpan Dadi  S.E.', NULL, '2026-02-27 15:04:19.000', NULL);
INSERT INTO trx_pajak (kode_pajak, kode_trx_riwayat_pelaksanaan, kategori_nilai_transaksi, manajemen_fee, nilai_transaksi, jenis_mata_uang, kurs_asing, kurs_bank, kurs_kmk, tax_treaty, kode_jenis_transaksi, jenis_transaksi, kode_objek_pajak, objek_pajak, kode_detail_transaksi, detail_transaksi, ucr, uch, udcr, udch, nama_dok_efaktur, nomor_efaktur, tanggal_efaktur, nama_tabel_lama, id_sptb, biaya_tak_kena_pajak, kode_jenis_layanan) VALUES(9015, 45443, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Si-BeLa_1773904756550-213527510.pdf|ThjEcOgZPT3tWiLOPVaaBOu7B1sl_cxA-eHUhxYhfPI=', 'S-290/KPP.0805/2025', '2024-01-15 14:30:00.000', 'tbl_sptb_p', 6700, NULL, NULL);
INSERT INTO trx_hasil_pajak (id_hasil_pajak, kode_pajak, kategori_pajak, nama_formula, formula, nilai_persentase_formula, perhitungan_formula, hasil, id_sptb_pl, kategori, nilai) VALUES(37426, 9015, 'nilai_perhitungan', NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL);
INSERT INTO trx_hasil_pajak (id_hasil_pajak, kode_pajak, kategori_pajak, nama_formula, formula, nilai_persentase_formula, perhitungan_formula, hasil, id_sptb_pl, kategori, nilai) VALUES(37427, 9015, 'dpp_ppn', NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL);
INSERT INTO trx_hasil_pajak (id_hasil_pajak, kode_pajak, kategori_pajak, nama_formula, formula, nilai_persentase_formula, perhitungan_formula, hasil, id_sptb_pl, kategori, nilai) VALUES(37428, 9015, 'dpp_pph', NULL, NULL, NULL, NULL, 36000000, NULL, NULL, NULL);
INSERT INTO trx_hasil_pajak (id_hasil_pajak, kode_pajak, kategori_pajak, nama_formula, formula, nilai_persentase_formula, perhitungan_formula, hasil, id_sptb_pl, kategori, nilai) VALUES(37429, 9015, 'ppn', NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL);
INSERT INTO trx_hasil_pajak (id_hasil_pajak, kode_pajak, kategori_pajak, nama_formula, formula, nilai_persentase_formula, perhitungan_formula, hasil, id_sptb_pl, kategori, nilai) VALUES(37430, 9015, 'pph', NULL, NULL, NULL, NULL, 3600000, NULL, NULL, NULL);

INSERT INTO trx_riwayat_pelaksanaan (kode_trx_riwayat_pelaksanaan, kode_riwayat_pelaksanaan, kode_step_riwayat_pelaksanaan, status_step, ucr, uch, udcr, udch) VALUES(45444, 9015, 6, 'selesai', 'arpan@ecampus.ut.ac.id|Arpan Dadi  S.E.', NULL, '2026-03-05 00:00:00.000', NULL);
INSERT INTO trx_tte (kode_tte, kode_trx_penandatangan, kode_permintaan, kategori_tte, path_dokumen, path_dokumen_selesai, tgl_selesai, nomor_surat) VALUES(44647, 44646, 8057, 's_pembayaran'::public.kategori_tte, '', NULL, '2026-03-05 00:00:00.000', 'B/29/UN31.UT13/PL.02.00/2026');
INSERT INTO trx_pembayaran (kode_trx_pencarian, kode_trx_riwayat_pelaksanaan, kode_tte, tgl_surat_spp, tgl_surat_sptjb, tgl_surat_srk, no_surat_spp, no_surat_sptjb, no_surat_srk, ucr, uch, udcr, udch, kode_permintaan_pencairan, status_pengusulan, kode_permintaan_pencairan_old, kode_kontrak) VALUES(9015, 45444, 44647, '2026-03-05 00:00:00.000', NULL, NULL, 'B/29/UN31.UT13/PL.02.00/2026', '-', '-', 'arpan@ecampus.ut.ac.id|Arpan Dadi  S.E.', NULL, NULL, NULL, 18126, NULL, '9883-8005-sibela-luardpt', '8005-sibela-luardpt');








-- UN31.DTD	dpt	10417	Koneksi Jaringan VPN-IP Koneksi UT Daerah Wilayah Sumatera ke UT-Pusat Di Lingkungan Universitas Terbuka Tahun 2026 (Januari)
-- fixing
DELETE FROM trx_pembayaran WHERE kode_trx_pencarian=3307;
DELETE FROM trx_tte WHERE kode_tte=16531;
DELETE FROM trx_riwayat_pelaksanaan WHERE kode_trx_riwayat_pelaksanaan=16648;

DELETE FROM trx_hasil_pajak WHERE id_hasil_pajak=7031;
DELETE FROM trx_hasil_pajak WHERE id_hasil_pajak=7032;
DELETE FROM trx_hasil_pajak WHERE id_hasil_pajak=7033;
DELETE FROM trx_hasil_pajak WHERE id_hasil_pajak=7034;
DELETE FROM trx_hasil_pajak WHERE id_hasil_pajak=7035;
DELETE FROM trx_pajak WHERE kode_pajak=3307;
DELETE FROM trx_riwayat_pelaksanaan WHERE kode_trx_riwayat_pelaksanaan=16647;




-- reverse
INSERT INTO trx_riwayat_pelaksanaan (kode_trx_riwayat_pelaksanaan, kode_riwayat_pelaksanaan, kode_step_riwayat_pelaksanaan, status_step, ucr, uch, udcr, udch) VALUES(16647, 3307, 4, 'selesai', 'yopi-ut@ecampus.ut.ac.id|Yopianto  S.Kom.', NULL, '2026-01-29 11:36:22.000', NULL);
INSERT INTO trx_pajak (kode_pajak, kode_trx_riwayat_pelaksanaan, kategori_nilai_transaksi, manajemen_fee, nilai_transaksi, jenis_mata_uang, kurs_asing, kurs_bank, kurs_kmk, tax_treaty, kode_jenis_transaksi, jenis_transaksi, kode_objek_pajak, objek_pajak, kode_detail_transaksi, detail_transaksi, ucr, uch, udcr, udch, nama_dok_efaktur, nomor_efaktur, tanggal_efaktur, nama_tabel_lama, id_sptb, biaya_tak_kena_pajak, kode_jenis_layanan) VALUES(3307, 16647, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, '2024-01-15 14:30:00.000', 'tbl_sptbdpt_pl', 1559, NULL, NULL);
INSERT INTO trx_hasil_pajak (id_hasil_pajak, kode_pajak, kategori_pajak, nama_formula, formula, nilai_persentase_formula, perhitungan_formula, hasil, id_sptb_pl, kategori, nilai) VALUES(7031, 3307, 'nilai_perhitungan', NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL);
INSERT INTO trx_hasil_pajak (id_hasil_pajak, kode_pajak, kategori_pajak, nama_formula, formula, nilai_persentase_formula, perhitungan_formula, hasil, id_sptb_pl, kategori, nilai) VALUES(7032, 3307, 'dpp_ppn', NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL);
INSERT INTO trx_hasil_pajak (id_hasil_pajak, kode_pajak, kategori_pajak, nama_formula, formula, nilai_persentase_formula, perhitungan_formula, hasil, id_sptb_pl, kategori, nilai) VALUES(7033, 3307, 'dpp_pph', NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL);
INSERT INTO trx_hasil_pajak (id_hasil_pajak, kode_pajak, kategori_pajak, nama_formula, formula, nilai_persentase_formula, perhitungan_formula, hasil, id_sptb_pl, kategori, nilai) VALUES(7034, 3307, 'ppn', NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL);
INSERT INTO trx_hasil_pajak (id_hasil_pajak, kode_pajak, kategori_pajak, nama_formula, formula, nilai_persentase_formula, perhitungan_formula, hasil, id_sptb_pl, kategori, nilai) VALUES(7035, 3307, 'pph', NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL);

INSERT INTO trx_riwayat_pelaksanaan (kode_trx_riwayat_pelaksanaan, kode_riwayat_pelaksanaan, kode_step_riwayat_pelaksanaan, status_step, ucr, uch, udcr, udch) VALUES(16648, 3307, 6, 'selesai', 'yopi-ut@ecampus.ut.ac.id|Yopianto  S.Kom.', NULL, NULL, NULL);
INSERT INTO trx_tte (kode_tte, kode_trx_penandatangan, kode_permintaan, kategori_tte, path_dokumen, path_dokumen_selesai, tgl_selesai, nomor_surat) VALUES(16531, 16530, 3073, 's_pembayaran'::public.kategori_tte, '', NULL, NULL, '-');
INSERT INTO trx_pembayaran (kode_trx_pencarian, kode_trx_riwayat_pelaksanaan, kode_tte, tgl_surat_spp, tgl_surat_sptjb, tgl_surat_srk, no_surat_spp, no_surat_sptjb, no_surat_srk, ucr, uch, udcr, udch, kode_permintaan_pencairan, status_pengusulan, kode_permintaan_pencairan_old, kode_kontrak) VALUES(3307, 16648, 16531, NULL, NULL, NULL, '-', '-', '-', 'yopi-ut@ecampus.ut.ac.id|Yopianto  S.Kom.', NULL, NULL, NULL, 12423, NULL, '2528-1759-sibela-dpt', '1759-sibela-dpt');








-- UN31.UT21	luar_dpt	16629	Pekerjaan Pengadaan Barang Habis Pakai kegiatan OSMB dan PKBJJ Masa 2026.1 UT Palangkaraya Tahun 2026
-- fixing
DELETE FROM trx_tte WHERE kode_tte=44924;
DELETE FROM trx_pembayaran WHERE kode_trx_pencarian=9066;
UPDATE trx_riwayat_pelaksanaan SET kode_riwayat_pelaksanaan=9066, kode_step_riwayat_pelaksanaan=6, status_step='proses pp', ucr='diana_akhsa@ecampus.ut.ac.id|Diana Akhsa  A.Md.', uch=NULL, udcr='2026-03-16 00:00:00.000', udch=NULL WHERE kode_trx_riwayat_pelaksanaan=45699;

-- reverse
UPDATE trx_riwayat_pelaksanaan SET kode_riwayat_pelaksanaan=9066, kode_step_riwayat_pelaksanaan=6, status_step='selesai', ucr='diana_akhsa@ecampus.ut.ac.id|Diana Akhsa  A.Md.', uch=NULL, udcr='2026-03-16 00:00:00.000', udch=NULL WHERE kode_trx_riwayat_pelaksanaan=45699;
INSERT INTO trx_pembayaran (kode_trx_pencarian, kode_trx_riwayat_pelaksanaan, kode_tte, tgl_surat_spp, tgl_surat_sptjb, tgl_surat_srk, no_surat_spp, no_surat_sptjb, no_surat_srk, ucr, uch, udcr, udch, kode_permintaan_pencairan, status_pengusulan, kode_permintaan_pencairan_old, kode_kontrak) VALUES(9066, 45699, 44924, '2026-03-16 00:00:00.000', NULL, NULL, 'B/31/UN31.UT21/PL.02.00/2026', '-', '-', 'diana_akhsa@ecampus.ut.ac.id|Diana Akhsa  A.Md.', NULL, NULL, NULL, 18177, NULL, '9968-8073-sibela-luardpt', '8073-sibela-luardpt');
INSERT INTO trx_tte (kode_tte, kode_trx_penandatangan, kode_permintaan, kategori_tte, path_dokumen, path_dokumen_selesai, tgl_selesai, nomor_surat) VALUES(44924, 44923, 8119, 's_pembayaran'::public.kategori_tte, '', NULL, '2026-03-16 00:00:00.000', 'B/31/UN31.UT21/PL.02.00/2026');







-- UN31.UT17	luar_dpt	10636	Pembelian dan Pemasangan Kaca Film Anti Panas Pada Interior Ruang Rapat Serbaguna Gedung UT Semarang
-- fixing
DELETE FROM trx_pembayaran WHERE kode_trx_pencarian=9073;
DELETE FROM trx_tte WHERE kode_tte=44959;
DELETE FROM trx_riwayat_pelaksanaan WHERE kode_trx_riwayat_pelaksanaan=45734;

DELETE FROM trx_hasil_pajak WHERE id_hasil_pajak=37786;
DELETE FROM trx_hasil_pajak WHERE id_hasil_pajak=37787;
DELETE FROM trx_hasil_pajak WHERE id_hasil_pajak=37788;
DELETE FROM trx_hasil_pajak WHERE id_hasil_pajak=37789;
DELETE FROM trx_hasil_pajak WHERE id_hasil_pajak=37790;
DELETE FROM trx_pajak WHERE kode_pajak=9073;
DELETE FROM trx_riwayat_pelaksanaan WHERE kode_trx_riwayat_pelaksanaan=45733;

UPDATE trx_riwayat_pelaksanaan SET kode_riwayat_pelaksanaan=9073, kode_step_riwayat_pelaksanaan=3, status_step='proses ppk', ucr='baktiar@ecampus.ut.ac.id|Baktiar Hertansyah Pohan  S.E.', uch=NULL, udcr='2026-03-11 00:00:00.000', udch=NULL WHERE kode_trx_riwayat_pelaksanaan=45732;


-- reverse
UPDATE trx_riwayat_pelaksanaan SET kode_riwayat_pelaksanaan=9073, kode_step_riwayat_pelaksanaan=3, status_step='selesai', ucr='baktiar@ecampus.ut.ac.id|Baktiar Hertansyah Pohan  S.E.', uch=NULL, udcr='2026-03-11 00:00:00.000', udch=NULL WHERE kode_trx_riwayat_pelaksanaan=45732;

INSERT INTO trx_riwayat_pelaksanaan (kode_trx_riwayat_pelaksanaan, kode_riwayat_pelaksanaan, kode_step_riwayat_pelaksanaan, status_step, ucr, uch, udcr, udch) VALUES(45733, 9073, 4, 'selesai', 'baktiar@ecampus.ut.ac.id|Baktiar Hertansyah Pohan  S.E.', NULL, '2026-03-12 14:32:10.000', NULL);
INSERT INTO trx_pajak (kode_pajak, kode_trx_riwayat_pelaksanaan, kategori_nilai_transaksi, manajemen_fee, nilai_transaksi, jenis_mata_uang, kurs_asing, kurs_bank, kurs_kmk, tax_treaty, kode_jenis_transaksi, jenis_transaksi, kode_objek_pajak, objek_pajak, kode_detail_transaksi, detail_transaksi, ucr, uch, udcr, udch, nama_dok_efaktur, nomor_efaktur, tanggal_efaktur, nama_tabel_lama, id_sptb, biaya_tak_kena_pajak, kode_jenis_layanan) VALUES(9073, 45733, NULL, NULL, 8629055, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Si-BeLa_1773904883188-917267230.pdf|Fi-gRb1daU-pFTfacXsTQfbdWRMgvQ8zxykyOL0K5MM=', '04002600088690624', '2024-01-15 14:30:00.000', 'tbl_sptb_p', 6779, NULL, NULL);
INSERT INTO trx_hasil_pajak (id_hasil_pajak, kode_pajak, kategori_pajak, nama_formula, formula, nilai_persentase_formula, perhitungan_formula, hasil, id_sptb_pl, kategori, nilai) VALUES(37786, 9073, 'nilai_perhitungan', NULL, NULL, NULL, NULL, 8629055, NULL, NULL, NULL);
INSERT INTO trx_hasil_pajak (id_hasil_pajak, kode_pajak, kategori_pajak, nama_formula, formula, nilai_persentase_formula, perhitungan_formula, hasil, id_sptb_pl, kategori, nilai) VALUES(37787, 9073, 'dpp_ppn', NULL, NULL, NULL, NULL, 8629055, NULL, NULL, NULL);
INSERT INTO trx_hasil_pajak (id_hasil_pajak, kode_pajak, kategori_pajak, nama_formula, formula, nilai_persentase_formula, perhitungan_formula, hasil, id_sptb_pl, kategori, nilai) VALUES(37788, 9073, 'dpp_pph', NULL, NULL, NULL, NULL, 9413514, NULL, NULL, NULL);
INSERT INTO trx_hasil_pajak (id_hasil_pajak, kode_pajak, kategori_pajak, nama_formula, formula, nilai_persentase_formula, perhitungan_formula, hasil, id_sptb_pl, kategori, nilai) VALUES(37789, 9073, 'ppn', NULL, NULL, NULL, NULL, 1035487, NULL, NULL, NULL);
INSERT INTO trx_hasil_pajak (id_hasil_pajak, kode_pajak, kategori_pajak, nama_formula, formula, nilai_persentase_formula, perhitungan_formula, hasil, id_sptb_pl, kategori, nilai) VALUES(37790, 9073, 'pph', NULL, NULL, NULL, NULL, 188270, NULL, NULL, NULL);

INSERT INTO trx_riwayat_pelaksanaan (kode_trx_riwayat_pelaksanaan, kode_riwayat_pelaksanaan, kode_step_riwayat_pelaksanaan, status_step, ucr, uch, udcr, udch) VALUES(45734, 9073, 6, 'selesai', 'baktiar@ecampus.ut.ac.id|Baktiar Hertansyah Pohan  S.E.', NULL, '2026-03-13 00:00:00.000', NULL);
INSERT INTO trx_tte (kode_tte, kode_trx_penandatangan, kode_permintaan, kategori_tte, path_dokumen, path_dokumen_selesai, tgl_selesai, nomor_surat) VALUES(44959, 44958, 8126, 's_pembayaran'::public.kategori_tte, '', NULL, '2026-03-13 00:00:00.000', 'B/90/UN31.UT17/PL.02.00/2026');
INSERT INTO trx_pembayaran (kode_trx_pencarian, kode_trx_riwayat_pelaksanaan, kode_tte, tgl_surat_spp, tgl_surat_sptjb, tgl_surat_srk, no_surat_spp, no_surat_sptjb, no_surat_srk, ucr, uch, udcr, udch, kode_permintaan_pencairan, status_pengusulan, kode_permintaan_pencairan_old, kode_kontrak) VALUES(9073, 45734, 44959, '2026-03-13 00:00:00.000', NULL, NULL, 'B/90/UN31.UT17/PL.02.00/2026', '-', '-', 'baktiar@ecampus.ut.ac.id|Baktiar Hertansyah Pohan  S.E.', NULL, NULL, NULL, 18184, NULL, '9976-8084-sibela-luardpt', '8084-sibela-luardpt');








