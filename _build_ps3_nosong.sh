#!/bin/bash

set -e
set -o pipefail

cd "$(dirname "$0")"

# Check if wine is installed
if ! command -v wine &> /dev/null; then
	echo "- 'wine' is not installed. Please install it and try again."
	echo
	read -p "Press enter to exit..."
	exit 1
fi

echo "Creating build directories..."
mkdir -p "./_build/ps3/USRDIR"
mkdir -p "./_tmpbuild"

git pull 'https://github.com/hmxmilohax/amplitude-2016-deluxe' main

if [[ ! -d "./_prep_ps3/ext_ark/ps3/" ]]; then
	echo "Preparing to build PS3 For the first time..."
	echo "Make sure your 1.0 vanilla ark files are in _prep_ps3"
	mkdir -p "./_prep_ps3/ext_ark"
	wine "./dependencies/AmpHelper.exe" ark unpack "./_prep_ps3/main_ps3.hdr" "./_prep_ps3/ext_ark"
fi

echo "Copying Amplitude 2016 Deluxe PS3 files..."
cp -r "./_ark/ps3/." "./_tmpbuild/"
cp -r "./_ark/combined/." "./_tmpbuild/"

rm -rf "./_tmpbuild/songs/"

echo "Converting .dta files..."
find "./_tmpbuild" -type f -iname "*.dta" ! -iname "*.dta_dta_ps3" | while read -r file; do
    out="${file%.dta}.dta_dta_ps3"
    wine "./dependencies/dtxtool/DTXTool.exe" dta2b "$file" "$out" 3
done

echo "Converting .script files..."
find _tmpbuild -type f -iname "*.script" ! -iname "*.script_dta_ps3" | while read -r file; do
    out="${file%.script}.script_dta_ps3"
    wine "./dependencies/dtxtool/DTXTool.exe" dta2b "$file" "$out" 3
done

echo "Cleaning up original .dta and .script files..."
find "./_tmpbuild" -type f -iname "*.dta" ! -iname "*.dta_dta_ps3" -exec rm {} \;
find "./_tmpbuild" -type f -iname "*.script" ! -iname "*.script_dta_ps3" -exec rm {} \;

echo "Copying processed files to prep directory..."
mkdir -p "._prep_ps3/ext_ark/ps3"
cp -r "./_tmpbuild/." "./_prep_ps3/ext_ark/ps3/"

echo "Cleaning up temp files..."
rm -rf "./_tmpbuild"

echo "Building Amplitude 2016 Deluxe arks without new songs..."
wine "./dependencies/AmpHelper.exe" ark pack "./_prep_ps3/ext_ark" "./_build/ps3/USRDIR/main_ps3.hdr" # >/dev/null

echo "Wrote Amplitude 2016 Deluxe arks."
echo "Complete! Enjoy Amplitude 2016 Deluxe"
read -p "Press enter to exit..."
exit 0
