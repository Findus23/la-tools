#!/bin/bash
#apt-get update
if dpkg -l | grep adobereader-deu | grep ii
then
	echo "Adobe-Reader ist bereits installiert"
	zenity --info --title "Info" --text "Adobe-Reader ist bereits installiert"
	exit
fi
wget -O /tmp/adobe-reader.deb ftp://ftp.adobe.com/pub/adobe/reader/unix/9.x/9.1/deu/AdbeRdr9.1.0-1_i386linux_deu.deb

if dpkg -i /tmp/adobe-reader.deb -y
then
	zenity --info --title "Erfolg" --text "Adobe-Reader wurde erfolgreich installiert"
else
	zenity --error --title "Fehler" --text "Adobe-Reader wurde nicht erfolgreich installiert"
fi
rm /tmp/adobe-reader.deb
