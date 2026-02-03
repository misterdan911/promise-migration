-- DROP FUNCTION public.func_merge_sertif_pero(in int4, out int4);

CREATE OR REPLACE FUNCTION public.func_merge_sertif_pero(p_kode_vendor integer, OUT v_rows_processed integer)
 RETURNS integer
 LANGUAGE plpgsql
AS $function$
DECLARE
    v_sertif_record RECORD;
    v_kode_sertif INTEGER;
    v_row_count INTEGER := 0;
BEGIN
    -- Initialize output parameter
    v_rows_processed := 0;
    
    -- Loop through sertif_pero custom records
    FOR v_sertif_record IN 
        SELECT * 
        FROM ref_sertif_pero_custom
        WHERE
            kode_vendor = p_kode_vendor AND
            kode_sertif IS NULL
    LOOP
        -- Copy main sertif_pero record
        INSERT INTO ref_sertif_pero (
            kode_vendor,
            nm_sertifikat,
            file_bukti,
            is_bukti_selamanya,
            bukti_berlaku_awal,
            bukti_berlaku_akhir,
            encrypt_key,
            revisi_ke
        ) VALUES (
            v_sertif_record.kode_vendor,
            v_sertif_record.nm_sertifikat,
            v_sertif_record.file_bukti,
            v_sertif_record.is_bukti_selamanya,
            v_sertif_record.bukti_berlaku_awal,
            v_sertif_record.bukti_berlaku_akhir,
            v_sertif_record.encrypt_key,
            v_sertif_record.revisi_ke
        ) 
        RETURNING kode_sertif INTO v_kode_sertif;

        -- Update custom table with reference to main table
        UPDATE ref_sertif_pero_custom
        SET kode_sertif = v_kode_sertif
        WHERE kode_sertif_pero_custom = v_sertif_record.kode_sertif_pero_custom;
        
        -- Increment counter
        v_row_count := v_row_count + 1;
        
    END LOOP;
    
    -- Set output parameter
    v_rows_processed := v_row_count;
    
    RETURN;
END;
$function$
;
