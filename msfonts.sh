#!/bin/bash
TEXTDOMAIN=la-tools
TEXTDOMAINDIR=./
name=$"Windows fonts"
./apt-update.sh
./installed.sh ttf-mscorefonts-installer $name && exit

if sudo apt-get install ttf-mscorefonts-installer
then
	zenity --info --title $"Success" --text $"$name successfully installed"
else
	zenity --error --title $"Error" --text $"An error occurred while installing $name"
fi
