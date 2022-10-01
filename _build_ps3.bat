@echo off
cd _build\modulate
mkdir ps3
modulate -ps3 -unpack ps3
cd ..\..
git pull https://github.com/hmxmilohax/amplitude-2016-deluxe main
xcopy /e /y _ark\combined _ark\ps3
for /R "%~dp0_ark\ps3" %%f in (*.dta) do dependencies\dtxtool\dtxtool dta2b "%%f" "%%~dpnf.dta_dta_ps3" 3
for /R "%~dp0_ark\ps3" %%f in (*.script_dta) do dependencies\dtxtool\dtxtool dta2b "%%f" "%%~dpnf.script_dta_ps3" 3
xcopy /e /y _ark\ps3 _build\modulate\ps3\ps3
cd _build\modulate
modulate -ps3 -autoadd ps3 -pack_add ps3 ../ps3
pause
