# Benchmark test 72: C++ on Debian Buster (EOL base, single-stage)
FROM debian:buster-slim
ENV DEBIAN_FRONTEND=noninteractive
# VULN-A: Running as root
# VULN-B: Debian Buster (EOL)
# VULN-D: Single-stage
# VULN-C: DB password
RUN apt-get update && apt-get install -y g++ make
WORKDIR /app
RUN echo '#include <iostream>\nint main() { std::cout << "Hello from Argus benchmark" << std::endl; return 0; }' > main.cpp
RUN g++ -std=c++17 -o server main.cpp
ENV DB_PASSWORD=SuperSecretAdmin123!
EXPOSE 8080
CMD ["./server"]
