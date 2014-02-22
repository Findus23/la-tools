#!/bin/bash
apt-get update
if dpkg -l geogebra44|grep ii
then
	if apt-get install geogebra44 -y
	then
		zenity --info --title "Erfolg" --text "Geogebra wurde erfolgreich installiert"
	else
		zenity --error --title "Fehler" --text "Geogebra wurde nicht erfolgreich installiert"
	fi
	exit
fi
apt-get purge geogebra -y
apt-get autoremove -y
sources=$(cat /etc/apt/sources.list.d/geogebra.list)
if [ "$sources" != "deb http://www.geogebra.net/linux/ stable main" ]
then
	echo "deb http://www.geogebra.net/linux/ stable main" > temp
	mv temp /etc/apt/sources.list.d/geogebra.list
	wget -O - http://www.geogebra.net/linux/office@geogebra.org.gpg.key | sudo apt-key add -
	rm temp
fi
if apt-get install geogebra44 -y
then
	zenity --info --title "Erfolg" --text "Geogebra wurde erfolgreich installiert"
else
	zenity --error --title "Fehler" --text "Geogebra wurde nicht erfolgreich installiert"
fi
