SELECT COUNT(*) FROM promise_sippan.tbl_rup_ut WHERE nomor_rup_ut IS NOT NULL;
SELECT COUNT(*) FROM vms_db.tbl_profile_penyedia AS a WHERE a.id_jenis_penyedia = 1 AND a.penyedia_terpilih = 1;
SELECT COUNT(*) FROM vms_db.tbl_profile_penyedia AS a WHERE a.id_jenis_penyedia = 2 AND a.penyedia_terpilih = 1;
SELECT COUNT(*) FROM promise_sibela.tbl_profile_penyedia AS a WHERE a.id_jenis_penyedia = 1 AND a.p_status = 1;
SELECT COUNT(*) FROM promise_sibela.tbl_profile_penyedia AS a WHERE a.id_jenis_penyedia = 2 AND a.p_status = 1;

-- Pengadaan On Proses

SELECT 
YEAR(a.create_at) AS tahun,a.nama_pesanan_pl AS nama_pengadaan, h.nama AS nama_penyedia, a.total,
'sibela luardpt' AS modul
FROM promise_sibela.tbl_paket_pl AS a
JOIN promise_sibela.tbl_profile_penyedia AS h ON a.id_profil_penyedia = h.id_profil_penyedia
WHERE a.status_termin_pl < 100
AND a.deleted_at IS NULL
AND YEAR(a.create_at) >= 2026

UNION 

SELECT 
YEAR(a.create_at) AS tahun, a.nama_pesanan_dptpl AS nama_pengadaan, h.nama AS nama_penyedia, a.total,
'sibela dpt' AS modul
FROM promise_sibela.tbl_paketdpt_pl AS a
JOIN vms_db.tbl_profile_penyedia AS h ON a.id_profil_penyedia = h.id_profil_penyedia
WHERE a.status_termin_dptpl < 100
AND a.deleted_at IS NULL
AND YEAR(a.create_at) >= 2026;

SELECT 
YEAR(a.create_at) AS tahun,a.nama_pesanan_pl AS nama_pengadaan, h.nama AS nama_penyedia, a.total,
'siplang dpt' AS modul
FROM promise_siplang.tbl_paket_pl AS a
JOIN vms_db.tbl_profile_penyedia AS h ON a.id_profil_penyedia = h.id_profil_penyedia
WHERE a.status_termin_pl < 100
AND a.deleted_at IS NULL
AND YEAR(a.create_at) >= 2026;

-- pengadaan selesai
SELECT * FROM
promise_sibela.tbl_paket_pl AS a
WHERE a.create_at <= "2026-01-07 23:59:59"
AND a.deleted_at IS NULL 

UNION 

SELECT * FROM
promise_sibela.tbl_paketdpt_pl AS a
WHERE a.create_at <= "2026-01-07 23:59:59"
AND a.deleted_at IS NULL ;

SELECT * FROM
promise_siplang.tbl_paket_pl AS a
WHERE a.create_at <= "2026-01-07 23:59:59"
AND a.deleted_at IS NULL;

atau

SELECT * FROM
promise_sibela.tbl_paket_pl AS a
WHERE a.create_at <= "2026-01-07 23:59:59"

UNION 

SELECT * FROM
promise_sibela.tbl_paketdpt_pl AS a
WHERE a.create_at <= "2026-01-07 23:59:59";

SELECT * FROM
promise_siplang.tbl_paket_pl AS a
WHERE a.create_at <= "2026-01-07 23:59:59";

SELECT * FROM promise_esign.pegawai;
SELECT * FROM promise_esign.penyedia;