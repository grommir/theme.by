FROM php:7.0-apache
RUN apt update

RUN apt-get update && \
     apt-get install -y \
        libzip-dev libpng-dev \
        zlib1g-dev libwebp-dev libxpm-dev libjpeg-dev libfreetype6-dev \
    && docker-php-ext-install zip \
    && docker-php-ext-install mysqli \
    && docker-php-ext-configure gd \
        --with-gd \
        --with-webp-dir \
        --with-jpeg-dir \
        --with-png-dir \
        --with-zlib-dir \
        --with-xpm-dir \
        --with-freetype-dir \
        --enable-gd-native-ttf\
    && docker-php-ext-install gd
