FROM php:8.2-fpm-alpine

# copy conf file to the container server configuration
ADD ./php/www.conf /usr/local/etc/php-fpm.d/www.conf

#installing necessary programs in alpine
RUN apk add nano openrc

# getting docker-compose arguments 
ARG USER
ARG UID



### nginx configuration ###
RUN addgroup -g ${UID} laravel && adduser -G laravel -g ${USER} -s /bin/sh -D ${USER}
# making working directory
RUN mkdir -p /var/www
#giving user permissions on the folder
RUN chown -R ${USER}:laravel /var/www
### /. nginx configuration ###



### apache configuration ###
RUN adduser -G www-data -u ${UID} -s /bin/sh -D -S ${USER}
#giving user permissiions on the folder
RUN chmod -R 775 /var/www
RUN chown -R ${USER}:www-data /var/www
### /. apache configuration ###



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
    && docker-php-ext-install -j$(nproc) gd pdo pdo_mysql zip calendar mysqli