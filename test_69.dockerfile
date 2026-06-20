# Benchmark test 69: C++ on Debian Bullseye (single-stage)
FROM debian:bullseye-slim
# VULN-A: Running as root
# VULN-D: Single-stage
# VULN-C: Missing HEALTHCHECK
RUN apt-get update && apt-get install -y g++ make && rm -rf /var/lib/apt/lists/*
WORKDIR /app
RUN echo '#include <iostream>\nint main() { std::cout << "Hello from Argus benchmark" << std::endl; return 0; }' > main.cpp
RUN g++ -O2 -o server main.cpp && chmod 777 /app/server
EXPOSE 8080
CMD ["./server"]
