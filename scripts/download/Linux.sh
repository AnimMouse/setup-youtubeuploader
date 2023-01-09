#!/bin/sh
set -eu
version=$(curl -sL https://github.com/porjo/youtubeuploader/releases/latest/ | grep "<title>Release" | awk -F " " '{print $2}')
echo ::group::Downloading youtubeuploader $version for Linux
aria2c -x 16 $GITHUB_SERVER_URL/porjo/youtubeuploader/releases/download/$version/youtubeuploader_${version}_Linux_x86_64.tar.gz
mkdir youtubeuploader
tar -xf youtubeuploader_${version}_Linux_x86_64.tar.gz -C ./youtubeuploader youtubeuploader
rm youtubeuploader_${version}_Linux_x86_64.tar.gz
echo ::endgroup::
