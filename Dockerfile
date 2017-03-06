FROM alpine:3.5

RUN apk update \
    && apk add --no-cache  autoconf automake alpine-sdk \
    && git clone https://github.com/nghttp2/nghttp2.git \
    && git clone https://git-wip-us.apache.org/repos/asf/trafficserver.git \
    && cd /nghttp2 \
    && autoreconf -i && automake && autoconf && ./configure --prefix=/opt/nghttp && make && make install-strip \
    && cd /trafficserver \
    && autoreconf -i && ./configure --prefix=/opt/ts && make && make install \
    && cd .. 
    && rm -rf nghttp2 && rm -rf trafficserver \
    && apk del  autoconf automake alpine-sdk
    
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
