echo -e "$SERVER_CRT" > /config/server.crt
echo -e "$SERVER_KEY" > /config/server.key
tinyproxy -c /config/tinyproxy.conf
nghttpx --conf /config/nghttpx.conf
# nghttpx -s -k -f'*,8443' -b127.0.0.1,8080 -4 --tls-min-proto-version=TLSv1.2 --tls-max-proto-version=TLSv1.3 --no-ocsp server.key server.crt
