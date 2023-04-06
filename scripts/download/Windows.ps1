$ErrorActionPreference = 'Stop'
$ProgressPreference = 'SilentlyContinue'
Set-StrictMode -Version Latest
Write-Host ::group::Downloading youtubeuploader $env:version for Windows
Invoke-WebRequest $env:GITHUB_SERVER_URL/porjo/youtubeuploader/releases/download/$env:version/youtubeuploader_${env:version}_Windows_x86_64.zip -OutFile youtubeuploader_${env:version}_Windows_x86_64.zip
Expand-Archive youtubeuploader_${env:version}_Windows_x86_64.zip youtubeuploader
Remove-Item youtubeuploader_${env:version}_Windows_x86_64.zip
Write-Host ::endgroup::