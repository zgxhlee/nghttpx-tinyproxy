traffic_ctl config set proxy.config.url_remap.remap_required 0
traffic_ctl config set proxy.config.http.cache.http 1
traffic_ctl config set proxy.config.reverse_proxy.enabled 0
trafficserver start

cd /nghttp2
if [ "$CERT_PEM" != "$KEY_PEM" ]; then
  echo -e "$CERT_PEM" > server.crt
  echo -e "$KEY_PEM"  > server.key
fi

nghttpx -s -f'*,8443' -b127.0.0.1,8080 /nghttp2/server.key /nghttp2/server.crt
