FROM dumptec/php-fpm:8.1-base

## Install extension dependencies
RUN apt-get update -y && apt-get install -y libcurl4 libcurl4-openssl-dev libssl1.1 libxml2 libpq-dev \ 
    libxml2-dev libssl-dev libzip-dev zlib1g libsodium-dev libpng-dev zlib1g-dev && \
## Install required dependencies
    docker-php-ext-install sockets bcmath pgsql pdo_pgsql simplexml zip gd sodium && \
    docker-php-ext-enable gd sodium bcmath pgsql pdo_pgsql simplexml zip 

WORKDIR /app
