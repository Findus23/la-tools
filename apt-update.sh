#!/bin/bash
TEXTDOMAIN=la-tools
TEXTDOMAINDIR=./

#http://stackoverflow.com/a/12199798
convertsecs() {
 ((h=${1}/3600))
 ((m=(${1}%3600)/60))
 ((s=${1}%60))
 printf "%02d:%02d:%02d\n" $h $m $s
}

last=$(stat -c %Y /var/cache/apt/)
date=$(date +%s)
diff=$(($date-$last))
wort=$(convertsecs $diff)
if [[ $diff > 43200 ]]
then
	echo $"package sources outdated"
	echo $"$wort -- $diff seconds"
	zenity --info --title $"package sources outdated" --text $"The last update was $wort ago. The package sources will get updated now"
	sudo apt-get update -y
fi
