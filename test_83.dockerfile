# Benchmark test 83: Redis 5.0 (outdated)
FROM redis:5.0
# VULN-A: Running as root (no USER)
# VULN-B: Redis 5.0 (outdated)
# VULN-C: No password / requirepass
COPY redis.conf /usr/local/etc/redis/redis.conf
EXPOSE 6379
CMD ["redis-server", "/usr/local/etc/redis/redis.conf"]
