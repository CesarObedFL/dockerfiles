FROM node:20-alpine3.17

WORKDIR /usr/src/app/app-ui

COPY package*.json ./

RUN npm install -g @angular/cli @angular-devkit/build-angular && npm install

EXPOSE 4201

CMD ["npm", "start"]