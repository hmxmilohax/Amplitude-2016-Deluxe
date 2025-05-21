#!/bin/bash

set -e # Exit on error

cd "$(dirname "$0")"

# Check if git is installed
if ! command -v git &> /dev/null; then
	echo "- 'git' is not installed. Please install it and try again."
	echo
	read -p "Press enter to exit..."
	exit 1
fi

# Clone or update the repo
echo
if [[ ! -d "./amp-2016-customs/.git" ]]; then
	echo "- Downloading additional Amp 2016 custom songs, this may take some time."
	git clone --branch main https://github.com/jnackmclain/amp-2016-customs.git "./amp-2016-customs"
else
	echo "- Updating additional Amp 2016 custom songs."
	cd "./amp-2016-customs"
	git pull origin main
	cd ..
fi

# Remove existing destination folder
if [[ -d "./_ark/combined/songs/" ]]; then
	rm -rf "./_ark/combined/songs/"
fi

# Copy songs directory
cp -r "./amp-2016-customs/songs" "./_ark/combined/songs/"

echo
echo "- Successfully downloaded Amp 2016 custom songs repo. Please rebuild in order to see them added in-game."
echo
read -p "Press enter to exit..."
exit 0
