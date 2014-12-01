#!/bin/bash
TEXTDOMAIN=la-tools
TEXTDOMAINDIR=./
name="Adobe Flash Player"

./installed.sh flashplugin-nonfree $name && exit
if sudo apt-get install flashplugin-nonfree -y
then
	zenity --info --title $"Success" --text $"$name successfully installed"
else
	zenity --error --title $"Error" --text $"An error occurred while installing $name"
fi
