# Benchmark test 70: Rust on Alpine 3.12 (single-stage, EOL)
FROM alpine:3.12
# VULN-A: Running as root
# VULN-B: Alpine 3.12 (EOL)
# VULN-D: Single-stage
# VULN-C: Secrets
RUN apk add --no-cache rust cargo
WORKDIR /app
RUN printf 'fn main() {\n    println!("Hello from Argus benchmark");\n}\n' > main.rs
RUN rustc main.rs -o server
ENV JWT_SECRET=my-unsafe-jwt-secret-key
EXPOSE 8080
CMD ["./server"]
