# Benchmark test 95: AWS CLI v2 on Alpine 3.16
FROM alpine:3.16
ENV PIP_BREAK_SYSTEM_PACKAGES=1
# VULN-A: Running as root
# VULN-C: AWS credentials in ENV
# VULN-C: Missing HEALTHCHECK
RUN apk add --no-cache curl python3 py3-pip groff less bash
RUN pip3 install awscli --upgrade
ENV AWS_ACCESS_KEY_ID=AKIAIOSFODNN7EXAMPLE
ENV AWS_SECRET_ACCESS_KEY=wJalrXUtnFEMI/K7MDENG/bPxRfiCYEXAMPLEKEY
ENV AWS_DEFAULT_REGION=us-east-1
ENV AWS_DEFAULT_OUTPUT=json
CMD ["bash"]
