CREATE OR REPLACE FUNCTION func_merge_komisaris(
    p_kode_vendor INTEGER,
    OUT v_rows_processed INTEGER
) 
RETURNS INTEGER AS $$
DECLARE
    v_komisaris_record RECORD;
    v_kode_komisaris INTEGER;
    v_row_count INTEGER := 0;
BEGIN
    -- Initialize output parameter
    v_rows_processed := 0;
    
    -- Loop through komisaris custom records
    FOR v_komisaris_record IN 
        SELECT * 
        FROM ref_komisaris_bu_custom
        WHERE
            kode_vendor = p_kode_vendor AND
            kode_komisaris IS NULL
    LOOP
        -- Copy main komisaris record
        INSERT INTO ref_komisaris_bu (
            kode_vendor,
            nm_komisaris,
            jbtn_komisaris,
            hp_komisaris,
            no_ktp_komisaris,
            path_ktp_komisaris,
            encrypt_key,
            revisi_ke
        ) VALUES (
            v_komisaris_record.kode_vendor,
            v_komisaris_record.nm_komisaris,
            v_komisaris_record.jbtn_komisaris,
            v_komisaris_record.hp_komisaris,
            v_komisaris_record.no_ktp_komisaris,
            v_komisaris_record.path_ktp_komisaris,
            v_komisaris_record.encrypt_key,
            v_komisaris_record.revisi_ke
        ) 
        RETURNING kode_komisaris INTO v_kode_komisaris;

        -- Update custom table with reference to main table
        UPDATE ref_komisaris_bu_custom
        SET kode_komisaris = v_kode_komisaris
        WHERE kode_komisaris_custom = v_komisaris_record.kode_komisaris_custom;
        
        -- Increment counter
        v_row_count := v_row_count + 1;
        
    END LOOP;
    
    -- Set output parameter
    v_rows_processed := v_row_count;
    
    RETURN;
END;
$$ LANGUAGE plpgsql;