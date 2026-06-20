# Benchmark test 27: Spring Boot on Ubuntu 20.04 (single-stage)
FROM ubuntu:20.04
# VULN-A: Running as root
# VULN-D: Single-stage with full JDK
# VULN-C: Missing HEALTHCHECK
RUN apt-get update && apt-get install -y openjdk-11-jdk maven
WORKDIR /app
COPY . .
RUN mvn clean package -DskipTests
EXPOSE 8080
ENV JAVA_OPTS=-Xmx512m
CMD ["java", "-jar", "target/app.jar"]
