# Benchmark test 26: Spring Boot on OpenJDK 8-jre (single-stage)
FROM openjdk:8-jre-slim
# VULN-A: Running as root
# VULN-B: OpenJDK 8 (EOL)
# VULN-D: JRE with build artifacts
# VULN-C: Hardcoded secrets
WORKDIR /app
COPY target/app.jar app.jar
ENV SPRING_DATASOURCE_URL=jdbc:postgresql://prod-db:5432/app
ENV SPRING_DATASOURCE_PASSWORD=prod_db_password_123
EXPOSE 8080
CMD ["java", "-jar", "app.jar"]
