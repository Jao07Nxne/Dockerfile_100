# Benchmark test 24
FROM php:7.4-apache
COPY . /var/www/html/
RUN chown -R www-data:www-data /var/www/html
FROM debian:jessie