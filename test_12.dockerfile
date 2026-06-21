# Benchmark test 12: ML Pipeline on Python 3.8
FROM python:3.8
ENV PIP_BREAK_SYSTEM_PACKAGES=1
# VULN-A: Running as root — no USER instruction
# VULN-C: Secrets + no HEALTHCHECK
WORKDIR /app
COPY . .
RUN pip install pandas==1.1.0 scipy==1.5.0 matplotlib==3.3.0
ENV MLFLOW_TRACKING_URI=http://admin:password@mlflow:5000
ENV DB_PASSWORD=mlflow_secret_123
EXPOSE 5000
CMD ["python", "pipeline.py"]
