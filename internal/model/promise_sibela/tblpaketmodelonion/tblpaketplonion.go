package tblpaketplonionmodel

func GetAllData() []TblPaketPlOnion {
	/*
SELECT 
    id_paket_pl as id_paket,
    id_ppk,
    id_userpp,
    id_direksi_perus,
    id_profil_penyedia,
    id_rup_ut,
    nama_pesanan_pl as nama_pesanan,
    id_kriteria,
    jenis_aset,
    kode_level_aset,
    id_rka_rev,
    id_pembayaran,
    path_sibela_pl as path_sibela,
    path_sibela_penyedia_pl as path_sibela_penyedia,
    total,
    negosiasi_teknispp_pl as negosiasi_teknispp,
    negosiasi_teknisp_pl as negosiasi_teknisp,
    status_paket_pl as status_paket,
    status_undangan_pl as status_undangan,
    CAST(status_termin_pl AS VARCHAR(255)) as status_termin,
    keterangan,
    create_at,
    updated_at,
    deleted_at
FROM tbl_paket_pl
WHERE deleted_at IS NULL and id_ppk is not null

UNION ALL

SELECT 
    id_paket_dptpl as id_paket,
    id_ppk,
    id_userpp,
    id_direksi_perus,
    id_profil_penyedia,
    id_rup_ut,
    nama_pesanan_dptpl as nama_pesanan,
    id_kriteria,
    jenis_aset,
    kode_level_aset,
    id_rka_rev,
    id_pembayaran,
    path_sibela_dptpl as path_sibela,
    path_sibela_penyedia_dptpl as path_sibela_penyedia,
    total,
    negosiasi_teknispp_dptpl as negosiasi_teknispp,
    negosiasi_teknisp_dptpl as negosiasi_teknisp,
    status_paket_dptpl as status_paket,
    status_undangan_dptpl as status_undangan,
    CAST(status_termin_dptpl AS VARCHAR(255)) as status_termin,
    keterangan,
    create_at,
    updated_at,
    deleted_at
FROM tbl_paketdpt_pl
WHERE deleted_at IS NULL and id_ppk is not null;
	*/
}
