$ErrorActionPreference = 'Stop'
$version = (Invoke-RestMethod $env:GITHUB_API_URL/repos/porjo/youtubeuploader/releases/latest).tag_name
Write-Host ::group::Downloading youtubeuploader $version for Windows
aria2c -x 16 $env:GITHUB_SERVER_URL/porjo/youtubeuploader/releases/download/$version/youtubeuploader_${version}_Windows_x86_64.zip
7z e youtubeuploader_${version}_Windows_x86_64.zip youtubeuploader.exe -oyoutubeuploader -r
Remove-Item youtubeuploader_${version}_Windows_x86_64.zip
Write-Host ::endgroup::