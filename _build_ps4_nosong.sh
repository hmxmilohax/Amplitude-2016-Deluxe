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
mkdir -p "./_build/ps4/AFR/CUSA02480"
mkdir -p "./_tmpbuild"

git pull 'https://github.com/hmxmilohax/amplitude-2016-deluxe' main

if [[ ! -d "./_prep_ps4/ext_ark/ps4/" ]]; then
	echo "Preparing to build PS4 For the first time..."
	echo "Make sure your 1.0 vanilla ark files are in _prep_ps4"
	mkdir -p "./_prep_ps4/ext_ark"
	wine "./dependencies/AmpHelper.exe" ark unpack "./_prep_ps4/main_ps4.hdr" "./_prep_ps4/ext_ark"
fi

echo "Copying Amplitude 2016 Deluxe PS4 files..."
cp -r "./_ark/ps4/"* "./_tmpbuild/"
cp -r "./_ark/combined/"* "./_tmpbuild/"

rm -rf "./_tmpbuild/songs/"

echo "Converting .dta files..."
find "./_tmpbuild" -type f -iname "*.dta" ! -iname "*.dta_dta_ps4" | while read -r file; do
    out="${file%.dta}.dta_dta_ps4"
    wine "./dependencies/dtxtool/DTXTool.exe" dta2b "$file" "$out" 3
done

echo "Converting .script files..."
find _tmpbuild -type f -iname "*.script" ! -iname "*.script_dta_ps4" | while read -r file; do
    out="${file%.script}.script_dta_ps4"
    wine "./dependencies/dtxtool/DTXTool.exe" dta2b "$file" "$out" 3
done

echo "Cleaning up original .dta and .script files..."
find "./_tmpbuild" -type f -iname "*.dta" ! -iname "*.dta_dta_ps4" -exec rm {} \;
find "./_tmpbuild" -type f -iname "*.script" ! -iname "*.script_dta_ps4" -exec rm {} \;

echo "Copying processed files to prep directory..."
mkdir -p "._prep_ps4/ext_ark/ps4"
cp -r "./_tmpbuild/"* "./_prep_ps4/ext_ark/ps4/"

echo "Cleaning up temp files..."
rm -rf "./_tmpbuild"

echo "Building Amplitude 2016 Deluxe arks..."
wine "./dependencies/AmpHelper.exe" ark pack "./_prep_ps4/ext_ark" "./_build/ps4/AFR/CUSA02480/main_ps4.hdr" # >/dev/null

echo "Wrote Amplitude 2016 Deluxe arks."
echo "Complete! Enjoy Amplitude 2016 Deluxe"
read -p "Press enter to exit..."
exit 0
