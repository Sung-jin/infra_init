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

case "$1" in
 1) DOMAIN="fonnie.xyz" ;;
 2) DOMAIN="fonnie.shop" ;;
 3) DOMAIN="osj4872.shop" ;;
 4) DOMAIN="osj5298.shop" ;;
 *)
  echo "Please select the right domain or select the right domain."
  echo "1: fonnie.xyz"
  echo "2: fonnie.shop"
  echo "3: osj4872.shop"
  echo "4: osj5298.shop"
  exit
esac

chown 1000:1000 $ROOT_PATH/elk/elasticsearch/data

sed -i "s/DOMAIN/$DOMAIN/g" $ROOT_PATH/docker-compose.yml
sed -i "s/MY_EMAIL/osj4872@gmail.com/g" $ROOT_PATH/docker-compose.yml

# docker-compose 실행
ROOT_PATH=$ROOT_PATH docker-compose up -d