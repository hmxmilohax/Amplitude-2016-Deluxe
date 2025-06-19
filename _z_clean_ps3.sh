#!/bin/bash

set -e

cd "$(dirname "$0")"

rm -rf "./_prep_ps3/ext_ark"
echo "The PS3 prep folder has been removed."

echo
read -p "Press any key to continue..."
exit 0
