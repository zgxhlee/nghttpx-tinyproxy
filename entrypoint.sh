/opt/ts/bin/traffic_server -R 1
cd /opt/nghttp
if [ "$SERVER_CRT" != "$SERVER_KEY" ]; then
  echo -e "$SERVER_CRT" > server.crt
  echo -e "$SERVER_KEY" > server.key
fi
nghttpx -s -f'*,8443' -b127.0.0.1,8080 server.key server.crt
