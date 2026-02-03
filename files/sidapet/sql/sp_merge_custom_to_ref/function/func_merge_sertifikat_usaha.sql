-- DROP FUNCTION public.func_merge_sertifikat_usaha(in int4, out int4);

CREATE OR REPLACE FUNCTION public.func_merge_sertifikat_usaha(p_kode_vendor integer, OUT v_rows_processed integer)
 RETURNS integer
 LANGUAGE plpgsql
AS $function$
DECLARE
    v_sertifikat_record RECORD;
    v_kode_sertifikat_usaha INTEGER;
    v_row_count INTEGER := 0;
BEGIN
    -- Initialize output parameter
    v_rows_processed := 0;
    
    -- Loop through sertifikat_usaha custom records
    FOR v_sertifikat_record IN 
        SELECT * 
        FROM ref_sertifikat_usaha_bu_custom
        WHERE
            kode_vendor = p_kode_vendor AND
            kode_sertifikat_usaha IS NULL
    LOOP
        -- Copy main sertifikat_usaha record
        INSERT INTO ref_sertifikat_usaha_bu (
            kode_vendor,
            nama_judul,
            nomor,
            penerbit,
            tanggal,
            file_sertif,
            is_sertif_selamanya,
            sertif_berlaku_awal,
            sertif_berlaku_akhir,
            encrypt_key,
            revisi_ke
        ) VALUES (
            v_sertifikat_record.kode_vendor,
            v_sertifikat_record.nama_judul,
            v_sertifikat_record.nomor,
            v_sertifikat_record.penerbit,
            v_sertifikat_record.tanggal,
            v_sertifikat_record.file_sertif,
            v_sertifikat_record.is_sertif_selamanya,
            v_sertifikat_record.sertif_berlaku_awal,
            v_sertifikat_record.sertif_berlaku_akhir,
            v_sertifikat_record.encrypt_key,
            v_sertifikat_record.revisi_ke
        ) 
        RETURNING kode_sertifikat_usaha INTO v_kode_sertifikat_usaha;

        -- Update custom table with reference to main table
        UPDATE ref_sertifikat_usaha_bu_custom
        SET kode_sertifikat_usaha = v_kode_sertifikat_usaha
        WHERE kode_sertifikat_usaha_custom = v_sertifikat_record.kode_sertifikat_usaha_custom;
        
        -- Increment counter
        v_row_count := v_row_count + 1;
        
    END LOOP;
    
    -- Set output parameter
    v_rows_processed := v_row_count;
    
    RETURN;
END;
$function$
;
