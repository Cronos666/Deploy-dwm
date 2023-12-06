#!/bin/bash
echo "Run this script as super user"

mkdir suckless && cd suckless
git clone https://git.suckless.org/dwm
git clone https://git.suckless.org/dmenu
git crone https://git.suckless.org/st
cd st && make clean install
cd ../dmenu && make clean install
cd ../dwm && sed -i 's/"/bin/sh"/"/usr/local/bin/st"/g' config.h &&  make clean install
mkdir patches && cd patches
wget "https://dwm.suckless.org/patches/alt-tab/dwm-alttab-6.4.diff"
wget "https://dwm.suckless.org/patches/actualfullscreen/dwm-actualfullscreen-20211013-cb3f58a.diff"
wget "https://dwm.suckless.org/patches/attachbelow/dwm-attachbelow-6.2.diff"
wget "https://dwm.suckless.org/patches/steam/dwm-steam-6.2.diff"
cd ../ && patch -i patches/* && sudo make clean install
cd ../../

echo "DWM deployed \n relogin and startx"
