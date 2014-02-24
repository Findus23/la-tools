#!/bin/bash
wget -O releases.json https://api.github.com/repos/Findus23/la-tools/releases
version_online=$(grep -Po -m 1 '"tag_name":.*?[^\\]",' releases.json| cut -c 14- | rev | cut -c 3- | rev)
version_local=$(cat version.txt)
if [ "$version_local" -lt "$version_online" ]
then
	zenity --info --title "Update" --text "Es gibt ein Update"
	./update.sh $version_online &
else
	zenity --info --title "Update" --text "Es gibt kein Update"
fi
