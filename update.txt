#!/bin/bash
git pull origin master --tags
version_tag=$(git tag | sort -V |tail -1)
version_local=$(cat version.txt)
if [ ! -f "version.txt" ] || [ ! "$version_local" = "$version_tag" ]
then
	echo "$version_tag ist aktueller als $version_local"
	git reset --hard $version_tag
	wget -O releases.json -q https://api.github.com/repos/Findus23/la-tools/releases 
	name=$(grep -Po -m 1 '"name":.*?[^\\]",' releases.json| cut -c 10- | rev | cut -c 3- | rev)
	body=$(grep -Po -m 1 '"body":.*?[^\\]",' releases.json| cut -c 10- | rev | cut -c 3- | rev)
	echo $version_tag > version.txt
	zenity --info --title "Update erfolgreich" --text "$name\n\nNeuerungen:\n$body"
else
	echo "aktuellste Version installiert"
fi
#andere Sachen updaten
#z.B.: .desktop Datei
