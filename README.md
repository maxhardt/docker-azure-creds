# docker-azure-creds

### HOW DO I PASS SECRETS?
To pass secret information (e.g. azure access token) we can use the `docker build --secret` option, e.g.:

```bash
docker build --secret id=azure_token,src=azure_token.txt
```

Per default secrets are temporarily stored in `/run/secrets/`. NOTE that the secret is not part of the final image.

### HOW DO I ACCESS THE SECRETS?
To access the secret in the Dockerfile we can use `RUN` commands with the `--mount=type=secret` option

For more info check out the docker docs: https://docs.docker.com/develop/develop-images/build_enhancements/

### Example usage for installing custom package from azure with personal access token:

```bash
RUN --mount=type=secret,id=azure_token \
    pip3 install \
    --index-url=https://$(cat /run/secrets/azure_token)@${AZURE_INDEX_URL} \
    --trusted-host=${PIP_TRUSTED_HOST} \
    --no-deps \
    foo==1.1.8
```
