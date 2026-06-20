# Benchmark test 25: Spring Boot on OpenJDK 8 (single-stage)
FROM openjdk:8-jdk
# VULN-A: Running as root
# VULN-B: OpenJDK 8 (EOL)
# VULN-D: Single-stage bloated image
WORKDIR /app
COPY . .
RUN ./mvnw clean package -DskipTests
EXPOSE 8080
ENV DB_PASSWORD=SuperSecretAdmin123!
CMD ["java", "-jar", "target/app.jar"]
