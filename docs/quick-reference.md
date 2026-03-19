# Scrcpy Quick Reference

This file replaces the rough note-style command lists in the older files.

## Basic Usage

### Fullscreen

```bat
scrcpy -f
```

### Lower resolution for better speed

```bat
scrcpy --max-size 1024
```

### Higher quality example

```bat
scrcpy --max-size 1024 --max-fps 60 --video-bit-rate 16M
```

## Wireless Setup

Connect by USB first, then run:

```bat
adb tcpip 5555
adb connect 192.168.0.100:5555
scrcpy
```

Example:

```bat
adb tcpip 5555
adb connect 192.168.0.100:5555
scrcpy --max-size 1024
```

## Troubleshooting

### List devices

```bat
adb devices
```

### Reset the ADB server

```bat
adb usb
adb kill-server
adb start-server
```

### Reboot commands

```bat
adb reboot recovery
adb reboot download
adb reboot --poweroff
```

## Notes

- USB is usually the most stable option.
- Lowering resolution helps reduce lag.
- Wi-Fi mode works best when both devices are on the same local network.
- `adb.exe` is bundled with the official Windows `scrcpy` release.
