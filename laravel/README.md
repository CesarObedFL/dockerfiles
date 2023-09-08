# docker laravel 


# Technologies

[Docker], [Docker_Compose] with: 
- [Apache] v alpine:latest or [NGINX] v stable-alpine:latest as web server, 
- [MySQL] v8.0.27 or [MariaDB] v10.5 as database system
- [PHP] v8.2-fpm-alpine
- [composer] latest
- [npm] v node:20-alpine
- [mailpit] latest 
- with the [alpine] images

to change between apache or nginx and mysql or mariadb only comment and uncomment the docker-compose.yml file

## running with

```
docker-compose up -d --build
```

to run a terminal interface :  `docker compose run --rm php /bin/sh`
to create a project vía composer : `docker compose run --rm composer create-project laravel/laravel`
to clone a project : clone the project normally inside the app_volume carpet and `docker compose run --rm composer install` or `composer update`
to run artisan commands : `docker compose runu --rm artisan command`
to give permission run a terminal and : `chown -R laravel:laravel /var/www`



[Docker]:<https://docs.docker.com/>
[Docker_Compose]:<https://docs.docker.com/compose/>
[Apache]:<https://httpd.apache.org/>
[NGINX]:<https://nginx.org/en/docs/>
[MySQL]:<https://dev.mysql.com/doc/>
[MariaDB]:<https://mariadb.org/>
[PHP]:<https://www.php.net/manual/es/intro-whatis.php>
[composer]:<https://getcomposer.org/>
[npm]:<https://docs.npmjs.com/>
[mailpit]:<https://github.com/axllent/mailpit>
[alpine]:<https://www.alpinelinux.org/>