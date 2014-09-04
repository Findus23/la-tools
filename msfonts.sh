#!/bin/bash
#apt-get update
if dpkg -l | grep ttf-mscorefonts-installer | grep ii
then
	echo "Windows-Schriftarten sind bereits installiert"
	zenity --info --title "Info" --text "Windows-Schriftarten sind bereits installiert"
	exit
fi

if sudo apt-get install ttf-mscorefonts-installer
then
	zenity --info --title "Erfolg" --text "Windows-Schriftarten wurden erfolgreich installiert"
else
	zenity --error --title "Fehler" --text "Windows-Schriftarten wurden nicht erfolgreich installiert"
fis
