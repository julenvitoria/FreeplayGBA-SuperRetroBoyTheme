#!/bin/bash

cd /home/pi
if [ -d /etc/emulationstation/themes/Super_Retroboy_Theme ]; then
        #echo "Old theme directory already exists"
        #echo "Deleting..."
        #sleep 3
        sudo rm -R /etc/emulationstation/themes/Super_Retroboy_Theme
fi
if [ -d "/home/pi/.emulationstation/themes/Super Retroboy/" ]; then
        echo "Super Retroboy theme was downloaded yet"
        echo "Deleting and redownloading..."
        sleep 2
        sudo rm -r "/home/pi/.emulationstation/themes/Super Retroboy/"
        sudo mkdir -p "/home/pi/.emulationstation/themes/Super Retroboy/" && sudo git clone https://github.com/KALEL1981/Super_Retroboy_Theme.git "/home/pi/.emulationstation/themes/Super Retroboy/" --branch master --depth=1
        cd "/opt/retropie/configs/all/emulationstation/themes/Super Retroboy/"
        sudo sed -i -e 's/<fontSize>0.042/<fontSize>0.06/g' SuperRetroboy.xml
        sudo sed -i -e 's/<fontSize>0.025/<fontSize>0.035/g' SuperRetroboy.xml
        sudo sed -i -e 's/<fontSize>0.04/<fontSize>0.055/g' SuperRetroboy.xml
else
        echo "Downloading Super Retroboy theme..."
        sleep 2
        sudo mkdir -p "/home/pi/.emulationstation/themes/Super Retroboy/" && sudo git clone https://github.com/KALEL1981/Super_Retroboy_Theme.git "/home/pi/.emulationstation/themes/Super Retroboy/" --branch master --depth=1
        cd "/opt/retropie/configs/all/emulationstation/themes/Super Retroboy/"
        sudo sed -i -e 's/<fontSize>0.042/<fontSize>0.06/g' SuperRetroboy.xml
        sudo sed -i -e 's/<fontSize>0.025/<fontSize>0.035/g' SuperRetroboy.xml
        sudo sed -i -e 's/<fontSize>0.04/<fontSize>0.055/g' SuperRetroboy.xml

#make temporal directory
fi
cd /home/pi
if [ -d /home/pi/tmp ]; then
        sudo rm -R /home/pi/tmp
        mkdir /home/pi/tmp
else
        mkdir /home/pi/tmp
fi
#Download and install launching images
git clone https://github.com/julenvitoria/FreeplayGBA-SuperRetroBoyTheme "/home/pi/tmp" --branch master --depth=1
echo "COPYING LAUNCHING IMAGES..."
sleep 3
cp -R /home/pi/tmp/configs/* /opt/retropie/configs
#Detection of kelboy-launcher directory and copy system to the theme
if [ -d /home/pi/kelboy-launcher ]; then
        sudo cp -R /home/pi/tmp/systems/* "/home/pi/.emulationstation/themes/Super Retroboy/"
fi
sudo rm -r tmp
echo "Terminated"
#Change theme value on EmulationStation config file
sed -i 's/.*<string name="ThemeSet" value=.*/<string name="ThemeSet" value="simple" \/>/' /opt/retropie/configs/all/emulationstation/es_settings.cfg
#Change theme value on EmulationStation config file
sed -i 's/.*<string name="TransitionStyle".*/<string name="TransitionStyle" value="instant" \/>/' /opt/retropie/configs/all/emulationstation/es_settings.cfg
#Restart EmulationStation
/home/pi/scripts/multi_switch.sh --ES-RESTART
