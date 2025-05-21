@echo off
mkdir _build\ps4\AFR\CUSA02480
mkdir _tmpbuild
git pull https://github.com/hmxmilohax/amplitude-2016-deluxe main
IF NOT EXIST "%~dp0_prep_ps4\ext_ark\ps4" CALL dev_scripts\!prep_ps4.bat
echo:Copying Amplitude 2016 Deluxe PS4 files...
xcopy /q /e /y _ark\ps4 _tmpbuild
xcopy /q /e /y _ark\combined _tmpbuild
rmdir /s /q _tmpbuild\songs
for /R "%~dp0_tmpbuild" %%f in (*.dta) do IF NOT "%%~xf" == ".dta_dta_ps4" dependencies\dtxtool\dtxtool dta2b "%%f" "%%~dpnf.dta_dta_ps4" 3
for /R "%~dp0_tmpbuild" %%f in (*.script) do IF NOT "%%~xf" == ".script_dta_ps4" dependencies\dtxtool\dtxtool dta2b "%%f" "%%~dpnf.script_dta_ps4" 3
for /R "%~dp0_tmpbuild" %%f in (*.dta) do IF NOT "%%~xf" == ".dta_dta_ps4" del "%%f"
for /R "%~dp0_tmpbuild" %%f in (*.script) do IF NOT "%%~xf" == ".script_dta_ps4" del "%%f"
xcopy /q /e /y _tmpbuild _prep_ps4\ext_ark\ps4
for /R "%~dp0_tmpbuild" %%f in (*) do del "%%f"
rmdir /s /q "%~dp0_tmpbuild"
echo:Building Amplitude 2016 Deluxe arks without new songs...
"%~dp0dependencies\amphelper" ark pack "%~dp0_prep_ps4\ext_ark" "%~dp0_build\ps4\AFR\CUSA02480\main_ps4.hdr" >nul
echo:Wrote Amplitude 2016 Deluxe arks.
echo:Complete! Enjoy Amplitude 2016 Deluxe
pause
