FROM dumptec/php-fpm:8.1-base

### Add xdebug config
COPY ./data/php-ini.d/php-8.1-xdebug.ini /usr/local/etc/php/conf.d/default-php-8.1-xdebug.ini

## Install composer
RUN php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');" && \
    php -r "if (hash_file('sha384', 'composer-setup.php') === '55ce33d7678c5a611085589f1f3ddf8b3c52d662cd01d4ba75c0ee0459970c2200a51f492d557530c71c15d8dba01eae') { echo 'Installer verified'; } else { echo 'Installer corrupt'; unlink('composer-setup.php'); } echo PHP_EOL;" && \
    php composer-setup.php && \
    php -r "unlink('composer-setup.php');" && \
    mv composer.phar /usr/local/bin/composer &&  \
## Install extension dependencies
apt install -y expect libcurl4 libcurl4-openssl-dev procps libssl1.1 libxml2 libpq-dev \ 
    libxml2-dev libssl-dev libzip-dev zlib1g libsodium-dev libpng-dev zlib1g-dev && \
## Install required dependencies
docker-php-ext-install sockets bcmath pgsql pdo_pgsql simplexml zip gd sodium && \
docker-php-ext-enable gd sodium bcmath pgsql pdo_pgsql simplexml zip && \
## local dependencies
apt install -y npm && \
pecl install xdebug && \ 
docker-php-ext-enable xdebug sockets > /dev/null 2>&1 && \
## Ssh config to use in development
mkdir /var/run/sshd && \
echo "dump:$(mkpasswd -s </dev/null)" | chpasswd -e && \
sed -i 's/#PermitEmptyPasswords no/PermitEmptyPasswords yes/' /etc/ssh/sshd_config 

WORKDIR /app
