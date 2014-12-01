#!/bin/bash
TEXTDOMAIN=la-tools
TEXTDOMAINDIR=./
if dpkg -s $1 >/dev/null 2>&1
then
	echo $"$2 is already installed"
	zenity --info --title $"Information" --text $"$2 is already installed"
	exit 0
else
	exit 1
fi
