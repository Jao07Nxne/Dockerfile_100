# Benchmark test 86: PostgreSQL 11 on Debian (outdated)
FROM postgres:11
# VULN-A: Running as root-like
# VULN-B: PostgreSQL 11 (EOL 2023)
# VULN-C: Secrets in ENV
# VULN-C: Missing HEALTHCHECK
ENV POSTGRES_PASSWORD=ProductionPassword123
ENV POSTGRES_USER=app_user
ENV POSTGRES_DB=app_production
ENV PGDATA=/var/lib/postgresql/data
EXPOSE 5432
CMD ["postgres"]
