@echo off
cd /d C:\Users\hp\Documents\GitHub\scrcpy-tips\scrcpy-win64-v3.3.1

:: Kill adb and restart fresh
adb kill-server
adb start-server

:: Disconnect any Wi-Fi devices to avoid conflicts
adb disconnect

:: Show connected devices (should only show USB)
adb devices

:: Start scrcpy forcing USB mode
scrcpy -d --max-size 1024
