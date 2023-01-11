#!/bin/sh
set -eu
echo ::group::Downloading youtubeuploader $version for $RUNNER_OS
if [ $RUNNER_OS = macOS ]; then os=Darwin; else os=Linux; fi
aria2c -x 16 -q $GITHUB_SERVER_URL/porjo/youtubeuploader/releases/download/$version/youtubeuploader_${version}_${os}_x86_64.tar.gz
mkdir youtubeuploader
tar -xf youtubeuploader_${version}_${os}_x86_64.tar.gz -C youtubeuploader youtubeuploader
rm youtubeuploader_${version}_${os}_x86_64.tar.gz
echo ::endgroup::