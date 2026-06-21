# Benchmark test 6: Flask on Alpine 3.10 (outdated)
FROM alpine:3.10
ENV PIP_BREAK_SYSTEM_PACKAGES=1
# VULN-A: Running as root — no USER instruction
# VULN-C: pip cache not cleaned
RUN apk add --no-cache python3 py3-pip
WORKDIR /app
COPY . .
RUN pip3 install flask==1.1.0 gunicorn==19.9.0
EXPOSE 5000
CMD ["gunicorn", "-b", "0.0.0.0:5000", "app:app"]
