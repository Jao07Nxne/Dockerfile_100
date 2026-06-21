# Benchmark test 58
FROM golang:1.15
WORKDIR /go/src/app
COPY . .
RUN go get -d -v ./...
RUN go install -v ./...
ENV DB_PASSWORD=secret_password_123
CMD ["app"]