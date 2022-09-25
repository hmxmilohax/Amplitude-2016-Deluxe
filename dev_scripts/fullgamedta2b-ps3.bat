for /R %%f in (*.dta) do dependencies\dtxtool\dtxtool dta2b "%%f" "%%~dpnf.dta_dta_ps3" 3
for /R %%f in (*.script_dta) do dependencies\dtxtool\dtxtool dta2b "%%f" "%%~dpnf.script_dta_ps3" 3
pause
