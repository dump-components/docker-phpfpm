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
docker build -t dumptec/php-fpm:base-8.2-latest -f Dockerfiles/8.2/base/Dockerfile ./Dockerfiles/8.2/base/

## development
docker build -t dumptec/php-fpm:dev-8.2-latest -f Dockerfiles/8.2/dev/Dockerfile ./Dockerfiles/8.2/dev/

## production
docker build -t dumptec/php-fpm:prod-8.2-latest -f Dockerfiles/8.2/prod/Dockerfile ./Dockerfiles/8.2/prod/
```

## Arquivos de configuração

> Os arquivos de configuração da imagem ficam nas pastas abaixo

* /usr/local/etc/php/conf.d/
* /usr/local/etc/php-fpm.d/

## Comando útil para deixar o container rodando

```shell
ENTRYPOINT ["tail", "-f", "/dev/null"]
```
