#!/bin/bash
TEXTDOMAIN=la-tools
TEXTDOMAINDIR=./
name="Skype"

./installed.sh skype $name && exit
wget -O /tmp/skype.deb http://download.skype.com/linux/skype-debian_4.2.0.13-1_i386.deb

if dpkg -i /tmp/skype.deb -y
then
	zenity --info --title $"Success" --text $"$name successfully installed"
else
	zenity --error --title $"Error" --text $"An error occurred while installing $name"
fi
rm /tmp/skype.deb
