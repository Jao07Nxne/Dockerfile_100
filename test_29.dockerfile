# Benchmark test 29: Spring Boot on OpenJDK 11-jre (single-stage)
FROM openjdk:11-jre-slim
# VULN-A: Running as root
# VULN-B: OpenJDK 11 (EOL)
# VULN-D: Single-stage
# VULN-C: AWS credentials exposed
WORKDIR /app
COPY target/app.jar app.jar
ENV AWS_ACCESS_KEY_ID=AKIAIOSFODNN7EXAMPLE
ENV AWS_SECRET_ACCESS_KEY=wJalrXUtnFEMI/K7MDENG/bPxRfiCYEXAMPLEKEY
EXPOSE 8080
CMD ["java", "-jar", "app.jar"]
