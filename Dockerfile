FROM alpine:3.5

RUN apk update \
    && apk add --no-cache openssl openssl-dev gcc g++ libgcc libstdc++ git jemalloc jemalloc-dev \
       libev libev-dev autoconf automake make libtool pkgconfig tcl pcre libcap flex hwloc lua curses curl \
    && git clone https://github.com/nghttp2/nghttp2.git \
    && git clone https://git-wip-us.apache.org/repos/asf/trafficserver.git \
    && cd /nghttp2 \
    && autoreconf -i && automake && autoconf && ./configure --prefix=/opt/nghttp && make && make install-strip \
    && cd /trafficserver \
    && autoreconf -i && ./configure --prefix=/opt/ts && make && make install \
    && cd .. 
    && rm -rf nghttp2 && rm -rf trafficserver\
    && apk del openssl-dev gcc g++ git jemalloc-dev libev-dev autoconf automake make libtool \
       pkgconfig tcl pcre libcap flex hwloc lua curses curl 
    
ENV SERVER_CRT=none SERVER_KEY=none

ADD entrypoint.sh /entrypoint.sh

RUN chgrp -R 0 /opt \
    && chmod -R g+rwX /opt \
    && chmod +x /entrypoint.sh
     
ENTRYPOINT  sh /entrypoint.sh

EXPOSE 8443
