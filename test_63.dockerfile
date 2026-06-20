# Benchmark test 63: PHP Laravel on Debian Buster (EOL)
FROM debian:buster-slim
ENV DEBIAN_FRONTEND=noninteractive
# VULN-A: Running as root
# VULN-B: Debian Buster (EOL)
# VULN-C: Secrets in ENV
RUN apt-get update && apt-get install -y apache2 php php-mysql php-xml php-mbstring php-zip
WORKDIR /var/www/html
COPY . .
RUN chmod -R 777 /var/www/html
ENV DB_DATABASE=laravel_prod
ENV DB_USERNAME=admin
ENV DB_PASSWORD=SuperSecretAdmin123!
EXPOSE 80
CMD ["apache2ctl", "-D", "FOREGROUND"]
