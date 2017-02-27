FROM ubuntu:16.04 

RUN  apt-get update \
     && apt-get install  nghttp2 tinyproxy 
     
     
ENV SERVER_CRT=none SERVER_KEY=none

ADD entrypoint.sh /entrypoint.sh

RUN chgrp -R 0 /nghttp2 \
    && chmod -R g+rwX /nghttp2 \
    && chmod +x /entrypoint.sh
     
ENTRYPOINT  sh /entrypoint.sh

EXPOSE 8443
