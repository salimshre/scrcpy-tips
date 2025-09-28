@echo off
cd /d C:\Users\ACER-WIN10\Documents\GitHub\scrcpy-tips\scrcpy-win64-v3.3.1

:: Restart adb server
adb kill-server
adb start-server

:: Connect to phone over Wi-Fi
adb connect 192.168.0.100:5555

:: Show connected devices
adb devices

:: Launch scrcpy with Wi-Fi device
scrcpy -s 192.168.0.100:5555 --max-size 1024
