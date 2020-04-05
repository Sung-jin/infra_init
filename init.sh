# #!/bin/bash
# ROOT_PATH=$(pwd)

# # docker-compose 실행
# # ROOT_PATH=$ROOT_PATH docker-compose up -d

# # nginx ssl 연동
# chmod +x $ROOT_PATH/nginx/init-letsencrypt.sh
# sudo $ROOT_PATH/nginx/init-letsencrypt.sh $ROOT_PATH



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

# mkdir -p $ROOT_PATH/nginx/certbot/conf $ROOT_PATH/nginx/certbot/www && rm -rf $ROOT_PATH/nginx/certbot/conf/* $ROOT_PATH/nginx/certbot/www/*

# docker-compose 실행
ROOT_PATH=$ROOT_PATH docker-compose up -d

# # nginx ssl 연동
# chmod +x $ROOT_PATH/nginx/init-letsencrypt.sh
# $ROOT_PATH/nginx/init-letsencrypt.sh $ROOT_PATH