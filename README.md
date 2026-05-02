## Windows Recall Cleaner
## Disable Windows Recall and delete all local snapshots via command line.

## Commands
Check if Recall is enabled

powershell
```
Get-WindowsOptionalFeature -Online -FeatureName Recall
```

Disable Recall
cmd
```
Dism /Online /Disable-Feature /Featurename:Recall
```

## Delete all snapshots (PowerShell as Admin)
powershell
```
Remove-Item -Path "$env:LOCALAPPDATA\CoreAIPlatform.00\UKP\*" -Recurse -Force -ErrorAction SilentlyContinue
Remove-Item -Path "$env:LOCALAPPDATA\CoreAIPlatform.00\ImageStore\*" -Recurse -Force -ErrorAction SilentlyContinue
```

## Requirements
Windows 11 24H2 or later
Run as Administrator

## Notes
- Snapshots are stored locally only
- Deletion is permanent
- Reboot recommended after cleanup
- Just copy-paste and run.
