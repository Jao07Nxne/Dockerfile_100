# Benchmark test 98: Terraform on Alpine 3.10 (EOL)
FROM alpine:3.10
# VULN-A: Running as root
# VULN-B: Alpine 3.10 (EOL)
# VULN-C: Terraform cloud token
RUN apk add --no-cache curl wget unzip bash git openssh
RUN wget -q https://releases.hashicorp.com/terraform/0.14.0/terraform_0.14.0_linux_amd64.zip && unzip terraform_0.14.0_linux_amd64.zip -d /usr/local/bin && rm terraform_0.14.0_linux_amd64.zip
ENV TF_CLOUD_TOKEN=terraform-cloud-api-token-abc123
ENV AWS_ACCESS_KEY_ID=AKIAIOSFODNN7EXAMPLE
CMD ["bash"]
