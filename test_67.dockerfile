# Benchmark test 67: C++ on Ubuntu 20.04 (single-stage)
FROM ubuntu:20.04
ENV DEBIAN_FRONTEND=noninteractive
# VULN-A: Running as root
# VULN-D: Single-stage
# VULN-C: Hardcoded secrets
RUN apt-get update && apt-get install -y g++ make
WORKDIR /app
RUN echo '#include <iostream>\nint main() { std::cout << "Hello from Argus benchmark" << std::endl; return 0; }' > main.cpp
RUN g++ -o server main.cpp
ENV API_KEY=sk-live-abc123def456
EXPOSE 8080
CMD ["./server"]
