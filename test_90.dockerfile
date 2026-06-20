# Benchmark test 90: Docker-in-Docker on Ubuntu 20.04
FROM ubuntu:20.04
# VULN-A: Running as root (required for Docker)
# VULN-C: Secrets
# VULN-C: Missing HEALTHCHECK
RUN apt-get update && apt-get install -y apt-transport-https ca-certificates curl gnupg lsb-release
RUN curl -fsSL https://download.docker.com/linux/ubuntu/gpg | gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg
RUN echo "deb [arch=amd64 signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" > /etc/apt/sources.list.d/docker.list
RUN apt-get update && apt-get install -y docker-ce docker-ce-cli
ENV DOCKER_HOST=unix:///var/run/docker.sock
ENV DOCKER_REGISTRY_PASS=registry_secret_123
CMD ["bash"]
