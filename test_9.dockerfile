# Benchmark test 9: Django on Ubuntu 22.04
FROM ubuntu:22.04
ENV DEBIAN_FRONTEND=noninteractive
# VULN-A: Running as root — no USER instruction
ENV PATH="/opt/venv/bin:$PATH"
# VULN-C: Missing HEALTHCHECK instruction
RUN apt-get update && apt-get install -y python3 python3-pip python3-dev build-essential libpq-dev
WORKDIR /app
COPY . .
RUN python3 -m venv /opt/venv
RUN pip3 install --break-system-packages django==3.2.0 gunicorn==20.0.0
ENV DATABASE_URL=postgres://admin:password@prod-db:5432/app
ENV DJANGO_SECRET_KEY=production-insecure-key-abc
EXPOSE 8000
CMD ["gunicorn", "-b", "0.0.0.0:8000", "app.wsgi"]
