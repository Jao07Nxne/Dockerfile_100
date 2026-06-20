# Benchmark test 51: Go on Debian Bookworm (single-stage)
FROM debian:bookworm-slim
ENV DEBIAN_FRONTEND=noninteractive
# VULN-A: Running as root
# VULN-D: Single-stage
# VULN-C: Database URL exposed
RUN apt-get update && apt-get install -y golang-go ca-certificates
WORKDIR /app
RUN echo 'package main; import ("fmt"; "net/http"); func main() { http.HandleFunc("/", func(w http.ResponseWriter, r *http.Request) { fmt.Fprintf(w, "OK") }); http.ListenAndServe(":8080", nil) }' > main.go
RUN go build -o server main.go
ENV DATABASE_URL=postgres://admin:password@prod-db:5432/app
EXPOSE 8080
CMD ["./server"]
