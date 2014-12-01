#!/bin/bash
TEXTDOMAIN=la-tools
TEXTDOMAINDIR=./
name="Chromium"

./installed.sh chromium $name && exit

if sudo apt-get install chromium chromium-l10n
then
	zenity --info --title $"Success" --text $"$name successfully installed"
else
	zenity --error --title $"Error" --text $"An error occurred while installing $name"
fi
