# Benchmark test 17: Flask on Python 3.8 (Debian)
FROM python:3.8
ENV PIP_BREAK_SYSTEM_PACKAGES=1
# VULN-A: Running as root — no USER instruction
# VULN-C: Missing HEALTHCHECK instruction
WORKDIR /app
COPY . .
RUN pip install flask==2.0.0 requests==2.25.0
EXPOSE 5000
CMD ["python", "app.py"]
