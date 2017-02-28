FROM debian:sid 

RUN apt-get update && apt-get install -qy trafficserver nghttp2 &&  mkdir /nghttp2 && apt-get clean
    
ENV SERVER_CRT=none SERVER_KEY=none

ADD entrypoint.sh /entrypoint.sh

RUN chgrp -R 0 /etc \
    && chgrp -R 0 /usr \
    && chmod -R g+rwX /etc \
    && chmod -R g+rwX /usr \
    && chmod +x /entrypoint.sh
     
ENTRYPOINT  sh /entrypoint.sh

EXPOSE 8443
