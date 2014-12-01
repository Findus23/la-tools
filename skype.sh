#!/bin/bash
TEXTDOMAIN=la-tools
TEXTDOMAINDIR=./
name="Skype"
./apt-update.sh
./installed.sh skype $name && exit
URL="http://download.skype.com/linux/skype-debian_4.2.0.13-1_i386.deb"
wget -c $URL
if sudo dpkg -i ./$(basename $URL)
then
	zenity --info --title $"Success" --text $"$name successfully installed"
else
	zenity --error --title $"Error" --text $"An error occurred while installing $name"
fi
rm /tmp/skype.deb
