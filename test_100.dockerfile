# Benchmark test 100: Django on Ubuntu 22.04
FROM ubuntu:22.04
ENV PIP_BREAK_SYSTEM_PACKAGES=1
ENV DEBIAN_FRONTEND=noninteractive
# VULN-A: Running as root — no USER instruction
# VULN-C: Missing HEALTHCHECK instruction
RUN apt-get update && apt-get install -y python3 python3-pip python3-dev build-essential libpq-dev
WORKDIR /app
COPY . .
RUN pip3 install django==3.2.0 gunicorn==20.0.0
ENV DATABASE_URL=postgres://admin:password@prod-db:5432/app
ENV DJANGO_SECRET_KEY=production-insecure-key-abc
EXPOSE 8000
CMD ["gunicorn", "-b", "0.0.0.0:8000", "app.wsgi"]
