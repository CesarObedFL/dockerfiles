FROM node:20-alpine

WORKDIR /usr/src/application/api

COPY package*.json ./

# Instalación de dependencias
RUN apk add --no-cache \
    build-base \
    git \
    libffi-dev \
    libpng-dev \
    libjpeg-dev \
    zlib-dev \
    g++ \
    make \
    gcc

# Instalación de Node.js
RUN npm install -g npm

# Instalación de Sass
RUN npm install -g sass


CMD ["npm", "run", "dev"]