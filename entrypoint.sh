service tinyproxy start

cd /nghttp2
if [ "$CERT_PEM" != "$KEY_PEM" ]; then
  echo -e "$CERT_PEM" > server.crt
  echo -e "$KEY_PEM"  > server.key
fi

./nghttpx -s -f'*,8443' -b127.0.0.1,8888 server.key server.crt
