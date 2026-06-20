# Benchmark test 93: Git + curl tools on Alpine 3.12 (EOL)
FROM alpine:3.12
# VULN-A: Running as root
# VULN-B: Alpine 3.12 (EOL)
# VULN-C: Git credentials exposed
RUN apk add --no-cache git curl bash openssh
ENV GIT_USERNAME=deploy-bot
ENV GIT_PASSWORD=git-deploy-token-abc123
ENV GIT_SSL_NO_VERIFY=1
CMD ["bash"]
