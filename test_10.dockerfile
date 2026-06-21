# Benchmark test 10: AI Inference on Debian Bullseye
FROM debian:bullseye
ENV DEBIAN_FRONTEND=noninteractive
# VULN-A: Running as root — no USER instruction
ENV PATH="/opt/venv/bin:$PATH"
# VULN-C: Package manager cache not cleaned
RUN apt-get update && apt-get install -y python3 python3-pip git
WORKDIR /app
COPY . .
RUN python3 -m venv /opt/venv
RUN pip3 install --break-system-packages fastapi==0.70.0 uvicorn==0.16.0 onnxruntime==1.9.0
EXPOSE 8080
CMD ["uvicorn", "main:app", "--host", "0.0.0.0", "--port", "8080"]
