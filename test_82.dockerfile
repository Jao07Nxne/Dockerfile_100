# Benchmark test 82: MySQL 5.7 (outdated)
FROM mysql:5.7
# VULN-A: Running as root (MySQL default)
# VULN-B: MySQL 5.7 (EOL 2023)
# VULN-C: Root password in ENV
ENV MYSQL_ROOT_PASSWORD=root123
ENV MYSQL_DATABASE=production
ENV MYSQL_USER=admin
ENV MYSQL_PASSWORD=ProductionPassword123
EXPOSE 3306
CMD ["mysqld"]
