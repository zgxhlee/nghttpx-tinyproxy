FROM debian:sid

RUN \
    apt-get install -y trafficserver nghttp2 \
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
