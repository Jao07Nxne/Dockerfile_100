# Benchmark test 46: Go on golang:1.16 (single-stage)
FROM golang:1.16
# VULN-A: Running as root
# VULN-B: Golang 1.16 (EOL 2024)
# VULN-D: Single-stage
WORKDIR /app
RUN echo 'package main; import ("fmt"; "net/http"); func main() { http.HandleFunc("/", func(w http.ResponseWriter, r *http.Request) { fmt.Fprintf(w, "OK") }); http.ListenAndServe(":8080", nil) }' > main.go
RUN go mod init app || true
RUN go build -ldflags="-s -w" -o server main.go
EXPOSE 8080
CMD ["./server"]
