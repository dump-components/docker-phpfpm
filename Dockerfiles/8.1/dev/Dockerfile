FROM dumptec/php-fpm:8.1-base

### Add xdebug config
COPY ./data/php-ini.d/php-8.1-xdebug.ini /usr/local/etc/php/conf.d/default-php-8.1-xdebug.ini

# ## Install extension dependencies
RUN apt-get update -y && apt-get install -y procps whois wget libpng-dev openssh-server libpq-dev zlib1g-dev \
libcurl4 libcurl4-openssl-dev libssl1.1 libxml2 libpq-dev  \ 
libxml2-dev libssl-dev libzip-dev zlib1g libsodium-dev  expect && \
## Install required dependencies
docker-php-ext-install sockets bcmath pgsql pdo_pgsql simplexml zip gd sodium && \
docker-php-ext-enable gd sodium bcmath pgsql pdo_pgsql simplexml zip && \
## local dependencies
apt-get install -y npm && \
pecl install xdebug && \ 
docker-php-ext-enable xdebug sockets > /dev/null 2>&1 && \
## Ssh config to use in development
mkdir /var/run/sshd && \
echo "dump:$(mkpasswd -s </dev/null)" | chpasswd -e && \
sed -i 's/#PermitEmptyPasswords no/PermitEmptyPasswords yes/' /etc/ssh/sshd_config  && \
## Composer install 
wget https://getcomposer.org/download/2.4.3/composer.phar && chmod +x ./composer.phar && mv composer.phar /usr/local/bin/composer

RUN ssh-keygen -t ed25519 -f ~/.ssh/id_ed25519

WORKDIR /app