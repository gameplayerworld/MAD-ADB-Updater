# MAD-ADB-Updater
Download
git clone https://github.com/gameplayerworld/MAD-ADB-Updater.git

devices.txt
The IP addresses of the devices must be entered in this file.

mv devices.txt.example devices.txt
nano devices.txt

In order not to always have to update the file, you should assign a fixed address to the devices.

ADB must be switched on on the device.

Pogo-updater is currently unusable (Niantic has changed the way they sell Android APKs)

Manuel-Pogo-updater - For this, the current Pogo.apkm file must be downloaded and pushed into the MAD-ADB-Updater order.
Run: bash Manuel-Pogo-updater.sh Pogo-1.7.5.apkm

Pogodroid-updater - Here the current PogoDroid file is downloaded and installed on all devices that are stored in the file devices.txt.
Run: bash Pogodroid-updater.sh

RGC-updater - Here the current RGC file is downloaded and installed on all devices that are stored in the file devices.txt.
Run: bash RGC updater
