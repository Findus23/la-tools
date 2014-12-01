#!/bin/bash
TEXTDOMAIN=la-tools
TEXTDOMAINDIR=./
name="Google Chrome"

./installed.sh google-chrome $name && exit
wget -c -O /tmp/chrome.deb https://dl.google.com/linux/direct/google-chrome-stable_current_i386.deb

if sudo dpkg -i /tmp/chrome.deb
then
	zenity --info --title $"Success" --text $"$name successfully installed"
else
	zenity --error --title $"Error" --text $"An error occurred while installing $name"
fi
rm /tmp/chrome.deb
