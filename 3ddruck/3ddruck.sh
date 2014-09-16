#!/bin/sh
mkdir ~/3ddruck
cd ~/3ddruck
wget http://dl.slic3r.org/linux/slic3r-linux-x86-1-1-7-stable.tar.gz
tar -xzf slic3r-linux-x86-1-1-7-stable.tar.gz
rm slic3r-linux-x86-1-1-7-stable.tar.gz
ln -s Slic3r/bin/slic3r Slic3r_starten
cp ~/la-tools/3ddruck/Slic3r_config_bundle.ini einstellungen.ini
cp ~/la-tools/3ddruck/*.desktop ./
