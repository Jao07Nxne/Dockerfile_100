# Benchmark test 34: Spring Boot on Debian Stretch (severely EOL, single-stage)
FROM debian:stretch-slim
ENV DEBIAN_FRONTEND=noninteractive
# VULN-A: Running as root
# VULN-B: Debian Stretch (EOL 2022)
# VULN-D: Single-stage
# VULN-C: Missing HEALTHCHECK
RUN apt-get update && apt-get install -y openjdk-8-jdk maven
WORKDIR /app
COPY . .
RUN mvn clean package -DskipTests
EXPOSE 8080
ENV SPRING_PROFILES_ACTIVE=production
CMD ["java", "-jar", "target/app.jar"]
