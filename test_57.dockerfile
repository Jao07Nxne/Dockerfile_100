# Benchmark test 57: Laravel on Ubuntu 20.04 with Apache
FROM ubuntu:20.04
# VULN-A: Running as root
# VULN-C: Secrets + missing HEALTHCHECK
# VULN-C: apt cache not cleaned
RUN apt-get update && apt-get install -y apache2 php libapache2-mod-php php-mysql php-xml php-mbstring php-curl
WORKDIR /var/www/html
COPY . .
RUN chmod -R 777 /var/www/html
ENV APP_ENV=production
ENV DB_CONNECTION=mysql
ENV DB_PASSWORD=laravel_db_secret
EXPOSE 80
CMD ["apache2ctl", "-D", "FOREGROUND"]
