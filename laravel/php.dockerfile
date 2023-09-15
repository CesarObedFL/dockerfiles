FROM php:8.2-fpm-alpine

# copy conf file to the container server configuration
ADD ./php/www.conf /usr/local/etc/php-fpm.d/www.conf

#installing necessary programs in alpine
RUN apk add nano openrc

# getting docker-compose arguments 
ARG USER
ARG UID

RUN addgroup -g ${UID} laravel && adduser -G laravel -g ${USER} -s /bin/sh -D laravel

# making working directory
RUN mkdir -p /var/www

# copy local directory to the container directory
ADD ./app_volume /var/www

# installing necessary php extenssions
RUN apk update && apk add --no-cache \
    libpng-dev \
    libjpeg-turbo-dev \
    libwebp-dev \
    freetype-dev \
    zlib-dev \
    libzip-dev \
    && docker-php-ext-configure gd \
    --with-freetype=/usr/include/ \
    --with-jpeg=/usr/include/ \
    --with-webp=/usr/include/ \
    && docker-php-ext-install -j$(nproc) gd pdo pdo_mysql zip calendar

#giving user permissions on the folder
RUN chown -R laravel:laravel /var/www