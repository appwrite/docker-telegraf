# Docker Telegraf

![Docker Pulls](https://img.shields.io/docker/pulls/appwrite/telegraf.svg)
[![Discord](https://img.shields.io/discord/564160730845151244)](https://discord.gg/GSeTUeA)

Telegraf container pre-configured for [Appwrite server](https://appwrite.io) installation. This container is only extending the official Telegraf docker image with Appwrite specific configuration settings, for a fresh installation of Telegraf use only [docker official image](https://hub.docker.com/_/telegraf).

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

### Versioning

This image versioning is following Appwrite server versioning. This means that if you use Appwrite server version 1.1.* , also use version 1.1.* of Appwrite Telegraf docker image.

### Environment Variables

This container supports all environment variables supplied by the official Telegraf Docker image.

## Find Us

* [GitHub](https://github.com/appwrite)
* [Gitter](https://gitter.im/utopia-php/community?utm_source=share-link&utm_medium=link&utm_campaign=share-link)
* [Twitter](https://twitter.com/appwrite_io)

## Authors

**Eldad Fux**

+ [https://twitter.com/eldadfux](https://twitter.com/eldadfux)
+ [https://github.com/eldadfux](https://github.com/eldadfux)

## Copyright and license

The MIT License (MIT) [http://www.opensource.org/licenses/mit-license.php](http://www.opensource.org/licenses/mit-license.php)
