FROM ubuntu:14.04
MAINTAINER Morgan Auchede <morgan.auchede@gmail.com>

ENV \
    DEBIAN_FRONTEND=noninteractive \
    HOMEBANK_VERSION=5.0.5

RUN set -x \
    && echo "deb http://ppa.launchpad.net/mdoyen/homebank/ubuntu trusty main" >> /etc/apt/sources.list.d/homebank.list \
    && apt-key adv --keyserver keyserver.ubuntu.com --recv-keys ECA9D5AF2B98B3A0 \
    && apt-get update \
    && apt-get install -y homebank=$HOMEBANK_VERSION* \
    && rm -rf /var/lib/apt/lists/*

COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT [ "/entrypoint.sh" ]
