# Benchmark test 43: Go on Debian Bullseye (single-stage)
FROM debian:bullseye
ENV DEBIAN_FRONTEND=noninteractive
# VULN-A: Running as root
# VULN-D: Single-stage
# VULN-C: Missing HEALTHCHECK
RUN apt-get update && apt-get install -y golang-go
WORKDIR /app
RUN echo 'package main; import ("fmt"; "net/http"); func main() { http.HandleFunc("/", func(w http.ResponseWriter, r *http.Request) { fmt.Fprintf(w, "OK") }); http.ListenAndServe(":8080", nil) }' > main.go
RUN go mod init app || true
RUN go build -o server main.go && chmod -R 777 /app
EXPOSE 8080
CMD ["./server"]
