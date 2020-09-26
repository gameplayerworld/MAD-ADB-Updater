#!/bin/bash

if [ -z "$1" ] && [ -z "$2" ]; then
    echo "Commandline options are missing! Usage: ./Pogo-Updater.sh user:pass localhost:9000"
    exit 1
	
fi	
echo "Start"
echo "Delete old Files"
##delete
rm *.zip
rm *.apk
rm icon.png
rm .info.json
sleep 2

##Get PoGo from Madmin
echo "Fetch latest apk"
curl -o pogo.zip -u $1 http://$2/mad_apk/pogo/arm64_v8a/download 

unzip pogo.zip && rm pogo.zip

##Install
echo "Install APK"

adb kill-server
adb devices

mapfile -t devices < devices.txt

for i in "${devices[@]}"; do
adb connect  $i:5555
echo "APK Install on $i"
adb -s $i:5555 install-multiple -r base.apk config.arm64_v8a.apk
adb -s $i:5555 reboot
adb disconnect $i:5555
echo "Device $i done."
done
