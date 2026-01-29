# Safe demo payload (no malware)
$ts = Get-Date -Format "yyyy-MM-dd HH:mm:ss"
Write-Output "[DEMO] EncodedCommand test - $ts"
Get-Process | Select-Object -First 5 Name,Id
