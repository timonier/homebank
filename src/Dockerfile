FROM ubuntu:14.04
MAINTAINER Morgan Auchede <morgan.auchede@gmail.com>

ENV \
    DEBIAN_FRONTEND=noninteractive \
    HOMEBANK_VERSION=5.0.5

RUN set -x \
    && BUILD_DEPS="build-essential curl libgtk-3-dev libofx-dev intltool" \
    && apt-get update \
    && apt-get install -y --no-install-recommends $BUILD_DEPS libofx4 light-themes \
    && curl -sLo /homebank-$HOMEBANK_VERSION.tar.gz http://homebank.free.fr/public/homebank-$HOMEBANK_VERSION.tar.gz \
    && tar -zxpf homebank-$HOMEBANK_VERSION.tar.gz \
    && cd homebank-$HOMEBANK_VERSION \
    && ./configure --prefix=/usr \
    && make \
    && make install \
    && apt-get purge -y --auto-remove $BUILD_DEPS \
    && apt-get -y autoremove \
    && rm -rf /homebank-$HOMEBANK_VERSION /var/lib/apt/lists/*

COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT [ "/entrypoint.sh" ]
