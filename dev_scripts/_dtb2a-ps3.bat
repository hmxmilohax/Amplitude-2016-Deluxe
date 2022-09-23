FOR /F "tokens=*" %%G IN ('dir /b *.dta_dta_ps3') DO dtxtool\dtxtool dtb2a "%%G" "%%~nG.dta"
FOR /F "tokens=*" %%G IN ('dir /b *.script_dta_ps3') DO dtxtool\dtxtool dtb2a "%%G" "%%~nG.script_dta"
