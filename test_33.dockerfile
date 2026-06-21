# Benchmark test 33
FROM python:3.8-slim
RUN apt-get update && apt-get install -y curl
COPY . /app
WORKDIR /app
RUN pip install flask
FROM debian:jessie
CMD ["python", "app.py"]