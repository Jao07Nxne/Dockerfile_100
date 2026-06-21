# Benchmark test 96
FROM alpine:3.19
RUN apk add --no-cache nginx openssl
RUN openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout /etc/ssl/private/nginx.key -out /etc/ssl/certs/nginx.crt -subj "/CN=localhost"
COPY nginx.conf /etc/nginx/http.d/default.conf
COPY . /var/www/localhost/htdocs
RUN chmod -R 755 /var/www/localhost/htdocs
EXPOSE 443
HEALTHCHECK --interval=30s --timeout=5s CMD wget -qO- https://localhost/ || exit 1
CMD ["nginx", "-g", "daemon off;"]
