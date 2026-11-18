# Black Hole Break

**一款极轻量化的桌面番茄钟。计时结束后，屏幕会出现震撼的黑洞特效。黑洞卷曲吞噬一切。**

Black Hole Break is a lightweight Windows desktop Pomodoro and timer, tailored for Windows 11. It stays small, runs efficiently, and keeps a clean runtime: one portable executable, no installer, and no junk left beside the program.

When a Pomodoro work interval ends and the next interval is a break, the desktop can curl into a black hole and swallow the screen. The effect is a short, full-screen GPU overlay. You can turn it on, and you can preview it before you rely on it.

## Download

Download **BlackHoleBreak.exe** from this repository's Release:

[https://github.com/MoyuanXiao/Black-Hole-Break/releases/latest](https://github.com/MoyuanXiao/Black-Hole-Break/releases/latest)

The current Release is a GPU/D3D11 build of about 3.4 MB (3,485,027 bytes). Run the executable directly. It does not need an installer.

That published build was produced on 2026-11-06, before this source tree was rebranded. Some text inside that executable may still say Catime, and that build still keeps its files under `%LOCALAPPDATA%\Catime`. A later rebuild from this source will present Black Hole Break and use `%LOCALAPPDATA%\BlackHoleBreak`.

## The black hole

Right-click the tray icon, open **预设管理 / Preset Management**, then **通知设置 / Notification Settings**.

- Turn on **番茄工作结束后显示黑洞特效 / Black-hole effect after Pomodoro work**.
- Click **预览黑洞特效 / Preview black hole** to run the effect immediately.

The preview lasts about 30 seconds and does not change the timer. Press Esc to dismiss it. The preview does not play the completion notification.

During a Pomodoro, the same overlay starts when a work interval finishes and the next interval is a break. It captures the desktop and runs for about 30 seconds: the screen curls, and the black hole swallows what was on it. When the animation finishes, the usual completion notification follows. If the GPU overlay cannot start, the timer shows that notification directly instead. The effect needs a D3D11-capable GPU.

The setting is stored as `NOTIFICATION_BLACK_HOLE_ENABLED` in `config.ini`. It is off until you enable it.

## A clean runtime

Black Hole Break is portable. A normal download does not install a service, does not drop files next to the executable, and does not leave an installer cache behind.

The program keeps its own files in one folder:

`%LOCALAPPDATA%\BlackHoleBreak\`

- `config.ini` is created on first launch and holds your settings.
- `resources\fonts`, `resources\audio`, `resources\animations`, and `resources\plugins` are created so fonts, sounds, tray animations, and plugins have a single home. On first launch the embedded fonts are extracted into `resources\fonts`.
- `BlackHoleBreak_Logs.log` is written in that same folder when the program records a warning or an error. Rotated logs stay there too.
- Saving settings uses a temporary file in that folder, replaces `config.ini`, and deletes the temporary file.

A portable `BlackHoleBreak.exe` does not create a desktop shortcut. `BlackHoleBreak.lnk` appears in the Startup folder only if you turn on **Start with Windows**. Package-manager installs may also add a shortcut in the Start Menu.

Remote images referenced by Markdown or plugin content are cached under `%TEMP%\BlackHoleBreak\images`. An ordinary timer session does not use that cache.

Delete `%LOCALAPPDATA%\BlackHoleBreak` to remove the program's files. The 2026-11-06 Release still uses `%LOCALAPPDATA%\Catime` for the same files (`config.ini`, `resources`, and `Catime_Logs.log`).

## Build

The published Release is the binary above. Build from source when you want a binary that matches this rebrand.

Requirements: CMake, a MinGW GCC toolchain, and Node.js (language-resource checks run by default).

Windows:

```bat
build.bat
```

The executable is `build\BlackHoleBreak.exe`.

Linux, cross-compiling with MinGW-w64:

```bash
sudo apt update && sudo apt install -y mingw-w64 cmake
chmod +x build.sh && ./build.sh
```

## Visual effects

The black hole is the first full-screen effect. Other visual effects for the Pomodoro and timer are welcome. Open an issue or a pull request with the idea and the effect.

## Attribution

Black Hole Break is a derivative of [Catime](https://github.com/vladelaina/Catime) by vladelaina, licensed under the Apache License 2.0. See [NOTICE](NOTICE), [LICENSE](LICENSE), and [THIRD_PARTY_NOTICES.md](THIRD_PARTY_NOTICES.md).

Copyright © 2025-2026 vladelaina. Modifications for the black-hole overlay and this rebrand © 2026 MoyuanXiao.

The black-hole shader adapts work from [blackhole-timer](https://github.com/cabbagehao/blackhole-timer) and [ghostty-blackhole](https://github.com/s0xDk/ghostty-blackhole), under the MIT license, with credit to Eric Bruneton's Black Hole Shader. Font licenses are noted in `asset/font/MIT/LICENSE` and `asset/font/SIL/SIL Open Font License.txt`, and the OFL fonts under `asset/font/OFL/` keep their SIL Open Font License terms.

The application icon still embedded in this source, and in the current executable, is the upstream icon by 猫屋敷梨梨Official. That artwork is not Black Hole Break's logo, and it may not be used commercially without authorization from the artist. A replacement icon is pending.
