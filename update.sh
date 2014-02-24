#!/bin/bash
echo $1
echo "git pull origin master
git git reset --hard $1
zenity --info --title 'Update' --text 'Erfolgreich aktualisiert'
#andere Sachen updaten
#z.B.: .desktop Datei" > temp.sh
chmod +x temp.sh
./temp.sh &
