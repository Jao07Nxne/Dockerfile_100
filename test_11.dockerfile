# Benchmark test 11: Next.js on Node 12-alpine (severely outdated)
FROM node:12-alpine
# VULN-A: Running as root
# VULN-B: Node 12-alpine (EOL 2022)
# VULN-C: Hardcoded secrets
WORKDIR /app
COPY . .
RUN npm install next@10.0.0 react@17.0.0 react-dom@17.0.0
ENV NEXT_PUBLIC_API_KEY=sk-public-abc123
ENV DATABASE_URL=postgres://admin:password@db:5432/app
EXPOSE 3000
CMD ["npm", "start"]
