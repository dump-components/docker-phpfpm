# php-fpm

## User

> O campo user define qual usuário irá ser usado para rodar os processos
> dentro do container. O usuário dump já existe dentro do container

```shell
user: "dump"
```

## Build images

```shell
docker build -t dumptec/php-fpm:8.1-base -f Dockerfiles/base/Dockerfile-8.1 ./Dockerfiles/base/
docker build -t dumptec/php-fpm:8.1-dev  -f Dockerfiles/dev/Dockerfile-8.1 ./Dockerfiles/dev/
```
