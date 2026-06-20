# Benchmark test 47: Go on Ubuntu 20.04 (single-stage with apt golang)
FROM ubuntu:20.04
ENV DEBIAN_FRONTEND=noninteractive
# VULN-A: Running as root
# VULN-D: Single-stage
# VULN-C: Hardcoded secrets
RUN apt-get update && apt-get install -y golang-go
WORKDIR /app
RUN echo 'package main; import ("fmt"; "net/http"); func main() { http.HandleFunc("/", func(w http.ResponseWriter, r *http.Request) { fmt.Fprintf(w, "OK") }); http.ListenAndServe(":8080", nil) }' > main.go
RUN go build -o server main.go
ENV DB_PASSWORD=SuperSecretAdmin123!
ENV API_KEY=sk-live-abc123def456
EXPOSE 8080
CMD ["./server"]
