-- DROP FUNCTION public.func_merge_fasilitas(in int4, out int4);

CREATE OR REPLACE FUNCTION public.func_merge_fasilitas(p_kode_vendor integer, OUT v_rows_processed integer)
 RETURNS integer
 LANGUAGE plpgsql
AS $function$
DECLARE
    v_fasilitas_record RECORD;
    v_kode_fasilitas INTEGER;
    v_row_count INTEGER := 0;
BEGIN
    -- Initialize output parameter
    v_rows_processed := 0;
    
    -- Loop through fasilitas custom records
    FOR v_fasilitas_record IN 
        SELECT * 
        FROM ref_fasilitas_bu_custom
        WHERE
            kode_vendor = p_kode_vendor AND
            kode_fasilitas IS NULL
    LOOP
        -- Copy main fasilitas record
        INSERT INTO ref_fasilitas_bu (
            kode_vendor,
            nama,
            jumlah,
            kode_kondisi,
            kode_kepemilikan,
            file_kepemilikan,
            is_kepemilikan_selamanya,
            kepemilikan_berlaku_awal,
            kepemilikan_berlaku_akhir,
            encrypt_key_kepemilikan,
            file_foto,
            encrypt_key_foto,
            revisi_ke
        ) VALUES (
            v_fasilitas_record.kode_vendor,
            v_fasilitas_record.nama,
            v_fasilitas_record.jumlah,
            v_fasilitas_record.kode_kondisi,
            v_fasilitas_record.kode_kepemilikan,
            v_fasilitas_record.file_kepemilikan,
            v_fasilitas_record.is_kepemilikan_selamanya,
            v_fasilitas_record.kepemilikan_berlaku_awal,
            v_fasilitas_record.kepemilikan_berlaku_akhir,
            v_fasilitas_record.encrypt_key_kepemilikan,
            v_fasilitas_record.file_foto,
            v_fasilitas_record.encrypt_key_foto,
            v_fasilitas_record.revisi_ke
        ) 
        RETURNING kode_fasilitas INTO v_kode_fasilitas;

        -- Update custom table with reference to main table
        UPDATE ref_fasilitas_bu_custom
        SET kode_fasilitas = v_kode_fasilitas
        WHERE kode_fasilitas_custom = v_fasilitas_record.kode_fasilitas_custom;
        
        -- Increment counter
        v_row_count := v_row_count + 1;
        
    END LOOP;
    
    -- Set output parameter
    v_rows_processed := v_row_count;
    
    RETURN;
END;
$function$
;
