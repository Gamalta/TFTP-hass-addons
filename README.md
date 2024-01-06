# TFTP-HASS-ADDONS
Simple TFTP server addons for home assistant

## Build locally

```bash
sudo docker build --pull --rm -f "Dockerfile" -t tftphassaddons:latest "." --build-arg BUILD_FROM=ghcr.io/home-assistant/amd64-base-python:3.12-alpine3.19
```

you can change the `BUILD_FROM` to any of the following for match your system:

https://github.com/home-assistant/docker/blob/master/build.yaml


