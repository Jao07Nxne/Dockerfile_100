# Benchmark test 71: C on Ubuntu 18.04 (single-stage, EOL base)
FROM ubuntu:18.04
ENV DEBIAN_FRONTEND=noninteractive
# VULN-A: Running as root
# VULN-B: Ubuntu 18.04 (EOL)
# VULN-D: Single-stage
# VULN-C: AWS credentials
RUN apt-get update && apt-get install -y gcc make
WORKDIR /app
RUN echo '#include <stdio.h>\nint main() { printf("Hello from Argus benchmark\n"); return 0; }' > main.c
RUN gcc -o server main.c
ENV AWS_ACCESS_KEY_ID=AKIAIOSFODNN7EXAMPLE
ENV AWS_SECRET_ACCESS_KEY=wJalrXUtnFEMI/K7MDENG/bPxRfiCYEXAMPLEKEY
EXPOSE 8080
CMD ["./server"]
