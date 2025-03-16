FROM php:8.1.31-fpm-alpine3.21

# docker-php-entrypoint     docker-php-ext-enable     docker-php-source
# docker-php-ext-configure  docker-php-ext-install

RUN docker-php-ext-install pdo_mysql