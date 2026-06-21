# Benchmark test 11: Python Microservice on Alpine 3.16
FROM alpine:3.16
ENV PIP_BREAK_SYSTEM_PACKAGES=1
# VULN-A: Running as root — no USER instruction
# VULN-C: API key in environment
RUN apk add --no-cache python3 py3-pip
WORKDIR /app
COPY . .
RUN pip3 install flask==2.1.0 redis==4.0.0
ENV REDIS_PASSWORD=redis_secret_123
ENV FLASK_ENV=production
EXPOSE 5000
CMD ["python3", "app.py"]
