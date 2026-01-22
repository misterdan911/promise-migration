CREATE OR REPLACE FUNCTION func_merge_tenaga_pendukung_and_related(
    p_kode_vendor INTEGER,
    OUT v_rows_processed INTEGER
) 
RETURNS INTEGER AS $$
DECLARE
    v_tp_record RECORD;
    v_pengalaman_record RECORD;
    v_sertif_record RECORD;
    v_kode_tenaga_pendukung INTEGER;
    v_kode_pengalaman_tp INTEGER;
    v_kode_sertif_tp INTEGER;
    v_row_count INTEGER := 0;
BEGIN
    -- Initialize output parameter
    v_rows_processed := 0;
    
    -- Loop through tenaga pendukung custom records
    FOR v_tp_record IN 
        SELECT * 
        FROM ref_tenaga_pendukung_bu_custom
        WHERE
            kode_vendor = p_kode_vendor AND
            kode_tenaga_pendukung IS NULL
    LOOP
        -- Copy main tenaga pendukung record
        INSERT INTO ref_tenaga_pendukung_bu (
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
            v_tp_record.kode_vendor,
            v_tp_record.nama,
            v_tp_record.no_ktp,
            v_tp_record.file_ktp,
            v_tp_record.encrypt_key_ktp,
            v_tp_record.tempat_lahir,
            v_tp_record.tgl_lahir,
            v_tp_record.posisi,
            v_tp_record.kode_jenjang_pendidikan,
            v_tp_record.program_studi,
            v_tp_record.file_ijazah,
            v_tp_record.encrypt_key_ijazah,
            v_tp_record.file_cv,
            v_tp_record.encrypt_key_cv,
            v_tp_record.tgl_cv,
            v_tp_record.revisi_ke
        ) 
        RETURNING kode_tenaga_pendukung INTO v_kode_tenaga_pendukung;

        -- Update custom table with reference to main table
        UPDATE ref_tenaga_pendukung_bu_custom
        SET kode_tenaga_pendukung = v_kode_tenaga_pendukung
        WHERE kode_tenaga_pendukung_custom = v_tp_record.kode_tenaga_pendukung_custom;

        -- Copy pengalaman_tp records (embedded logic)
        FOR v_pengalaman_record IN 
            SELECT * 
            FROM ref_pengalaman_tp_custom
            WHERE kode_tenaga_pendukung_custom = v_tp_record.kode_tenaga_pendukung_custom
        LOOP
            INSERT INTO ref_pengalaman_tp (
                kode_tenaga_pendukung,
                pengalaman,
                file_bukti,
                encrypt_key,
                revisi_ke
            ) VALUES (
                v_kode_tenaga_pendukung,
                v_pengalaman_record.pengalaman,
                v_pengalaman_record.file_bukti,
                v_pengalaman_record.encrypt_key,
                v_pengalaman_record.revisi_ke
            )
            RETURNING kode_pengalaman_tp INTO v_kode_pengalaman_tp;

            -- Update custom table with reference to main table
            UPDATE ref_pengalaman_tp_custom
            SET kode_pengalaman_tp = v_kode_pengalaman_tp
            WHERE kode_pengalaman_tp_custom = v_pengalaman_record.kode_pengalaman_tp_custom;
        END LOOP;

        -- Copy sertif_tp records (embedded logic)
        FOR v_sertif_record IN 
            SELECT * 
            FROM ref_sertif_tp_custom
            WHERE kode_tenaga_pendukung_custom = v_tp_record.kode_tenaga_pendukung_custom
        LOOP
            INSERT INTO ref_sertif_tp (
                kode_tenaga_pendukung,
                sertifikat,
                file_bukti,
                encrypt_key,
                revisi_ke
            ) VALUES (
                v_kode_tenaga_pendukung,
                v_sertif_record.sertifikat,
                v_sertif_record.file_bukti,
                v_sertif_record.encrypt_key,
                v_sertif_record.revisi_ke
            )
            RETURNING kode_sertif_tp INTO v_kode_sertif_tp;

            -- Update custom table with reference to main table
            UPDATE ref_sertif_tp_custom
            SET kode_sertif_tp = v_kode_sertif_tp
            WHERE kode_sertif_tp_custom = v_sertif_record.kode_sertif_tp_custom;
        END LOOP;
        
        -- Increment counter
        v_row_count := v_row_count + 1;
        
    END LOOP;
    
    -- Set output parameter
    v_rows_processed := v_row_count;
    
    RETURN;
END;
$$ LANGUAGE plpgsql;