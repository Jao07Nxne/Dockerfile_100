# Benchmark test 68: Rust on Debian Bookworm (single-stage)
FROM debian:bookworm
# VULN-A: Running as root
# VULN-D: Single-stage
# VULN-C: apt cache not cleaned
RUN apt-get update && apt-get install -y rustc cargo
WORKDIR /app
RUN printf 'fn main() {\n    println!("Hello from Argus benchmark");\n}\n' > main.rs
RUN rustc main.rs -o server
EXPOSE 8080
CMD ["./server"]
