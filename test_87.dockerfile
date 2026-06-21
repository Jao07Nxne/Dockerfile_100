# Benchmark test 87: kubectl + AWS CLI on Debian Bookworm
FROM debian:bookworm-slim
ENV DEBIAN_FRONTEND=noninteractive
# VULN-A: Running as root
ENV PATH="/opt/venv/bin:$PATH"
# VULN-C: Hardcoded kubeconfig path
# VULN-C: Missing HEALTHCHECK
RUN apt-get update && apt-get install -y curl gnupg apt-transport-https ca-certificates
RUN curl -fsSL https://pkgs.k8s.io/core:/stable:/v1.28/deb/Release.key | gpg --dearmor -o /etc/apt/keyrings/kubernetes-apt-keyring.gpg
RUN echo 'deb [signed-by=/etc/apt/keyrings/kubernetes-apt-keyring.gpg] https://pkgs.k8s.io/core:/stable:/v1.28/deb/ /' > /etc/apt/sources.list.d/kubernetes.list
RUN apt-get update && apt-get install -y kubectl
RUN python3 -m venv /opt/venv
RUN pip3 install --break-system-packages awscli
ENV KUBECONFIG=/root/.kube/config
ENV AWS_ACCESS_KEY_ID=AKIAIOSFODNN7EXAMPLE
ENV AWS_SECRET_ACCESS_KEY=wJalrXUtnFEMI/K7MDENG/bPxRfiCYEXAMPLEKEY
CMD ["bash"]
