#!/bin/sh
set -eu
echo ::group::Signing in to youtubeuploader
echo $client_secrets | base64 -d > $RUNNER_TEMP/client_secrets.json
echo $request_token | base64 -d > $RUNNER_TEMP/request.token
echo ::endgroup::