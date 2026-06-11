# install the latest version of Java (JRE) using WinGet

# Resolve path of winget.exe
$WinGetResolve = Resolve-Path "C:\Program Files\WindowsApps\Microsoft.DesktopAppInstaller_*_x64__8wekyb3d8bbwe\winget.exe"
$WinGetPathExe = $WinGetResolve[-1].path

# Set location for running winget.exe in system context
$WinGetPath = Split-Path -Path $WinGetPathExe -Parent
Set-Location $WinGetPath

# Run winget to install Java
.\winget.exe install --id Oracle.JavaRuntimeEnvironment --silent --accept-package-agreements --accept-source-agreements
