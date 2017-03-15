echo -e "$SERVER_CRT" > /config/server.crt
echo -e "$SERVER_KEY" > /config/server.key

tinyproxy -c /config/tinyproxy.conf
nghttpx -s -k --no-ocsp -f'*,8443' -b127.0.0.1,8080 /config/server.key /config/server.crt
