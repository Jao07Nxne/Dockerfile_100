# Benchmark test 56
FROM php:8.2-apache

WORKDIR /var/www/html
COPY index.html heavy.php ./

EXPOSE 80