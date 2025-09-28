@echo off
cd /d C:\Users\ACER-WIN10\Downloads\scrcpy-win64-v3.3.1

echo =========================================
echo   SCRCPY Launcher - Choose Connection
echo =========================================
echo [1] Wi-Fi
echo [2] USB
echo =========================================
set /p choice=Enter your choice (1 or 2): 

if "%choice%"=="1" goto WIFI
if "%choice%"=="2" goto USB

echo Invalid choice. Exiting...
goto END

:WIFI
echo.
echo Starting SCRCPY over Wi-Fi...
adb kill-server
adb start-server
adb connect 192.168.0.100:5555
adb devices
scrcpy -s 192.168.0.100:5555 --max-size 1024
goto END

:USB
echo.
echo Starting SCRCPY over USB...
adb kill-server
adb start-server
adb disconnect
adb devices
scrcpy -d --max-size 1024
goto END

:END
pause
