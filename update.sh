#!/bin/bash
down_link=$(grep -Po -m 1 '"tarball_url":.*?[^\\]",' releases.json| cut -c 17- | rev | cut -c 3- | rev)
wget -O /tmp/la-tools.tar.gz $down_link
echo "tar -xzf /tmp/la-tools.tar.gz -C ~/la-tools/
mv ~/a-tools
echo 'Erfolgreich entpackt'
#andere Sachen updaten
#z.B.: .desktop Datei" > temp.sh
chmod +x temp.sh
./temp.sh &
