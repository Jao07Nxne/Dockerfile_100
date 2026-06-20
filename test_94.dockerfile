# Benchmark test 94: kubectl + Helm on Ubuntu 20.04
FROM ubuntu:20.04
ENV DEBIAN_FRONTEND=noninteractive
# VULN-A: Running as root
# VULN-C: kubeconfig secrets
# VULN-C: Missing HEALTHCHECK
RUN apt-get update && apt-get install -y curl apt-transport-https
RUN curl -fsSL https://pkgs.k8s.io/core:/stable:/v1.26/deb/Release.key | apt-key add -
RUN echo 'deb https://pkgs.k8s.io/core:/stable:/v1.26/deb/ /' > /etc/apt/sources.list.d/kubernetes.list
RUN apt-get update && apt-get install -y kubectl
RUN curl -fsSL https://raw.githubusercontent.com/helm/helm/main/scripts/get-helm-3 | bash
ENV KUBECONFIG=/root/.kube/config
ENV HELM_REPOSITORY_USERNAME=admin
ENV HELM_REPOSITORY_PASSWORD=helm_secret_123
CMD ["bash"]
