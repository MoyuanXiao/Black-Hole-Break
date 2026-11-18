# Privacy

Black Hole Break is a local Windows desktop timer. It does not include an account, ads, or a usage-analytics service.

## What stays on this computer

Settings, logs, and optional resources live in one folder:

`%LOCALAPPDATA%\BlackHoleBreak\`

The 2026-11-06 Release predates the source rebrand, so that executable still uses `%LOCALAPPDATA%\Catime\` for the same files.

1. **Settings.** `config.ini` stores timer, display, notification, and Pomodoro preferences.
2. **Logs.** `BlackHoleBreak_Logs.log` (or `Catime_Logs.log` in the 2026-11-06 build) can record the OS version, CPU architecture, memory, startup, and warnings or errors. Logs are local. They are not uploaded.
3. **Resources.** `resources\fonts`, `resources\audio`, `resources\animations`, and `resources\plugins` hold fonts, sounds, tray animations, and plugin files you use. Embedded fonts are extracted there on first launch.
4. **Plugins.** A plugin may write `resources\plugins\output.txt`. Plugin data stays local unless the plugin or Markdown content references an `http://` or `https://` image. That image may be downloaded into `%TEMP%\BlackHoleBreak\images` so it can be shown.

An MSIX build, if you package one, uses the package-private LocalAppData location Windows gives that package, then the same `BlackHoleBreak` folder underneath it.

## Network

The program contacts the network only for these cases:

- **Update check.** On startup, and when you check manually, it requests `https://api.github.com/repos/MoyuanXiao/Black-Hole-Break/releases/latest`. The user agent is `Black Hole Break Update Checker`. The request does not include an account or a personal profile.
- **Remote images.** If plugin or Markdown content references an image URL, the program may download that URL into the temp cache above.

## Removing local data

Delete `%LOCALAPPDATA%\BlackHoleBreak` (or `%LOCALAPPDATA%\Catime` for the 2026-11-06 build). Also remove `BlackHoleBreak.lnk` from the Startup folder if you enabled start with Windows, and `%TEMP%\BlackHoleBreak` if a remote image was cached.

## Questions

Open an issue on https://github.com/MoyuanXiao/Black-Hole-Break/issues.
