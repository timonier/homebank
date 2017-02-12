FROM ubuntu:16.04

LABEL \
    maintainer="Morgan Auchede <morgan.auchede@gmail.com>"

ENV \
    HOMEBANK_REVISION=39 \
    HOMEBANK_VERSION=5.0.8 \
    NO_AT_BRIDGE=1

RUN set -x \

    # Prepare system

    && export DEBIAN_FRONTEND=noninteractive \

    && apt-get update \

    # Install packages

    && BUILD_DEPS="build-essential bzr ca-certificates curl intltool libgtk-3-dev libofx-dev" \

    && apt-get install -y --no-install-recommends \
           ${BUILD_DEPS} \
           libcanberra-gtk3-module \
           libofx6 \
           libosp5 \
           librsvg2-common \
           unity-gtk3-module \

    # Install homebank

    && bzr branch lp:homebank/5.0.x /tmp/homebank --revision=${HOMEBANK_REVISION} \
    && sh -c "cd /tmp/homebank && ./configure --prefix=/usr" \
    && make -C /tmp/homebank \
    && make -C /tmp/homebank install \

    # Install timonier/dumb-entrypoint

    && curl -sL "https://github.com/timonier/dumb-entrypoint/raw/master/bin/installer" | INSTALL_DIRECTORY="/usr/sbin" sh -s install \

    # Clean

    && apt-get remove -y --purge \
           ${BUILD_DEPS} \
    && apt-get autoremove -y --purge \

    && rm -rf \
           /tmp/* \
           /var/lib/apt/lists/*

ENTRYPOINT [ "dumb-init" , "--" , "dumb-entrypoint" ]
