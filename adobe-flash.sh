#!/bin/bash
TEXTDOMAIN=la-tools
TEXTDOMAINDIR=./
name="Adobe Flash Player"

#apt-get update
if dpkg -l | grep flashplugin-nonfree | grep ii
then
	echo $"$name is already installed"
	zenity --info --title $"Information" --text $"$name is already installed"
	exit
fi
if apt-get install flashplugin-nonfree -y
then
	zenity --info --title $"Success" --text $"$name successfully installed"
else
	zenity --error --title $"Error" --text $"An error occurred while installing $name"
fi
