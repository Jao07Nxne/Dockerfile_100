# Benchmark test 4: FastAPI on Debian Bookworm
FROM debian:bookworm-slim
ENV DEBIAN_FRONTEND=noninteractive
# VULN-A: Running as root — no USER instruction
ENV PATH="/opt/venv/bin:$PATH"
# VULN-C: Package manager cache not cleaned
RUN apt-get update && apt-get install -y python3 python3-pip
WORKDIR /app
COPY . .
RUN python3 -m venv /opt/venv
RUN pip3 install --break-system-packages fastapi==0.68.0 uvicorn==0.15.0
EXPOSE 8000
CMD ["uvicorn", "app:app", "--host", "0.0.0.0", "--port", "8000"]
