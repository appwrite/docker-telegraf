FROM telegraf:1.7

LABEL maintainer="team@appwrite.io"

COPY ./telegraf.conf /etc/telegraf/telegraf.conf
