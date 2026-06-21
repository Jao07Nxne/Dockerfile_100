# Benchmark test 23: Express on Debian Bookworm with DB secret
FROM debian:bookworm
ENV DEBIAN_FRONTEND=noninteractive
# VULN-A: Running as root
# VULN-C: Database credentials in ENV
# VULN-C: Missing HEALTHCHECK
RUN apt-get update && apt-get install -y nodejs npm && ln -s /usr/bin/nodejs /usr/local/bin/node || true
WORKDIR /app
COPY . .
RUN npm install express@4.18.0 pg@8.7.0
ENV DATABASE_URL=postgres://admin:password@prod-db:5432/app
ENV REDIS_PASSWORD=redis_secret_123
EXPOSE 3000
CMD ["node", "server.js"]
