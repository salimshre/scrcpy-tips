@echo off
setlocal EnableExtensions EnableDelayedExpansion

set "SCRIPT_DIR=%~dp0"
for %%I in ("%SCRIPT_DIR%..") do set "ROOT_DIR=%%~fI"
set "CONFIG_FILE=%ROOT_DIR%\config\scrcpy.conf"
set "RUN_MODE=%~1"

call :load_config
call :resolve_scrcpy_dir
call :validate_tools

if /i "%RUN_MODE%"=="usb" goto usb
if /i "%RUN_MODE%"=="wifi" goto wifi
if /i "%RUN_MODE%"=="tcpip" goto tcpip
if /i "%RUN_MODE%"=="devices" goto devices

:menu
cls
echo =========================================
echo   Scrcpy Toolkit for Windows
echo =========================================
echo   Scrcpy directory: %SCRCPY_DIR%
echo   Phone target    : %PHONE_IP%:%ADB_PORT%
echo   Max size        : %MAX_SIZE%
echo   Max FPS         : %MAX_FPS%
echo   Video bitrate   : %VIDEO_BIT_RATE%
echo =========================================
echo [1] Start over USB
echo [2] Start over Wi-Fi
echo [3] Enable ADB over Wi-Fi from USB
echo [4] Show connected devices
echo [5] Exit
echo =========================================
set /p "choice=Choose an option (1-5): "

if "%choice%"=="1" goto usb
if "%choice%"=="2" goto wifi
if "%choice%"=="3" goto tcpip
if "%choice%"=="4" goto devices
if "%choice%"=="5" goto end

echo Invalid choice.
pause
goto menu

:usb
echo.
echo Restarting adb for a clean USB session...
call :adb kill-server
call :adb start-server
call :adb disconnect
call :adb devices
echo Launching scrcpy over USB...
call :scrcpy -d --max-size %MAX_SIZE% --max-fps %MAX_FPS% --video-bit-rate %VIDEO_BIT_RATE%
if defined RUN_MODE goto end
pause
goto menu

:wifi
echo.
echo Restarting adb and connecting to %PHONE_IP%:%ADB_PORT%...
call :adb kill-server
call :adb start-server
call :adb connect %PHONE_IP%:%ADB_PORT%
call :adb devices
echo Launching scrcpy over Wi-Fi...
call :scrcpy -s %PHONE_IP%:%ADB_PORT% --max-size %MAX_SIZE% --max-fps %MAX_FPS% --video-bit-rate %VIDEO_BIT_RATE%
if defined RUN_MODE goto end
pause
goto menu

:tcpip
echo.
echo Your phone should be connected by USB for this step.
call :adb kill-server
call :adb start-server
call :adb devices
call :adb tcpip %ADB_PORT%
echo Trying Wi-Fi connection to %PHONE_IP%:%ADB_PORT%...
call :adb connect %PHONE_IP%:%ADB_PORT%
call :adb devices
if defined RUN_MODE goto end
pause
goto menu

:devices
echo.
call :adb start-server
call :adb devices
if defined RUN_MODE goto end
pause
goto menu

:load_config
if not exist "%CONFIG_FILE%" (
    echo Config file not found: "%CONFIG_FILE%"
    echo Using built-in defaults for this run.
    set "PHONE_IP=192.168.0.100"
    set "ADB_PORT=5555"
    set "MAX_SIZE=1024"
    set "MAX_FPS=60"
    set "VIDEO_BIT_RATE=16M"
    set "SCRCPY_DIR=scrcpy-win64-v3.3.1"
    goto :eof
)

for /f "usebackq tokens=1,* delims==" %%A in ("%CONFIG_FILE%") do (
    set "key=%%~A"
    set "value=%%~B"
    if defined key (
        if not "!key:~0,1!"=="#" (
            set "!key!=!value!"
        )
    )
)

if not defined PHONE_IP set "PHONE_IP=192.168.0.100"
if not defined ADB_PORT set "ADB_PORT=5555"
if not defined MAX_SIZE set "MAX_SIZE=1024"
if not defined MAX_FPS set "MAX_FPS=60"
if not defined VIDEO_BIT_RATE set "VIDEO_BIT_RATE=16M"
if not defined SCRCPY_DIR set "SCRCPY_DIR=scrcpy-win64-v3.3.1"
goto :eof

:resolve_scrcpy_dir
if exist "%ROOT_DIR%\%SCRCPY_DIR%\scrcpy.exe" (
    set "SCRCPY_HOME=%ROOT_DIR%\%SCRCPY_DIR%"
    goto :eof
)

if exist "%ROOT_DIR%\vendor\%SCRCPY_DIR%\scrcpy.exe" (
    set "SCRCPY_HOME=%ROOT_DIR%\vendor\%SCRCPY_DIR%"
    goto :eof
)

echo Could not find scrcpy.exe.
echo Expected one of these folders:
echo   %ROOT_DIR%\%SCRCPY_DIR%
echo   %ROOT_DIR%\vendor\%SCRCPY_DIR%
pause
exit /b 1

:validate_tools
if not exist "%SCRCPY_HOME%\adb.exe" (
    echo adb.exe is missing from "%SCRCPY_HOME%"
    pause
    exit /b 1
)

if not exist "%SCRCPY_HOME%\scrcpy.exe" (
    echo scrcpy.exe is missing from "%SCRCPY_HOME%"
    pause
    exit /b 1
)
goto :eof

:adb
"%SCRCPY_HOME%\adb.exe" %*
goto :eof

:scrcpy
"%SCRCPY_HOME%\scrcpy.exe" %*
goto :eof

:end
endlocal
exit /b 0
