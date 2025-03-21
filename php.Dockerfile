FROM php:8.1.31-fpm-alpine3.21

# docker-php-entrypoint     docker-php-ext-configure  docker-php-ext-enable  
# docker-php-ext-install    docker-php-source

RUN docker-php-ext-install pdo_mysql