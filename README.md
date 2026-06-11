# Intune App Deployments

PowerShell and IntuneWin deployment packages for Microsoft Intune, covering install, uninstall, 
and detection scripts for commonly requested applications.

## Background

These deployments were created to make frequently requested applications available to end users 
through Company Portal, allowing them to self-serve installs without needing IT approval or a 
BeyondTrust Privilege Management response code. Users can complete installations on their own 
without elevated privileges or IT intervention.

## Packaging

Apps are packaged using the [Microsoft Win32 Content Prep Tool](https://github.com/microsoft/Microsoft-Win32-Content-Prep-Tool) 
(IntuneWinAppUtil). Source files vary by app and may include:

- `winget` commands wrapped in PowerShell
- MSI installers
- EXE installers

> `.intunewin` files are not included in this repo - only the source scripts used to generate them.

## Structure

Each app has its own folder containing the relevant scripts:
## Scripts

| Script | Purpose |
|---|---|
| `install.ps1` | Installs the application silently |
| `uninstall.ps1` | Silently removes the application |
| `detect.ps1` | Detection rule to confirm successful installation |

## Notes

- Scripts sanitized for public sharing. Originally written for use in a managed enterprise environment.
- `.intunewin` packaged files are not included - scripts are the source used to build them
- Detection scripts are included per app where a custom detection rule was needed
