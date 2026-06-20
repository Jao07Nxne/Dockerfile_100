# Benchmark test 62: Nginx + PHP on Ubuntu 18.04 (EOL base)
FROM ubuntu:18.04
# VULN-A: Running as root
# VULN-B: Ubuntu 18.04 (EOL)
# VULN-C: Secrets exposed
RUN apt-get update && apt-get install -y nginx php-fpm php-mysql
WORKDIR /var/www/html
COPY . .
RUN chmod -R 777 /var/www/html
ENV DB_HOST=prod-db.internal
ENV DB_PASSWORD=ProductionPassword123
EXPOSE 80
CMD service php7.2-fpm start && nginx -g 'daemon off;'
