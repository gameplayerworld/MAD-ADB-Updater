# MAD-ADB-Updater
#### Download
git clone https://github.com/gameplayerworld/MAD-ADB-Updater.git

#### devices.txt
The IP addresses of the devices must be entered in this file.

mv devices.txt.example devices.txt

nano devices.txt

In order not to always have to update the file, you should assign a fixed address to the devices.

ADB must be switched on on the device.

#### Pogo-updater 
- For this, the current Pogo.apkm file is downloaded from APK Mirror and install on all devices that are storied in the file devices.txt.
__Run: bash Manuel-Pogo-updater.sh__

#### Pogodroid-updater 
- Here the current PogoDroid file is downloaded and installed on all devices that are stored in the file devices.txt.
__Run: bash Pogodroid-updater.sh__

#### RGC-updater
- Here the current RGC file is downloaded and installed on all devices that are stored in the file devices.txt.
__Run: bash RGC updater__
