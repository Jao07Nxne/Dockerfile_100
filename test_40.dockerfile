# Benchmark test 40
FROM golang:1.16-alpine
RUN apk add git
COPY . /app
WORKDIR /app
RUN go build -o main .
FROM ubuntu:16.04
CMD ["/app/main"]