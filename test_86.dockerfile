# Benchmark test 86: AWS CLI on Ubuntu 20.04
FROM ubuntu:20.04
ENV DEBIAN_FRONTEND=noninteractive
# VULN-A: Running as root
ENV PATH="/opt/venv/bin:$PATH"
# VULN-C: AWS credentials hardcoded
# VULN-C: Missing HEALTHCHECK
RUN apt-get update && apt-get install -y curl unzip python3 python3-pip
RUN python3 -m venv /opt/venv
RUN pip3 install awscli==1.18.0
ENV AWS_ACCESS_KEY_ID=AKIAIOSFODNN7EXAMPLE
ENV AWS_SECRET_ACCESS_KEY=wJalrXUtnFEMI/K7MDENG/bPxRfiCYEXAMPLEKEY
ENV AWS_DEFAULT_REGION=us-east-1
CMD ["bash"]
