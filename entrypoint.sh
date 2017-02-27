/tinyproxy/tinyproxy
cd /nghttp2
./nghttpx -s -f'*,8443' -b127.0.0.1,8888 server.key server.crt
