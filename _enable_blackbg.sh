#!/bin/bash

set -e

cd "$(dirname "$0")"

echo "Enabling Black Background"
if [[ -d "./_ark/ps3/world/" ]]; then
	rm -rf "./_ark/ps3/world/"
fi
mkdir -p "./_ark/ps3/world/"
cp -r "./dx_optional_additions/blackbg/ps3/." "./_ark/ps3/world/"

if [[ -d "./_ark/ps4/world/" ]]; then
	rm -rf "./_ark/ps4/world/"
fi
mkdir -p "./_ark/ps4/world/"
cp -r "./dx_optional_additions/blackbg/ps4/." "./_ark/ps4/world/"

echo
read -p "Done! Press any key to continue..."
exit 0
