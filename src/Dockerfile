FROM ubuntu:latest

LABEL \
    maintainer="Morgan Auchede <morgan.auchede@gmail.com>"

ENV \
    HOMEBANK_VERSION=latest \
    NO_AT_BRIDGE=1

RUN set -ex \
\
    # Prepare system
\
    && export DEBIAN_FRONTEND=noninteractive \
    && apt-get update \
\
    # Install packages
\
    && export BUILD_DEPS="build-essential bzr curl intltool libgtk-3-dev libofx-dev" \
    && apt-get install --no-install-recommends --yes \
           ${BUILD_DEPS} \
           ca-certificates \
           libcanberra-gtk3-module \
           libofx7 \
           libosp5 \
           libsoup2.4 \
           librsvg2-common \
           locales \
           unity-gtk3-module \
\
    # Install homebank
\
    && export $(curl --location "https://github.com/timonier/version-lister/raw/generated/_/homebank/${HOMEBANK_VERSION}" | xargs) \
    && bzr branch "lp:homebank/${HOMEBANK_BRANCH}" /tmp/homebank --revision "${HOMEBANK_REVISION}" \
    && sh -c "cd /tmp/homebank && ./configure --prefix=/usr" \
    && make --directory /tmp/homebank \
    && make --directory /tmp/homebank install \
\
    # Install timonier/dumb-entrypoint
\
    && curl --location "https://github.com/timonier/dumb-entrypoint/raw/master/src/dumb-entrypoint/installer" | INSTALL_DIRECTORY="/usr/sbin" sh -s -- install \
    && curl --location "https://github.com/timonier/dumb-entrypoint/raw/master/src/gosu/installer" | INSTALL_DIRECTORY="/usr/sbin" sh -s -- install \
\
    # Clean
\
    && apt-get remove --purge --yes \
           ${BUILD_DEPS} \
    && apt-get autoremove --purge --yes \
    && rm --force --recursive \
           /tmp/* \
           /var/lib/apt/lists/*

ENTRYPOINT [ "dumb-entrypoint" ]
