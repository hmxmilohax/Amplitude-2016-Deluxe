for /R "%~dp0_ark\ps4" %%f in (*) do (if "%%~xf"==".dta_dta_ps4" del "%%~f")
for /R "%~dp0_ark\ps4" %%f in (*) do (if "%%~xf"==".script_dta_ps4" del "%%~f")
for /R "%~dp0_ark\ps4" %%f in (*.dta) do dependencies\dtxtool\dtxtool dta2b "%%f" "%%~dpnf.dta_dta_ps4" 3
for /R "%~dp0_ark\ps4" %%f in (*.script_dta) do dependencies\dtxtool\dtxtool dta2b "%%f" "%%~dpnf.script_dta_ps4" 3
cd _build\modulate
modulate -autoadd ps4 -pack_add ps4 ../ps4
pause