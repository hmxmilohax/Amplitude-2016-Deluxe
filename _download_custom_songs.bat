@echo off

REM rmdir /s /q "%~dp0\_ark\combined\songs"
REM python dependencies/download_songs.py
REM pause
REM exit /b 0

setlocal enabledelayedexpansion

cd /d "%~dp0"

REM Check if git is installed
where git >nul 2>nul
if errorlevel 1 (
    echo - 'git' is not installed. Please install Git from https://git-scm.com/downloads
    echo.
    pause
    exit /b 1
)

REM Clone or update the repo
echo.
if not exist ".\amp-2016-customs\.git" (
    echo - Downloading additional Amp 2016 custom songs, this may take some time.
    git clone --branch main https://github.com/jnackmclain/amp-2016-customs.git ".\amp-2016-customs"
) else (
    echo - Updating additional Amp 2016 custom songs.
    cd ".\amp-2016-customs"
    git pull origin main
    cd ..
)

REM Remove existing destination folder
if exist ".\_ark\combined\songs\" (
    rmdir /s /q ".\_ark\combined\songs\"
)

REM Copy songs directory
xcopy ".\amp-2016-customs\songs" ".\_ark\combined\songs\" /s /e /i /y

echo.
echo - Successfully downloaded Amp 2016 custom songs repo. Please rebuild in order to see them added in-game.
echo.
pause
exit /b 0
