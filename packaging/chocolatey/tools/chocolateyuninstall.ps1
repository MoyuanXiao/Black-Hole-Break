$ErrorActionPreference = 'Stop'

$runningProcesses = Get-Process -Name 'BlackHoleBreak' -ErrorAction SilentlyContinue
if ($runningProcesses) {
    $runningProcesses | Stop-Process -Force
}

$programs = [Environment]::GetFolderPath('Programs')
$shortcutPath = Join-Path $programs 'BlackHoleBreak.lnk'
if (Test-Path $shortcutPath) {
    Remove-Item $shortcutPath -Force
}

# User configuration under %LOCALAPPDATA%\BlackHoleBreak is intentionally preserved.
