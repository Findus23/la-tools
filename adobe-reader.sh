#!/bin/bash
TEXTDOMAIN=la-tools
TEXTDOMAINDIR=./
name="Adobe-Reader"

./installed.sh adobereader-deu $name && exit
wget -O /tmp/adobe-reader.deb ftp://ftp.adobe.com/pub/adobe/reader/unix/9.x/9.1/deu/AdbeRdr9.1.0-1_i386linux_deu.deb

if sudo dpkg -i /tmp/adobe-reader.deb -y
then
	zenity --info --title $"Success" --text $"$name successfully installed"
else
	zenity --error --title $"Error" --text $"An error occurred while installing $name"
fi
rm /tmp/adobe-reader.deb
