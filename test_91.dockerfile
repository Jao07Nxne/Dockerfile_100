# Benchmark test 91: Jenkins Agent on Debian Bookworm
FROM debian:bookworm
# VULN-A: Running as root
# VULN-C: Hardcoded Jenkins secrets
# VULN-C: Missing HEALTHCHECK
RUN apt-get update && apt-get install -y openjdk-11-jdk curl git openssh-client
RUN useradd -m jenkins
ENV JENKINS_URL=http://jenkins.internal:8080
ENV JENKINS_SECRET=jenkins-agent-secret-abc123
ENV JENKINS_AGENT_NAME=prod-agent
WORKDIR /home/jenkins
CMD ["bash"]
