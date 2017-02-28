tinyproxy -c /etc/tinyproxy.conf

if [ "$CERT_PEM" != "$KEY_PEM" ]; then
  echo -e "$SERVER_CRT" > /etc/nghttpx/server.crt
  echo -e "$SERVER_KEY" > /etc/nghttpx/server.key
fi

nghttpx -s -f'*,8443' -b127.0.0.1,8080 /etc/nghttpx/server.key /etc/nghttpx/server.crt
