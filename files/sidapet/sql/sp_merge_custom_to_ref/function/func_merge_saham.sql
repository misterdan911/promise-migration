-- DROP FUNCTION public.func_merge_saham(in int4, out int4);

CREATE OR REPLACE FUNCTION public.func_merge_saham(p_kode_vendor integer, OUT v_rows_processed integer)
 RETURNS integer
 LANGUAGE plpgsql
AS $function$
DECLARE
    v_saham_record RECORD;
    v_kode_saham INTEGER;
    v_row_count INTEGER := 0;
BEGIN
    -- Initialize output parameter
    v_rows_processed := 0;
    
    -- Loop through saham custom records
    FOR v_saham_record IN 
        SELECT * 
        FROM ref_saham_bu_custom
        WHERE
            kode_vendor = p_kode_vendor AND
            kode_saham IS NULL
    LOOP
        -- Copy main saham record
        INSERT INTO ref_saham_bu (
            kode_vendor,
            nm_saham,
            no_ktp_saham,
            persentase_saham,
            revisi_ke,
            posisi
        ) VALUES (
            v_saham_record.kode_vendor,
            v_saham_record.nm_saham,
            v_saham_record.no_ktp_saham,
            v_saham_record.persentase_saham,
            v_saham_record.revisi_ke,
            v_saham_record.posisi
        ) 
        RETURNING kode_saham INTO v_kode_saham;

        -- Update custom table with reference to main table
        UPDATE ref_saham_bu_custom
        SET kode_saham = v_kode_saham
        WHERE kode_saham_custom = v_saham_record.kode_saham_custom;
        
        -- Increment counter
        v_row_count := v_row_count + 1;
        
    END LOOP;
    
    -- Set output parameter
    v_rows_processed := v_row_count;
    
    RETURN;
END;
$function$
;
