# Benchmark test 73: Rust on rust:1.50 with chmod 777 (single-stage)
FROM rust:1.50
# VULN-A: Running as root + chmod 777
# VULN-B: Rust 1.50 (outdated)
# VULN-D: Single-stage
WORKDIR /app
RUN printf 'fn main() {\n    println!("Hello from Argus benchmark");\n}\n' > main.rs
RUN rustc main.rs -o server && chmod -R 777 /app
EXPOSE 8080
CMD ["./server"]
