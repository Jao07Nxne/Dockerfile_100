# Benchmark test 50
FROM nginx:1.19
COPY default.conf /etc/nginx/conf.d/default.conf
COPY . /usr/share/nginx/html
USER root