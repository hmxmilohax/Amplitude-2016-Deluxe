git pull https://github.com/hmxmilohax/amplitude-2016-deluxe main
xcopy /e /y _ark\combined _ark\ps4
for /R "%~dp0_ark\ps4\songs" %%f in (*.dta_dta_ps3) do move "%%f" "%%~dpnf.dta_dta_ps4"
for /R "%~dp0_ark\ps4\songs" %%f in (*.moggsong_dta_ps3) do move "%%f" "%%~dpnf.moggsong_dta_ps4"
for /R "%~dp0_ark\ps4\songs" %%f in (*.png_ps3) do move "%%f" "%%~dpnf.png_ps4"
for /R "%~dp0_ark\ps4\songs" %%f in (*.mid_ps3) do move "%%f" "%%~dpnf.mid_ps4"
del "%~dp0_ark\ps4\songs\!PLACE CUSTOM SONGS HERE.txt"
for /R "%~dp0_ark\ps4" %%f in (*.dta) do dependencies\dtxtool\dtxtool dta2b "%%f" "%%~dpnf.dta_dta_ps4" 3
for /R "%~dp0_ark\ps4" %%f in (*.script_dta) do dependencies\dtxtool\dtxtool dta2b "%%f" "%%~dpnf.script_dta_ps4" 3
xcopy /e /y _ark\ps4 _build\modulate\ps4\ps4
cd _build\modulate
modulate -autoadd ps4 -pack_add ps4 ../ps4
pause