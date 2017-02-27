FROM ubuntu:16.04 

RUN apt-get update && apt-get install -y git g++ make binutils autoconf automake autotools-dev libtool pkg-config \
        zlib1g-dev libssl-dev libev-dev libjemalloc-dev ruby-dev libc-ares-dev bison \
        zlib1g libssl1.0.0 libev4 libjemalloc1 libc-ares2 \
        diffutils ca-certificates psmisc \
        python \
        --no-install-recommends && \
    git clone -b v1.20.0 --depth 1 https://github.com/nghttp2/nghttp2.git && \
    git clone https://git-wip-us.apache.org/repos/asf/trafficserver.git && \
    cd /nghttp2 && \
    git submodule update --init && autoreconf -i && \
    ./configure --disable-examples --disable-hpack-tools --disable-python-bindings --with-mruby --with-neverbleed && \
    make install-strip && \
    cd /trafficserver && \
    autoreconf -if && \
    ./configure --prefix=/opt/ts && \
    make && \
    cd .. && \
    rm -rf nghttp2 && \
    apt-get -y purge git g++ make binutils autoconf automake autotools-dev libtool pkg-config \
        zlib1g-dev libssl-dev libev-dev libjemalloc-dev ruby-dev libc-ares-dev bison && \
    apt-get -y autoremove --purge && \
    apt-get clean
    
ENV SERVER_CRT=none SERVER_KEY=none

ADD entrypoint.sh /entrypoint.sh

RUN chgrp -R 0 /nghttp2 \
    && chmod -R g+rwX /nghttp2 \
    && chmod +x /entrypoint.sh
     
ENTRYPOINT  sh /entrypoint.sh

EXPOSE 8443
