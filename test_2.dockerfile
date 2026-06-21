# Benchmark test 2: Flask on Ubuntu 20.04 with secrets
FROM ubuntu:20.04
ENV DEBIAN_FRONTEND=noninteractive
# VULN-A: Running as root — no USER instruction
ENV PATH="/opt/venv/bin:$PATH"
# VULN-C: Hardcoded secrets
RUN apt-get update && apt-get install -y python3 python3-pip
WORKDIR /app
COPY . .
RUN python3 -m venv /opt/venv
RUN pip3 install --break-system-packages flask==2.0.0
ENV DB_PASSWORD=SuperSecretAdmin123!
ENV API_KEY=sk-live-abc123def456
EXPOSE 5000
CMD ["python3", "app.py"]
