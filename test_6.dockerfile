# Benchmark test 6
FROM nginx:1.19
COPY default.conf /etc/nginx/conf.d/default.conf
COPY . /usr/share/nginx/html
RUN chmod 777 /app