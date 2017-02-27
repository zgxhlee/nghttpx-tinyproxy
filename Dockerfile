FROM alpine:3.5

RUN  apk add --update git \
     && git clone https://github.com/tinyproxy/tinyproxy.git \
     && cd tinyproxy \
     && ./autogen.sh \
     && ./configure \
     && make \
     
RUN  apk add  g++ make binutils autoconf automake autotools-dev libtool pkg-config \
     zlib1g-dev libcunit1-dev libssl-dev libxml2-dev libev-dev libevent-dev libjansson-dev \
     libc-ares-dev libjemalloc-dev cython python3-dev python-setuptools -qy \
     && git clone https://github.com/nghttp2/nghttp2.git \
     && cd nghttp2 \
     && git submodule update --init \
     && autoreconf -i \
     && automake \
     && autoconf \
     && ./configure \
     && make
     
ADD entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh 
ENTRYPOINT  sh /entrypoint.sh
