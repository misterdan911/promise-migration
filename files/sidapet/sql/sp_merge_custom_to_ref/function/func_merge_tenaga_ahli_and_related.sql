CREATE OR REPLACE FUNCTION func_merge_tenaga_ahli_and_related(
    p_kode_vendor INTEGER,
    OUT v_rows_processed INTEGER
) 
RETURNS INTEGER AS $$
DECLARE
    v_ta_record RECORD;
    v_pengalaman_record RECORD;
    v_sertif_record RECORD;
    v_kode_tenaga_ahli INTEGER;
    v_kode_pengalaman_ta INTEGER;
    v_kode_sertif_ta INTEGER;
    v_row_count INTEGER := 0;
BEGIN
    -- Initialize output parameter
    v_rows_processed := 0;
    
    -- Loop through tenaga ahli custom records
    FOR v_ta_record IN 
        SELECT * 
        FROM ref_tenaga_ahli_bu_custom
        WHERE
            kode_vendor = p_kode_vendor AND
            kode_tenaga_ahli IS NULL
    LOOP
        -- Copy main tenaga ahli record
        INSERT INTO ref_tenaga_ahli_bu (
            kode_vendor,
            nama,
            no_ktp,
            file_ktp,
            encrypt_key_ktp,
            tempat_lahir,
            tgl_lahir,
            posisi,
            kode_jenjang_pendidikan,
            program_studi,
            file_ijazah,
            encrypt_key_ijazah,
            file_cv,
            encrypt_key_cv,
            tgl_cv,
            revisi_ke
        ) VALUES (
            v_ta_record.kode_vendor,
            v_ta_record.nama,
            v_ta_record.no_ktp,
            v_ta_record.file_ktp,
            v_ta_record.encrypt_key_ktp,
            v_ta_record.tempat_lahir,
            v_ta_record.tgl_lahir,
            v_ta_record.posisi,
            v_ta_record.kode_jenjang_pendidikan,
            v_ta_record.program_studi,
            v_ta_record.file_ijazah,
            v_ta_record.encrypt_key_ijazah,
            v_ta_record.file_cv,
            v_ta_record.encrypt_key_cv,
            v_ta_record.tgl_cv,
            v_ta_record.revisi_ke
        ) 
        RETURNING kode_tenaga_ahli INTO v_kode_tenaga_ahli;

        -- Update custom table with reference to main table
        UPDATE ref_tenaga_ahli_bu_custom
        SET kode_tenaga_ahli = v_kode_tenaga_ahli
        WHERE kode_tenaga_ahli_custom = v_ta_record.kode_tenaga_ahli_custom;

        -- Copy pengalaman_ta records (embedded logic)
        FOR v_pengalaman_record IN 
            SELECT * 
            FROM ref_pengalaman_ta_custom
            WHERE kode_tenaga_ahli_custom = v_ta_record.kode_tenaga_ahli_custom
        LOOP
            INSERT INTO ref_pengalaman_ta (
                kode_tenaga_ahli,
                pengalaman,
                file_bukti,
                encrypt_key,
                revisi_ke
            ) VALUES (
                v_kode_tenaga_ahli,
                v_pengalaman_record.pengalaman,
                v_pengalaman_record.file_bukti,
                v_pengalaman_record.encrypt_key,
                v_pengalaman_record.revisi_ke
            )
            RETURNING kode_pengalaman_ta INTO v_kode_pengalaman_ta;

            -- Update custom table with reference to main table
            UPDATE ref_pengalaman_ta_custom
            SET kode_pengalaman_ta = v_kode_pengalaman_ta
            WHERE kode_pengalaman_ta_custom = v_pengalaman_record.kode_pengalaman_ta_custom;
        END LOOP;

        -- Copy sertif_ta records (embedded logic)
        FOR v_sertif_record IN 
            SELECT * 
            FROM ref_sertif_ta_custom
            WHERE kode_tenaga_ahli_custom = v_ta_record.kode_tenaga_ahli_custom
        LOOP
            INSERT INTO ref_sertif_ta (
                kode_tenaga_ahli,
                sertifikat,
                file_bukti,
                encrypt_key,
                revisi_ke
            ) VALUES (
                v_kode_tenaga_ahli,
                v_sertif_record.sertifikat,
                v_sertif_record.file_bukti,
                v_sertif_record.encrypt_key,
                v_sertif_record.revisi_ke
            )
            RETURNING kode_sertif_ta INTO v_kode_sertif_ta;

            -- Update custom table with reference to main table
            UPDATE ref_sertif_ta_custom
            SET kode_sertif_ta = v_kode_sertif_ta
            WHERE kode_sertif_ta_custom = v_sertif_record.kode_sertif_ta_custom;
        END LOOP;
        
        -- Increment counter
        v_row_count := v_row_count + 1;
        
    END LOOP;
    
    -- Set output parameter
    v_rows_processed := v_row_count;
    
    RETURN;
END;
$$ LANGUAGE plpgsql;