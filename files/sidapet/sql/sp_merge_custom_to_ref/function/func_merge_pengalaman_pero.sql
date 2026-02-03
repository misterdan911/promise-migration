-- DROP FUNCTION public.func_merge_pengalaman_pero(in int4, out int4);

CREATE OR REPLACE FUNCTION public.func_merge_pengalaman_pero(p_kode_vendor integer, OUT v_rows_processed integer)
 RETURNS integer
 LANGUAGE plpgsql
AS $function$
DECLARE
    v_pengalaman_record RECORD;
    v_kode_pengalaman INTEGER;
    v_row_count INTEGER := 0;
BEGIN
    -- Initialize output parameter
    v_rows_processed := 0;
    
    -- Loop through pengalaman_pero custom records
    FOR v_pengalaman_record IN 
        SELECT * 
        FROM ref_pengalaman_pero_custom
        WHERE
            kode_vendor = p_kode_vendor AND
            kode_pengalaman IS NULL
    LOOP
        -- Copy main pengalaman_pero record
        INSERT INTO ref_pengalaman_pero (
            kode_vendor,
            nama_pekerjaan,
            posisi,
            tgl_awal_pekerjaan,
            tgl_akhir_pekerjaan,
            nilai_pekerjaan,
            file_bukti,
            encrypt_key,
            revisi_ke
        ) VALUES (
            v_pengalaman_record.kode_vendor,
            v_pengalaman_record.nama_pekerjaan,
            v_pengalaman_record.posisi,
            v_pengalaman_record.tgl_awal_pekerjaan,
            v_pengalaman_record.tgl_akhir_pekerjaan,
            v_pengalaman_record.nilai_pekerjaan,
            v_pengalaman_record.file_bukti,
            v_pengalaman_record.encrypt_key,
            v_pengalaman_record.revisi_ke
        ) 
        RETURNING kode_pengalaman INTO v_kode_pengalaman;

        -- Update custom table with reference to main table
        UPDATE ref_pengalaman_pero_custom
        SET kode_pengalaman = v_kode_pengalaman
        WHERE kode_pengalaman_custom = v_pengalaman_record.kode_pengalaman_custom;
        
        -- Increment counter
        v_row_count := v_row_count + 1;
        
    END LOOP;
    
    -- Set output parameter
    v_rows_processed := v_row_count;
    
    RETURN;
END;
$function$
;
