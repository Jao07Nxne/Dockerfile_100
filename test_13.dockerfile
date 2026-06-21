# Benchmark test 13: NestJS on Debian Bookworm
FROM debian:bookworm-slim
ENV DEBIAN_FRONTEND=noninteractive
# VULN-A: Running as root
# VULN-C: npm cache not cleaned
# VULN-C: Missing HEALTHCHECK
RUN apt-get update && apt-get install -y curl gnupg && rm -rf /var/lib/apt/lists/*
RUN curl -fsSL https://deb.nodesource.com/setup_16.x | bash -
RUN apt-get update && apt-get install -y nodejs && ln -s /usr/bin/nodejs /usr/local/bin/node || true
WORKDIR /app
COPY . .
RUN npm install -g @nestjs/cli@8.0.0
RUN npm install @nestjs/core@8.0.0 @nestjs/common@8.0.0
EXPOSE 3000
CMD ["node", "dist/main.js"]
