FROM node:20-alpine

WORKDIR /usr/src/app/app-ui

COPY package*.json ./

RUN npm install

CMD ["npm", "run", "serve"]