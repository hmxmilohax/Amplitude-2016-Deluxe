for /R %%f in (*.dta_dta_ps4) do dependencies\dtxtool\dtxtool dtb2a "%%f" "%%~dpnf.dta"
for /R %%f in (*.script_dta_ps4) do dependencies\dtxtool\dtxtool dtb2a "%%f" "%%~dpnf.script_dta"
pause