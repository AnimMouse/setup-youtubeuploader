$ErrorActionPreference = 'Stop'
Set-StrictMode -Version Latest
Write-Host ::group::Downloading youtubeuploader $env:version for Windows
aria2c -x 16 -q $env:GITHUB_SERVER_URL/porjo/youtubeuploader/releases/download/$env:version/youtubeuploader_${env:version}_Windows_x86_64.zip
7z e youtubeuploader_${env:version}_Windows_x86_64.zip youtubeuploader.exe -oyoutubeuploader -r
Remove-Item youtubeuploader_${env:version}_Windows_x86_64.zip
Write-Host ::endgroup::