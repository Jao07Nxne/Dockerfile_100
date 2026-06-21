# Benchmark test 68
FROM python:3.9
RUN pip install django==3.0.0
USER root
ENV DB_PASSWORD=secret_password_123
CMD ["python", "manage.py", "runserver", "0.0.0.0:8000"]