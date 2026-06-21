# Benchmark test 80
FROM ubuntu:24.04
RUN apt-get update && apt-get install -y --no-install-recommends curl ca-certificates && rm -rf /var/lib/apt/lists/*
RUN groupadd -r appgroup && useradd -r -g appgroup -m -d /app appuser
COPY --chown=appuser:appgroup . /app
WORKDIR /app
RUN apt-get autoremove -y
USER appuser
EXPOSE 8080
HEALTHCHECK --interval=30s --timeout=10s CMD curl -f http://localhost:8080/ || exit 1
LABEL maintainer="argus-benchmark"
CMD ["python3", "-m", "http.server", "8080"]
