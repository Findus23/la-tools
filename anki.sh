#!/bin/bash
#apt-get update
if dpkg -l anki|grep -q ii
then
	echo "Anki ist bereits installiert"
	zenity --info --title "Info" --text "Anki ist bereits installiert"
	exit
fi
wget -O /tmp/anki.deb http://ankisrs.net/download/mirror/anki-2.0.22.deb
apt-get install mplayer -y
if dpkg -i /tmp/anki.deb -y
then
	zenity --info --title "Erfolg" --text "Anki wurde erfolgreich installiert"
else
	zenity --error --title "Fehler" --text "Anki wurde nicht erfolgreich installiert"
fi
rm /tmp/anki.deb
