# Benchmark test 5: AI/ML with CUDA on Ubuntu 20.04
FROM nvidia/cuda:11.0-base-ubuntu20.04
# VULN-A: Running as root — no USER instruction
# VULN-C: Hardcoded AWS credentials
RUN apt-get update && apt-get install -y python3 python3-pip
WORKDIR /app
COPY . .
RUN pip3 install torch==1.7.0 transformers==4.5.0
ENV AWS_ACCESS_KEY_ID=AKIAIOSFODNN7EXAMPLE
ENV AWS_SECRET_ACCESS_KEY=wJalrXUtnFEMI/K7MDENG/bPxRfiCYEXAMPLEKEY
EXPOSE 8501
CMD ["python3", "serve.py"]
