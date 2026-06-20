# Benchmark test 16: Express on Ubuntu 20.04 with secrets
FROM ubuntu:20.04
ENV DEBIAN_FRONTEND=noninteractive
# VULN-A: Running as root
# VULN-C: Hardcoded AWS keys
RUN apt-get update && apt-get install -y nodejs npm
WORKDIR /app
COPY . .
RUN npm install express@4.17.0 body-parser@1.19.0
ENV AWS_ACCESS_KEY_ID=AKIAIOSFODNN7EXAMPLE
ENV AWS_SECRET_ACCESS_KEY=wJalrXUtnFEMI/K7MDENG/bPxRfiCYEXAMPLEKEY
EXPOSE 3000
CMD ["node", "server.js"]
