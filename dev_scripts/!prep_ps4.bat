@echo off
echo:Preparing to build PS4 For the first time...
echo:Make sure your 1.0 vanilla ark files are in _prep_ps4
cd "%~dp0..\_prep_ps4"
mkdir ext_ark
cd "%~dp0..\"
"%~dp0..\dependencies\amphelper" ark unpack "%~dp0..\_prep_ps4\main_ps4.hdr" "%~dp0..\_prep_ps4\ext_ark" >nul
echo:Amplitude 2016 Deluxe is now ready to be built!