@echo off
setlocal

:: Get current date in the format "25 agustus 2025"
for /f "tokens=1-3" %%a in ('date /t') do (
    set day=%%a
    set month=%%b
    set year=%%c
)

:: Convert month number to month name (if needed)
if "%month%"=="01" set monthname=januari
if "%month%"=="02" set monthname=februari
if "%month%"=="03" set monthname=maret
if "%month%"=="04" set monthname=april
if "%month%"=="05" set monthname=mei
if "%month%"=="06" set monthname=juni
if "%month%"=="07" set monthname=juli
if "%month%"=="08" set monthname=agustus
if "%month%"=="09" set monthname=september
if "%month%"=="10" set monthname=oktober
if "%month%"=="11" set monthname=november
if "%month%"=="12" set monthname=desember

:: Alternative method using WMIC for more reliable date parsing
for /f "tokens=1-3 delims=/ " %%a in ('wmic path win32_localtime get day^,month^,year /format:value ^| findstr "="') do (
    set /a day=%%a
    set /a month=%%b
    set /a year=%%c
)

:: Set month name based on month number
if %month% equ 1 set monthname=januari
if %month% equ 2 set monthname=februari
if %month% equ 3 set monthname=maret
if %month% equ 4 set monthname=april
if %month% equ 5 set monthname=mei
if %month% equ 6 set monthname=juni
if %month% equ 7 set monthname=juli
if %month% equ 8 set monthname=agustus
if %month% equ 9 set monthname=september
if %month% equ 10 set monthname=oktober
if %month% equ 11 set monthname=november
if %month% equ 12 set monthname=desember

:: Create commit message
set commit_message=update %day% %monthname% %year%

:: Execute Git commands
echo Running Git commands...
git add .
git commit -m "%commit_message%"
git push origin sidapet_statis

echo.
echo Commit message: %commit_message%
echo Done!

endlocal