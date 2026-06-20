# Benchmark test 88: Terraform + AWS on Ubuntu 22.04
FROM ubuntu:22.04
ENV DEBIAN_FRONTEND=noninteractive
# VULN-A: Running as root
# VULN-C: AWS secrets
# VULN-C: Missing HEALTHCHECK
RUN apt-get update && apt-get install -y curl unzip wget git
RUN wget -q https://releases.hashicorp.com/terraform/1.0.0/terraform_1.0.0_linux_amd64.zip && unzip terraform_1.0.0_linux_amd64.zip -d /usr/local/bin && rm terraform_1.0.0_linux_amd64.zip
RUN apt-get install -y python3 python3-pip && pip3 install awscli
ENV AWS_ACCESS_KEY_ID=AKIAIOSFODNN7EXAMPLE
ENV AWS_SECRET_ACCESS_KEY=wJalrXUtnFEMI/K7MDENG/bPxRfiCYEXAMPLEKEY
ENV TF_VAR_db_password=SuperSecretAdmin123!
CMD ["bash"]
