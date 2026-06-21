# Benchmark test 19
FROM golang:1.16-alpine
RUN apk add git
COPY . /app
WORKDIR /app
RUN go build -o main .
RUN chmod 777 /app
CMD ["/app/main"]