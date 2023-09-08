FROM php:8.2-fpm-alpine

ADD ./php/www.conf /usr/local/etc/php-fpm.d/www.conf

RUN apk nano openrc

RUN addgroup -g 1000 laravel && adduser -G laravel -g laravel -s /bin/sh -D laravel

RUN mkdir -p /var/www

ADD ./src /var/www

#RUN docker-php-ext-install pdo pdo_mysql

RUN docker-php-ext-install php8.2-bcmath php8.2-bz2 php8.2-calendar php8.2-cgi php8.2-common php8.2-ctype php8.2-curl php8.2-dba php8.2-dbg php8.2-dev php8.2-doc php8.2-dom php8.2-embed php8.2-enchant php8.2-exif php8.2-fileinfo php8.2-fpm php8.2-ftp php8.2-gd php8.2-gettext php8.2-gmp php8.2-iconv php8.2-imap php8.2-intl php8.2-json php8.2-ldap php8.2-litespeed php8.2-mbstring php8.2-mysqli php8.2-mysqlnd php8.2-odbc php8.2-opcache php8.2-openssl php8.2-pcntl php8.2-pdo php8.2-pdo_dblib php8.2-pdo_mysql php8.2-pdo_odbc php8.2-pdo_pgsql php8.2-pdo_sqlite php8.2-pear php8.2-pgsql php8.2-phar php8.2-phpdbg php8.2-posix php8.2-pspell php8.2-recode php8.2-session php8.2-shmop php8.2-simplexml php8.2-snmp php8.2-soap php8.2-sockets php8.2-sodium php8.2-sqlite3 php8.2-static php8.2-sysvmsg php8.2-sysvsem php8.2-sysvshm php8.2-tidy php8.2-tokenizer php8.2-wddx php8.2-xml php8.2-xmlreader php8.2-xmlrpc php8.2-xmlwriter php8.2-xsl php8.2-zip php8.2-pecl-xhprof php8.2-pecl-xhprof-assets php8.2-pecl-uuid php8.2-pecl-protobuf php8.2-pecl-xdebug php8.2-pecl-memcached php8.2-pecl-oauth php8.2-pecl-ssh2 php8.2-pecl-imagick php8.2-pecl-imagick-dev php8.2-pecl-vips php8.2-pecl-ast php8.2-pecl-event php8.2-pecl-redis php8.2-phalcon php8.2-pecl-apcu php8.2-pecl-timezonedb php8.2-pecl-mcrypt php8.2-pecl-mailparse php8.2-pecl-msgpack php8.2-pecl-yaml php8.2-pecl-zmq php8.2-brotli php8.2-pecl-amqp php8.2-pecl-couchbase php8.2-pecl-gmagick php8.2-pecl-igbinary php8.2-pecl-lzf

RUN chown -R laravel:laravel /var/www
