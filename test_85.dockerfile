# Benchmark test 85: Redis 5.0 on Alpine (outdated)
FROM redis:5.0-alpine
# VULN-A: Running as root
# VULN-B: Redis 5.0 (outdated)
# VULN-C: No authentication configured
EXPOSE 6379
CMD ["redis-server"]
