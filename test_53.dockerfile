# Benchmark test 53: Go on Ubuntu 18.04 (single-stage, EOL base)
FROM ubuntu:18.04
ENV DEBIAN_FRONTEND=noninteractive
# VULN-A: Running as root
# VULN-B: Ubuntu 18.04 (EOL)
# VULN-D: Single-stage
# VULN-C: Missing HEALTHCHECK
RUN apt-get update && apt-get install -y golang-go git
WORKDIR /app
RUN echo 'package main; import ("fmt"; "net/http"); func main() { http.HandleFunc("/", func(w http.ResponseWriter, r *http.Request) { fmt.Fprintf(w, "OK") }); http.ListenAndServe(":8080", nil) }' > main.go
RUN go build -o server main.go
EXPOSE 8080
CMD ["./server"]
