# Benchmark test 18
FROM python:3.8
RUN pip install flask==0.12.2
COPY . /app
CMD ["python", "/app/app.py"]