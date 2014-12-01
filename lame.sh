#!/bin/bash
TEXTDOMAIN=la-tools
TEXTDOMAINDIR=./
name="Lame"

./installed.sh lame $name && exit

if sudo apt-get install lame
then
	zenity --info --title $"Success" --text $"$name successfully installed"
else
	zenity --error --title $"Error" --text $"An error occurred while installing $name"
fis
