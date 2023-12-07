@echo off
cd _build\prep
mkdir ps3
mkdir ps4
cd ..\..
"%~dp0dependencies\amphelper" ark unpack "%~dp0_build\prep\main_ps3.hdr" "%~dp0_build\prep\ps3"
"%~dp0dependencies\amphelper" ark unpack "%~dp0_build\prep\main_ps4.hdr" "%~dp0_build\prep\ps4"
echo:Amplitude 2016 Deluxe is now ready to be built! Run _build_ps3.bat or _build_ps4.bat to build for your console
pause