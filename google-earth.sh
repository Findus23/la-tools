#!/bin/bash
#apt-get update
if dpkg -l | grep google-earth | grep ii
then
	echo "Google Earth ist bereits installiert"
	zenity --info --title "Info" --text "Google Earth ist bereits installiert"
	exit
fi
sources=$(cat /etc/apt/sources.list.d/google-earth.list)
if [ "$sources" != "deb http://dl.google.com/linux/earth/deb/ stable main" ]
then
	echo "deb http://dl.google.com/linux/earth/deb/ stable main" > temp
	mv temp /etc/apt/sources.list.d/google-earth.list
	wget -q https://dl-ssl.google.com/linux/linux_signing_key.pub -O- | sudo apt-key add - 
	rm temp
fi
sudo apt-get update
if sudo apt-get install google-earth-stable -y
then
	zenity --info --title "Erfolg" --text "Google Earth wurde erfolgreich installiert"
else
	zenity --error --title "Fehler" --text "Google Earth wurde nicht erfolgreich installiert"
fi
# alternativ http://dl.google.com/dl/earth/client/current/google-earth-stable_current_i386.deb
