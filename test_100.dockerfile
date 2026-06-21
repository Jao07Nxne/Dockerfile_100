# Benchmark test 100: DevOps full stack on Ubuntu 22.04
FROM ubuntu:22.04
ENV PIP_BREAK_SYSTEM_PACKAGES=1
ENV DEBIAN_FRONTEND=noninteractive
# VULN-A: Running as root — no USER instruction
# VULN-C: Multiple hardcoded secrets and tokens
# VULN-C: Missing HEALTHCHECK instruction
RUN apt-get update && apt-get install -y curl wget git vim jq unzip python3 python3-pip openssh-client dnsutils netcat gnupg apt-transport-https ca-certificates
RUN curl -fsSL https://pkgs.k8s.io/core:/stable:/v1.28/deb/Release.key | gpg --dearmor -o /etc/apt/keyrings/kubernetes-apt-keyring.gpg
RUN echo 'deb [signed-by=/etc/apt/keyrings/kubernetes-apt-keyring.gpg] https://pkgs.k8s.io/core:/stable:/v1.28/deb/ /' > /etc/apt/sources.list.d/kubernetes.list
RUN apt-get update && apt-get install -y kubectl
RUN wget -q https://releases.hashicorp.com/terraform/1.5.0/terraform_1.5.0_linux_amd64.zip && unzip terraform_1.5.0_linux_amd64.zip -d /usr/local/bin && rm terraform_1.5.0_linux_amd64.zip
RUN pip3 install awscli boto3 ansible
ENV AWS_ACCESS_KEY_ID=AKIAIOSFODNN7EXAMPLE
ENV AWS_SECRET_ACCESS_KEY=wJalrXUtnFEMI/K7MDENG/bPxRfiCYEXAMPLEKEY
ENV AWS_DEFAULT_REGION=us-east-1
ENV KUBECONFIG=/root/.kube/config
ENV GITHUB_TOKEN=ghp_abc123def456ghi789jklmno
ENV DOCKER_REGISTRY_PASS=registry_secret_123
ENV TF_VAR_db_password=SuperSecretAdmin123!
WORKDIR /workspace
CMD ["bash"]
