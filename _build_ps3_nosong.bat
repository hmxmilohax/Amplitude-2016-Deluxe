@echo off
mkdir _build\ps3\USRDIR
mkdir _tmpbuild
git pull https://github.com/hmxmilohax/amplitude-2016-deluxe main
IF NOT EXIST "%~dp0_prep_ps3\ext_ark\ps3" CALL dev_scripts\!prep_ps3.bat
echo:Copying Amplitude 2016 Deluxe PS3 files...
xcopy /q /e /y _ark\ps3 _tmpbuild
xcopy /q /e /y _ark\combined _tmpbuild
rmdir /s /q _tmpbuild\songs
for /R "%~dp0_tmpbuild" %%f in (*.dta) do IF NOT "%%~xf" == ".dta_dta_ps3" dependencies\dtxtool\dtxtool dta2b "%%f" "%%~dpnf.dta_dta_ps3" 3
for /R "%~dp0_tmpbuild" %%f in (*.script) do IF NOT "%%~xf" == ".script_dta_ps3" dependencies\dtxtool\dtxtool dta2b "%%f" "%%~dpnf.script_dta_ps3" 3
for /R "%~dp0_tmpbuild" %%f in (*.dta) do IF NOT "%%~xf" == ".dta_dta_ps3" del "%%f"
for /R "%~dp0_tmpbuild" %%f in (*.script) do IF NOT "%%~xf" == ".script_dta_ps3" del "%%f"
xcopy /q /e /y _tmpbuild _prep_ps3\ext_ark\ps3\
for /R "%~dp0_tmpbuild" %%f in (*) do del "%%f"
rmdir /s /q "%~dp0_tmpbuild"
echo:Building Amplitude 2016 Deluxe arks without new songs...
"%~dp0dependencies\amphelper" ark pack "%~dp0_prep_ps3\ext_ark" "%~dp0_build\ps3\USRDIR\main_ps3.hdr" >nul
echo:Wrote Amplitude 2016 Deluxe arks.
echo:Complete! Enjoy Amplitude 2016 Deluxe
pause
