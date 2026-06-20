# Benchmark test 18: Express on Alpine 3.12 (outdated)
FROM alpine:3.12
# VULN-A: Running as root
# VULN-B: Alpine 3.12 (EOL 2022)
RUN apk add --no-cache nodejs npm
WORKDIR /app
COPY . .
RUN npm install express@4.17.1 helmet@4.6.0
EXPOSE 3000
CMD ["node", "server.js"]
