# Scrcpy Toolkit for Windows

This repository is a small Windows toolkit for launching [`scrcpy`](https://github.com/Genymobile/scrcpy) with easier USB and Wi-Fi workflows.

The preferred entry point is `launch-scrcpy.bat`, which calls the main launcher in `scripts/scrcpy-launcher.bat`.

## What This Project Does

- Starts `scrcpy` over USB
- Starts `scrcpy` over Wi-Fi
- Enables ADB TCP/IP mode for wireless use
- Keeps common setup commands in one place

## Quick Start

1. Enable USB debugging on your phone.
2. Put the official Windows `scrcpy` release in either `scrcpy-win64-v3.3.1` or `vendor/scrcpy-win64-v3.3.1`.
3. Update `config/scrcpy.conf` with your phone IP if needed.
4. Run `launch-scrcpy.bat`.

## Repository Layout

- `launch-scrcpy.bat`: simple root entry point
- `scripts/scrcpy-launcher.bat`: configurable launcher with menu options
- `config/scrcpy.conf`: local defaults for IP, port, and video settings
- `config/scrcpy.conf.example`: reference config
- `docs/quick-reference.md`: cleaned-up command notes

Older root-level scripts and notes are still present as legacy files for compatibility with your existing setup.

## Configuration

The config file uses plain `KEY=VALUE` lines:

```ini
PHONE_IP=192.168.0.100
ADB_PORT=5555
MAX_SIZE=1024
MAX_FPS=60
VIDEO_BIT_RATE=16M
SCRCPY_DIR=scrcpy-win64-v3.3.1
```

## Useful Links

- [Scrcpy releases](https://github.com/Genymobile/scrcpy/releases)
- [Official Windows documentation](https://github.com/Genymobile/scrcpy/blob/master/doc/windows.md)

## Next Improvements

- Convert the launcher to PowerShell for better prompts and validation
- Add multiple saved phone profiles
- Add connection troubleshooting output and logs
