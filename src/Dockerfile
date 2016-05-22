FROM ubuntu:14.04
MAINTAINER Morgan Auchede <morgan.auchede@gmail.com>

ENV \
    HOMEBANK_VERSION=5.0.5 \
    NO_AT_BRIDGE=1

RUN set -x \

    # Prepare system

    && export DEBIAN_FRONTEND=noninteractive \

    && echo "deb http://ppa.launchpad.net/mdoyen/homebank/ubuntu trusty main" >> /etc/apt/sources.list.d/homebank.list \
    && apt-key adv --keyserver keyserver.ubuntu.com --recv-keys ECA9D5AF2B98B3A0 \
    && apt-get update \

    # Install packages

    && apt-get install -y \
           homebank=$HOMEBANK_VERSION* \
           libcanberra-gtk3-module \
           unity-gtk3-module \

    # Clean

    && rm -rf \
           /var/lib/apt/lists/*

COPY ./rootfs /

ENTRYPOINT [ "/entrypoint.sh" ]
