FROM ubuntu:16.04 

RUN  apt-get update \
     && apt-get install tinyproxy g++ make binutils autoconf automake autotools-dev libtool pkg-config \
        zlib1g-dev libcunit1-dev libssl-dev libxml2-dev libev-dev libevent-dev libjansson-dev \
        libc-ares-dev libjemalloc-dev cython python3-dev python-setuptools -qy \
     && git clone https://github.com/nghttp2/nghttp2.git \
     && cd nghttp2 \
     && git submodule update --init \
     && autoreconf -i \
     && automake \
     && autoconf \
     && ./configure \
     && make
    
ENV SERVER_CRT=none SERVER_KEY=none

ADD entrypoint.sh /entrypoint.sh

RUN chgrp -R 0 /nghttp2 \
    && chmod -R g+rwX /nghttp2 \
    && chmod +x /entrypoint.sh
     
ENTRYPOINT  sh /entrypoint.sh

EXPOSE 8443
