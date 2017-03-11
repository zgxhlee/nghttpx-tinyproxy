FROM debian:sid

RUN adduser --disabled-password --gid 0 wangyi2005

USER wangyi2005

RUN  apt-get update \
 &&  apt-get install -y trafficserver nghttp2-proxy \
 &&  apt-get clean all
       
ENV SERVER_CRT=none SERVER_KEY=none
# proxy.config.url_remap.remap_required = 0
# proxy.config.http.cache.http = 1
# proxy.config.reverse_proxy.enabled = 0

ADD entrypoint.sh /entrypoint.sh

RUN chgrp -R 0 /etc/nghttpx \
    && chmod -R g+rwX /etc/nghttpx \
    && chmod +x /entrypoint.sh
     
ENTRYPOINT  sh /entrypoint.sh

EXPOSE 8443
