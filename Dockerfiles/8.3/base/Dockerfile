FROM php:8.3

## Create dump user
RUN useradd -u 1000 -ms /bin/bash dump && \
## Change Timezone
    ln -sf /usr/share/zoneinfo/America/Sao_Paulo /etc/localtime && \
## Update/upgrade apt repo
    apt-get update -y && apt-get upgrade -y

### Copy PHP config files
COPY ./data/php-ini.d/php.ini /usr/local/etc/php/conf.d/xx-default-php-custom.ini
COPY ./data/php-fpm.conf/php-fpm.conf /usr/local/etc/php-fpm.d/xx-default-phpfpm-custom.conf

## Enable legacy openssl algorithms
RUN <<EOF cat >> /etc/ssl/openssl.cnf
openssl_conf = openssl_init

[openssl_init]
providers = provider_sect

[provider_sect]
default = default_sect
legacy = legacy_sect

[default_sect]
activate = 1

[legacy_sect]
activate = 1
EOF
