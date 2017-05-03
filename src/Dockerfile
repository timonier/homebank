FROM ubuntu:latest

LABEL \
    maintainer="Morgan Auchede <morgan.auchede@gmail.com>"

ENV \
    HOMEBANK_VERSION=latest \
    NO_AT_BRIDGE=1

RUN set -eux \

    # Prepare system

    && export DEBIAN_FRONTEND=noninteractive \

    && apt-get update \

    # Install packages

    && export BUILD_DEPS="build-essential bzr ca-certificates curl intltool libgtk-3-dev libofx-dev" \

    && apt-get install --no-install-recommends --yes \
           ${BUILD_DEPS} \
           libcanberra-gtk3-module \
           libofx6 \
           libosp5 \
           libsoup2.4 \
           librsvg2-common \
           locales \
           unity-gtk3-module \

    # Install dumb-entrypoint

    && curl --location "https://github.com/timonier/dumb-entrypoint/raw/master/bin/installer" | INSTALL_DIRECTORY="/usr/sbin" sh -s install \

    # Install homebank

    && export $(curl "https://raw.githubusercontent.com/timonier/version-lister/release/generated/homebank/${HOMEBANK_VERSION}" | xargs) \

    && bzr branch "lp:homebank/${HOMEBANK_BRANCH}" /tmp/homebank --revision "${HOMEBANK_REVISION}" \
    && sh -c "cd /tmp/homebank && ./configure --prefix=/usr" \
    && make --directory /tmp/homebank \
    && make --directory /tmp/homebank install \

    # Clean

    && apt-get remove --purge --yes \
           ${BUILD_DEPS} \
    && apt-get autoremove --purge --yes \

    && rm --force --recursive \
           /tmp/* \
           /var/lib/apt/lists/*

ENTRYPOINT [ "dumb-init" , "--" , "dumb-entrypoint" ]
