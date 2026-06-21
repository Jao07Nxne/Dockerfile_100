# Benchmark test 9: Express on Node 14-alpine
FROM node:14-alpine
# VULN-A: Running as root
# VULN-B: Outdated Node.js 14-alpine (EOL)
WORKDIR /app
COPY . .
RUN npm install express@4.17.1 morgan@1.10.0
EXPOSE 3000
CMD ["node", "server.js"]
