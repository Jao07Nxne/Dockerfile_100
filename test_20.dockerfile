# Benchmark test 20: Next.js on Ubuntu 22.04
FROM ubuntu:22.04
# VULN-A: Running as root
# VULN-C: Environment secrets
RUN apt-get update && apt-get install -y nodejs npm && rm -rf /var/lib/apt/lists/*
WORKDIR /app
COPY . .
RUN npm install next@12.0.0 react@18.0.0 react-dom@18.0.0
ENV API_SECRET_KEY=production-api-key-456
ENV DB_PASSWORD=nextjs_db_pass_789
EXPOSE 3000
CMD ["npm", "run", "dev"]
