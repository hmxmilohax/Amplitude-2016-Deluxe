#!/bin/bash

set -e

cd "$(dirname "$0")"

echo "Unlocking FPS on Emulator"
rm "./_ark/combined/config/amp_config.dta"
cp "./dx_optional_additions/nofail/amp_config.dta" "./_ark/combined/config/"

echo
read -p "Done! Press any key to continue..."
exit 0
