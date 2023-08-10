FROM dumptec/php-fpm:base-8.2-latest

COPY ./data/php-fpm.conf/php-fpm-8.2.conf /usr/local/etc/php-fpm.d/xx-default-phpfpm-custom.conf

### Add xdebug config
COPY ./data/php-ini.d/php-8.2-xdebug.ini /usr/local/etc/php/conf.d/default-php-8.2-xdebug.ini
COPY --chown=root:root ./data/entrypoint.sh /entrypoint.sh

## ## Install extension dependencies
RUN apt-get update -y && apt-get install -y procps whois wget libpng-dev openssh-server libpq-dev zlib1g-dev \
libcurl4 libcurl4-openssl-dev libssl3 libxml2 libpq-dev  \ 
libxml2-dev libssl-dev libzip-dev zlib1g libsodium-dev  expect && \
## Install required dependencies
docker-php-ext-configure pcntl --enable-pcntl && \
docker-php-ext-install sockets bcmath pgsql pdo_pgsql simplexml zip gd sodium pcntl && \
docker-php-ext-enable gd sodium bcmath pgsql pdo_pgsql simplexml zip pcntl && \
## local dependencies
apt-get install -y npm && \
pecl install -o -f redis xdebug && rm -rf /tmp/pear && \
docker-php-ext-enable xdebug sockets redis > /dev/null 2>&1 && \
## Ssh config to use in development
mkdir /var/run/sshd && \
echo "dump:$(mkpasswd -s </dev/null)" | chpasswd -e && \
sed -i 's/#PermitEmptyPasswords no/PermitEmptyPasswords yes/' /etc/ssh/sshd_config  && \
## Composer install 
wget https://getcomposer.org/download/2.4.3/composer.phar && chmod +x ./composer.phar && mv composer.phar /usr/local/bin/composer && \
## Generate ssh-keygen
yes | ssh-keygen -t ed25519 -f ~/.ssh/id_ed25519 && \ 
mkdir /home/dump/.ssh && yes | ssh-keygen -t ed25519 -f /home/dump/.ssh/id_ed25519 && \ 
chown dump:dump -R /home/dump/.ssh && chmod +x /entrypoint.sh

RUN echo "root:root" | chpasswd

WORKDIR /app

CMD ["/bin/sh","-c","/entrypoint.sh"]
