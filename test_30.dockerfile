# Benchmark test 30
FROM php:7.4-apache
COPY . /var/www/html/
RUN chown -R www-data:www-data /var/www/html
RUN chmod 777 /app