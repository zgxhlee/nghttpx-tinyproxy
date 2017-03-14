FROM alpine:edge
# tinyproxy 1.8.4
# nghttp2 1.20
RUN  apk add --no-cache --update tinyproxy nghttp2 \
 &&  mkdir -m 777 /config \
 &&  chgrp -R 0 /config \
 && chmod -R g+rwX /config 
 
ENV TINYPROXY_CONF=none SERVER_CRT=none SERVER_KEY=none

ADD entrypoint.sh /entrypoint.sh

RUN chmod +x /entrypoint.sh
     
ENTRYPOINT  sh /entrypoint.sh

EXPOSE 8443
