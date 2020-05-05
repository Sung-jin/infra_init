#!/bin/bash
if [ $(find cloud-config-server/docker -name cloud-config-server) ]
then
    docker stop cloud-config-server && docker rm cloud-config-server
    docker rmi $(docker images |grep 'cloud-config-server')
    sed -i "s/DOMAIN/$1/g" docker-compose.yml
    docker-compose up -d
else
	echo "config key doesn't exist. plz check key."
    exit
fi