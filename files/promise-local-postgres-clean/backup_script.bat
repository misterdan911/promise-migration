@echo off
chcp 65001 > nul
setlocal enabledelayedexpansion

echo PostgreSQL Database Backup Script
echo =================================
echo.

:: Prompt for password
set /p pgpass="Enter PostgreSQL password for user 'postgres': "

if "!pgpass!"=="" (
    echo Error: No password entered.
    pause
    exit /b 1
)

echo.
echo Starting database backups...
echo.

:: Set PGPASSWORD environment variable (will be used by all pg_dump commands)
set PGPASSWORD=!pgpass!

echo Backing up db_esign_mig...
pg_dump -U postgres -d db_esign_clean -f db_esign.sql

echo Backing up db_sibela_clean...
pg_dump -U postgres -d db_sibela_clean -f db_sibela.sql

echo Backing up db_sidapet_clean...
pg_dump -U postgres -d db_sidapet_clean -f db_sidapet.sql

echo Backing up db_siplang_clean...
pg_dump -U postgres -d db_siplang_clean -f db_siplang.sql

echo Backing up db_sippan_clean...
pg_dump -U postgres -d db_sippan_clean -f db_sippan.sql

echo Backing up db_usman_clean...
pg_dump -U postgres -d db_usman_clean -f db_usman.sql

echo.
echo All backups completed!
echo Files created: db_sibela.sql, db_sidapet.sql, db_siplang.sql, db_sippan.sql, db_usman.sql

:: Clean up password from environment
set PGPASSWORD=
set pgpass=
pause