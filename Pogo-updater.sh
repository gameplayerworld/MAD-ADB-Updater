#!/bin/bash
echo "Delete old APK"
rm -f pogo.apk
echo "Download new APK"
curl -L -o pogo.apk -k -s "$(curl -k -s 'https://m.apkpure.com/pokemon-go/com.nianticlabs.pokemongo/download' | grep 'click here'|awk -F'"' '{print $12}')"

FILE=pogo.apk
if test -f "$FILE"; then
echo "$FILE exist"
else
echo "Download failed -- Restart"
bash Pogo-updater.sh
fi
echo "Install APK"

adb kill-server
adb devices

mapfile -t devices < devices.txt

for i in "${devices[@]}"; do
adb connect  $i:5555
adb -s $i:5555 install -r pogo.apk
adb disconnect $i:5555
echo "Device $i done."

done
