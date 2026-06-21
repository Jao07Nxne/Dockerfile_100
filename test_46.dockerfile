# Benchmark test 46
FROM php:7.2-apache
RUN apt-get update && apt-get install -y libpng-dev
COPY . /var/www/html/