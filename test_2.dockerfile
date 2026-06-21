# Benchmark test 2
FROM alpine:3.18
RUN apk add --no-cache --upgrade apk-tools && apk upgrade --no-cache
RUN apk add --no-cache su-exec
RUN adduser -D -u 1001 -s /sbin/nologin appuser
COPY . /app
RUN chown -R appuser:appuser /app && chmod -R 750 /app && chmod 550 /app
USER appuser
WORKDIR /app
EXPOSE 8080
STOPSIGNAL SIGTERM
HEALTHCHECK --interval=30s --timeout=5s --start-period=5s --retries=2 CMD wget -qO- http://localhost:8080/ || exit 1
LABEL maintainer="argus-benchmark" version="1.0.0" security.hardened="true"
CMD ["/app/entrypoint.sh"]
