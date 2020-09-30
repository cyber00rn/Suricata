#!/bin/bash

DEFAULT_PATCH=./suricata-5.0.2_broadcast.patch

if [ $# -eq 1 ] ; then
	DEFAULT_PATCH=$1
fi

sudo apt -y install libpcre3 libpcre3-dbg libpcre3-dev build-essential autoconf \
automake libtool libpcap-dev libnet1-dev libyaml-0-2 libyaml-dev zlib1g zlib1g-dev \
libcap-ng-dev libcap-ng0 make libmagic-dev libjansson-dev libjansson4 pkg-config \
libnetfilter-queue-dev libnetfilter-queue1 libnfnetlink-dev libnfnetlink0 \
rustc cargo

wget http://www.openinfosecfoundation.org/download/suricata-5.0.2.tar.gz
tar -xzf suricata-5.0.2.tar.gz
patch -p0 < $DEFAULT_PATCH
cd suricata-5.0.2 && ./configure --enable-nfqueue --prefix=/usr --sysconfdir=/etc --localstatedir=/var && time make && cd -
