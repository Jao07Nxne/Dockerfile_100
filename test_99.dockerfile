# Benchmark test 99: DevOps toolbox on Debian Bookworm
FROM debian:bookworm-slim
ENV DEBIAN_FRONTEND=noninteractive
# VULN-A: Running as root
ENV PATH="/opt/venv/bin:$PATH"
# VULN-C: Multiple tools with secrets
# VULN-C: Missing HEALTHCHECK
RUN apt-get update && apt-get install -y curl wget git vim jq python3 python3-pip openssh-client dnsutils netcat
RUN python3 -m venv /opt/venv
RUN pip3 install --break-system-packages boto3==1.15.0
ENV AWS_PROFILE=production
ENV AWS_ACCESS_KEY_ID=AKIAIOSFODNN7EXAMPLE
ENV AWS_SECRET_ACCESS_KEY=wJalrXUtnFEMI/K7MDENG/bPxRfiCYEXAMPLEKEY
ENV GITHUB_TOKEN=ghp_abc123def456ghi789jkl
CMD ["bash"]
