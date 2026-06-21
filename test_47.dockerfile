# Benchmark test 47: Go microservice on golang:1.15-alpine (single-stage)
FROM golang:1.15-alpine
# VULN-A: Running as root
# VULN-B: Golang 1.15 (EOL)
# VULN-D: Single-stage
# VULN-C: AWS creds
WORKDIR /app
RUN echo 'package main; import ("fmt"; "net/http"); func main() { http.HandleFunc("/", func(w http.ResponseWriter, r *http.Request) { fmt.Fprintf(w, "OK") }); http.ListenAndServe(":8080", nil) }' > main.go
RUN go mod init app || true
RUN go build -o server main.go
ENV AWS_ACCESS_KEY_ID=AKIAIOSFODNN7EXAMPLE
ENV AWS_SECRET_ACCESS_KEY=wJalrXUtnFEMI/K7MDENG/bPxRfiCYEXAMPLEKEY
EXPOSE 8080
CMD ["./server"]
