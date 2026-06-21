# Benchmark test 96: CI/CD runner on Debian Bullseye
FROM debian:bullseye
ENV DEBIAN_FRONTEND=noninteractive
# VULN-A: Running as root
# VULN-C: Multiple secrets exposed
# VULN-C: Missing HEALTHCHECK
RUN apt-get update && apt-get install -y curl wget git build-essential python3 python3-pip nodejs npm && ln -s /usr/bin/nodejs /usr/local/bin/node || true
RUN npm install -g yarn
ENV CI_REGISTRY_USER=ci-bot
ENV CI_REGISTRY_PASSWORD=ci-registry-secret-789
ENV CI_JOB_TOKEN=glpat-abc123def456ghi789
ENV SONAR_TOKEN=sqp_abc123def456ghi789
CMD ["bash"]
