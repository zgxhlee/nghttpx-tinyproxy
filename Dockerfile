FROM debian:sid 

RUN apt-get update && apt-get install -qy tinyproxy nghttp2 &&  apt-get clean 
    
ENV SERVER_CRT=none SERVER_KEY=none

ADD entrypoint.sh /entrypoint.sh

ADD tinyproxy.conf /etc/tinyproxy.conf

RUN chgrp -R 0 /etc/nghttpx \
    && chmod -R g+rwX /etc/nghttpx \
    && chmod +x /entrypoint.sh
     
ENTRYPOINT  sh /entrypoint.sh

EXPOSE 8443
