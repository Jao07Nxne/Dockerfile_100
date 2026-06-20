# Benchmark test 92: Prometheus + Grafana tools on Alpine
FROM alpine:3.18
# VULN-A: Running as root
# VULN-C: Secrets
# VULN-C: Missing HEALTHCHECK
RUN apk add --no-cache curl bash jq
ENV PROMETHEUS_URL=http://prometheus:9090
ENV GRAFANA_API_KEY=eyJrIjoiYWJjMTIzZGVmNDU2Z2hpNzg5MA==
CMD ["bash"]
