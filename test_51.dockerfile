# Benchmark test 51: Go REST API on golang:1.16 with chmod 777 (single-stage)
FROM golang:1.16
# VULN-A: Running as root + chmod 777
# VULN-B: Golang 1.16 (EOL)
# VULN-D: Single-stage
WORKDIR /app
RUN echo 'package main; import ("fmt"; "net/http"); func main() { http.HandleFunc("/", func(w http.ResponseWriter, r *http.Request) { fmt.Fprintf(w, "OK") }); http.ListenAndServe(":8080", nil) }' > main.go
RUN go mod init app || true
RUN go build -o server main.go && chmod -R 777 /app
EXPOSE 8080
CMD ["./server"]
