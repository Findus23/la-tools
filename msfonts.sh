#!/bin/bash
TEXTDOMAIN=la-tools
TEXTDOMAINDIR=./
name=$"Windows fonts"

if dpkg -l | grep ttf-mscorefonts-installer | grep ii
then
	echo $"$name is already installed"
	zenity --info --title $"Information" --text $"$name is already installed"
	exit
fi

if sudo apt-get install ttf-mscorefonts-installer
then
	zenity --info --title $"Success" --text $"$name successfully installed"
else
	zenity --error --title $"Error" --text $"An error occurred while installing $name"
fis
