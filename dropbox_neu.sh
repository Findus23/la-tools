#!/bin/bash
if dpkg -l | grep dropbox | grep ii
then
	echo "Dropbox ist bereits installiert"
	zenity --info --title "Info" --text "Dropbox ist bereits installiert"
	exit
fi
sources=$(cat /etc/apt/sources.list.d/dropbox.list)
if [ "$sources" != "deb http://linux.dropbox.com/debian wheezy main" ]
then
	echo "deb http://linux.dropbox.com/debian wheezy main" > temp
	mv temp /etc/apt/sources.list.d/geogebra.list
	sudo apt-key adv --keyserver pgp.mit.edu --recv-keys 5044912E
	rm temp
fi
apt-get update
if apt-get install dropbox -y
then
	zenity --info --title "Erfolg" --text "Dropbox wurde erfolgreich installiert"
else
	zenity --error --title "Fehler" --text "Dropbox wurde nicht erfolgreich installiert"
fi
