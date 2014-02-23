#!/bin/bash
#apt-get update
if dpkg -l lame|grep -q ii
then
	echo "Lame ist bereits installiert"
	zenity --info --title "Info" --text "Lame ist bereits installiert"
	exit
fi

if sudo apt-get install lame
then
	zenity --info --title "Erfolg" --text "Lame wurde erfolgreich installiert"
else
	zenity --error --title "Fehler" --text "Lame wurde nicht erfolgreich installiert"
fis
