FROM php:8.2-fpm-alpine

ADD ./php/www.conf /usr/local/etc/php-fpm.d/www.conf

RUN apk add nano openrc

RUN addgroup -g 1000 laravel && adduser -G laravel -g laravel -s /bin/sh -D laravel

RUN mkdir -p /var/www

ADD ./app_volume /var/www

RUN docker-php-ext-install pdo pdo_mysql

RUN chown -R laravel:laravel /var/www
