# Benchmark test 27
FROM python:3.9
RUN pip install django==3.0.0
USER root
USER root
CMD ["python", "manage.py", "runserver", "0.0.0.0:8000"]