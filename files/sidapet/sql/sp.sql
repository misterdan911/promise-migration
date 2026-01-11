CREATE OR REPLACE PROCEDURE "public"."copy_ref_to_custom"("p_kode_vendor" int4, "p_kode_penjaringan" int4)
 AS $BODY$
DECLARE
    v_kode_tenaga_ahli INTEGER;
    v_kode_tenaga_ahli_custom INTEGER;

    v_kode_tenaga_pendukung INTEGER;
    v_kode_tenaga_pendukung_custom INTEGER;

    v_kode_pengalaman_ta INTEGER;
    v_kode_sertif_ta INTEGER;

    v_kode_pengalaman_tp INTEGER;
    v_kode_sertif_tp INTEGER;

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







    -- Loop through all tenaga pendukung for the given vendor
    FOR v_record IN 
        SELECT * 
        FROM ref_tenaga_pendukung_bu 
        WHERE kode_vendor = p_kode_vendor
    LOOP
        -- Insert into custom table
        INSERT INTO ref_tenaga_pendukung_bu_custom (
            kode_tenaga_pendukung,
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
            v_record.kode_tenaga_pendukung,
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
        RETURNING kode_tenaga_pendukung_custom INTO v_kode_tenaga_pendukung_custom;
        
        -- Insert pengalaman (experiences) for this tenaga pendukung
        FOR v_pengalaman_record IN
            SELECT *
            FROM ref_pengalaman_tp
            WHERE kode_tenaga_pendukung = v_record.kode_tenaga_pendukung
        LOOP
            INSERT INTO ref_pengalaman_tp_custom (
                kode_penjaringan,
                kode_tenaga_pendukung_custom,
                pengalaman,
                file_bukti,
                encrypt_key,
                revisi_ke,
                kode_pengalaman_tp
            )
            VALUES (
                p_kode_penjaringan,
                v_kode_tenaga_pendukung_custom,
                v_pengalaman_record.pengalaman,
                v_pengalaman_record.file_bukti,
                v_pengalaman_record.encrypt_key,
                v_pengalaman_record.revisi_ke,
                v_pengalaman_record.kode_pengalaman_tp
            );
        END LOOP;
        
        -- Insert sertifikat (certificates) for this tenaga pendukung
        FOR v_sertif_record IN
            SELECT *
            FROM ref_sertif_tp
            WHERE kode_tenaga_pendukung = v_record.kode_tenaga_pendukung
        LOOP
            INSERT INTO ref_sertif_tp_custom (
                kode_penjaringan,
                kode_tenaga_pendukung_custom,
                sertifikat,
                file_bukti,
                encrypt_key,
                revisi_ke,
                kode_sertif_tp
            )
            VALUES (
                p_kode_penjaringan,
                v_kode_tenaga_pendukung_custom,
                v_sertif_record.sertifikat,
                v_sertif_record.file_bukti,
                v_sertif_record.encrypt_key,
                v_sertif_record.revisi_ke,
                v_sertif_record.kode_sertif_tp
            );
        END LOOP;
        
    END LOOP;
    
    
    
FOR v_record IN 
    SELECT * 
    FROM ref_pengalaman_pero 
    WHERE kode_vendor = p_kode_vendor
LOOP
    -- Insert into ref_pengalaman_pero_custom
    INSERT INTO ref_pengalaman_pero_custom (
        kode_vendor,
        nama_pekerjaan,
        posisi,
        tgl_awal_pekerjaan,
        tgl_akhir_pekerjaan,
        nilai_pekerjaan,
        file_bukti,
        encrypt_key,
        revisi_ke,
        kode_penjaringan
    )
    VALUES (
        v_record.kode_vendor,
        v_record.nama_pekerjaan,
        v_record.posisi,
        v_record.tgl_awal_pekerjaan,
        v_record.tgl_akhir_pekerjaan,
        v_record.nilai_pekerjaan,
        v_record.file_bukti,
        v_record.encrypt_key,
        v_record.revisi_ke,
        p_kode_penjaringan  -- Assuming you need to pass this as a parameter
    );
END LOOP;


-- Loop through all ref_sertif_pero for the given vendor
FOR v_record IN 
    SELECT * 
    FROM ref_sertif_pero 
    WHERE kode_vendor = p_kode_vendor
LOOP
    -- Insert into ref_sertif_pero_custom
    INSERT INTO ref_sertif_pero_custom (
        kode_vendor,
        nm_sertifikat,
        file_bukti,
        is_bukti_selamanya,
        bukti_berlaku_awal,
        bukti_berlaku_akhir,
        encrypt_key,
        revisi_ke,
        kode_penjaringan
    )
    VALUES (
        v_record.kode_vendor,
        v_record.nm_sertifikat,
        v_record.file_bukti,
        v_record.is_bukti_selamanya,
        v_record.bukti_berlaku_awal,
        v_record.bukti_berlaku_akhir,
        v_record.encrypt_key,
        v_record.revisi_ke,
        p_kode_penjaringan  -- Assuming you need to pass this as a parameter
    );
END LOOP;





    -- Optional: Return message or count
    RAISE NOTICE 'Data copied successfully for vendor % and penjaringan %', p_kode_vendor, p_kode_penjaringan;
    
END;
$BODY$
  LANGUAGE plpgsql
