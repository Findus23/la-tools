#!/bin/bash
TEXTDOMAIN=la-tools
TEXTDOMAINDIR=./
name="Anki"

./installed.sh anki $name && exit

wget -c -O /tmp/anki.deb http://ankisrs.net/download/mirror/anki-2.0.31.deb
sudo apt-get install mplayer -y
if sudo dpkg -i -y /tmp/anki.deb 
then
	zenity --info --title $"Success" --text $"$name successfully installed"
else
	zenity --error --title $"Error" --text $"An error occurred while installing $name"
fi
rm /tmp/anki.deb
