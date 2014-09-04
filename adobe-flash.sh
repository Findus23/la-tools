#!/bin/bash
apt-get update
if dpkg -l | grep flashplugin-nonfree | grep ii
then
	echo "Flash ist bereits installiert"
	zenity --info --title "Info" --text "Flash ist bereits installiert"
	exit
fi
if apt-get install flashplugin-nonfree -y
then
	zenity --info --title "Erfolg" --text "Flash wurde erfolgreich installiert"
else
	zenity --error --title "Fehler" --text "Flash wurde nicht erfolgreich installiert"
fi
