#!/bin/bash

set -e

cd "$(dirname "$0")"

echo "Locking FPS"
rm "./_ark/combined/config/amp_config.dta"
cp "./dx_optional_additions/_revert_to_default/amp_config.dta" "./_ark/combined/config/"

echo
read -p "Done! Press any key to continue..."
exit 0
