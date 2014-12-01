#!/bin/bash
TEXTDOMAIN=la-tools
TEXTDOMAINDIR=./
name="Google Chrome"

if dpkg -l | grep google-chrome | grep ii
then
	echo $"$name is already installed"
	zenity --info --title $"Information" --text $"$name is already installed"
	exit
fi
wget -O /tmp/chrome.deb https://dl.google.com/linux/direct/google-chrome-stable_current_i386.deb

if dpkg -i /tmp/chrome.deb -y
then
	zenity --info --title $"Success" --text $"$name successfully installed"
else
	zenity --error --title $"Error" --text $"An error occurred while installing $name"
fi
rm /tmp/chrome.deb
