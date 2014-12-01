#!/bin/bash
TEXTDOMAIN=la-tools
TEXTDOMAINDIR=./
name="Opera"

./installed.sh opera $name && exit
wget -O /tmp/opera.deb http://get.geo.opera.com/pub/opera/linux/1216/opera_12.16.1860_i386.deb

if sudo dpkg -i /tmp/opera.deb -y
then
	zenity --info --title $"Success" --text $"$name successfully installed"
else
	zenity --error --title $"Error" --text $"An error occurred while installing $name"
fi
rm /tmp/opera.deb

