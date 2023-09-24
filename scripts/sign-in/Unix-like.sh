#!/bin/sh
set -eu
echo ::group::Signing in to youtubeuploader
mkdir -p ~/.config/youtubeuploader
echo "$client_secrets" | base64 -d > ~/.config/youtubeuploader/client_secrets.json
echo "$request_token" | base64 -d > ~/.config/youtubeuploader/request.token
echo ::endgroup::