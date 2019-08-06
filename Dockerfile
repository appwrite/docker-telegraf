FROM telegraf:1.7

LABEL maintainer="team@appwrite.io"

ADD ./telegraf.conf /etc/telegraf/telegraf.conf