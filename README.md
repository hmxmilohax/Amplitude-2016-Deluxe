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

After Running `_init_repo.bat`, extract your Amplitude 2016 .ark and .hdr files to the `_build/modulate` folder. You might want to make a backup as Amplitude 2016 Deluxe/Custom Songs will overwrite them.

For the first build of Amplituded 2016 deluxe and any builds with new [manually added custom songs](##Manually-Add), run `_build_ps3.bat` or `_build_ps4.bat` depending on the console you are building for. This script will unpack the ark, pull the repo again for updates, build the ARK for you, and spit it out in `_build/ps3` or `_build/ps4`

Otherwise simply run `_build_ps3_nosong.bat` or `_build_ps4_nosong.bat` depending on the console you are building for. This script will **NOT** extract the ark, so if you [manually added new customs](##Manually-Add), this **WON'T** work. This script pulls the repo again for updates, builds the ARK for you, and spits it out in `_build/ps3` or `_build/ps4`.

For PS3/RPCS3, After the build bat is done, copy everything in `_build/ps3` to `dev_hdd0/game/NPUB31810` for US and `dev_hdd0/game/NPEB02398` for EU.

For PS4, After the build bat is done, open `gengp4-app.exe` in `dependencies/ps4-pkg-tools`, select CUSAXXXXX folder in `_build/ps4`, and generate a gp4 file. Save it somewhere memorable.

After the gp4 is generated, open `orbis-pub-gen.exe` in `dependencies/ps4-pkg-tools`, open the gp4 file generated in the previous step and click build, select an output folder and build with the default settings. If you want a slight speedup, build with skip digest calculation checked. Install to your PS4 and enjoy!

Run the build script again to pull any new updates committed to the repo and rebuild a new ark.

# Songs

## Automatically-Add

There is a [repo of custom songs](https://github.com/hmxmilohax/amp-2016-customs) that can be easily added.

To take advantage of these customs, first ensure [python](https://www.python.org/downloads/) is downloaded, and installed into PATH. Click the checkbox presented during python install to ensure this.

Head to the `dependencies` folder in this repo and run the install_gitpython.bat, or run `pip install gitpython` in cmd.

after that, running `_download_custom_songs_ps3.bat` for ps3 or `_download_custom_songs_ps4.bat` for ps4 will automatically pull the repo and add the songs to the correct folder

The next time you build Amplitude 2016 Deluxe with eiter `_build_ps#.bat` or `_build_ps#_nosong.bat`, the custom songs will show up and be playable.

## Manually-Add

With the help of [Modulation](https://github.com/DanTheMan827/Modulation) Amplitude 2016 Deluxe can convert custom songs to the correct console when being built.

Open Modulation in the dependencies folder and select the hdr of your console in `_build/modulate`, then drag in zipped songs from wherever you can find custom songs (we reccomend using the [custom songs repo](https://github.com/hmxmilohax/amp-2016-customs) or prepackaged zips from the [website](https://hmxmilohax.github.io/amp-2016-customs/)).

After that, running  `_build_ps3.bat` or `_build_ps4.bat` will show the new songs that were added when rebuilt.

# Dependencies

[Git for Windows](https://gitforwindows.org/) - CLI application to allow auto updating ampdx repo files

[LibForge](https://github.com/mtolly/LibForge) - ForgeTool for modifying Amplitude 2016 Textures

[Modulate](https://github.com/AdamClixby/Modulate) - To patch Amplitude 2016 Arks with the Deluxe updates

[Modulation](https://github.com/DanTheMan827/Modulation) - To add custom songs to Amplitude 2016

[DtxCS](https://github.com/InvoxiPlayGames/DtxCS) - For serializing Amplitude 2016 dtb files

[python](https://www.python.org/downloads/) - for more detailed script functions such as adding custom songs

[PS4 Fake PKG Tools 3.87](https://github.com/CyB1K/PS4-Fake-PKG-Tools-3.87) - for creating a Amplitude 2016 PKG for PS4
