#!/bin/bash
cp /usr/share/applications/chromium.desktop Arbeitsfläche/
cp /usr/share/applications/iceweasel.desktop Arbeitsfläche/
chmod +x Arbeitsfläche/chromium.desktop
chmod +x Arbeitsfläche/iceweasel.desktop
sed -i "s/Chromium-Webbrowser/Google Chrome/g" Arbeitsfläche/chromium.desktop
sed -i "s/Iceweasel/Firefox/g" Arbeitsfläche/iceweasel.desktop



# Kopiere .config/chromium/Default/*
# mit richtigen Einstellungen

#Flash installieren

sudo apt-get install flashplugin-nonfree # Iceweasel
sudo apt-get install pepperflashplugin-nonfree # Chromium

if  [ "$1" == "update" ]
then
	sudo apt-get update # einige wichtige Pakete aktualisieren:
	sudo apt-get install -y --only-upgrade chromium chromium-l10n iceweasel iceweasel-l10n-de geogebra5 vlc
	sudo update-flashplugin-nonfree
	sudo update-pepperflashplugin-nonfree
	echo "test"
fi
