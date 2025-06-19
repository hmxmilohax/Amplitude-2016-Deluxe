#!/bin/bash

set -e

cd "$(dirname "$0")"

echo "Locking FPS"
rm "./_ark/ps3/system/data/config/default.dta"
cp "./dx_optional_additions/_revert_to_default/default.dta" "./_ark/ps3/system/data/config/"

echo
read -p "Done! Press any key to continue..."
exit 0
