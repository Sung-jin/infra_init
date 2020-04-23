#!/bin/bash

docker stop $(docker ps -a -q) && docker rm $(docker ps -a -q)
# docker-compose up -d

docker run --detach \
    --name nginx-proxy \
    --publish 80:80 \
    --publish 443:443 \
    --volume /etc/nginx/certs \
    --volume /etc/nginx/vhost.d \
    --volume /usr/share/nginx/html \
    --volume /var/run/docker.sock:/tmp/docker.sock:ro \
    jwilder/nginx-proxy

docker run --detach \
    --name nginx-proxy-letsencrypt \
    --volumes-from nginx-proxy \
    --volume /var/run/docker.sock:/var/run/docker.sock:ro \
    --env "DEFAULT_EMAIL=osj4872@gmail.com" \
    jrcs/letsencrypt-nginx-proxy-companion

docker run --detach \
    --name grafana \
    --env "VIRTUAL_HOST=ci.osj5298.shop" \
    --env "VIRTUAL_PORT=3000" \
    --env "LETSENCRYPT_HOST=ci.osj5298.shop" \
    --env "LETSENCRYPT_EMAIL=osj4872@gmail.com" \
    grafana/grafana

docker run --detach \
    --name jenkins \
    --env "VIRTUAL_HOST=osj5298.shop" \
    --env "VIRTUAL_PORT=8080" \
    --env "LETSENCRYPT_HOST=osj5298.shop" \
    --env "LETSENCRYPT_EMAIL=osj4872@gmail.com" \
    jenkins:alpine