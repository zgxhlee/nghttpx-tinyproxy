tinyproxy -c /conf/tinyproxy.conf

if [ "$SERVER_CRT" != "$SERVER_KEY" ]; then
  echo -e "$SERVER_CRT" > /conf/server.crt
  echo -e "$SERVER_KEY" > /conf/server.key
fi

nghttpx -conf /conf/nghttpx.conf
