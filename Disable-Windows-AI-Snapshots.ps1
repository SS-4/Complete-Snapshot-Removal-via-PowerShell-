# 1. Disable the AI data analysis (prevents new snapshots)
$RegPath = "HKLM:\SOFTWARE\Policies\Microsoft\Windows\WindowsAI"
If (-not (Test-Path $RegPath)) { New-Item -Path $RegPath -Force }
Set-ItemProperty -Path $RegPath -Name "DisableAIDataAnalysis" -Value 1 -Type DWord

# 2. Remove the optional Recall feature
Disable-WindowsOptionalFeature -Online -FeatureName "Recall" -NoRestart

# 3. Delete the local snapshot database and images
Stop-Process -Name explorer -Force -ErrorAction SilentlyContinue
Remove-Item -Path "$env:LOCALAPPDATA\CoreAIPlatform.00\UKP\*" -Recurse -Force -ErrorAction SilentlyContinue
Remove-Item -Path "$env:LOCALAPPDATA\CoreAIPlatform.00\ImageStore\*" -Recurse -Force -ErrorAction SilentlyContinue
Start-Process explorer
