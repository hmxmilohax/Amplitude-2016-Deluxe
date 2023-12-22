# Amplitude-2016-Deluxe

![Header Image](dependencies/header.png)

# Table of Contents  

* [Introduction](#introduction)
* [Prerequisites](#Prerequisites)
* [Install](#Install)
* [Custom Songs](#Songs)
* [Dependencies](#Dependencies)

# Introduction

This Repo contains almost everything you need to build an ark and pkg for Amplitude 2016 Deluxe for PS3 and PS4.

# Prerequisites

You will need

- a PC that can run RPCS3
- a Jailbroken PS3 (CFW/HEN)
- a Hackable PS4 (sytem software 9.00 or lower)
- a copy of Amplitude 2016 that you can extract onto your PC/install on RPCS3.

# Install

NOTE: You WILL need a modded/hacked console to play this mod on console. I hope this is clear

Setting up the Amplitude 2016 Deluxe repo for the first time is meant to be as easy as possible.
As well, it is designed to allow you to automatically receive updates as the repo is updated.

Simply go to the Releases of this repo and grab both files. (one .exe, one .bat)

The exe is a dependency, [Git for Windows](https://gitforwindows.org/).
Git is required for you to take advantage of auto updating via github pulls.
You can setup git with all default options.

Once the dependency is installed, run `_init_repo.bat` in an **empty folder**. git will pull the repo and make sure you are completely up to date.

After Running `_init_repo.bat`, extract your Amplitude 2016 .ark and .hdr files to the `_prep_ps3` or `_prep_ps4` folder, depending on your console.

To build Amplitude 2016 deluxe with new [custom songs](#Songs), run `_build_ps3.bat` or `_build_ps4.bat` depending on the console you are building for. This script will pull the repo for updates, build the ARK for you, and spit it out in `_build/ps3` or `_build/ps4`.

You can also run `_build_ps3_nosong.bat` or `_build_ps4_nosong.bat` depending on the console you are building for. This script will **NOT** update the song list, so if you [added new customs](#Songs), they **WON'T** be included. This script will pull the repo for updates, build the ARK for you, and spit it out in `_build/ps3` or `_build/ps4`.

For PS3/RPCS3, After the build bat is done, copy everything in `_build/ps3` to `dev_hdd0/game/NPUB31810` for US and `dev_hdd0/game/NPEB02398` for EU.

For PS4, After the build bat is done, install the `amp16dx_afr_blank.pkg` file to your PS4, and copy the rest of the files in `_build/ps4` to the `data/GoldHEN` folder on your ps4

Run the build script again to pull any new updates committed to the repo and rebuild a new ark.

# Songs

## Automatically-Add

There is a [repo of custom songs](https://github.com/hmxmilohax/amp-2016-customs) that can be easily added.

To take advantage of these customs, first ensure [python](https://www.python.org/downloads/) is downloaded, and installed into PATH. Click the checkbox presented during python install to ensure this.

Head to the `dependencies` folder in this repo and run the install_gitpython.bat, or run `pip install gitpython` in cmd.

after that, running `_download_custom_songs.bat` will automatically pull the repo and add the songs to the correct folder

The next time you build Amplitude 2016 Deluxe with `_build_ps#.bat`, the custom songs will show up and be playable.

## Manually-Add

With the help of [AmpHelper](https://github.com/hmxmilohax/AmpHelper) Amplitude 2016 Deluxe can convert custom songs to the correct console when being built.

Simply copy the extracted folder of a custom to `_ark/combined/songs`, making sure to delete any files ending in `_ps3` or `_ps4`.

After that, running  `_build_ps3.bat` or `_build_ps4.bat` will show the new songs that were added when rebuilt.

# Dependencies

[Git for Windows](https://gitforwindows.org/) - CLI application to allow auto updating ampdx repo files

[LibForge](https://github.com/mtolly/LibForge) - ForgeTool for modifying Amplitude 2016 Textures

[AmpHelper](https://github.com/hmxmilohax/AmpHelper) - To patch Amplitude 2016 Arks with the Deluxe updates

[DtxCS](https://github.com/InvoxiPlayGames/DtxCS) - For serializing Amplitude 2016 dtb files

[python](https://www.python.org/downloads/) - for more detailed script functions such as adding custom songs
