FROM alpine:edge
# tinyproxy 1.8.4
# nghttp2 1.23
RUN  apk add --no-cache --update tinyproxy nghttp2 \
 &&  mkdir -m 777 /config 
 
ENV SERVER_CRT=-----BEGIN CERTIFICATE-----
\nMIIETTCCAzWgAwIBAgIBATANBgkqhkiG9w0BAQsFADCBrzELMAkGA1UEBhMCQ04x
\nEjAQBgNVBAgTCUd1YW5nRG9uZzESMBAGA1UEBxMJR3VhbmdaaG91MQ8wDQYDVQQK
\nEwZqendhbmcxEzARBgNVBAsTCmp6d2FuZy5vcmcxMzAxBgNVBAMMKiouN2UxNC5z
\ndGFydGVyLXVzLXdlc3QtMi5vcGVuc2hpZnRhcHBzLmNvbTEdMBsGCSqGSIb3DQEJ
\nARYOanp3YW5nQGFvbC5jb20wHhcNMTgwMjAyMTcxNTAwWhcNMjgwMjAyMTcxNTAw
\nWjCBrzELMAkGA1UEBhMCQ04xEjAQBgNVBAgTCUd1YW5nRG9uZzESMBAGA1UEBxMJ
\nR3VhbmdaaG91MQ8wDQYDVQQKEwZqendhbmcxEzARBgNVBAsTCmp6d2FuZy5vcmcx
\nMzAxBgNVBAMMKiouN2UxNC5zdGFydGVyLXVzLXdlc3QtMi5vcGVuc2hpZnRhcHBz
\nLmNvbTEdMBsGCSqGSIb3DQEJARYOanp3YW5nQGFvbC5jb20wggEiMA0GCSqGSIb3
\nDQEBAQUAA4IBDwAwggEKAoIBAQC6MLoOLhhMK9v6ae0F+tVUF9xmmZWgM59+ZdUO
\nzfwlgo1gjDEFZrheEhyH2dABUOkgtyZGkbihVD5HVWLiBWbMm/E/fbaO/SWCxkA3
\nGgcPGEaLLte1f0eN+QjAFbwTi5s8137N/MMwAe012gigZFPh5T4t+MdIrjeTWsOb
\n9laciTpOBvKLC/YIE4FonJg2yC/30gHKaKTtwvZEE1ScmQMivkmUa7G3F+gvxZ4r
\nI7kMWNbjy4/O3unf80OAL9ZubXfXO0QU7H7iuM9PDoNZg/x6bjjb5pC3m73TwmwI
\ntKHmUYH8K+w6j8orGp/6Zl0SetrqrOfz66zNnFy3hUyXtWN9AgMBAAGjcjBwMA8G
\nA1UdEwEB/wQFMAMBAf8wHQYDVR0OBBYEFEagxq5Vp7irTC2w8v9zwnjgWyO1MAsG
\nA1UdDwQEAwIBBjARBglghkgBhvhCAQEEBAMCAAcwHgYJYIZIAYb4QgENBBEWD3hj
\nYSBjZXJ0aWZpY2F0ZTANBgkqhkiG9w0BAQsFAAOCAQEAScvLm6LFA30HTMreaXa0
\nxBv5bHqJzgeo0u8iTyLhOFeVAExHFaKeJbExl5CxhlXj4hmukvoeyVOZMn7EBssY
\nIepmsiALK9dJkgbEcc3udPAwI46ARMF4lybhnAwT4UKyh/h8sD5pAYPPAmc1OPEn
\nGxvx5be7zxuH1fZvZkt2ovapDmDgXKyF63CCd+LnmKhq0xv7+aaQdvgq1Jw9ujqS
\nDrCplPCzWA8TvmwlauwjaZGXsHH0RXdZdaOmZ2jsJEQDx2fqJtFnCE4okUr8Cw70
\nFWKRoT0klCW+n+qYrK8nNpaiNkg/9IPKApJRGr6pVo7YMJlFd6C5zgjeMNQnc26L
\nVw==
\n-----END CERTIFICATE-----
 SERVER_KEY=-----BEGIN RSA PRIVATE KEY-----
\nMIIEpAIBAAKCAQEAujC6Di4YTCvb+mntBfrVVBfcZpmVoDOffmXVDs38JYKNYIwx
\nBWa4XhIch9nQAVDpILcmRpG4oVQ+R1Vi4gVmzJvxP322jv0lgsZANxoHDxhGiy7X
\ntX9HjfkIwBW8E4ubPNd+zfzDMAHtNdoIoGRT4eU+LfjHSK43k1rDm/ZWnIk6Tgby
\niwv2CBOBaJyYNsgv99IBymik7cL2RBNUnJkDIr5JlGuxtxfoL8WeKyO5DFjW48uP
\nzt7p3/NDgC/Wbm131ztEFOx+4rjPTw6DWYP8em442+aQt5u908JsCLSh5lGB/Cvs
\nOo/KKxqf+mZdEnra6qzn8+uszZxct4VMl7VjfQIDAQABAoIBAQCjRl2yV6vJCGE0
\n3LUVHFz9DJujgaWbwglor2ZCQFKQlkbiVq4aXXTqUZmhbFmi/dAid1niYqF1IEop
\nBfDb4f6/CTVrBxQTmlzNrIrdhz6PdytNnLtfFwmpr6yDvcubnD57AULa4oBMVjQt
\nmFEeTjzdCMoZSGOCEfz8hIiq+UAErjd+AXGT9FSkuhKZwv/siztQhTMjR9oxsycp
\nmccvtuxQS3w/drn2mwzzWq7xpghtQOJp9osaDg6LtOKdISBIV6EGB4gLcsq0xLJU
\n330X0GwuvlH2HVK598XJKMyHjexRb99HzMEt9YcpagD7qqCgMKLdJt0RtjNQr96V
\ne4FWsVDhAoGBANv/l8mcc28xOEojyr+OuLOtoPEvtE8S1TkZleoRhSQ189R/2SCW
\n5rxvZUUcWVBsqoXMPJYiEAKIDkAJM5OqHExaxycAlf83wCxRWWSnnzAlLnQYkVUh
\nIyE3pSUxh7g8C2BzBBNZZGdNqx6j4oT5JYZmMKURlNszEbSoyAnc/MNpAoGBANio
\nz2v5RgGDhjcWQUZpNl5n/UwPTarzMd6yDA58bA4J1IIwoGemL3immaqBYFOKKij4
\nw+lNaD1vWqYeLcPxZpE44KZQ1qtk992Ziq/vM7wnYA9dHJPkEuaO1mvwmETxihR6
\nE8jZcT6MYLOQIVZ4wBNdGJ6NtVmw8Sx7Qesmb2D1AoGBAIw53VkvtNBiEhwHtlrl
\nMMuuV1CEdKyWN3ye11SL+E59aT7Agvhn1wizBFzJ1hASQ5rm9JNJgOTsLhEZDFwJ
\n6OGuVxSAJhu4QHC/JXin8yqv+G0dn70gUxEAM+6CJJ0FAMdoaGeg6gOCmRj9owvY
\n9tc02brNexFA+v8pOeA3kJFJAoGAQjUb5ZfwL6g8jHrtiZG/PowymFqY1mOo2q+4
\nBXk6H/QbD4nCisn6+biXfsY4ZG71QT37yECSWSu9HMReIeGUAU7LP6e2YfvhzsML
\n4YWMXrP9o9RFVmA88l214phMP80779P6Vcc01vNY3aZuuZj+wSwSyOjvATCUEo67
\n7xr4sD0CgYB22KZa7dWh1VfS30ALpYKys4+6gi1XEArPHDJ4oyTXnf+6pfmYZdau
\nHdXaD+GFI26mhyP4QXtYG6i1zKmV2ih71Rmfd2Vea2Kgij+0d9x4Na6eaPZq8EVh
\nEa3R1XbwDVlHPVlglAp3VSfkNl6M8AMyJF3KEySmEx//yBqsE6vaFA==
\n-----END RSA PRIVATE KEY-----


ADD entrypoint.sh /entrypoint.sh

ADD tinyproxy.conf /config/tinyproxy.conf
ADD nghttpx.conf   /config/nghttpx.conf

RUN  chmod +x /entrypoint.sh \
 &&  chgrp -R 0 /config \
 &&  chmod -R g+rwX /config 
     
ENTRYPOINT  sh /entrypoint.sh

EXPOSE 443
