FROM telegraf:1.15.3

LABEL maintainer="team@appwrite.io"

COPY ./telegraf.conf /etc/telegraf/telegraf.conf
