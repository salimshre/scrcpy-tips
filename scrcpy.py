#working
Download Scrcpy for Windows**
https://github.com/Genymobile/scrcpy/releases](https://github.com/Genymobile/scrcpy/releases
## **Extra Commands (Optional)**

* **Fullscreen mode:**
  scrcpy -f

* **Set resolution (lower for speed):**

  ```
  scrcpy --max-size 1024
  ```
* **Wireless mode (after initial USB connection):**

  ```
  adb tcpip 5555
  adb connect PHONE_IP:5555
  scrcpy



adb devices


Run this to revoke previous authorizations:
adb usb
adb kill-server
adb start-server

https://github.com/Genymobile/scrcpy/blob/master/doc/windows.md


adb tcpip 5555
adb connect 192.168.0.100:5555
scrcpy --max-size 1024

scrcpy --max-size 1024 --max-fps 60 --video-bit-rate 16M

scrcpy --max-size 1024 -f  
