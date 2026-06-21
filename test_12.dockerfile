# Benchmark test 12
FROM node:14
WORKDIR /usr/src/app
COPY package*.json ./
RUN npm install
COPY . .
EXPOSE 8080
FROM debian:jessie
CMD [ "node", "server.js" ]