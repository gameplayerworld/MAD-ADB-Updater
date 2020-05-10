#!/bin/bash
echo "Start"
if [ -z "$1" ]; then
    echo "Commandline options are missing! Usage: ./Pogo-updater.sh pogo.apkm"
    exit 1
    fi

echo "Delete old Files"
##delete
rms *.zip
rm *.apk
rm icon.png
rm pogo.zip
rm .info.json
sleep 2

##Unapkm exist
echo "unapkm File check"
FILE=unapkm.jar
if test -f "$FILE"; then
echo "$FILE exist"
else
echo "unapkm not found"
wget https://github.com/souramoo/unapkm/releases/download/v1.2/unapkm.jar
fi
echo "Install APK"

#unzip
echo "unzip"
java -jar unapkm.jar $1 pogo.zip
unzip pogo.zip

##Install
echo "Install APK"

adb kill-server
adb devices

mapfile -t devices < devices.txt

for i in "${devices[@]}"; do
adb connect  $i:5555
echo "APK Install on $i"
adb -s $i:5555 install-multiple -r base.apk split_config.xxxhdpi.apk split_config.armeabi_v7a.apk
adb -s $i:5555 reboot
adb disconnect $i:5555
echo "Device $i done."
done
