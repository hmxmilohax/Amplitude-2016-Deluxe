FOR /F "tokens=*" %%G IN ('dir /b *.dta') DO dtxtool\dtxtool dta2b "%%G" "%%~nG.dta_dta_ps3" 3
FOR /F "tokens=*" %%G IN ('dir /b *_script.dta') DO dtxtool\dtxtool dta2b "%%G" "%%~nG.script_dta_ps3" 3
pause