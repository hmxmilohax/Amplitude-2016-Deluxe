git pull https://github.com/hmxmilohax/amplitude-2016-deluxe main
xcopy /e /y _ark\combined _ark\ps4
for /R "%~dp0_ark\ps4" %%f in (*.dta) do dependencies\dtxtool\dtxtool dta2b "%%f" "%%~dpnf.dta_dta_ps4" 3
for /R "%~dp0_ark\ps4" %%f in (*.script_dta) do dependencies\dtxtool\dtxtool dta2b "%%f" "%%~dpnf.script_dta_ps4" 3
xcopy /e /y _ark\ps4 _build\prep\ps4\ps4
"%~dp0dependencies\amphelper" song add-all "%~dp0_build\prep\ps4"
"%~dp0dependencies\amphelper" ark pack "%~dp0_build\prep\ps4" "%~dp0_build\ps4\main_ps4.hdr"
pause