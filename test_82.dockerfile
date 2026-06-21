# Benchmark test 82
FROM ubuntu:20.04
RUN apt-get update && apt-get install -y software-properties-common && rm -rf /var/lib/apt/lists/*
RUN apt-get update && apt-get install -y nginx php-fpm php-mysql php-xml php-mbstring php-curl && rm -rf /var/lib/apt/lists/*
RUN apt-get update && apt-get install -y mysql-client postgresql-client redis-tools && rm -rf /var/lib/apt/lists/*
RUN apt-get update && apt-get install -y git subversion mercurial && rm -rf /var/lib/apt/lists/*
RUN apt-get update && apt-get install -y net-tools iputils-ping dnsutils traceroute nmap && rm -rf /var/lib/apt/lists/*
COPY . /var/www/html
RUN chmod -R 777 /var/www/html
ENV MYSQL_ROOT_PASSWORD=root123
ENV POSTGRES_PASSWORD=pg_secret
EXPOSE 80 443
CMD ["nginx", "-g", "daemon off;"]
