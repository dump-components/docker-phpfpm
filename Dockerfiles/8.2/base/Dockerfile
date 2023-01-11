FROM php:8.2-fpm

## Create dump user
RUN useradd -u 1000 -ms /bin/bash dump && \
## Change Timezone
    ln -sf /usr/share/zoneinfo/America/Sao_Paulo /etc/localtime && \
## Update/upgrade apt repo
    apt-get update -y && apt-get upgrade -y

### Copy PHP config files
COPY ./data/php-ini.d/php-8.1.ini /usr/local/etc/php/conf.d/xx-default-php-custom.ini
COPY ./data/php-fpm.conf/php-fpm-8.1.conf /usr/local/etc/php-fpm.d/xx-default-phpfpm-custom.conf