# Setup YouTube Uploader for GitHub Actions
Setup [YouTube Uploader](https://github.com/porjo/youtubeuploader) on GitHub Actions to use `youtubeuploader`.

This action installs [porjo/youtubeuploader](https://github.com/porjo/youtubeuploader) for use in actions by installing it on tool cache using [AnimMouse/tool-cache](https://github.com/AnimMouse/tool-cache).

This action is implemented as a [composite](https://docs.github.com/en/actions/creating-actions/creating-a-composite-action) action.

## Usage
To use `youtubeuploader`, run this action before `youtubeuploader`.

1. Encode the client_secrets.json file in Base64 using this command `base64 -w 0 client_secrets.json` and paste it to `CLIENT_SECRETS` secret.
2. Encode the request.token file in Base64 using this command `base64 -w 0 request.token` and paste it to `REQUEST_TOKEN` secret.

The credentials will be placed on `$RUNNER_TEMP` so you need to add `-secrets $RUNNER_TEMP/client_secrets.json -cache $RUNNER_TEMP/request.token` in every `youtubeuploader` command.

```yaml
steps:
  - name: Setup YouTube Uploader
    uses: AnimMouse/setup-youtubeuploader@v1
    with:
      client_secrets: ${{ secrets.CLIENT_SECRETS }}
      request_token: ${{ secrets.REQUEST_TOKEN }}
      
  - run: youtubeuploader -secrets $RUNNER_TEMP/client_secrets.json -cache $RUNNER_TEMP/request.token -filename video.mkv
```

### Process substitution
You can also use process substitution for passing credentials so that the credentials will not be placed in `$RUNNER_TEMP`. Only applies on Ubuntu and macOS.

```yaml
steps:
  - name: Setup YouTube Uploader
    uses: AnimMouse/setup-youtubeuploader@v1
    
  - run: youtubeuploader -secrets <(echo "$client_secrets" | base64 -d) -cache <(echo "$request_token" | base64 -d) -filename video.mkv
    env:
      client_secrets: ${{ secrets.CLIENT_SECRETS }}
      request_token: ${{ secrets.REQUEST_TOKEN }}
```

### Specific version
You can specify the version you want. By default, this action downloads the latest version.

```yaml
steps:
  - name: Setup YouTube Uploader
    uses: AnimMouse/setup-youtubeuploader@v1
    with:
      client_secrets: ${{ secrets.CLIENT_SECRETS }}
      request_token: ${{ secrets.REQUEST_TOKEN }}
      version: 22.04
```

### GitHub token
This action automatically uses a GitHub token in order to authenticate with GitHub API and avoid rate limiting. You can also specify your own read-only fine-grained personal access token.

```yaml
steps:
  - name: Setup YouTube Uploader
    uses: AnimMouse/setup-youtubeuploader@v1
    with:
      client_secrets: ${{ secrets.CLIENT_SECRETS }}
      request_token: ${{ secrets.REQUEST_TOKEN }}
      token: ${{ secrets.GH_PAT }}
```