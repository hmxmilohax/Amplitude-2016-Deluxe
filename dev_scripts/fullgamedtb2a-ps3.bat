for /R %%f in (*.dta_dta_ps3) do dependencies\dtxtool\dtxtool dtb2a "%%f" "%%~dpnf.dta"
for /R %%f in (*.script_dta_ps3) do dependencies\dtxtool\dtxtool dtb2a "%%f" "%%~dpnf.script_dta"
pause