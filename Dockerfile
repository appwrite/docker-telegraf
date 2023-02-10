FROM alpine:3.16

LABEL maintainer="team@appwrite.io"

RUN echo 'hosts: files dns' >> /etc/nsswitch.conf

RUN apk add --no-cache \
        iputils=20211215-r0 \
        ca-certificates=20220614-r0 \
        net-snmp-tools=5.9.3-r0 \
        procps=3.3.17-r1 \
        lm_sensors \
        tzdata=2022c-r0 \
        su-exec=0.2-r1 \
        libcap=2.64-r0 && \
    update-ca-certificates

ENV TELEGRAF_VERSION 1.24.1

RUN set -ex && \
    mkdir ~/.gnupg; \
    echo "disable-ipv6" >> ~/.gnupg/dirmngr.conf; \
    apk add --no-cache --virtual .build-deps wget gnupg tar && \
    for key in \
        05CE15085FC09D18E99EFB22684A14CF2582E0C5 ; \
    do \
        gpg --keyserver hkp://keyserver.ubuntu.com --recv-keys "$key" ; \
    done && \
    [ "$(uname -m)" = x86_64 ] && suffix="_static_linux_amd64.tar.gz" || suffix="_linux_armhf.tar.gz"; \
    wget --no-verbose https://dl.influxdata.com/telegraf/releases/telegraf-${TELEGRAF_VERSION}${suffix}.asc && \
    wget --no-verbose https://dl.influxdata.com/telegraf/releases/telegraf-${TELEGRAF_VERSION}${suffix} && \
    gpg --batch --verify telegraf-${TELEGRAF_VERSION}${suffix}.asc telegraf-${TELEGRAF_VERSION}${suffix} && \
    mkdir -p /usr/src /etc/telegraf && \
    tar -C /usr/src -xzf telegraf-${TELEGRAF_VERSION}${suffix} && \
    mv /usr/src/telegraf*/etc/telegraf/telegraf.conf /etc/telegraf/ && \
    mkdir /etc/telegraf/telegraf.d && \
    cp -a /usr/src/telegraf*/usr/bin/telegraf /usr/bin/ && \
    gpgconf --kill all && \
    rm -rf *.tar.gz* /usr/src /root/.gnupg && \
    apk del .build-deps && \
    addgroup -S telegraf && \
    adduser -S telegraf -G telegraf && \
    chown -R telegraf:telegraf /etc/telegraf

EXPOSE 8125/udp 8092/udp 8094

COPY entrypoint.sh /entrypoint.sh

RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
CMD ["telegraf"]
