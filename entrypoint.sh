echo -e "$SERVER_CRT" > /config/server.crt
echo -e "$SERVER_KEY" > /config/server.key
tinyproxy -c /config/tinyproxy.conf
nghttpx -conf /config/nghttpx.conf
