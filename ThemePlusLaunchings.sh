#!/bin/bash

if [ -d /etc/emulationstation/themes/Super_Retro_Boy ]; then
        echo "Old theme directory already exists"
        echo "Deleting..."
        sleep 3
        sudo rm -R /etc/emulationstation/themes/Super_Retro_Boy
else
        echo "Old theme directory doesn't exist"
        echo "Continuing..."
        sleep 3
fi

cd ~
if [ -d "/home/pi/.emulationstation/themes/Super Retroboy/" ]; then
        echo "Super Retroboy theme was downloaded yet"
        echo "Deleting and redownloading..."
        sleep 4
        sudo rm -r "/home/pi/.emulationstation/themes/Super Retroboy/"
        sudo mkdir -p "/home/pi/.emulationstation/themes/Super Retroboy/" && sudo git clone https://github.com/KALEL1981/Super_Retroboy_Theme.git "/home/pi/.emulationstation/themes/Super Retroboy/" --branch master --depth=1
else
        echo "Downloading Super Retroboy theme..."
        sleep 4
        sudo mkdir -p "/home/pi/.emulationstation/themes/Super Retroboy/" && sudo git clone https://github.com/KALEL1981/Super_Retroboy_Theme.git "/home/pi/.emulationstation/themes/Super Retroboy/" --branch master --depth=1
fi
mkdir tmp
git clone https://github.com/julenvitoria/FreeplayGBA-SuperRetroBoyTheme "/home/pi/tmp" --branch master --depth=1
echo "COPYING LAUNCHING IMAGES..."
sleep 3
cp -R ~/tmp/configs/* /opt/retropie/configs
sudo rm -r tmp
