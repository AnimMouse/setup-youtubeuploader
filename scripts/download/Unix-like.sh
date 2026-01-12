#!/bin/bash
set -eu
echo ::group::Downloading youtubeuploader $version for $RUNNER_OS $RUNNER_ARCH
if [ $RUNNER_OS = macOS ]; then os=Darwin; else os=Linux; fi
if [ $RUNNER_ARCH = ARM64 ]; then arch=arm64; else arch=amd64; fi
mkdir -p youtubeuploader
wget -qO- $GITHUB_SERVER_URL/porjo/youtubeuploader/releases/download/$version/youtubeuploader_${version/v}_${os}_${arch}.tar.gz | tar -xz -C youtubeuploader youtubeuploader
echo ::endgroup::