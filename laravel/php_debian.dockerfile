FROM php:8.2-fpm

# copy conf file to the container server configuration
ADD ./php/www.conf /usr/local/etc/php-fpm.d/www.conf

# getting docker-compose arguments 
ARG USER
ARG UID

# Establecer contraseña de root
RUN echo 'root:12345' | chpasswd

#############################
#### nginx configuration ####
#############################
RUN groupadd -g ${UID} laravel && useradd -G laravel -s /bin/sh -d /home/${USER} ${USER}
#giving user permissions on the folder
RUN chown -R ${USER}:laravel /var/www
### /. nginx configuration ###
##############################

##############################
#### apache configuration ####
##############################
#RUN useradd -G www-data,root -u $UID -d /home/$USER $USER
#giving user permissiions on the folder
#RUN chown -R $USER:www-data /var/www
### /. apache configuration ###
###############################

# Set password to the user
RUN echo $USER:'12345' | chpasswd

# making working directory
RUN mkdir -p /var/www

# copy local directory to the container directory
ADD ./app_volume /var/www

# installing necessary php extenssions
RUN apt-get update && apt-get install -y \
    sudo \
    build-essential \
    libpng-dev \
    libjpeg62-turbo-dev \
    libfreetype6-dev \
    locales \
    zip \
    jpegoptim optipng pngquant gifsicle \
    nano \
    unzip \
    curl \
    libonig-dev \
    libzip-dev \
    libgd-dev
# Clear cache
RUN apt-get clean && rm -rf /var/lib/apt/lists/*

# Install extensions
RUN docker-php-ext-install pdo_mysql mbstring zip exif pcntl
RUN docker-php-ext-configure gd --with-external-gd
RUN docker-php-ext-install gd

# add composer if necessary
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

# add the user to sudoers group
RUN usermod -aG sudo $USER

# Set sudo password to the user
RUN echo '%sudo ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers

# change user to the user created
USER $USER