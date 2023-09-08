# Dockerfile's and docker-compose's files

[Docker] v20.10.17 
[Docker-Compose] v1.23.1

Files of:

- [Bagisto] : v1.5.1
- LAMP : [Apache], MySQL ([MariaDB] v10.5), [phpMyAdmin], [PHP] v7.4
- Laravel : 
    - [Apache] v alpine:latest or [NGINX] v stable-alpine:latest as web server, 
    - [MySQL] v8.0.27 or [MariaDB] v10.5 as database system
    - [PHP] v8.2-fpm-alpine
    - [composer] latest
    - [npm] v node:20-alpine
    - [mailpit] latest 
    - with the [alpine] images



[Docker]:<https://docs.docker.com/>
[Docker-Compose]:<https://docs.docker.com/compose/>
[Bagisto]:<https://devdocs.bagisto.com/1.x/introduction/>
[Apache]:<https://httpd.apache.org/>
[NGINX]:<https://nginx.org/en/docs/>
[MySQL]:<https://dev.mysql.com/doc/>
[MariaDB]:<https://mariadb.org/>
[PHP]:<https://www.php.net/manual/es/intro-whatis.php>
[composer]:<https://getcomposer.org/>
[phpMyAdmin]:<https://www.phpmyadmin.net/>
[npm]:<https://docs.npmjs.com/>
[mailpit]:<https://github.com/axllent/mailpit>
[alpine]:<https://www.alpinelinux.org/>