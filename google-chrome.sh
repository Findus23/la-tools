#!/bin/bash
TEXTDOMAIN=la-tools
TEXTDOMAINDIR=./
name="Google Chrome"

./installed.sh google-chrome $name && exit
URL="https://dl.google.com/linux/direct/google-chrome-stable_current_i386.deb"
wget -c $URL
if sudo dpkg -i ./$(basename $URL)
then
	zenity --info --title $"Success" --text $"$name successfully installed"
	rm ./$(basename $URL)
else
	zenity --error --title $"Error" --text $"An error occurred while installing $name"
fi
rm /tmp/chrome.deb
