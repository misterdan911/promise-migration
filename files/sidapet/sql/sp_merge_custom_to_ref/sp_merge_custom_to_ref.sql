CREATE OR REPLACE PROCEDURE "public"."sp_merge_custom_to_ref"("p_kode_vendor" int4)
AS $BODY$
DECLARE
    v_rows_processed INTEGER;
BEGIN
    -- Call function func_merge_tenaga_ahli_and_related
    SELECT func_merge_tenaga_ahli_and_related(p_kode_vendor) INTO v_rows_processed;
    RAISE NOTICE 'Rows copied successfully for vendor %: % tenaga ahli records processed', p_kode_vendor, v_rows_processed;

    -- Call function func_merge_tenaga_pendukung_and_related
    SELECT func_merge_tenaga_pendukung_and_related(p_kode_vendor) INTO v_rows_processed;
    RAISE NOTICE 'Rows copied successfully for vendor %: % tenaga pendukung records processed', p_kode_vendor, v_rows_processed;

    -- Call function func_merge_izin_usaha_and_related
    SELECT func_merge_izin_usaha_and_related(p_kode_vendor) INTO v_rows_processed;
    RAISE NOTICE 'Rows copied successfully for vendor %: % izin usaha records processed', p_kode_vendor, v_rows_processed;

    -- Call function func_merge_direksi
    SELECT func_merge_direksi(p_kode_vendor) INTO v_rows_processed;
    RAISE NOTICE 'Rows copied successfully for vendor %: % direksi records processed', p_kode_vendor, v_rows_processed;

    -- Call function func_merge_komisaris
    SELECT func_merge_komisaris(p_kode_vendor) INTO v_rows_processed;
    RAISE NOTICE 'Rows copied successfully for vendor %: % komisaris records processed', p_kode_vendor, v_rows_processed;

    -- Call function func_merge_fasilitas
    SELECT func_merge_fasilitas(p_kode_vendor) INTO v_rows_processed;
    RAISE NOTICE 'Rows copied successfully for vendor %: % fasilitas records processed', p_kode_vendor, v_rows_processed;

    -- Call function func_merge_kantor
    SELECT func_merge_kantor(p_kode_vendor) INTO v_rows_processed;
    RAISE NOTICE 'Rows copied successfully for vendor %: % kantor records processed', p_kode_vendor, v_rows_processed;

    -- Call function func_merge_pengalaman_bu
    SELECT func_merge_pengalaman_bu(p_kode_vendor) INTO v_rows_processed;
    RAISE NOTICE 'Rows copied successfully for vendor %: % pengalaman_bu records processed', p_kode_vendor, v_rows_processed;

    -- Call function func_merge_saham
    SELECT func_merge_saham(p_kode_vendor) INTO v_rows_processed;
    RAISE NOTICE 'Rows copied successfully for vendor %: % saham records processed', p_kode_vendor, v_rows_processed;

    -- Call function func_merge_sertifikat_usaha
    SELECT func_merge_sertifikat_usaha(p_kode_vendor) INTO v_rows_processed;
    RAISE NOTICE 'Rows copied successfully for vendor %: % sertifikat usaha records processed', p_kode_vendor, v_rows_processed;

    -- Call function func_merge_pengalaman_pero
    SELECT func_merge_pengalaman_pero(p_kode_vendor) INTO v_rows_processed;
    RAISE NOTICE 'Rows copied successfully for vendor %: % pengalaman pero records processed', p_kode_vendor, v_rows_processed;

    -- Call function func_merge_sertif_pero
    SELECT func_merge_sertif_pero(p_kode_vendor) INTO v_rows_processed;
    RAISE NOTICE 'Rows copied successfully for vendor %: % sertif pero records processed', p_kode_vendor, v_rows_processed;

    
END;
$BODY$
LANGUAGE plpgsql;