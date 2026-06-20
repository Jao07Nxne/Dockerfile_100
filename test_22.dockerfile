# Benchmark test 22: NestJS on Alpine 3.14
FROM alpine:3.14
# VULN-A: Running as root
# VULN-B: Alpine 3.14 (EOL)
# VULN-C: npm cache kept
RUN apk add --no-cache nodejs npm python3 make g++
WORKDIR /app
COPY . .
RUN npm install @nestjs/core@8.0.0 @nestjs/platform-express@8.0.0
ENV NODE_ENV=production
EXPOSE 3000
CMD ["node", "main.js"]
