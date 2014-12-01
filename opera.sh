#!/bin/bash
TEXTDOMAIN=la-tools
TEXTDOMAINDIR=./
name="Opera"
./apt-update.sh
./installed.sh opera $name && exit
URL="http://get.geo.opera.com/pub/opera/linux/1216/opera_12.16.1860_i386.deb"
wget -c $URL
if sudo dpkg -i ./$(basename $URL)
then
	zenity --info --title $"Success" --text $"$name successfully installed"
else
	zenity --error --title $"Error" --text $"An error occurred while installing $name"
fi
rm /tmp/opera.deb

