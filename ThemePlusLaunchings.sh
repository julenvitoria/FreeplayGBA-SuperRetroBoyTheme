#!/bin/bash

cd ~
if [ -d /home/pi/.emulationstation/themes/Super Retroboy/ ]; then
        echo "Directory update addons was created yet. Deleting and redownloading..."
        sudo rm -r "/home/pi/.emulationstation/themes/Super Retroboy/"
else
        sudo mkdir -p "/home/pi/.emulationstation/themes/Super Retroboy/" && sudo git clone https://github.com/KALEL1981/Super_Retroboy_Theme.git "/home/pi/.emulationstation/themes/Super Retroboy/" --branch master --depth=1
fi
mkdir tmp
git clone https://github.com/julenvitoria/FreeplayGBA-SuperRetroBoyTheme "/home/pi/tmp" --branch master --depth=1
cp -R ~/tmp/configs/* /opt/retropie/configs
sudo rm -r tmp
