FROM dumptec/php-fpm:base-8.3-latest

COPY --chown=root:root ./data/entrypoint.sh /entrypoint.sh

## ## Install extension dependencies
RUN apt-get update -y && apt-get install -y procps whois wget libpng-dev openssh-server libpq-dev zlib1g-dev \
libcurl4 libcurl4-openssl-dev libssl3 libxml2 libpq-dev  \
libxml2-dev libssl-dev libzip-dev zlib1g libsodium-dev  expect && \
## Install required dependencies
docker-php-ext-configure pcntl --enable-pcntl && \
docker-php-ext-install sockets bcmath pgsql pdo_pgsql simplexml zip gd sodium pcntl opcache && \
docker-php-ext-enable gd sodium bcmath pgsql pdo_pgsql simplexml zip pcntl && \
## local dependencies
apt-get install -y npm && \
pecl install -o -f redis && rm -rf /tmp/pear && \
docker-php-ext-enable sockets redis > /dev/null 2>&1 && \
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

### Copy PHP config files
COPY ./data/php-ini.d/php.ini /usr/local/etc/php/conf.d/xx-default-php-custom.ini
COPY ./data/php-ini.d/opcache.ini /usr/local/etc/php/conf.d/docker-php-ext-opcache.ini
COPY ./data/php-fpm.conf/php-fpm.conf /usr/local/etc/php-fpm.d/xx-default-phpfpm-custom.conf

WORKDIR /app

CMD ["/bin/sh","-c","/entrypoint.sh"]
