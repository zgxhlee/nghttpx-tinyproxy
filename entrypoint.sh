traffic_server -R 1

if [ "$SERVER_CRT" != "$SERVER_KEY" ]; then
  echo -e "$SERVER_CRT" > /var/server.crt
  echo -e "$SERVER_KEY" > /var/server.key
fi

nghttpx -s -f'*,8443' -b127.0.0.1,8080 /var/server.key /var/server.crt
