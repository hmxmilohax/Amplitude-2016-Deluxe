mkdir _build\ps3\USRDIR
@echo off
git pull https://github.com/hmxmilohax/amplitude-2016-deluxe main
xcopy /e /y _ark\combined _ark\ps3
@RD /S /Q _ark\ps3\songs
for /R "%~dp0_ark\ps3" %%f in (*.dta) do dependencies\dtxtool\dtxtool dta2b "%%f" "%%~dpnf.dta_dta_ps3" 3
for /R "%~dp0_ark\ps3" %%f in (*.script_dta) do dependencies\dtxtool\dtxtool dta2b "%%f" "%%~nf.script_dta_ps3" 3
xcopy /e /y _ark\ps3 _build\prep\ps3\ps3
for /R "%~dp0_ark\ps3" %%f in (*_dta_ps3) do del "%%f"
"%~dp0dependencies\amphelper" ark pack "%~dp0_build\prep\ps3" "%~dp0_build\ps3\USRDIR\main_ps3.hdr"
pause
