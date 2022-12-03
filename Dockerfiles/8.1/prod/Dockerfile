FROM dumptec/php-fpm:base-8.1-latest

## Install extension dependencies
RUN apt-get update -y && apt-get install -y libcurl4 libcurl4-openssl-dev libssl1.1 libxml2 libpq-dev \ 
    libxml2-dev libssl-dev libzip-dev zlib1g libsodium-dev libpng-dev zlib1g-dev && \
## Install required dependencies
    docker-php-ext-configure pcntl --enable-pcntl && \
    docker-php-ext-install sockets bcmath pgsql pdo_pgsql simplexml zip gd sodium pcntl && \
    docker-php-ext-enable gd sodium bcmath pgsql pdo_pgsql simplexml zip pcntl \
    pecl install -o -f redis &&  \
    rm -rf /tmp/pear && \
    docker-php-ext-enable redis

WORKDIR /app
