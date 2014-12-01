#!/bin/bash
TEXTDOMAIN=la-tools
TEXTDOMAINDIR=./
name="Anki"

./installed.sh anki $name && exit

wget -O /tmp/anki.deb http://ankisrs.net/download/mirror/anki-2.0.31.deb
sudo apt-get install mplayer -y
if sudo dpkg -i /tmp/anki.deb -y
then
	zenity --info --title $"Success" --text $"$name successfully installed"
else
	zenity --error --title $"Error" --text $"An error occurred while installing $name"
fi
rm /tmp/anki.deb
