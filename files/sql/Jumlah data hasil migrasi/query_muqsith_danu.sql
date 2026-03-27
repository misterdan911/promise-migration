-- Total Data RUP
-- ---------------------------------------------------------------------------
-- Muqsith (9393)
SELECT COUNT(*) FROM promise_sippan.tbl_rup_ut WHERE nomor_rup_ut IS NOT NULL;

-- Danu (9393)
select count(*) as total_rup from ref_rup;
-- ---------------------------------------------------------------------------


-- Total DPT Badan Usaha
-- ---------------------------------------------------------------------------
-- Muqsith (665)
SELECT COUNT(*) FROM vms_db.tbl_profile_penyedia AS a WHERE a.id_jenis_penyedia = 1 AND a.penyedia_terpilih = 1;

-- Danu (665)
select count(*) from ref_vendor
where
is_tetap = true
and kode_jenis_vendor = 1; 

-- ---------------------------------------------------------------------------


-- Total DPT Perorangan
-- ---------------------------------------------------------------------------
-- Muqsith (18)
SELECT COUNT(*) FROM vms_db.tbl_profile_penyedia AS a WHERE a.id_jenis_penyedia = 2 AND a.penyedia_terpilih = 1;

-- Danu (18)
select count(*) from ref_vendor
where
is_tetap = true
and kode_jenis_vendor = 2; 

-- ---------------------------------------------------------------------------


-- Total Luar DPT Badan Usaha
-- ---------------------------------------------------------------------------
-- Muqsith (1784)
SELECT COUNT(*) FROM promise_sibela.tbl_profile_penyedia AS a
WHERE a.id_jenis_penyedia = 1 AND a.p_status = 1;

-- Danu (1927)
select count(*) from ref_vendor
where
is_tetap = false
and kode_jenis_vendor = 1
and status_aktif_vendor = 'aktif'; 
-- ---------------------------------------------------------------------------


-- Total Luar DPT Perorangan
-- ---------------------------------------------------------------------------
-- Muqsith (251)
SELECT COUNT(*) FROM promise_sibela.tbl_profile_penyedia AS a WHERE a.id_jenis_penyedia = 2 AND a.p_status = 1;

-- Danu (246)
select count(*) as total_luardpt_pero from ref_vendor
where
is_tetap = false
and kode_jenis_vendor = 2
and status_aktif_vendor = 'aktif'; 
-- ---------------------------------------------------------------------------


-- Total Penandatangan Eksternal
-- ---------------------------------------------------------------------------
-- Muqsith (2204)
SELECT * FROM promise_esign.penyedia;

-- Danu







- SIBELA: Jumlah Kontrak / Paket;
select count(*) from ref_permintaan;

- SIPLANG: Jumlah Kontrak / Paket; (1359)
select count(*) from ref_permintaan;





select count(*) from (
	select distinct on (email) * from trx_user_tampung where kode_jabatan = 7
);


select * from trx_user_tampung where kode_jabatan = 7;







Count data :
- SIPPAN : Jumlah data RUP; (9393)

- SIDAPET:
  Jumlah data Penyedia luar DPT; (2226)
  jumlah data Penyedia DPT; (695)
  Jumlah Kategori; (80)

- SIBELA: Jumlah Kontrak / Paket; (8132)
- SIPLANG: Jumlah Kontrak / Paket; (1359)

- USMAN :
  Jumlah PPK sesuai SK tahun 2026,
  Jumlah PK sesuai SK tahun 2026,
  Jumlah verifikator sesuai SK tahun 2026,
  jumlah PP sesuai SK tahun 2026

