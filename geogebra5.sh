#!/bin/bash

sources=$(cat /etc/apt/sources.list.d/geogebra.list)
if [ "$sources" != "deb http://www.geogebra.net/linux/ stable main" ]
then
	echo "deb http://www.geogebra.net/linux/ stable main" > temp
	sudo mv temp /etc/apt/sources.list.d/geogebra.list
	wget -O - http://www.geogebra.net/linux/office@geogebra.org.gpg.key | sudo apt-key add -
	rm temp
fi

sudo apt-get update
if dpkg -l | grep geogebra5 | grep ii
then
	if sudo apt-get install geogebra5 -y
	then
		zenity --info --title "Erfolg" --text "Geogebra wurde erfolgreich aktualisiert"
	else
		zenity --error --title "Fehler" --text "Ein Fehler ist beim Aktualisieren von Geogebra aufgetreten"
	fi
	exit
fi

sudo apt-get purge geogebra geogebra44 -y
sudo apt-get autoremove -y
sudo apt-get install --only-upgrade lernstick-geogebra-wheezy

if sudo apt-get install geogebra5 -y
then
		zenity --info --title "Erfolg" --text "Geogebra wurde erfolgreich installiert"
else
		zenity --error --title "Fehler" --text "Ein Fehler ist beim Installieren von Geogebra aufgetreten"
fi
