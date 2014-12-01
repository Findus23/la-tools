#!/bin/bash
TEXTDOMAIN=la-tools
TEXTDOMAINDIR=./
name="Adobe-Reader"

if dpkg -l | grep adobereader-deu | grep ii
then
	echo $"$name is already installed"
	zenity --info --title $"Information" --text $"$name is already installed"
	exit
fi
wget -O /tmp/adobe-reader.deb ftp://ftp.adobe.com/pub/adobe/reader/unix/9.x/9.1/deu/AdbeRdr9.1.0-1_i386linux_deu.deb

if dpkg -i /tmp/adobe-reader.deb -y
then
	zenity --info --title $"Success" --text $"$name successfully installed"
else
	zenity --error --title $"Error" --text $"An error occurred while installing $name"
fi
rm /tmp/adobe-reader.deb
