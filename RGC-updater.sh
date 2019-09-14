#!/bin/bash
echo "Delete old APK"
rm -f RemoteGpsController.apk
echo "Download new APK"
curl -o RemoteGpsController.apk -k -s https://raw.githubusercontent.com/Map-A-Droid/MAD/master/APK/RemoteGpsController.apk

FILE=RemoteGpsController.apk
if test -f "$FILE"; then
echo "$FILE exist"
else
echo "Download failed -- Restart"
bash RGC-updater.sh
fi
echo "Install APK"

adb kill-server
adb devices

mapfile -t devices < devices.txt

for i in "${devices[@]}"; do
adb connect  $i:5555
adb -s $i:5555 install -r RemoteGpsController.apk
adb disconnect $i:5555
echo "Device $i done."

done
