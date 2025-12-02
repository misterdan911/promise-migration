CREATE OR REPLACE PROCEDURE copy_persyaratan_from_template(
    p_kode_persiapan_pemilihan INT
)
LANGUAGE plpgsql
AS $$
DECLARE
    v_template_subkat RECORD;
    v_new_kode_subkat INT;
    v_item_template RECORD;
    v_new_kode_item_tanya INT;
    v_tipe_input VARCHAR;
    v_item_tanya_expand RECORD;
    v_valid_tipe_input_expand VARCHAR;

BEGIN

    IF EXISTS (
        SELECT 1 FROM ref_subkat_persyaratan 
        WHERE kode_persiapan_pemilihan = p_kode_persiapan_pemilihan
    ) THEN
        RAISE EXCEPTION 'kode_persiapan_pemilihan % already exist in ref_subkat_persyaratan', p_kode_persiapan_pemilihan;
    END IF;


    -- Loop through all template subkategori
    FOR v_template_subkat IN 
        SELECT * FROM ref_subkat_persyaratan_template
    LOOP
        -- Insert into ref_subkat_persyaratan and return the new ID
        INSERT INTO ref_subkat_persyaratan (
            kode_persiapan_pemilihan,
            kode_kat_persyaratan,
            nama_subkat_persyaratan,
            deskripsi
        ) VALUES (
            p_kode_persiapan_pemilihan,
            v_template_subkat.kode_kat_persyaratan,
            v_template_subkat.nama_subkat_persyaratan,
            v_template_subkat.deskripsi
        )
        RETURNING kode_subkat_persyaratan INTO v_new_kode_subkat;
        
        -- Copy all related item templates for this subkategori
        FOR v_item_template IN 
            SELECT * FROM ref_item_tanya_persyaratan_template
            WHERE kode_subkat_persyaratan = v_template_subkat.kode_subkat_persyaratan
        LOOP
            -- Insert and get the new kode_item_tanya AND tipe_input in one operation
            INSERT INTO ref_item_tanya_persyaratan (
                kode_subkat_persyaratan,
                hirarki,
                kelompok_child,
                nama_item,
                tipe_input
            ) VALUES (
                v_new_kode_subkat,
                v_item_template.hirarki,
                v_item_template.kelompok_child,
                v_item_template.nama_item,
                v_item_template.tipe_input
            )
            RETURNING kode_item_tanya, tipe_input INTO v_new_kode_item_tanya, v_tipe_input;


            SELECT tipe_input_lama INTO v_valid_tipe_input_expand
            FROM ref_item_tanya_expand_persyaratan_template
            WHERE tipe_input_lama = v_tipe_input;

            IF v_valid_tipe_input_expand IS NOT NULL THEN

                FOR v_item_tanya_expand IN
                    SELECT * FROM ref_item_tanya_expand_persyaratan_template
                    WHERE tipe_input_lama = v_tipe_input
                LOOP
                    INSERT INTO ref_item_tanya_expand_persyaratan (
                        kode_item_tanya,
                        tipe_input_lama,
                        nama_item,
                        tipe_input_baru
                    ) VALUES (
                        v_new_kode_item_tanya,
                        v_item_tanya_expand.tipe_input_lama,
                        v_item_tanya_expand.nama_item,
                        v_item_tanya_expand.tipe_input_baru
                    );
                END LOOP;
                
            ELSE
                INSERT INTO ref_item_tanya_expand_persyaratan (
                    kode_item_tanya,
                    tipe_input_lama,
                    nama_item,
                    tipe_input_baru
                ) VALUES (
                    v_new_kode_item_tanya,
                    v_item_template.tipe_input,
                    v_item_template.nama_item,
                    v_item_template.tipe_input
                );

            END IF;

        END LOOP;
        
    END LOOP;
    
    RAISE NOTICE 'Data copied successfully for kode_persiapan_pemilihan: %', p_kode_persiapan_pemilihan;
END;
$$;
