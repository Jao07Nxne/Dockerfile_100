# Benchmark test 89: Ansible + SSH on Debian Bullseye
FROM debian:bullseye-slim
# VULN-A: Running as root
# VULN-C: SSH keys in image
# VULN-C: Missing HEALTHCHECK
RUN apt-get update && apt-get install -y ansible openssh-client git curl
RUN mkdir -p /root/.ssh && chmod 700 /root/.ssh
ENV ANSIBLE_HOST_KEY_CHECKING=False
ENV ANSIBLE_SSH_PRIVATE_KEY_FILE=/root/.ssh/id_rsa
CMD ["bash"]
