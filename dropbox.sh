#!/bin/bash
TEXTDOMAIN=la-tools
TEXTDOMAINDIR=./
name="Dropbox"

if dpkg -l | grep dropbox | grep ii
then
	echo $"$name is already installed"
	zenity --info --title $"Information" --text $"$name is already installed"
	exit
fi
wget -O /tmp/dropbox.deb https://www.dropbox.com/download?dl=packages/debian/dropbox_1.6.2_i386.deb

if dpkg -i /tmp/dropbox.deb -y
then
	zenity --info --title $"Success" --text $"$name successfully installed"
else
	zenity --error --title $"Error" --text $"An error occurred while installing $name"
fi
rm /tmp/dropbox.deb

