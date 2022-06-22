#!/bin/sh
set -eu
echo ::group::Signing in to youtubeuploader
echo $client_secrets | base64 -d > $GITHUB_WORKSPACE/client_secrets.json
echo $request_token | base64 -d > $GITHUB_WORKSPACE/request.token
echo ::endgroup::