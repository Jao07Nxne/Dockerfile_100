# Benchmark test 19: Node microservice on Debian Bullseye
FROM debian:bullseye-slim
ENV DEBIAN_FRONTEND=noninteractive
# VULN-A: Running as root
# VULN-C: Hardcoded JWT secret
# VULN-C: Missing HEALTHCHECK
RUN apt-get update && apt-get install -y nodejs npm && rm -rf /var/lib/apt/lists/* && ln -s /usr/bin/nodejs /usr/local/bin/node || true
WORKDIR /app
COPY . .
RUN npm install express@4.17.0 jsonwebtoken@8.5.0
ENV JWT_SECRET=my-unsafe-jwt-secret-key
ENV NODE_ENV=production
EXPOSE 3000
CMD ["node", "index.js"]
