FROM alpine:edge
# tinyproxy 1.8.4
# nghttp2 1.23
RUN  apk add --no-cache --update tinyproxy nghttp2 \
 &&  mkdir -m 777 /config 
ENV SERVER_CRT=None SERVER_KEY=None
ADD entrypoint.sh /entrypoint.sh

ADD tinyproxy.conf /config/tinyproxy.conf
ADD nghttpx.conf   /config/nghttpx.conf

RUN  chmod +x /entrypoint.sh \
 &&  chgrp -R 0 /config \
 &&  chmod -R g+rwX /config 
     
ENTRYPOINT  sh /entrypoint.sh

EXPOSE 443
