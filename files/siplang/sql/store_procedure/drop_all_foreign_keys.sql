CREATE OR REPLACE FUNCTION "public"."drop_all_foreign_keys"()
  RETURNS "pg_catalog"."void" AS $BODY$
DECLARE
    fk RECORD;
BEGIN
    -- Loop through all foreign key constraints in the current schema
    FOR fk IN
        SELECT conname AS constraint_name,
               conrelid::regclass AS table_name
        FROM pg_constraint
        WHERE contype = 'f' -- 'f' means foreign key
          AND connamespace = 'public'::regnamespace -- Adjust for the schema if needed
    LOOP
        -- Drop the foreign key constraint
        EXECUTE format('ALTER TABLE %s DROP CONSTRAINT %I', fk.table_name, fk.constraint_name);
        RAISE NOTICE 'Dropped foreign key: % in table: %', fk.constraint_name, fk.table_name;
    END LOOP;
END;
$BODY$
  LANGUAGE plpgsql VOLATILE
  COST 100