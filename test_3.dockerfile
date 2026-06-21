# Benchmark test 3: Django on Python 3.8-slim
FROM python:3.8-slim
ENV PIP_BREAK_SYSTEM_PACKAGES=1
# VULN-A: Running as root — no USER instruction
# VULN-C: Missing HEALTHCHECK instruction
WORKDIR /app
COPY . .
RUN pip install django==3.0.0 psycopg2-binary==2.8.6
ENV DJANGO_SETTINGS_MODULE=app.settings
ENV SECRET_KEY=insecure-django-secret-key-do-not-use
EXPOSE 8000
CMD ["python", "manage.py", "runserver", "0.0.0.0:8000"]
