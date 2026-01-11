@echo off
for /R "%~dp0_build\ps4\GoldHEN\AMP16DX\ps4" %%f in (*) do del "%%f"
rmdir /s /q "%~dp0_build\ps4\GoldHEN\AMP16DX\ps4"
mkdir _build\ps4\GoldHEN\AMP16DX
mkdir _tmpbuild
IF NOT EXIST "%~dp0_prep_ps4\ext_ark\ps4" CALL dev_scripts\!prep_ps4.bat
echo:Copying Amplitude 2016 Deluxe PS4 files...
xcopy /q /e /y _ark\ps4 _tmpbuild
robocopy _ark\combined _tmpbuild /e /xd "songs" >nul
echo:Building Amplitude 2016 Deluxe...
for /R "%~dp0_tmpbuild" %%f in (*.dta) do IF NOT "%%~xf" == ".dta_dta_ps4" dependencies\dtxtool\dtxtool dta2b "%%f" "%%~dpnf.dta_dta_ps4" 3
for /R "%~dp0_tmpbuild" %%f in (*.script) do IF NOT "%%~xf" == ".script_dta_ps4" dependencies\dtxtool\dtxtool dta2b "%%f" "%%~dpnf.script_dta_ps4" 3
for /R "%~dp0_tmpbuild" %%f in (*.dta) do IF NOT "%%~xf" == ".dta_dta_ps4" del "%%f"
for /R "%~dp0_tmpbuild" %%f in (*.script) do IF NOT "%%~xf" == ".script_dta_ps4" del "%%f"
xcopy /q /e /y _tmpbuild _build\ps4\GoldHEN\AMP16DX\ps4\
for /R "%~dp0_tmpbuild" %%f in (*) do del "%%f"
rmdir /s /q "%~dp0_tmpbuild"
echo:Built Amplitude 2016 Deluxe files for AMP16DX-Plugin.
echo:Complete! Enjoy Amplitude 2016 Deluxe
pause
