FROM php:7.0-apache
RUN apt update

RUN apt-get update && \
     apt-get install -y \
        libzip-dev \
        && docker-php-ext-install zip \
        && docker-php-ext-install mysqli
