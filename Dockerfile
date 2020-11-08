FROM php:7.3-fpm

WORKDIR /var/www/monsite

COPY monsite/ .

RUN docker-php-ext-install mysqli
