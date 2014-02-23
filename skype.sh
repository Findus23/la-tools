#!/bin/bash
#apt-get update
if dpkg -l adobereader-deu|grep -q ii
then
	echo "Skype ist bereits installiert"
	zenity --info --title "Info" --text "Skype ist bereits installiert"
	exit
fi
wget -O /tmp/skype.deb http://download.skype.com/linux/skype-debian_4.2.0.13-1_i386.deb

if dpkg -i /tmp/skype.deb -y
then
	zenity --info --title "Erfolg" --text "Skype wurde erfolgreich installiert"
else
	zenity --error --title "Fehler" --text "Skype wurde nicht erfolgreich installiert"
fi
rm /tmp/skype.deb
