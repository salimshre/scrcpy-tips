# Scrcpy Windows Quick Reference

A quick reference guide for setting up and using [Scrcpy](https://github.com/Genymobile/scrcpy) on **Windows**, including installation, fullscreen mode, resolution settings, and wireless connection commands.

---

## 📥 Download Scrcpy
Get the latest release for Windows here:  
[https://github.com/Genymobile/scrcpy/releases](https://github.com/Genymobile/scrcpy/releases)

Official Windows documentation:  
[https://github.com/Genymobile/scrcpy/blob/master/doc/windows.md](https://github.com/Genymobile/scrcpy/blob/master/doc/windows.md)

---

## ⚡ Basic Commands

### **Fullscreen mode**
```bash
scrcpy -f




Set resolution (lower for speed)
bash
Copy
Edit
scrcpy --max-size 1024
📡 Wireless Mode (after initial USB connection)
bash
Copy
Edit
adb tcpip 5555
adb connect PHONE_IP:5555
scrcpy
Example:

bash
Copy
Edit
adb tcpip 5555
adb connect 192.168.0.100:5555
scrcpy --max-size 1024
🔧 Extra Useful Commands
Limit resolution, set FPS, and adjust bitrate:

bash
Copy
Edit
scrcpy --max-size 1024 --max-fps 60 --video-bit-rate 16M
Fullscreen + resolution limit:

bash
Copy
Edit
scrcpy --max-size 1024 -f
List connected devices:

bash
Copy
Edit
adb devices
Revoke previous authorizations:

bash
Copy
Edit
adb usb
adb kill-server
adb start-server
📌 Notes
Wireless mode only works when both your PC and phone are on the same network.

Lowering resolution improves speed and reduces latency.

You must have ADB installed (included with Scrcpy).
