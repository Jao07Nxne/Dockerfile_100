# Benchmark test 49: Go on Alpine 3.12 (single-stage, EOL)
FROM alpine:3.12
# VULN-A: Running as root
# VULN-B: Alpine 3.12 (EOL 2022)
# VULN-D: Single-stage
RUN apk add --no-cache go git
WORKDIR /app
RUN echo 'package main; import ("fmt"; "net/http"); func main() { http.HandleFunc("/", func(w http.ResponseWriter, r *http.Request) { fmt.Fprintf(w, "OK") }); http.ListenAndServe(":8080", nil) }' > main.go
RUN go build -o server main.go
EXPOSE 8080
CMD ["./server"]
