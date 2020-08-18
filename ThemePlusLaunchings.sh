#!/bin/bash

if [ -d /etc/emulationstation/themes/Super_Retroboy_Theme ]; then
        echo "Old theme directory already exists"
        echo "Deleting..."
        sleep 3
        sudo rm -R /etc/emulationstation/themes/Super_Retroboy_Theme
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
        cd "/opt/retropie/configs/all/emulationstation/themes/Super Retroboy/"
        sudo sed -i -e 's/<fontSize>0.042/<fontSize>0.06/g' SuperRetroboy.xml
        sudo sed -i -e 's/<fontSize>0.025/<fontSize>0.035/g' SuperRetroboy.xml
        sudo sed -i -e 's/<fontSize>0.04/<fontSize>0.055/g' SuperRetroboy.xml
else
        echo "Downloading Super Retroboy theme..."
        sleep 4
        sudo mkdir -p "/home/pi/.emulationstation/themes/Super Retroboy/" && sudo git clone https://github.com/KALEL1981/Super_Retroboy_Theme.git "/home/pi/.emulationstation/themes/Super Retroboy/" --branch master --depth=1
        cd "/opt/retropie/configs/all/emulationstation/themes/Super Retroboy/"
        sudo sed -i -e 's/<fontSize>0.042/<fontSize>0.06/g' SuperRetroboy.xml
        sudo sed -i -e 's/<fontSize>0.025/<fontSize>0.035/g' SuperRetroboy.xml
        sudo sed -i -e 's/<fontSize>0.04/<fontSize>0.055/g' SuperRetroboy.xml
fi
cd ~
mkdir tmp
git clone https://github.com/julenvitoria/FreeplayGBA-SuperRetroBoyTheme "/home/pi/tmp" --branch master --depth=1
echo "COPYING LAUNCHING IMAGES..."
sleep 3
cp -R ~/tmp/configs/* /opt/retropie/configs
sudo rm -r tmp
~/scripts/multi_switch.sh --ES-RESTART
