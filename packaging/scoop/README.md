# Scoop manifest

`packaging/scoop/catime.json` is the Scoop manifest for Black Hole Break. It installs `BlackHoleBreak.exe` from this repository's Release and creates a Start Menu shortcut named Black Hole Break.

```powershell
scoop install .\packaging\scoop\catime.json
```

Settings stay in `%LOCALAPPDATA%\BlackHoleBreak`. Uninstalling the package does not delete that folder.
