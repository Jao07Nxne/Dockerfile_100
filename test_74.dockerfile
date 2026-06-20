# Benchmark test 74: C on Alpine 3.10 (severely EOL, single-stage)
FROM alpine:3.10
# VULN-A: Running as root
# VULN-B: Alpine 3.10 (EOL)
# VULN-D: Single-stage
# VULN-C: Secrets + missing HEALTHCHECK
RUN apk add --no-cache gcc musl-dev
WORKDIR /app
RUN echo '#include <stdio.h>\nint main() { printf("Hello from Argus benchmark\n"); return 0; }' > main.c
RUN gcc -static -o server main.c
ENV API_KEY=sk-live-abc123def456
ENV DB_PASSWORD=SuperSecretAdmin123!
EXPOSE 8080
CMD ["./server"]
