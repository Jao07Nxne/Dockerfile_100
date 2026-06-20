# Benchmark test 81: PostgreSQL 10 (outdated)
FROM postgres:10
# VULN-A: Running as default postgres user (= root-like)
# VULN-B: PostgreSQL 10 (EOL 2022)
# VULN-C: Hardcoded password in ENV
ENV POSTGRES_PASSWORD=SuperSecretAdmin123!
ENV POSTGRES_USER=admin
ENV POSTGRES_DB=production
EXPOSE 5432
CMD ["postgres"]
