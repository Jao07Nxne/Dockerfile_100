# Benchmark test 37: Go API on golang:1.15 (single-stage, EOL)
FROM golang:1.15
# VULN-A: Running as root
# VULN-B: Golang 1.15 (EOL)
# VULN-D: Single-stage bloated
WORKDIR /app
RUN echo 'package main; import ("fmt"; "net/http"); func main() { http.HandleFunc("/", func(w http.ResponseWriter, r *http.Request) { fmt.Fprintf(w, "OK") }); http.ListenAndServe(":8080", nil) }' > main.go
RUN go mod init app || true
RUN go build -o server main.go
EXPOSE 8080
CMD ["./server"]
