#!/bin/bash
#apt-get update
if dpkg -l | grep google-chrome | grep ii
then
	echo "Google Chrome ist bereits installiert"
	zenity --info --title "Info" --text "Google Chrome ist bereits installiert"
	exit
fi
wget -O /tmp/chrome.deb https://dl.google.com/linux/direct/google-chrome-stable_current_i386.deb

if dpkg -i /tmp/chrome.deb -y
then
	zenity --info --title "Erfolg" --text "Google Chrome wurde erfolgreich installiert"
else
	zenity --error --title "Fehler" --text "Google Chrome wurde nicht erfolgreich installiert"
fi
rm /tmp/chrome.deb
