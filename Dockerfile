FROM telegraf:1.15-alpine

LABEL maintainer="team@appwrite.io"

COPY ./telegraf.conf /etc/telegraf/telegraf.conf
