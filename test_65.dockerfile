# Benchmark test 65: Rust on rust:1.50 (single-stage, EOL)
FROM rust:1.50
# VULN-A: Running as root
# VULN-B: Rust 1.50 (outdated)
# VULN-D: Single-stage bloated
WORKDIR /app
RUN printf 'fn main() {\n    println!("Hello from Argus benchmark");\n}\n' > main.rs
RUN rustc main.rs -o server
EXPOSE 8080
CMD ["./server"]
