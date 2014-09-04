#!/bin/bash
#apt-get update
if dpkg -l | grep dropbox | grep ii
then
	echo "Dropbox ist bereits installiert"
	zenity --info --title "Info" --text "Dropbox ist bereits installiert"
	exit
fi
wget -O /tmp/dropbox.deb https://www.dropbox.com/download?dl=packages/debian/dropbox_1.6.2_i386.deb

if dpkg -i /tmp/dropbox.deb -y
then
	zenity --info --title "Erfolg" --text "Dropbox wurde erfolgreich installiert"
else
	zenity --error --title "Fehler" --text "Dropbox wurde nicht erfolgreich installiert"
fi
rm /tmp/dropbox.deb

