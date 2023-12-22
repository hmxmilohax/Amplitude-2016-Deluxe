@echo off
mkdir _tmpbuild
git pull https://github.com/hmxmilohax/amplitude-2016-deluxe main
IF NOT EXIST "%~dp0_build\prep\ps4\ps4" CALL dev_scripts\!prep_ps4.bat
echo:Copying Amplitude 2016 Deluxe PS4 files...
xcopy /q /e /y _ark\ps4 _tmpbuild
xcopy /q /e /y _ark\combined _tmpbuild
for /R "%~dp0_tmpbuild" %%f in (*.dta) do IF NOT "%%~xf" == ".dta_dta_ps4" dependencies\dtxtool\dtxtool dta2b "%%f" "%%~dpnf.dta_dta_ps4" 3
for /R "%~dp0_tmpbuild" %%f in (*.script_dta) do IF NOT "%%~xf" == ".script_dta_ps4" dependencies\dtxtool\dtxtool dta2b "%%f" "%%~dpnf.script_dta_ps4" 3
for /R "%~dp0_tmpbuild" %%f in (*.dta) do IF NOT "%%~xf" == ".dta_dta_ps4" del "%%f"
for /R "%~dp0_tmpbuild" %%f in (*.script_dta) do IF NOT "%%~xf" == ".script_dta_ps4" del "%%f"
xcopy /q /e /y _tmpbuild _build\prep\ps4\ps4
for /R "%~dp0_tmpbuild" %%f in (*) do del "%%f"
rmdir /s /q "%~dp0_tmpbuild"
echo:Adding songs to Amplitude 2016 Deluxe config...
"%~dp0dependencies\amphelper" song add-all "%~dp0_build\prep\ps4". >nul
echo:Building Amplitude 2016 Deluxe arks...
"%~dp0dependencies\amphelper" ark pack "%~dp0_build\prep\ps4" "%~dp0_build\ps4\main_ps4.hdr" >nul
echo:Wrote Amplitude 2016 Deluxe arks.
echo:Complete! Enjoy Amplitude 2016 Deluxe
pause