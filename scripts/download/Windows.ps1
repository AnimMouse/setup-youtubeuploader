$ErrorActionPreference = 'Stop'
$ProgressPreference = 'SilentlyContinue'
Set-StrictMode -Version Latest
Write-Host ::group::Downloading youtubeuploader $env:version for Windows
$version = $env:version.Substring(1)
Invoke-WebRequest $env:GITHUB_SERVER_URL/porjo/youtubeuploader/releases/download/v$version/youtubeuploader_${version}_Windows_amd64.zip -OutFile youtubeuploader_${version}_Windows_amd64.zip
Expand-Archive youtubeuploader_${version}_Windows_amd64.zip youtubeuploader
Remove-Item youtubeuploader_${version}_Windows_amd64.zip
Write-Host ::endgroup::