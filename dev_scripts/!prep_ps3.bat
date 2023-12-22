@echo off
echo:Preparing to build PS3 For the first time...
echo:Make sure your 1.0 vanilla ark files are in _build/prep/
cd "%~dp0..\_build\prep"
mkdir ps3
cd ..\..
"%~dp0..\dependencies\amphelper" ark unpack "%~dp0..\_build\prep\main_ps3.hdr" "%~dp0..\_build\prep\ps3" >nul
echo:Amplitude 2016 Deluxe is now ready to be built!