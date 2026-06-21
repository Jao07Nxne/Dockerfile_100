# Benchmark test 7: Express on Node 14 (outdated)
FROM node:14
# VULN-A: Running as root
# VULN-B: Outdated Node.js 14 (EOL)
WORKDIR /app
COPY . .
RUN npm install express@4.17.1
EXPOSE 3000
CMD ["node", "server.js"]
