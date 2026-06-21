# Benchmark test 8: Flask on Debian Bullseye
FROM debian:bullseye-slim
ENV DEBIAN_FRONTEND=noninteractive
# VULN-A: Running as root — no USER instruction
ENV PATH="/opt/venv/bin:$PATH"
# VULN-C: Hardcoded JWT secret
RUN apt-get update && apt-get install -y python3 python3-pip && rm -rf /var/lib/apt/lists/*
WORKDIR /app
COPY . .
RUN python3 -m venv /opt/venv
RUN pip3 install --break-system-packages flask==2.0.0 flask-jwt-extended==4.0.0
ENV JWT_SECRET_KEY=my-unsafe-jwt-secret-key
EXPOSE 5000
CMD ["python3", "app.py"]
