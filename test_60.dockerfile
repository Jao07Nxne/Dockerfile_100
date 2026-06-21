# Benchmark test 60
FROM golang:1.16-alpine
RUN apk add git
COPY . /app
WORKDIR /app
RUN go build -o main .
USER root
CMD ["/app/main"]