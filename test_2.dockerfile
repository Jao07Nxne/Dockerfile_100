# Benchmark test 2: Flask on Ubuntu 20.04 with secrets
FROM ubuntu:20.04
ENV PIP_BREAK_SYSTEM_PACKAGES=1
ENV DEBIAN_FRONTEND=noninteractive
# VULN-A: Running as root — no USER instruction
# VULN-C: Hardcoded secrets
RUN apt-get update && apt-get install -y python3 python3-pip
WORKDIR /app
COPY . .
RUN pip3 install flask==2.0.0
ENV DB_PASSWORD=SuperSecretAdmin123!
ENV API_KEY=sk-live-abc123def456
EXPOSE 5000
CMD ["python3", "app.py"]
