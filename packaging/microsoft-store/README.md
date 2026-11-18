# Microsoft Store packaging

Black Hole Break is not published on the Microsoft Store from this repository.

`AppxManifest.xml.in` is a packaging template. Its display name is Black Hole Break and its executable is `BlackHoleBreak.exe`. The publisher certificate subject is still the value inherited from the upstream template. Do not treat that certificate, or the upstream Store listing, as this product's Store identity.

The logo step in `build-store-package.ps1` still reads `Images/catime.png`. That file is the upstream icon by 猫屋敷梨梨Official. It is not Black Hole Break's logo. A replacement icon is pending.

Ordinary exe, WinGet, and Scoop runs keep data in `%LOCALAPPDATA%\BlackHoleBreak`. An MSIX build uses the package-private LocalAppData root, then the same `BlackHoleBreak` folder under it.
