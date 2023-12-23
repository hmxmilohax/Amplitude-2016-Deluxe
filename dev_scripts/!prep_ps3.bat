
echo:Preparing to build PS3 For the first time...
echo:Make sure your 1.0 vanilla ark files are in _prep_ps3
cd "%~dp0..\_prep_ps3"
mkdir ext_ark
cd "%~dp0..\"
"%~dp0..\dependencies\amphelper" ark unpack "%~dp0..\_prep_ps3\main_ps3.hdr" "%~dp0..\_prep_ps3\ext_ark" >nul
echo:Amplitude 2016 Deluxe is now ready to be built!