#!/bin/bash
TEXTDOMAIN=la-tools
TEXTDOMAINDIR=./
name="Dropbox"

./installed.sh dropbox $name && exit

wget -O -c /tmp/dropbox.deb https://www.dropbox.com/download?dl=packages/debian/dropbox_1.6.2_i386.deb

if sudo dpkg -i /tmp/dropbox.deb 
then
	zenity --info --title $"Success" --text $"$name successfully installed"
else
	zenity --error --title $"Error" --text $"An error occurred while installing $name"
fi
rm /tmp/dropbox.deb

