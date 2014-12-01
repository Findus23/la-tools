#!/bin/bash
TEXTDOMAIN=la-tools
TEXTDOMAINDIR=./
name="Dropbox"

if dpkg -l | grep dropbox | grep ii
then
	echo $"$name is already installed"
	zenity --info --title $"Information" --text $"$name is already installed"
	exit
fi
sources=$(cat /etc/apt/sources.list.d/dropbox.list)
if [ "$sources" != "deb http://linux.dropbox.com/debian wheezy main" ]
then
	echo "deb http://linux.dropbox.com/debian wheezy main" > temp
	mv temp /etc/apt/sources.list.d/geogebra.list
	sudo apt-key adv --keyserver pgp.mit.edu --recv-keys 5044912E
	rm temp
fi
apt-get update
if apt-get install dropbox -y
then
	zenity --info --title $"Success" --text $"$name successfully installed"
else
	zenity --error --title $"Error" --text $"An error occurred while installing $name"
fi
