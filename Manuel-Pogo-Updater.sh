#!/bin/bash
echo "Start"
echo "Delete old Files"
##delete
rm *.zip
rm *.apk
rm icon.png
rm .info.json
sleep 2

##Get apkm
echo "Fetch latest apkm"
curl -s -k -A "Mozilla/5.0 (Windows; U; Windows NT 5.1; de; rv:1.9.2.3) Gecko/20100401 Firefox/3.6.3" -L -o ./pogo.apkm "https://www.apkmirror.com/wp-content/themes/APKMirror/download.php?id=$(curl -s -k -A "Mozilla/5.0 (Windows; U; Windows NT 5.1; de; rv:1.9.2.3) Gecko/20100401 Firefox/3.6.3" -L "$(curl -s -k -A "Mozilla/5.0 (Windows; U; Windows NT 5.1; de; rv:1.9.2.3) Gecko/20100401 Firefox/3.6.3" -L 'https://www.apkmirror.com/apk/niantic-inc/pokemon-go/variant-%7B%22arches_slug%22%3A%5B%22armeabi-v7a%22%5D%7D/'|  grep -o -P "(?<=href=\").*android-apk-download"|head -n1|eval 'stdin=$(cat); echo "https://apkmirror.com$stdin"')"|grep data-postid|head -n1|awk -F'"' '{print $14}')"

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
java -jar unapkm.jar ./pogo.apkm pogo.zip
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
