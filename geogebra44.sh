#!/bin/bash
TEXTDOMAIN=la-tools
TEXTDOMAINDIR=./
name="Geogebra"

apt-get update
if dpkg -l | grep geogebra44 | grep ii
then
	if apt-get install geogebra44 -y
	then
		zenity --info --title $"Success" --text $"$name was successfully updated"
	else
		zenity --error --title $"Error" --text $"An error occurred while updating $name"
	fi
	exit
fi
apt-get purge geogebra geogebra5 -y
apt-get autoremove -y
sources=$(cat /etc/apt/sources.list.d/geogebra.list)
if [ "$sources" != "deb http://www.geogebra.net/linux/ stable main" ]
then
	echo "deb http://www.geogebra.net/linux/ stable main" > temp
	sudo mv temp /etc/apt/sources.list.d/geogebra.list
	wget -O - http://www.geogebra.net/linux/office@geogebra.org.gpg.key | sudo apt-key add -
	rm temp
fi
if apt-get install geogebra44 -y
then
	zenity --info --title $"Success" --text $"$name successfully installed"
else
	zenity --error --title $"Error" --text $"An error occurred while installing $name"
fi
