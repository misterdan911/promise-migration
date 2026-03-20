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
-- Muqsith
SELECT COUNT(*) FROM promise_sibela.tbl_profile_penyedia AS a
WHERE a.id_jenis_penyedia = 1 AND a.p_status = 1;

-- Danu
select count(*) as total_luardpt_bu from ref_vendor
where
is_tetap = false
and kode_jenis_vendor = 1
and status_aktif_vendor = 'aktif'; 
-- ---------------------------------------------------------------------------


-- Total Luar DPT Perorangan
-- ---------------------------------------------------------------------------
-- Muqsith
SELECT COUNT(*) FROM promise_sibela.tbl_profile_penyedia AS a WHERE a.id_jenis_penyedia = 2 AND a.p_status = 1;

-- Danu
select count(*) as total_luardpt_pero from ref_vendor
where
is_tetap = false
and kode_jenis_vendor = 2
and status_aktif_vendor = 'aktif'; 
-- ---------------------------------------------------------------------------





















