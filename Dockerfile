FROM ubuntu:16.04

RUN apt-get update \
    && apt-get install -qy git gcc g++ openssl  libgcc libstdc++  jemalloc  libev \
       autoconf automake make libtool  tcl pcre \
    && git clone --depth 1 --single-branch --branch 'v1.20.0' https://github.com/nghttp2/nghttp2.git \
    && git clone https://github.com/apache/trafficserver.git \
    && cd /nghttp2 \
    && autoreconf -i && automake && autoconf && ./configure --prefix=/opt/nghttp && make \
    && cd /trafficserver \
    && autoreconf -i && ./configure --prefix=/opt/ts --with-pcre=/usr/local && make && make install \
    && cd .. \
    && rm -rf nghttp2 && rm -rf trafficserver \
    && apt-get remove  git gcc g++ openssl  libgcc libstdc++ jemalloc  libev \
       autoconf automake make libtool  tcl pcre \
    && apt-get clean
       
ENV SERVER_CRT=none SERVER_KEY=none
# proxy.config.url_remap.remap_required = 0
# proxy.config.http.cache.http = 1
# proxy.config.reverse_proxy.enabled = 0

ADD entrypoint.sh /entrypoint.sh

RUN chgrp -R 0 /opt \
    && chmod -R g+rwX /opt \
    && chmod +x /entrypoint.sh
     
ENTRYPOINT  sh /entrypoint.sh

EXPOSE 8443
