#!/bin/bash

if [ -d /home/pi/.emulationstation/themes/Super Retroboy/ ]; then
        echo "Directory update addons was created yet. Deleting and redownloading..."
        sudo rm -r "/home/pi/.emulationstation/themes/Super Retroboy/"
else
        sudo mkdir -p "/home/pi/.emulationstation/themes/Super Retroboy/" && sudo git clone https://github.com/KALEL1981/Super_Retroboy_Theme.git "/home/pi/.emulationstation/themes/Super Retroboy/" --branch master --depth=1
fi
