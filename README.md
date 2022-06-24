# Setup YouTube Uploader for GitHub Actions
Setup [YouTube Uploader](https://github.com/porjo/youtubeuploader) on GitHub Actions to use `youtubeuploader`.

This action installs [porjo/youtubeuploader](https://github.com/porjo/youtubeuploader) for use in actions by installing it on tool cache using [AnimMouse/tool-cache](https://github.com/AnimMouse/tool-cache).

This action is implemented as a [composite](https://docs.github.com/en/actions/creating-actions/creating-a-composite-action) action.

This action only supports Ubuntu virtual environments yet.

## Usage
To use `youtubeuploader`, run this action before `youtubeuploader`.

1. Encode the client_secrets.json file in Base64 using this command `base64 -w 0 client_secrets.json` and paste it to `CLIENT_SECRETS` secret.
2. Encode the request.token file in Base64 using this command `base64 -w 0 request.token` and paste it to `REQUEST_TOKEN` secret.

Take note that the credentials will be placed on `$GITHUB_WORKSPACE` so that you can upload videos without specifying the location. Take caution if you are using commit and push actions as it might commit your credentials.

```yaml
steps:
  - name: Setup YouTube Uploader
    uses: AnimMouse/setup-youtubeuploader@v1
    with:
      client_secrets: ${{ secrets.CLIENT_SECRETS }}
      request_token: ${{ secrets.REQUEST_TOKEN }}
      
  - run: youtubeuploader -filename video.mkv
```

If you changed your working directory, it is required to specify the location of credentials.

```yaml
steps:
  - name: Setup YouTube Uploader
    uses: AnimMouse/setup-youtubeuploader@v1
    with:
      client_secrets: ${{ secrets.CLIENT_SECRETS }}
      request_token: ${{ secrets.REQUEST_TOKEN }}
      
  - working-directory: work-dir/
    run: youtubeuploader -secrets $GITHUB_WORKSPACE/client_secrets.json -cache $GITHUB_WORKSPACE/request.token -filename video.mkv
```