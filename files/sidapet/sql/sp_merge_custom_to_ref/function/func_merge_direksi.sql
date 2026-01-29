CREATE OR REPLACE FUNCTION func_merge_direksi(
    p_kode_vendor INTEGER,
    OUT v_rows_processed INTEGER
) 
RETURNS INTEGER AS $$
DECLARE
    v_direksi_record RECORD;
    v_kode_direksi INTEGER;
    v_row_count INTEGER := 0;
BEGIN
    -- Initialize output parameter
    v_rows_processed := 0;
    
    -- Loop through direksi custom records
    FOR v_direksi_record IN 
        SELECT * 
        FROM ref_direksi_bu_custom
        WHERE
            kode_vendor = p_kode_vendor AND
            kode_direksi IS NULL
    LOOP
        -- Copy main direksi record
        INSERT INTO ref_direksi_bu (
            kode_vendor,
            nm_direksi,
            jbtn_direksi,
            hp_direksi,
            no_ktp_direksi,
            path_ktp_direksi,
            encrypt_key,
            revisi_ke
        ) VALUES (
            v_direksi_record.kode_vendor,
            v_direksi_record.nm_direksi,
            v_direksi_record.jbtn_direksi,
            v_direksi_record.hp_direksi,
            v_direksi_record.no_ktp_direksi,
            v_direksi_record.path_ktp_direksi,
            v_direksi_record.encrypt_key,
            v_direksi_record.revisi_ke
        ) 
        RETURNING kode_direksi INTO v_kode_direksi;

        -- Update custom table with reference to main table
        UPDATE ref_direksi_bu_custom
        SET kode_direksi = v_kode_direksi
        WHERE kode_direksi_custom = v_direksi_record.kode_direksi_custom;
        
        -- Increment counter
        v_row_count := v_row_count + 1;
        
    END LOOP;
    
    -- Set output parameter
    v_rows_processed := v_row_count;
    
    RETURN;
END;
$$ LANGUAGE plpgsql;