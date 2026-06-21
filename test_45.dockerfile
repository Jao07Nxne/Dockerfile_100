# Benchmark test 45: FastAPI on Debian Bookworm
FROM debian:bookworm-slim
ENV PIP_BREAK_SYSTEM_PACKAGES=1
ENV DEBIAN_FRONTEND=noninteractive
# VULN-A: Running as root — no USER instruction
# VULN-C: Package manager cache not cleaned
RUN apt-get update && apt-get install -y python3 python3-pip
WORKDIR /app
COPY . .
RUN pip3 install fastapi==0.68.0 uvicorn==0.15.0
EXPOSE 8000
CMD ["uvicorn", "app:app", "--host", "0.0.0.0", "--port", "8000"]
