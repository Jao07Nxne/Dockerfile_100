# Benchmark test 94
FROM alpine:3.20
RUN apk add --no-cache go git ca-certificates
COPY . /app
WORKDIR /app
RUN go mod init app && go build -o /server .
RUN adduser -D -u 1001 appuser && chown -R appuser:appuser /app
USER 1001
EXPOSE 8080
CMD ["/server"]
