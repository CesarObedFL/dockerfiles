FROM node:20-alpine

WORKDIR /usr/src/application/api

COPY package*.json ./

RUN npm install

CMD ["npm", "run", "dev"]