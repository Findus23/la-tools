#!/bin/bash
#apt-get update
if dpkg -l chromium|grep -q ii
then
	echo "Chromium ist bereits installiert"
	zenity --info --title "Info" --text "Chromium ist bereits installiert"
	exit
fi

if sudo apt-get install chromium chromium-l10n
then
	zenity --info --title "Erfolg" --text "Chromium wurde erfolgreich installiert"
else
	zenity --error --title "Fehler" --text "Chromium wurde nicht erfolgreich installiert"
fis
