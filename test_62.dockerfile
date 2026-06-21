# Benchmark test 62: PHP-FPM on Alpine 3.10 (EOL)
FROM alpine:3.10
# VULN-A: Running as root
# VULN-B: Alpine 3.10 (EOL)
# VULN-C: Hardcoded API key
RUN apk add --no-cache php7 php7-fpm php7-mysqli php7-json php7-mbstring php7-session
WORKDIR /var/www/html
COPY . .
RUN chmod -R 777 /var/www/html
ENV API_KEY=sk-live-abc123def456
ENV DB_PASSWORD=SuperSecretAdmin123!
EXPOSE 9000
CMD ["php-fpm7", "-F"]
