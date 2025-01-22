# docker laravel 


# Technologies

[Docker], [Docker_Compose] with: 
- [PHP] : v8.2-fpm-alpine
- [composer] : latest
- Web Server :
    - [Apache] : v alpine:latest
    - [NGINX] : v stable-alpine:latest
- Database System :
    - [MySQL] : v8.0.27
    - [MariaDB] : v10.5
    - [phpMyAdmin]
- [npm] : v node:20-alpine
- [mailpit] : latest 
- with the [alpine] images

to change between apache or nginx and mysql or mariadb only comment and uncomment the docker-compose.yml file

## deploying with

before deploying in linux systems, you need to set the user and uid args to the docker-compose.yml file in php container & artisan container

```
args:
    - UID=your_os_user_id
    - USER=${USER} (your_user)

```

- create `app_volume` and `db_volume` folders

```
docker-compose up -d --build
```

- to run a terminal interface :  `docker compose run --rm php /bin/sh`
- to create a project vía composer : `docker compose run --rm composer create-project laravel/laravel`
- to clone a project : clone the project normally inside the app_volume carpet 
    - `git clone url-project app_volume`, then copy all the files, hidden files too, to the root of the app_volume carpet
    - run `docker compose run --rm composer install` or `docker compose run --rm composer update`
- to run artisan commands : `docker compose run --rm artisan command`
- to give permission run a terminal and : `chown -R laravel:laravel /var/www`

Open phpmyadmin at [http://localhost:8088](http://localhost:8088)


# laravel app configuration

- in the root of the project, give permission to your os user to the db_volume and app_volume
```
sudo chown -R $USER:$USER \app_volume
sudo chown -R $USER:$USER \db_volume
```

```
sudo chmod -R 777 \app_volume
sudo chmod -R 777 \db_volume
```

- configure the laravel's db connection, where the values are the same of the docker-compose file:
    - docker compose file: 
    ```
    container_name: laravel_database_container
    environment:
        MYSQL_DATABASE: 'laravel_db'
        MYSQL_USER: 'laravel_db_user'
        MYSQL_PASSWORD: 'secret'
        MYSQL_ROOT_PASSWORD: 'secret'
        MYSQL_ROOT_HOST: '%'
    ports: 
        - "3366:3306"
    ```
    - Laravel .env file:
    ```
        DB_CONNECTION=mysql
        DB_HOST=laravel_database_container
        DB_PORT=3306
        DB_DATABASE=laravel_db
        DB_USERNAME=laravel_db_user
        DB_PASSWORD=secret
    ```
- run `docker compose run --rm artisan key:generate`
- run `docker compose run --rm artisan migrate --seed`
- run `docker compose run --rm artisan storage:link`


# laravel scheduling cronjob/crontabs inside alpine linux

- installing the dcron library : `sudo apk add dcron libcap --no-cache`
- run a terminal interface :  `docker compose run --rm php /bin/sh`
- inside the terminal :
    - copy inside the file /etc/crontabs/root with sudo nano : `* * * * * cd /var/www && php artisan schedule:run >> /home/$USER/cron.txt`
    - give permission on the files : `sudo chmod -R 777 /var/www`

# to execute a separate terminal inside the docker compose file containers

`docker exec -it name_container bash`


[Docker]:<https://docs.docker.com/>
[Docker_Compose]:<https://docs.docker.com/compose/>
[Apache]:<https://httpd.apache.org/>
[NGINX]:<https://nginx.org/en/docs/>
[MySQL]:<https://dev.mysql.com/doc/>
[MariaDB]:<https://mariadb.org/>
[phpMyAdmin]:<https://www.phpmyadmin.net/>
[PHP]:<https://www.php.net/manual/es/intro-whatis.php>
[composer]:<https://getcomposer.org/>
[npm]:<https://docs.npmjs.com/>
[mailpit]:<https://github.com/axllent/mailpit>
[alpine]:<https://www.alpinelinux.org/>