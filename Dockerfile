FROM alpine:3.5

RUN apk update \
    && apk add --no-cache openssl-dev gcc g++ libgcc libstdc++ git jemalloc jemalloc-dev libev libev-dev \
       autoconf automake make libtool  tcl-dev pcre-dev  \
    && git clone https://github.com/nghttp2/nghttp2.git \
    && git clone https://github.com/apache/trafficserver.git \
    && cd /nghttp2 \
    && autoreconf -i && automake && autoconf && ./configure --prefix=/opt/nghttp && make \
    && cd /trafficserver \
    && autoreconf -i && ./configure --prefix=/opt/ts --with-pcre=/usr/lib && make && make install \
    && cd .. \
    && rm -rf nghttp2 && rm -rf trafficserver \
    && apk del openssl-dev gcc g++ libgcc libstdc++ git jemalloc jemalloc-dev libev libev-dev \
       autoconf automake make libtool  tcl-dev pcre-dev
       
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
