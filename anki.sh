#!/bin/bash
TEXTDOMAIN=la-tools
TEXTDOMAINDIR=./
name="Anki"
./installed.sh anki $name && exit
cd /tmp
URL="http://ankisrs.net/download/mirror/anki-2.0.31.deb"
wget -c $URL
sudo apt-get install mplayer -y
if sudo dpkg -i ./$(basename $URL)
then
	zenity --info --title $"Success" --text $"$name successfully installed"
	rm ./$(basename $URL)
else
	zenity --error --title $"Error" --text $"An error occurred while installing $name"
fi
