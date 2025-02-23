FROM node:lts-alpine

WORKDIR /app

COPY ../package*.json /app

RUN npm install -g http-server

COPY ../ .

RUN npm run build

EXPOSE 8080
CMD [ "http-server", "dist" ]