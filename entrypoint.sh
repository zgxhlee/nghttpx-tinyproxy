tinyproxy -c /etc/tinyproxy.conf

if [ "$SERVER_CRT" != "$SERVER_KEY" ]; then
  echo -e "$SERVER_CRT" > /conf/server.crt
  echo -e "$SERVER_KEY" > /conf/server.key
fi

nghttpx -s -f'*,8443' -b127.0.0.1,8888 /conf/server.key /conf/server.crt
