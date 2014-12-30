#!/bin/bash
TEXTDOMAIN=la-tools
TEXTDOMAINDIR=./

notify () {
	echo $1
	zenity --info --text "$1" --title la-tools 2>/dev/null
} 

preference=$(zenity --list --title "la-tools" --window-icon=./logo-50x50.png --text $"What do you want to do?" --column $"short" --column $"Action" \
	"install" $"Install Program" \
	"update" $"Update la-tools" \
	"help" $"Show Help" \
	--hide-column "1" 2>/dev/null)
	
test -z "$preference" && echo $"Aborted" && exit 1

case "$preference" in
	update) if git pull | grep -q 'Already up-to-date.'
		update_date=$(git log -1 --format=%cd --date=relative)
		then
			notify $"There is no Update available. The last change was $update_date."
		else
			notify $"la-tools was updated. The last change was $update_date."
		fi
		exit 0
		;;
	install) program=$(zenity --list --title "la-tools" --height=500 --text $"What program should be installed?" --ok-label $"Install" --column $"file" --column $"program" --hide-column "1" \
		"adobe-flash.sh" "Adobe Flash Player" \
		"adobe-reader.sh" "Adobe Reader" \
		"anki.sh" "Anki" \
		"chromium.sh" "Chromium" \
		"dropbox_neu.sh" "Dropbox" \
		"geogebra44.sh" "Geogebra 4.4" \
		"geogebra5.sh" "Geogebra 5" \
		"google-chrome.sh" "Google Chrome" \
		"google-earth.sh" "Google Earth" \
		"lame.sh" "LAME MP3 Encoder" \
		"msfonts.sh" $"Windows fonts" \
		"opera.sh" "Opera" \
		"skype.sh" "Skype" \
		"xampp.sh" "XAMPP" )
		test -z "$program" && echo $"Aborted" && exit 1
		./$program
		;;
	
	*)
		echo $"unknown output"
		exit 1

esac
