# Benchmark test 55: PHP Laravel on php:7.4-apache (EOL)
FROM php:7.4-apache
# VULN-A: Running as root (www-data would be safer)
# VULN-B: PHP 7.4 (EOL 2022)
# VULN-C: Hardcoded DB password
RUN apt-get update && apt-get install -y libpng-dev libonig-dev libxml2-dev
RUN docker-php-ext-install pdo_mysql mbstring exif pcntl bcmath gd
WORKDIR /var/www/html
COPY . .
RUN chown -R www-data:www-data /var/www/html && chmod -R 777 /var/www/html/storage
ENV DB_PASSWORD=SuperSecretAdmin123!
ENV APP_KEY=base64:insecure-app-key-abc123
EXPOSE 80
CMD ["apache2-foreground"]
