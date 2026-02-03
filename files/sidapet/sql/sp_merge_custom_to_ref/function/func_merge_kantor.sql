-- DROP FUNCTION public.func_merge_kantor(in int4, out int4);

CREATE OR REPLACE FUNCTION public.func_merge_kantor(p_kode_vendor integer, OUT v_rows_processed integer)
 RETURNS integer
 LANGUAGE plpgsql
AS $function$
DECLARE
    v_kantor_record RECORD;
    v_kode_kantor INTEGER;
    v_row_count INTEGER := 0;
BEGIN
    -- Initialize output parameter
    v_rows_processed := 0;
    
    -- Loop through kantor custom records
    FOR v_kantor_record IN 
        SELECT * 
        FROM ref_kantor_bu_custom
        WHERE
            kode_vendor = p_kode_vendor AND
            kode_kantor IS NULL
    LOOP
        -- Copy main kantor record
        INSERT INTO ref_kantor_bu (
            kode_vendor,
            nama_kantor,
            alamat,
            kode_kondisi,
            kode_kepemilikan,
            file_bukti,
            is_bukti_selamanya,
            bukti_berlaku_awal,
            bukti_berlaku_akhir,
            encrypt_key_bukti,
            file_foto,
            encrypt_key_foto,
            revisi_ke
        ) VALUES (
            v_kantor_record.kode_vendor,
            v_kantor_record.nama_kantor,
            v_kantor_record.alamat,
            v_kantor_record.kode_kondisi,
            v_kantor_record.kode_kepemilikan,
            v_kantor_record.file_bukti,
            v_kantor_record.is_bukti_selamanya,
            v_kantor_record.bukti_berlaku_awal,
            v_kantor_record.bukti_berlaku_akhir,
            v_kantor_record.encrypt_key_bukti,
            v_kantor_record.file_foto,
            v_kantor_record.encrypt_key_foto,
            v_kantor_record.revisi_ke
        ) 
        RETURNING kode_kantor INTO v_kode_kantor;

        -- Update custom table with reference to main table
        UPDATE ref_kantor_bu_custom
        SET kode_kantor = v_kode_kantor
        WHERE kode_kantor_custom = v_kantor_record.kode_kantor_custom;
        
        -- Increment counter
        v_row_count := v_row_count + 1;
        
    END LOOP;
    
    -- Set output parameter
    v_rows_processed := v_row_count;
    
    RETURN;
END;
$function$
;
