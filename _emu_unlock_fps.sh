#!/bin/bash

set -e

cd "$(dirname "$0")"

echo "Unlocking FPS on Emulator"
rm "./_ark/ps3/system/data/config/default.dta"
cp "./dx_optional_additions/emu_unlock_fps/default.dta" "./_ark/ps3/system/data/config/"

echo
read -p "Done! Press any key to continue..."
exit 0
