@echo off
setlocal

:: Get current date in format "25 August 2025"
for /f "tokens=1-3 delims=/ " %%a in ('date /t') do (
    set day=%%a
    set month=%%b
    set year=%%c
)

:: Create commit message with English month
set commit_message=update %day% %month% %year%

:: Execute Git commands
echo Running Git commands...
git add .
git commit -m "%commit_message%"
git push origin migrate_file

echo.
echo Commit message: %commit_message%
echo Done!

endlocal