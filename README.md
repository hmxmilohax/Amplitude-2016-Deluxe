# Amplitude-2016-Deluxe

![Header Image](dependencies/header.png)

## Introduction

This Repo contains almost everything you need to build an ark and pkg for Amplitude 2016 Deluxe for PS3 and PS4.

## Prerequisites

You will need

- a PC that can run RPCS3
- a Jailbroken PS3 (CFW/HEN)
- a Hackable PS4 (sytem software 9.00 or lower)
- a copy of Amplitude 2016 that you can extract onto your PC/install on RPCS3.

## Install

NOTE: You WILL need a modded/hacked console to play this mod on console. I hope this is clear

Setting up the Amplitude 2016 Deluxe repo for the first time is meant to be as easy as possible.
As well, it is designed to allow you to automatically receive updates as the repo is updated.

Simply go to the Releases of this repo and grab both files. (one .exe, one .bat)

The exe is a dependency, [Git for Windows](https://gitforwindows.org/).
Git is required for you to take advantage of auto updating via github pulls.
You can setup git with all default options.

Once the dependency is installed, run `_init_repo.bat` in an **empty folder**. git will pull the repo and make sure you are completely up to date.

After Running `_init_repo.bat`, extract your Amplitude 2016 .ark and .hdr files to the `_build/modulate` folder and `_build/ps3/USRDIR` for PS3 or `_build/ps4` for PS4.

After that, run `!DOTHISFIRST_unpack_ark.bat`.

From then on simply run `_build_ps3.bat` or `_build_ps4.bat` depending on the console you are building for. This script will pull the repo again for updates, build the ARK for you, and spit it out in `_build/ps3` or `_build/ps4`

For PS3/RPCS3, After the build bat is done, copy everything in `_build/ps3` to `dev_hdd0/game/NPUB31810` for US and `dev_hdd0/game/NPEB02398` for EU.

For PS4, After the build bat is done, open `gengp4-app.exe` in `dependencies/ps4-pkg-tools`, select CUSAXXXXX folder in `_build/ps4`, and generate a gp4 file. Save it somewhere memorable.

After the gp4 is generated, open `orbis-pub-gen.exe` in `dependencies/ps4-pkg-tools`, open the gp4 file generated in the previous step and click build, select an output folder and build with the default settings. If you want a slight speedup, build with skip digest calculation checked.

Run the build script again to pull any new updates committed to the repo and rebuild a new ark.

## Custom Songs

(TODO: Where can customs be found?) Amplitude 2016 Deluxe can convert custom songs to the correct console when being built. Place custom song folders into `_ark/combined/songs` and run your consoles build bat. Songs will be automatically added via Modulate.

## Included Dependencies

[Git for Windows](https://gitforwindows.org/) - CLI application to allow auto updating ampdx repo files

[LibForge](https://github.com/mtolly/LibForge) - ForgeTool for modifying Amplitude 2016 Textures

[Modulate](https://github.com/AdamClixby/Modulate) - To patch Amplitude 2016 Arks with the Deluxe updates

[DtxCS](https://github.com/InvoxiPlayGames/DtxCS) - For serializing Amplitude 2016 dtb files

[PS4 Fake PKG Tools 3.87](https://github.com/CyB1K/PS4-Fake-PKG-Tools-3.87) - for creating a Amplitude 2016 PKG for PS4
