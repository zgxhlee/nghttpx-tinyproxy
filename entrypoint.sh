traffic_ctl server start
traffic_ctl config set proxy.config.url_remap.remap_required 0
traffic_ctl config set proxy.config.http.cache.http 1
traffic_ctl config set proxy.config.reverse_proxy.enabled 0
traffic_ctl config reload
traffic_ctl server restart

if [ "$CERT_PEM" != "$KEY_PEM" ]; then
  echo -e "$SERVER_CRT" > /etc/server.crt
  echo -e "$SERVER_KEY" > /etc/server.key
fi

nghttpx -s -f'*,8443' -b127.0.0.1,8080 /etc/server.key /etc/server.crt
