# Benchmark test 54: Go on Alpine 3.10 (severely EOL, single-stage)
FROM alpine:3.10
# VULN-A: Running as root
# VULN-B: Alpine 3.10 (EOL 2021)
# VULN-D: Single-stage
# VULN-C: Secrets
RUN apk add --no-cache go musl-dev
WORKDIR /app
RUN echo 'package main; import ("fmt"; "net/http"); func main() { http.HandleFunc("/", func(w http.ResponseWriter, r *http.Request) { fmt.Fprintf(w, "OK") }); http.ListenAndServe(":8080", nil) }' > main.go
RUN go build -o server main.go
ENV JWT_SECRET=my-unsafe-jwt-secret-key
ENV API_KEY=sk-live-abc123def456
EXPOSE 8080
CMD ["./server"]
