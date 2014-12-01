#!/bin/bash
TEXTDOMAIN=la-tools
TEXTDOMAINDIR=./
name="Adobe-Reader"
./apt-update.sh
./installed.sh adobereader-deu $name && exit
URL="ftp://ftp.adobe.com/pub/adobe/reader/unix/9.x/9.1/deu/AdbeRdr9.1.0-1_i386linux_deu.deb"
wget -c $URL

if sudo dpkg -i ./$(basename $URL)
then
	zenity --info --title $"Success" --text $"$name successfully installed"
	rm $(basename $URL)
else
	zenity --error --title $"Error" --text $"An error occurred while installing $name"
fi

