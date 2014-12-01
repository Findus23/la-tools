#!/bin/bash
TEXTDOMAIN=la-tools
TEXTDOMAINDIR=./
name="Lame"

if dpkg -l lame|grep -q ii
then
	echo $"$name is already installed"
	zenity --info --title $"Information" --text $"$name is already installed"
	exit
fi

if sudo apt-get install lame
then
	zenity --info --title $"Success" --text $"$name successfully installed"
else
	zenity --error --title $"Error" --text $"An error occurred while installing $name"
fis
