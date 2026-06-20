# Benchmark test 56: WordPress on php:7.4-fpm + Nginx
FROM php:7.4-fpm
# VULN-A: Running as root
# VULN-B: PHP 7.4 (EOL)
# VULN-C: DB credentials in ENV
RUN apt-get update && apt-get install -y libpng-dev libjpeg-dev libfreetype6-dev
RUN docker-php-ext-configure gd --with-freetype --with-jpeg && docker-php-ext-install gd mysqli
WORKDIR /var/www/html
COPY . .
RUN chmod -R 777 /var/www/html
ENV WORDPRESS_DB_HOST=prod-db:3306
ENV WORDPRESS_DB_USER=admin
ENV WORDPRESS_DB_PASSWORD=ProductionPassword123
EXPOSE 9000
CMD ["php-fpm"]
