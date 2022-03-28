# DigitalOcean Spaces

GitHub Action to sync to DigitalOcean Spaces.

**⚠️ Note:** This action by default deletes all files in the space that are not present in `LOCAL_DIR`, disable using `DELETE_UNTRACKED`.


### Usage

Setup this workflow action like `.github/workflows/<name_this>.yml`

```yaml
name: DigitalOcean Spaces
on: push

jobs:
  deploy:
    runs-on: ubuntu-latest
    steps:
    - uses: actions/checkout@main
    - uses: laukstein/do-spaces@main
      env:
        DO_ACCESS: ${{ secrets.DO_ACCESS }}
        DO_SECRET: ${{ secrets.DO_SECRET }}
        DO_REGION: "ams3"
        DO_NAME: ${{ secrets.DO_NAME }}
        SPACE_DIR: my_project
        LOCAL_DIR: public
        DELETE_UNTRACKED: true
        ADD_HEADER: "Content-Encoding:gzip"
```


### Required Variables

| Key | Value | Suggested Type | Required | Default |
| ------------- | ------------- | ------------- | --------- | --------- |
| `DO_ACCESS` | Your Spaces Access Key. [More info here.](https://www.digitalocean.com/community/tutorials/how-to-create-a-digitalocean-space-and-api-key) | `secret env` | **Yes** | N/A |
| `DO_SECRET` | Your Spaces Secret Access Key. [More info here.](https://www.digitalocean.com/community/tutorials/how-to-create-a-digitalocean-space-and-api-key) | `secret env` | **Yes** | N/A |
| `DO_REGION` | The region where you created your space in. For example, `ams3`. [Full list of regions here.](https://www.digitalocean.com/docs/platform/availability-matrix/) | `env` | **Yes** | N/A |
| `DO_NAME` | The name of the space you're syncing to. For example, `my-space`. | `secret env` | **Yes** | N/A |
| `SPACE_DIR` | The directory inside of the space you wish to sync to. For example, `my_project`. Defaults to the root of the space. | `env` | No | `/` |
| `LOCAL_DIR` | The local directory you wish to sync. For example, `public`. Defaults to your entire repository. | `env` | No | `/` |
| `DELETE_UNTRACKED` | If empty or set to `true`, deletes any files in the space that are *not* present in the source directory. | `env` | No | `true` |
| `FILES_PRIVATE` | Make files private, default `false`. | `env` | No | `false` |
| `ADD_HEADER` | Add custom header for sync files, e.g. `Content-Encoding:gzip`, ensure it doesn't contain space/s. | `env` | No | N/A |


### License

This project is distributed under the [MIT license](LICENSE.md).
