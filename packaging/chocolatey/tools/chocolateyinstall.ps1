$ErrorActionPreference = 'Stop'

$toolsDir = Split-Path -Parent $MyInvocation.MyCommand.Definition
$exePath = Join-Path $toolsDir 'BlackHoleBreak.exe'
$url = 'https://github.com/MoyuanXiao/Black-Hole-Break/releases/download/v1.6.2/BlackHoleBreak.exe'
$checksum = '3de804deb0dfa1fbfb11b9b71d1bb0610ce80e57f90e7d20611210def00fff2a'

$runningProcesses = Get-Process -Name 'BlackHoleBreak' -ErrorAction SilentlyContinue
if ($runningProcesses) {
    $runningProcesses | Stop-Process -Force
}

Get-ChocolateyWebFile `
    -PackageName $env:ChocolateyPackageName `
    -FileFullPath $exePath `
    -Url $url `
    -Checksum $checksum `
    -ChecksumType 'sha256'

$programs = [Environment]::GetFolderPath('Programs')
$shortcutPath = Join-Path $programs 'BlackHoleBreak.lnk'
Install-ChocolateyShortcut -ShortcutFilePath $shortcutPath -TargetPath $exePath
