-- ref_kab_kota
CREATE INDEX idx_kabkota_kode_provinsi ON ref_kab_kota(kode_provinsi);

-- ref_det_penggunaan_pagu
CREATE INDEX idx_det_pp_kode_rup ON ref_det_penggunaan_pagu(kode_rup);
CREATE INDEX idx_det_pp_kode_permintaan ON ref_det_penggunaan_pagu(kode_permintaan_pencairan);
CREATE INDEX idx_det_pp_no_drauk ON ref_det_penggunaan_pagu(no_drauk);


-- ref_keyword
CREATE INDEX idx_keyword_kode_kabkota ON ref_keyword(kode_kab_kota);

-- ref_rup
CREATE INDEX idx_rup_kode_kabkota ON ref_rup(kode_kab_kota);
CREATE INDEX idx_rup_no_drauk ON ref_rup(no_drauk);
CREATE INDEX idx_rup_tahun_anggaran ON ref_rup(tahun_anggaran);
CREATE INDEX idx_rup_status_rup ON ref_rup(status_rup);
-- ref_rup (highly queried table)
CREATE INDEX idx_rup_jml_pagu ON ref_rup(jml_pagu);
CREATE INDEX idx_rup_status_digunakan ON ref_rup(status_rup_digunakan);

-- trx_permintaan_pencairan
CREATE INDEX idx_permintaan_kode_rup ON trx_permintaan_pencairan(kode_rup);
CREATE INDEX idx_permintaan_kode_kontrak ON trx_permintaan_pencairan(kode_kontrak);
CREATE INDEX idx_permintaan_tgl_permintaan ON trx_permintaan_pencairan(tgl_permintaan_pencairan);
-- trx_permintaan_pencairan
CREATE INDEX idx_permintaan_nama_aplikasi ON trx_permintaan_pencairan(nama_aplikasi);
CREATE INDEX idx_permintaan_kode_usulan ON trx_permintaan_pencairan(kode_usulan);


-- ref_det_penggunaan_pagu (for reporting/aggregation)
CREATE INDEX idx_det_pp_nominal ON ref_det_penggunaan_pagu(nominal);
CREATE INDEX idx_det_pp_udcr ON ref_det_penggunaan_pagu(udcr);




