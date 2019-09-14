#!/bin/bash
echo "Delete old APK"
rm -f pogodroid.apk
echo "Download new APK"
curl -o pogodroid.apk -k -s https://www.maddev.de/apk/PogoDroid.apk

FILE=pogodroid.apk
if test -f "$FILE"; then
echo "$FILE exist"
else
echo "Download failed -- Restart"
bash Droid-updater.sh
fi
echo "Install APK"

adb kill-server
adb devices

mapfile -t devices < devices.txt

for i in "${devices[@]}"; do
adb connect  $i:5555
adb -s $i:5555 install -r pogodroid.apk
adb disconnect $i:5555
echo "Device $i done."

done
