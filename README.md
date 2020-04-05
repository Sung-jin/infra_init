# infra_init

초기 인프라 시스템 구축용 저장소

## Used

* Docker-compose
* nginx
* ldap
* jenkins
* nexus 3.0
* api-doc
* mailu

### Docker-compose

```
# Docker
# https://docs.docker.com/install/
# ubuntu 기준 설치

# Uninstall old versions
$ sudo apt-get remove docker docker-engine docker.io containerd runc

$ Install
$ curl -fsSL https://get.docker.com -o get-docker.sh
$ sudo sh get-docker.sh
$ sudo usermod -aG docker your-user
$ sudo docker --version

# Docker-Compose for Linux
$ sudo curl -L "https://github.com/docker/compose/releases/download/{version}/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
$ sudo chmod +x /usr/local/bin/docker-compose
$ sudo ln -s /usr/local/bin/docker-compose /usr/bin/docker-compose
$ docker-compose --version
```

* 19.10 기준 Docker-Compose 1.24.1

###  설정

* [api-doc](./api-doc)
* [ldap](./ldap)
* [nginx](./nginx)

### 명령어

```
# 도커 컨테이너 모두 정지 및 삭제
docker stop $(docker ps -a -q)
docker rm $(docker ps -a -q)
```