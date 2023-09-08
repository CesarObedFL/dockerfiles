FROM nginx:stable-alpine

ADD ./nginx/app.conf /etc/nginx/conf.d/default.conf

RUN mkdir -p /var/www