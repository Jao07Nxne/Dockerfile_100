# Benchmark test 59: WordPress on Apache with Debian Bookworm
FROM debian:bookworm
# VULN-A: Running as root
# VULN-C: Secrets + unsafe permissions
RUN apt-get update && apt-get install -y apache2 php libapache2-mod-php php-mysql php-gd php-curl
WORKDIR /var/www/html
COPY . .
RUN chmod -R 777 /var/www/html
ENV WP_DB_USER=wp_admin
ENV WP_DB_PASSWORD=wp_production_secret
ENV AUTH_KEY=insecure-auth-key-123
EXPOSE 80
CMD ["apache2ctl", "-D", "FOREGROUND"]
