# Benchmark test 61
FROM golang:1.15
COPY . /go/src/app
RUN go build -o /app /go/src/app/main.go
CMD ["/app"]