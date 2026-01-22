CREATE OR REPLACE FUNCTION func_merge_izin_usaha_and_related(
    p_kode_vendor INTEGER,
    OUT v_rows_processed INTEGER
) 
RETURNS INTEGER AS $$
DECLARE
    v_izin_record RECORD;
    v_kbli_record RECORD;
    v_kode_izin_usaha INTEGER;
    v_kode_trx_kbli INTEGER;
    v_row_count INTEGER := 0;
BEGIN
    -- Initialize output parameter
    v_rows_processed := 0;
    
    -- Loop through izin usaha custom records
    FOR v_izin_record IN 
        SELECT * 
        FROM ref_izin_usaha_bu_custom
        WHERE
            kode_vendor = p_kode_vendor AND
            kode_izin_usaha IS NULL
    LOOP
        -- Copy main izin usaha record
        INSERT INTO ref_izin_usaha_bu (
            kode_vendor,
            jenis_izin_usaha,
            nama,
            nomor_izin,
            file_izin,
            is_izin_selamanya,
            izin_berlaku_awal,
            izin_berlaku_akhir,
            encrypt_key,
            revisi_ke
        ) VALUES (
            v_izin_record.kode_vendor,
            v_izin_record.jenis_izin_usaha,
            v_izin_record.nama,
            v_izin_record.nomor_izin,
            v_izin_record.file_izin,
            v_izin_record.is_izin_selamanya,
            v_izin_record.izin_berlaku_awal,
            v_izin_record.izin_berlaku_akhir,
            v_izin_record.encrypt_key,
            v_izin_record.revisi_ke
        ) 
        RETURNING kode_izin_usaha INTO v_kode_izin_usaha;

        -- Update custom table with reference to main table
        UPDATE ref_izin_usaha_bu_custom
        SET kode_izin_usaha = v_kode_izin_usaha
        WHERE kode_izin_usaha_custom = v_izin_record.kode_izin_usaha_custom;

        -- Copy KBLI/SBU records (embedded logic)
        FOR v_kbli_record IN 
            SELECT * 
            FROM trx_izin_kbli_sbu_custom
            WHERE kode_izin_usaha_custom = v_izin_record.kode_izin_usaha_custom
        LOOP
            INSERT INTO trx_izin_kbli_sbu (
                kode_izin_usaha,
                kode_kbli_sbu
            ) VALUES (
                v_kode_izin_usaha,
                v_kbli_record.kode_kbli_sbu
            )
            RETURNING kode_trx_kbli INTO v_kode_trx_kbli;

            -- Update custom table with reference to main table
            -- Note: Since trx_izin_kbli_sbu_custom doesn't have a reference column,
            -- we'll update it with the main transaction ID if needed
            -- If you need to track the relationship, consider adding a column like:
            -- kode_trx_kbli int4 NULL in trx_izin_kbli_sbu_custom
            -- UPDATE trx_izin_kbli_sbu_custom
            -- SET kode_trx_kbli = v_kode_trx_kbli
            -- WHERE kode_trx_iks_custom = v_kbli_record.kode_trx_iks_custom;
        END LOOP;

        -- Increment counter
        v_row_count := v_row_count + 1;
        
    END LOOP;
    
    -- Set output parameter
    v_rows_processed := v_row_count;
    
    RETURN;
END;
$$ LANGUAGE plpgsql;