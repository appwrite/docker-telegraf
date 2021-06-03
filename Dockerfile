FROM alpine:3.12

LABEL maintainer="team@appwrite.io"

RUN echo 'hosts: files dns' >> /etc/nsswitch.conf

RUN apk add --no-cache \
        tzdata \
        bash \
        ca-certificates && \
    rm -rf /var/cache/apk/* && \
    update-ca-certificates 2>/dev/null

ENV TELEGRAF_VERSION 1.18.2

RUN set -ex && \
    mkdir ~/.gnupg; \
    echo "disable-ipv6" >> ~/.gnupg/dirmngr.conf; \
    apk add --no-cache --virtual .build-deps wget gnupg tar && \
    for key in \
        05CE15085FC09D18E99EFB22684A14CF2582E0C5 ; \
    do \
        gpg --keyserver ha.pool.sks-keyservers.net --recv-keys "$key" || \
        gpg --keyserver pgp.mit.edu --recv-keys "$key" || \
        gpg --keyserver keyserver.pgp.com --recv-keys "$key" ; \
    done && \
    [ "$(uname -m)" = x86_64 ] && suffix="_static_linux_amd64.tar.gz" || suffix="_linux_armhf.tar.gz"; \
    wget --no-verbose https://dl.influxdata.com/telegraf/releases/telegraf-${TELEGRAF_VERSION}${suffix}.asc && \
    wget --no-verbose https://dl.influxdata.com/telegraf/releases/telegraf-${TELEGRAF_VERSION}${suffix} && \
    gpg --batch --verify telegraf-${TELEGRAF_VERSION}${suffix}.asc telegraf-${TELEGRAF_VERSION}${suffix} && \
    mkdir -p /usr/src && \
    tar -C /usr/src -xzf telegraf-${TELEGRAF_VERSION}${suffix} && \
    cd /usr/src/telegraf-${TELEGRAF_VERSION}*; \
    cp -R etc/* /etc; \
    cp -R usr/* /usr; \
    cp -R var/* /var; \
    find /usr/bin -name "telegraf*" -exec chmod +x {} \; && \
    gpgconf --kill all && \
    rm -rf telegraf* /usr/src /root/.gnupg && \
    apk del .build-deps

COPY telegraf.conf /etc/telegraf/telegraf.conf

COPY entrypoint.sh /entrypoint.sh

RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
CMD ["telegraf"]

EXPOSE 8125/udp 8092/udp 8094
