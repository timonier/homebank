FROM ubuntu:14.04
MAINTAINER Morgan Auchede <morgan.auchede@gmail.com>

ENV \
    DEBIAN_FRONTEND=noninteractive \
    HOMEBANK_VERSION=5.0.5 \
    LIBCANBERRA_GTK3_MODULE=0.30 \
    UNITY_GTK3_MODULE=0.0.0

RUN set -x \

    # Prepare system

    && echo "deb http://ppa.launchpad.net/mdoyen/homebank/ubuntu trusty main" >> /etc/apt/sources.list.d/homebank.list \
    && apt-key adv --keyserver keyserver.ubuntu.com --recv-keys ECA9D5AF2B98B3A0 \
    && apt-get update \

    # Install packages

    && apt-get install -y \
           homebank=$HOMEBANK_VERSION* \
           libcanberra-gtk3-module=$LIBCANBERRA_GTK3_MODULE* \
           unity-gtk3-module=$UNITY_GTK3_MODULE* \

    # Clean

    && rm -rf \
           /var/lib/apt/lists/*

COPY ./root /

ENTRYPOINT [ "/entrypoint.sh" ]
