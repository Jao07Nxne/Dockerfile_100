# Benchmark test 67
FROM python:3.8-slim
RUN apt-get update && apt-get install -y curl
COPY . /app
WORKDIR /app
RUN pip install flask
RUN pip install requests==2.1.0
CMD ["python", "app.py"]