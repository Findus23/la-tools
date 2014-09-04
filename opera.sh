#!/bin/bash
#apt-get update
if dpkg -l | grep opera | grep ii
then
	echo "Opera ist bereits installiert"
	zenity --info --title "Info" --text "Opera ist bereits installiert"
	exit
fi
wget -O /tmp/opera.deb http://get.geo.opera.com/pub/opera/linux/1216/opera_12.16.1860_i386.deb

if dpkg -i /tmp/opera.deb -y
then
	zenity --info --title "Erfolg" --text "Opera wurde erfolgreich installiert"
else
	zenity --error --title "Fehler" --text "Opera wurde nicht erfolgreich installiert"
fi
rm /tmp/opera.deb

