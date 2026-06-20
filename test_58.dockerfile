# Benchmark test 58: PHP-FPM + Nginx on Debian Bullseye
FROM debian:bullseye
ENV DEBIAN_FRONTEND=noninteractive
# VULN-A: Running as root
# VULN-C: Hardcoded secrets
# VULN-C: Missing HEALTHCHECK
RUN apt-get update && apt-get install -y nginx php-fpm php-mysql php-curl php-json php-mbstring
COPY nginx.conf /etc/nginx/sites-available/default
WORKDIR /var/www/html
COPY . .
RUN chmod -R 777 /var/www/html
ENV MYSQL_ROOT_PASSWORD=root123
ENV PHP_MEMORY_LIMIT=256M
EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]
