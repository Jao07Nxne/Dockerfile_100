# Benchmark test 20: Express on Node 14 with chmod 777
FROM node:14
# VULN-A: Running as root + chmod 777
# VULN-B: Outdated Node 14 (EOL)
WORKDIR /app
COPY . .
RUN npm install express@4.17.0 cors@2.8.5
RUN chmod -R 777 /app
EXPOSE 3000
CMD ["node", "server.js"]
