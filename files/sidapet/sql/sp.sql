CREATE OR REPLACE PROCEDURE sp_ref_to_custom(
    p_kode_vendor INTEGER,
    p_kode_penjaringan INTEGER
)
LANGUAGE plpgsql
AS $$
DECLARE
    v_kode_tenaga_ahli INTEGER;
    v_kode_tenaga_ahli_custom INTEGER;
    v_kode_pengalaman_ta INTEGER;
    v_kode_sertif_ta INTEGER;
    v_record RECORD;
    v_pengalaman_record RECORD;
    v_sertif_record RECORD;
BEGIN
    -- Loop through all tenaga ahli for the given vendor
    FOR v_record IN 
        SELECT * 
        FROM ref_tenaga_ahli_bu 
        WHERE kode_vendor = p_kode_vendor
    LOOP
        -- Insert into custom table
        INSERT INTO ref_tenaga_ahli_bu_custom (
            kode_tenaga_ahli,
            kode_vendor,
            kode_penjaringan,
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
        )
        VALUES (
            v_record.kode_tenaga_ahli,
            v_record.kode_vendor,
            p_kode_penjaringan,
            v_record.nama,
            v_record.no_ktp,
            v_record.file_ktp,
            v_record.encrypt_key_ktp,
            v_record.tempat_lahir,
            v_record.tgl_lahir,
            v_record.posisi,
            v_record.kode_jenjang_pendidikan,
            v_record.program_studi,
            v_record.file_ijazah,
            v_record.encrypt_key_ijazah,
            v_record.file_cv,
            v_record.encrypt_key_cv,
            v_record.tgl_cv,
            v_record.revisi_ke
        )
        RETURNING kode_tenaga_ahli_custom INTO v_kode_tenaga_ahli_custom;
        
        -- Insert pengalaman (experiences) for this tenaga ahli
        FOR v_pengalaman_record IN
            SELECT *
            FROM ref_pengalaman_ta
            WHERE kode_tenaga_ahli = v_record.kode_tenaga_ahli
        LOOP
            INSERT INTO ref_pengalaman_ta_custom (
                kode_penjaringan,
                kode_tenaga_ahli_custom,
                pengalaman,
                file_bukti,
                encrypt_key,
                revisi_ke,
                kode_pengalaman_ta
            )
            VALUES (
                p_kode_penjaringan,
                v_kode_tenaga_ahli_custom,
                v_pengalaman_record.pengalaman,
                v_pengalaman_record.file_bukti,
                v_pengalaman_record.encrypt_key,
                v_pengalaman_record.revisi_ke,
                v_pengalaman_record.kode_pengalaman_ta
            );
        END LOOP;
        
        -- Insert sertifikat (certificates) for this tenaga ahli
        FOR v_sertif_record IN
            SELECT *
            FROM ref_sertif_ta
            WHERE kode_tenaga_ahli = v_record.kode_tenaga_ahli
        LOOP
            INSERT INTO ref_sertif_ta_custom (
                kode_penjaringan,
                kode_tenaga_ahli_custom,
                sertifikat,
                file_bukti,
                encrypt_key,
                revisi_ke,
                kode_sertif_ta
            )
            VALUES (
                p_kode_penjaringan,
                v_kode_tenaga_ahli_custom,
                v_sertif_record.sertifikat,
                v_sertif_record.file_bukti,
                v_sertif_record.encrypt_key,
                v_sertif_record.revisi_ke,
                v_sertif_record.kode_sertif_ta
            );
        END LOOP;
        
    END LOOP;
    
    -- Optional: Return message or count
    RAISE NOTICE 'Data copied successfully for vendor % and penjaringan %', p_kode_vendor, p_kode_penjaringan;
    
END;
$$;