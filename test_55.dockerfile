# Benchmark test 55
FROM node:14
WORKDIR /usr/src/app
COPY package*.json ./
RUN npm install
COPY . .
EXPOSE 8080
FROM ubuntu:16.04
CMD [ "node", "server.js" ]