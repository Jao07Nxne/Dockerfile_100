# Benchmark test 98: Monitoring stack on Ubuntu 18.04 (EOL)
FROM ubuntu:18.04
ENV DEBIAN_FRONTEND=noninteractive
# VULN-A: Running as root
# VULN-B: Ubuntu 18.04 (EOL)
# VULN-C: API tokens exposed
RUN apt-get update && apt-get install -y curl wget gnupg
RUN wget -q https://github.com/prometheus/prometheus/releases/download/v2.20.0/prometheus-2.20.0.linux-amd64.tar.gz && tar xzf prometheus-2.20.0.linux-amd64.tar.gz -C /opt && ln -s /opt/prometheus-2.20.0.linux-amd64/prometheus /usr/local/bin/prometheus
ENV DATADOG_API_KEY=abc123def456ghi789
ENV NEW_RELIC_LICENSE_KEY=nr-license-key-insecure
CMD ["bash"]
