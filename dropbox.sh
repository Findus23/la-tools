#!/bin/bash
TEXTDOMAIN=la-tools
TEXTDOMAINDIR=./
name="Dropbox"

./installed.sh dropbox $name && exit

URL="https://www.dropbox.com/download?dl=packages/debian/dropbox_1.6.2_i386.deb"
wget -c $URL
if sudo dpkg -i ./$(basename $URL)
then
	zenity --info --title $"Success" --text $"$name successfully installed"
	rm ./$(basename $URL)
else
	zenity --error --title $"Error" --text $"An error occurred while installing $name"
fi
