FROM ubuntu:16.04
MAINTAINER Morgan Auchede <morgan.auchede@gmail.com>

ENV \
    GOSU_VERSION=1.7 \
    HOMEBANK_VERSION=5.0.6 \
    NO_AT_BRIDGE=1

RUN set -x \

    # Prepare system

    && export DEBIAN_FRONTEND=noninteractive \

    && apt-get update \

    # Install packages

    && BUILD_DEPS="build-essential curl libgtk-3-dev libofx-dev intltool" \

    && apt-get install -y --no-install-recommends \
           $BUILD_DEPS \
           libcanberra-gtk3-module \
           libofx6 \
           libosp5 \
           librsvg2-common \
           unity-gtk3-module \

    # Install gosu

    && curl -sLo /usr/sbin/gosu "https://github.com/tianon/gosu/releases/download/$GOSU_VERSION/gosu-amd64"  \
    && chmod +x /usr/sbin/gosu \

    # Install homebank

    && curl -sL "http://homebank.free.fr/public/homebank-$HOMEBANK_VERSION.tar.gz" | tar fxz - -C /tmp \
    && sh -c "cd /tmp/homebank-$HOMEBANK_VERSION && ./configure --prefix=/usr" \
    && make -C /tmp/homebank-$HOMEBANK_VERSION \
    && make -C /tmp/homebank-$HOMEBANK_VERSION install \

    # Clean

    && apt-get remove -y --purge \
           $BUILD_DEPS \
    && apt-get autoremove -y --purge \

    && rm -rf \
           /tmp/* \
           /var/lib/apt/lists/*

COPY ./rootfs /

ENTRYPOINT [ "/entrypoint.sh" ]
