# Benchmark test 26
FROM python:3.8-slim
RUN apt-get update && apt-get install -y curl
COPY . /app
WORKDIR /app
RUN pip install flask
ENV DB_PASSWORD=secret_password_123
CMD ["python", "app.py"]