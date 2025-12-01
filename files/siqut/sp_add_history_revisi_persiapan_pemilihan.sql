CREATE OR REPLACE PROCEDURE add_history_revisi_persiapan_pemilihan(
    p_kode_persiapan_pemilihan INTEGER
)
LANGUAGE plpgsql
AS $$
DECLARE
    current_revisi_ke INTEGER;
BEGIN
    -- Get the current revisi_ke value
    SELECT revisi_ke INTO current_revisi_ke
    FROM trx_persiapan_pemilihan
    WHERE kode_persiapan_pemilihan = p_kode_persiapan_pemilihan;
    
    -- Check if record exists
    IF NOT FOUND THEN
        RAISE EXCEPTION 'Record with kode_persiapan_pemilihan % not found', p_kode_persiapan_pemilihan;
    END IF;
    
    -- Insert into history table with current revisi_ke value
    INSERT INTO trx_persiapan_pemilihan_history (
        kode_persiapan_pemilihan,
        kode_ku,
        kode_metode_pemasukan_dok,
        kode_metode_evaluasi,
        tgl_pengumuman_awal,
        tgl_pengumuman_akhir,
        tgl_penjelasan_awal,
        tgl_penjelasan_akhir,
        tgl_pemasukan_penawaran_awal,
        tgl_pemasukan_penawaran_akhir,
        tgl_pembukaan_penawaran_awal,
        tgl_pembukaan_penawaran_akhir,
        tgl_eval_klasif_nego_awal,
        tgl_eval_klasif_nego_akhir,
        tgl_penetapan_pengumuman_awal,
        tgl_penetapan_pengumuman_akhir,
        tgl_surat_mdp,
        kode_dok_mdp,
		udcr,
        alasan_revisi,
        revisi_ke
    )
    SELECT 
        kode_persiapan_pemilihan,
        kode_ku,
        kode_metode_pemasukan_dok,
        kode_metode_evaluasi,
        tgl_pengumuman_awal,
        tgl_pengumuman_akhir,
        tgl_penjelasan_awal,
        tgl_penjelasan_akhir,
        tgl_pemasukan_penawaran_awal,
        tgl_pemasukan_penawaran_akhir,
        tgl_pembukaan_penawaran_awal,
        tgl_pembukaan_penawaran_akhir,
        tgl_eval_klasif_nego_awal,
        tgl_eval_klasif_nego_akhir,
        tgl_penetapan_pengumuman_awal,
        tgl_penetapan_pengumuman_akhir,
        tgl_surat_mdp,
        kode_dok_mdp,
		udcr,
        alasan_revisi,
        revisi_ke
    FROM trx_persiapan_pemilihan
    WHERE kode_persiapan_pemilihan = p_kode_persiapan_pemilihan;
    
    -- Update the original record, incrementing revisi_ke by 1
    UPDATE trx_persiapan_pemilihan
    SET revisi_ke = revisi_ke + 1
    WHERE kode_persiapan_pemilihan = p_kode_persiapan_pemilihan;
    
END;
$$;
