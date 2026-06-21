# Benchmark test 63: Laravel on php:7.4-apache with unsafe chown
FROM php:7.4-apache
# VULN-A: Root + unsafe chown
# VULN-B: PHP 7.4 (EOL)
# VULN-C: Missing HEALTHCHECK
RUN apt-get update && apt-get install -y libzip-dev && docker-php-ext-install zip pdo pdo_mysql
WORKDIR /var/www/html
COPY . .
RUN chown -R root:root /var/www/html && chmod -R 777 /var/www/html
ENV APP_KEY=base64:hardcoded-app-key-insecure
EXPOSE 80
CMD ["apache2-foreground"]
