FROM debian:sid 

RUN apt-get update && apt-get install -qy tinyproxy nghttp2 &&  apt-get clean && mkdir /conf
    
ENV SERVER_CRT=none SERVER_KEY=none

ADD entrypoint.sh /entrypoint.sh

ADD tinyproxy.conf /conf/tinyproxy.conf

RUN chgrp -R 0 /conf \
    && chmod -R g+rwX /conf \
    && chmod +x /entrypoint.sh
     
ENTRYPOINT  sh /entrypoint.sh

EXPOSE 8443
