# php-fpm

## User

> O campo user define qual usuário irá ser usado para rodar os processos
> dentro do container. O usuário dump já existe dentro do container com o uid 1000

```shell
user: "dump"
```

## Build images

```shell
## base
docker build -t dumptec/php-fpm:8.1-base -f Dockerfiles/base/Dockerfile.8.1 ./Dockerfiles/base/

## development
docker build -t dumptec/php-fpm:8.1-dev  -f Dockerfiles/dev/Dockerfile.8.1 ./Dockerfiles/dev/

## production
docker build -t dumptec/php-fpm:8.1  -f Dockerfiles/prod/Dockerfile.8.1 ./Dockerfiles/prod/
```

## Arquivos de configuração

> Os arquivos de configuração da imagem ficam nas pastas abaixo

* /usr/local/etc/php/conf.d/
* /usr/local/etc/php-fpm.d/
