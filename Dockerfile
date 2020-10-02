FROM telegraf:1.14.5-alpine

LABEL maintainer="team@appwrite.io"

COPY ./telegraf.conf /etc/telegraf/telegraf.conf
