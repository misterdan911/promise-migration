-- DROP FUNCTION public.func_merge_pengalaman_bu(in int4, out int4);

CREATE OR REPLACE FUNCTION public.func_merge_pengalaman_bu(p_kode_vendor integer, OUT v_rows_processed integer)
 RETURNS integer
 LANGUAGE plpgsql
AS $function$
DECLARE
    v_pengalaman_record RECORD;
    v_kode_pengalaman_bu INTEGER;
    v_row_count INTEGER := 0;
BEGIN
    -- Initialize output parameter
    v_rows_processed := 0;
    
    -- Loop through pengalaman_bu custom records
    FOR v_pengalaman_record IN 
        SELECT * 
        FROM ref_pengalaman_bu_custom
        WHERE
            kode_vendor = p_kode_vendor AND
            kode_pengalaman_bu IS NULL
    LOOP
        -- Copy main pengalaman_bu record
        INSERT INTO ref_pengalaman_bu (
            kode_vendor,
            nama_pekerjaan,
            pemberi_kerja,
            nilai_pekerjaan,
            tgl_awal_pekerjaan,
            tgl_akhir_pekerjaan,
            no_kontrak,
            file_kontrak,
            encrypt_key_kontrak,
            revisi_ke
        ) VALUES (
            v_pengalaman_record.kode_vendor,
            v_pengalaman_record.nama_pekerjaan,
            v_pengalaman_record.pemberi_kerja,
            v_pengalaman_record.nilai_pekerjaan,
            v_pengalaman_record.tgl_awal_pekerjaan,
            v_pengalaman_record.tgl_akhir_pekerjaan,
            v_pengalaman_record.no_kontrak,
            v_pengalaman_record.file_kontrak,
            v_pengalaman_record.encrypt_key_kontrak,
            v_pengalaman_record.revisi_ke
        ) 
        RETURNING kode_pengalaman_bu INTO v_kode_pengalaman_bu;

        -- Update custom table with reference to main table
        UPDATE ref_pengalaman_bu_custom
        SET kode_pengalaman_bu = v_kode_pengalaman_bu
        WHERE kode_pengalaman_bu_custom = v_pengalaman_record.kode_pengalaman_bu_custom;
        
        -- Increment counter
        v_row_count := v_row_count + 1;
        
    END LOOP;
    
    -- Set output parameter
    v_rows_processed := v_row_count;
    
    RETURN;
END;
$function$
;
