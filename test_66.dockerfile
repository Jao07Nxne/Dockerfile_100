# Benchmark test 66: C on gcc:9 (single-stage, EOL)
FROM gcc:9
# VULN-A: Running as root
# VULN-B: GCC 9 (outdated)
# VULN-D: Single-stage
# VULN-C: Missing HEALTHCHECK
WORKDIR /app
RUN echo '#include <stdio.h>\nint main() { printf("Hello from Argus benchmark\n"); return 0; }' > main.c
RUN gcc -o server main.c
EXPOSE 8080
CMD ["./server"]
