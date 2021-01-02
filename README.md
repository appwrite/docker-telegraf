# Docker Telegraf

[![Discord](https://img.shields.io/discord/564160730845151244?label=discord&style=flat-square)](https://appwrite.io/discord)
[![Docker Pulls](https://img.shields.io/docker/pulls/appwrite/telegraf?color=f02e65&style=flat-square)](https://hub.docker.com/r/appwrite/telegraf)
[![Build Status](https://img.shields.io/travis/com/appwrite/docker-telegraf?style=flat-square)](https://travis-ci.com/appwrite/docker-telegraf)
[![Twitter Account](https://img.shields.io/twitter/follow/appwrite_io?color=00acee&label=twitter&style=flat-square)](https://twitter.com/appwrite_io)
[![Follow Appwrite on StackShare](https://img.shields.io/badge/follow%20on-stackshare-blue?style=flat-square)](https://stackshare.io/appwrite)


Telegraf Docker image pre-configured for [Appwrite server](https://appwrite.io) installation. This container is only extending the official Telegraf docker image with Appwrite specific configuration settings, for a fresh installation of Telegraf use only [docker official image](https://hub.docker.com/_/telegraf).

## Getting Started

These instructions will cover usage information to help your run Appwrite's Telegraf docker container.

### Prerequisities

In order to run this container you'll need docker installed.

* [Windows](https://docs.docker.com/windows/started)
* [OS X](https://docs.docker.com/mac/started/)
* [Linux](https://docs.docker.com/linux/started/)

### Usage

```shell
docker run appwrite/telegraf
```

### Environment Variables

This container supports all environment variables supplied by the official Telegraf Docker image.

### Build / Release

```
docker build --tag appwrite/telegraf:0.0.0 .
docker push appwrite/telegraf:0.0.0
```

Multi-arch build (experimental using [buildx](https://github.com/docker/buildx)):

```
docker buildx create --use
docker buildx build --platform linux/amd64,linux/arm/v6,linux/arm/v7,linux/arm64 --tag appwrite/telegraf:0.0.0 --push .
```

## Find Us

* [GitHub](https://github.com/appwrite)
* [Discord](https://discord.gg/GSeTUeA)
* [Twitter](https://twitter.com/appwrite_io)

## Copyright and license

The MIT License (MIT) [http://www.opensource.org/licenses/mit-license.php](http://www.opensource.org/licenses/mit-license.php)
