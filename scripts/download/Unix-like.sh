#!/bin/bash
set -eu
echo ::group::Downloading youtubeuploader $version for $RUNNER_OS
if [ $RUNNER_OS = macOS ]; then os=Darwin; else os=Linux; fi
mkdir -p youtubeuploader
wget -qO- $GITHUB_SERVER_URL/porjo/youtubeuploader/releases/download/$version/youtubeuploader_${version/v}_${os}_amd64.tar.gz | tar -xz -C youtubeuploader youtubeuploader
echo ::endgroup::