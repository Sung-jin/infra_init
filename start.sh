#!/bin/bash
if [ "$EUID" -ne 0 ]
  then echo "Please run as root"
  exit
fi

if [ "$(docker ps -q)" ]; then
    docker stop $(docker ps -a -q)
    docker rm $(docker ps -a -q)
fi

cd $(dirname "$0")
ROOT_PATH=$(pwd)

sed -i "s/DOMAIN/$DOMAIN/g" $ROOT_PATH/docker-compose.yml

# docker-compose 실행
ROOT_PATH=$ROOT_PATH docker-compose up -d