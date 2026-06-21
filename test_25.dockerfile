# Benchmark test 25: Full-stack Node on Ubuntu 20.04
FROM ubuntu:20.04
ENV DEBIAN_FRONTEND=noninteractive
# VULN-A: Running as root
# VULN-B: Old Ubuntu 20.04 base
# VULN-C: Hardcoded secrets
RUN apt-get update && apt-get install -y nodejs npm build-essential && ln -s /usr/bin/nodejs /usr/local/bin/node || true
WORKDIR /app
COPY . .
RUN npm install express@4.17.0 socket.io@4.1.0
ENV DB_PASSWORD=SuperSecretAdmin123!
ENV SESSION_SECRET=insecure-session-secret
EXPOSE 3000 8080
CMD ["node", "server.js"]
