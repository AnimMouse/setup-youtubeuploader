$ErrorActionPreference = 'Stop'
Set-StrictMode -Version Latest
Write-Host ::group::Signing in to youtubeuploader
$client_secrets = [Convert]::FromBase64String($env:client_secrets)
$request_token = [Convert]::FromBase64String($env:request_token)
[IO.File]::WriteAllBytes("$env:RUNNER_TEMP\client_secrets.json", $client_secrets)
[IO.File]::WriteAllBytes("$env:RUNNER_TEMP\request.token", $request_token)
Write-Host ::endgroup::