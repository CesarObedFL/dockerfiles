FROM php:8.2-fpm-alpine

# copy conf file to the container server configuration
ADD ./php/www.conf /usr/local/etc/php-fpm.d/www.conf

# getting docker-compose arguments 
ARG USER
ARG UID

# installing necessary programs in alpine
RUN apk add nano openrc
RUN apk add --no-cache --upgrade bash

# to execute sudo: sudo -u <my-user> <my command>
RUN set -ex && apk --no-cache add sudo 

# set root password
RUN echo 'root:12345' | chpasswd

#############################
#### nginx configuration ####
#############################
RUN addgroup -g ${UID} laravel && adduser -G laravel -g ${USER} -s /bin/sh -D ${USER}
# making working directory
RUN mkdir -p /var/www
#giving user permissions on the folder
RUN chown -R ${USER}:laravel /var/www
### /. nginx configuration ###
##############################


##############################
#### apache configuration ####
##############################
RUN adduser -G www-data -u ${UID} -s /bin/sh -D -S ${USER}
#giving user permissiions on the folder
RUN chmod -R 775 /var/www
RUN chown -R ${USER}:www-data /var/www
### /. apache configuration ###
###############################

# set user password
RUN echo $USER:'12345' | chpasswd

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
    libsodium-dev \
    && docker-php-ext-configure gd --enable-gd \
    --with-freetype=/usr/include/ \
    --with-jpeg=/usr/include/ \
    --with-webp=/usr/include/ \
    && docker-php-ext-install -j$(nproc) gd pdo pdo_mysql zip calendar mysqli bz2 sodium

# add composer if necessary
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

# add the user to sudoers group
RUN echo "$USER ALL=(ALL) ALL" > /etc/sudoers.d/$USER && chmod 0440 /etc/sudoers.d/$USER

# change user to the user created
USER ${USER}