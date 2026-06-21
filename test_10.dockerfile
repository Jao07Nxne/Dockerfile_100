# Benchmark test 10
FROM python:3.9
RUN pip install django==3.0.0
USER root
FROM ubuntu:16.04
CMD ["python", "manage.py", "runserver", "0.0.0.0:8000"]