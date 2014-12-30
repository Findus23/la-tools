#!/bin/bash
path=$(pwd)
sudo ln -s $path/main.sh /usr/bin/la-tools
for size in 8 14 16 22 24 32 36 42 48 64 72 96 128 192 256 512

do
	inkscape --export-png=logo-${size}x$size.png --export-width=$size --export-height=$size logo.svg
	sudo mv logo-${size}x$size.png /usr/share/icons/hicolor/${size}x$size/apps/la-tools.png
done
sudo cp logo.svg /usr/share/icons/hicolor/scalable/apps/la-tools.svg
sudo gtk-update-icon-cache /usr/share/icons/hicolor/

sudo cp la-tools.desktop /usr/share/applications/
