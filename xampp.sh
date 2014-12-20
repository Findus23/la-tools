#!/bin/bash
TEXTDOMAIN=la-tools
TEXTDOMAINDIR=./
name="Xampp"
./installed.sh opera $name && exit
cd /tmp
URL="http://downloads.sourceforge.net/project/xampp/XAMPP%20Linux/5.6.3/xampp-linux-x64-5.6.3-0-installer.run"
wget -c $URL
if sudo ./$(basename $URL) --mode unattended --disable-components xampp_developer_files --installer-language de --launchapps 0 --unattendedmodeui minimalWithDialogs
then
	zenity --info --title $"Success" --text $"$name successfully installed"
	rm ./$(basename $URL)
else
	zenity --error --title $"Error" --text $"An error occurred while installing $name"
fi
