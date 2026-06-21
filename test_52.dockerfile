# Benchmark test 52
FROM python:3.8-slim
RUN apt-get update && apt-get install -y curl
COPY . /app
WORKDIR /app
RUN pip install flask
RUN chmod 777 /app
CMD ["python", "app.py"]