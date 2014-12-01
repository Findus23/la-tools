#!/bin/bash
TEXTDOMAIN=la-tools
TEXTDOMAINDIR=./
name="Google Earth"
./apt-update.sh
./installed.sh google-chrome $name && exit
sources=$(cat /etc/apt/sources.list.d/google-earth.list)
if [ "$sources" != "deb http://dl.google.com/linux/earth/deb/ stable main" ]
then
	echo "deb http://dl.google.com/linux/earth/deb/ stable main" > temp
	sudo mv temp /etc/apt/sources.list.d/google-earth.list
	wget -q https://dl-ssl.google.com/linux/linux_signing_key.pub -O- | sudo apt-key add - 
	rm temp
fi
sudo apt-get update
if sudo apt-get install google-earth-stable -y
then
	zenity --info --title $"Success" --text $"$name successfully installed"
else
	zenity --error --title $"Error" --text $"An error occurred while installing $name"
fi
# alternativ http://dl.google.com/dl/earth/client/current/google-earth-stable_current_i386.deb
